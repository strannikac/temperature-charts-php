let values = [];
let locationsTitle = [];
let locationsId = [];

const forecastAPI = 'https://api.weatherapi.com/v1/history.json?key=e68013b944d44f7da19130017210107';
let requestsCount = 0;
let requestsTotal = 0;

document.addEventListener('DOMContentLoaded', (event) => {
	let datesLen = dates.length;
	locationsTitle = locations.map(item => item.title);
	locationsId = locations.map(item => item.id);

	const filterForm = document.querySelector('.js-period-filter');

	if (datesLen > 0) {
		requestsTotal = datesLen * locations.length;

		for(let location of locations) {
			for(let date of dates) {
				getForecast(location, date);
			}
		}
	} else {
		getHistoryData();
	}

	filterForm.addEventListener('submit', (e) => {
		e.preventDefault();
		getHistoryData(filterForm.querySelector('[name="from"]').value, filterForm.querySelector('[name="till"]').value);
	});

	function getForecast(location, date) {
		fetch(forecastAPI + '&q=' + location.title + '&dt=' + date)
			.then(response => response.json())
			.then(forecastData => {
				if (forecastData.forecast.forecastday[0].day != undefined) {
					const forecast = forecastData.forecast.forecastday[0].day;
	
					const postData =  new FormData ();
					postData.append ('location', location.id);
					postData.append ('date', date);
					postData.append ('maxTemp', forecast.maxtemp_c);
					postData.append ('minTemp', forecast.mintemp_c);
					postData.append ('avgTemp', forecast.avgtemp_c);
					
					fetch(apiUrl + "forecast/",
					{
						method: "POST",
						body: postData
					})
					.then(response => response.json())
					.then(data => {
						requestsCount++;

						if (requestsCount >= requestsTotal) {
							getHistoryData();
						}
					});
				} else {
					requestsCount++;

					if (requestsCount >= requestsTotal) {
						getHistoryData();
					}
				}
			});
	}
	
	function getHistoryData(dateFrom = '', dateTill = '') {
		filterForm.querySelector('button').disabled = true;
		
		fetch(apiUrl + 'forecast/?dateFrom=' + dateFrom + '&dateTill=' + dateTill)
			.then(response => response.json())
			.then(data => {
				let date = '';
				let obj = {};

				values = [];

				const items = data.data.items;
				let minDate = dateFrom;
				let maxDate = dateTill;

				for (let item of items) {
					if(minDate == '') {
						minDate = item.date;
					}

					if(dateTill == '') {
						maxDate = item.date;
					}

					if (date != item.date) {
						if (obj.temp != undefined) {
							values.push(obj);
						}

						obj = {
							date: item.date, 
							temp: {}
						};
					}

					obj.temp[item.location_id] = item.avg_temp;

					date = item.date;
				}

				values.push(obj);

				filterForm.querySelector('[name="from"]').value = minDate;
				filterForm.querySelector('[name="till"]').value = maxDate;

				new ChartOneLocation("chart-one", values, locationsId[0]);

				new ChartAllLocations("chart-all", values, locationsTitle, locationsId);

				filterForm.querySelector('button').disabled = false;
			});
	}
});

class ChartAllLocations {
	constructor(selector, values, legends, legendsId) {
		this.selector = selector;
		this.legends = legends;
		this.legendsId = legendsId;
		this.values = values;

		// Create chart instance
		this.chart = am4core.create(this.selector, am4charts.XYChart);

		this.init();
	}

	init() {
		// Themes begin
		am4core.useTheme(am4themes_animated);
		// Themes end
		
		// Create axes
		let dateAxis = this.chart.xAxes.push(new am4charts.DateAxis());
		let valueAxis = this.chart.yAxes.push(new am4charts.ValueAxis());
	
		const count = this.legends.length;
	
		for (let i = 0; i < count; i++) {
			this.createSeries(this.legendsId[i], this.legends[i]);
		}
	
		this.chart.legend = new am4charts.Legend();
		this.chart.legend.position = "right";
		this.chart.legend.scrollable = true;
		
		this.chart.legend.markers.template.states.create("dimmed").properties.opacity = 0.3;
		this.chart.legend.labels.template.states.create("dimmed").properties.opacity = 0.3;
		
		this.chart.legend.itemContainers.template.events.on("over", event => {
		  	this.processOver(event.target.dataItem.dataContext);
		});
		
		this.chart.legend.itemContainers.template.events.on("out", event => {
			this.processOut(event.target.dataItem.dataContext);
		});
	}

