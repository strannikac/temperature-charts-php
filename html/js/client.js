function convertDate(from) {
    let date = new Date(from);

    let month = (date.getMonth()+1);
    month = month < 10 ? `0${month}` : month.toString();

    let day = date.getDate();
    day = day < 10 ? `0${day}` : day.toString();

    return day + '.' + month + '.' + date.getFullYear().toString();
}