	// Create series
	createSeries(s, name) {
	  var series = this.chart.series.push(new am4charts.LineSeries());
	  series.dataFields.valueY = "value" + s;
	  series.dataFields.dateX = "date";
	  series.name = name;
	
	  var segment = series.segments.template;
	  segment.interactionsEnabled = true;
	
	  var hoverState = segment.states.create("hover");
	  hoverState.properties.strokeWidth = 3;
	
	  var dimmed = segment.states.create("dimmed");
	  dimmed.properties.stroke = am4core.color("#dadada");
	
	  segment.events.on("over", event => {
		this.processOver(event.target.parent.parent.parent);
	  });
	
	  segment.events.on("out", event => {
		this.processOut(event.target.parent.parent.parent);
	  });
	
	  var data = [];

	  const count = this.values.length;
	  for (let i = 0; i < count; i++) {
		const value = this.values[i].temp[s];
		let dataItem = { date: new Date(this.values[i].date) };
		dataItem["value" + s] = value;
		data.push(dataItem);
	  }
	
	  series.data = data;
	  return series;
	}
	
	processOver(hoveredSeries) {
	  hoveredSeries.toFront();
	
	  hoveredSeries.segments.each(function(segment) {
		segment.setState("hover");
	  })
	  
	  hoveredSeries.legendDataItem.marker.setState("default");
	  hoveredSeries.legendDataItem.label.setState("default");
	
	  this.chart.series.each(function(series) {
		if (series != hoveredSeries) {
		  series.segments.each(function(segment) {
			segment.setState("dimmed");
		  })
		  series.bulletsContainer.setState("dimmed");
		  series.legendDataItem.marker.setState("dimmed");
		  series.legendDataItem.label.setState("dimmed");
		}
	  });
	}
	
	processOut() {
		this.chart.series.each(function(series) {
		series.segments.each(function(segment) {
		  segment.setState("default");
		})
		series.bulletsContainer.setState("default");
		series.legendDataItem.marker.setState("default");
		series.legendDataItem.label.setState("default");
	  });
	}
}

class ChartOneLocation {
	constructor(selector, values, index) {
		this.selector = selector;
		this.valueIndex = index;
		this.values = values;

		// Create chart instance
		this.chart = am4core.create(this.selector, am4charts.XYChart);

		this.init();
	}

	init() {
		// Themes begin
		am4core.useTheme(am4themes_animated);
		// Themes end
		
		let data = [];

		const count = this.values.length;
		for (let i = 0; i < count; i++) {
			data.push({date: new Date(this.values[i].date), value: this.values[i].temp[this.valueIndex]});
		}
		
		this.chart.data = data;
		
		// Create axes
		let dateAxis = this.chart.xAxes.push(new am4charts.DateAxis());
		// dateAxis.renderer.minGridDistance = 60;
		
		let valueAxis = this.chart.yAxes.push(new am4charts.ValueAxis());
		
		// Create series
		let series = this.chart.series.push(new am4charts.LineSeries());
		series.dataFields.valueY = "value";
		series.dataFields.dateX = "date";
		series.tooltipText = "{value}"
		
		series.tooltip.pointerOrientation = "vertical";
		
		this.chart.cursor = new am4charts.XYCursor();
		this.chart.cursor.snapToSeries = series;
		this.chart.cursor.xAxis = dateAxis;
		
		//this.chart.scrollbarY = new am4core.Scrollbar();
		this.chart.scrollbarX = new am4core.Scrollbar();
	}
}