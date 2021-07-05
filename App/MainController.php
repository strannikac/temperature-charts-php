<?php

namespace App;

use Model\LocationModel;
use Model\ForecastModel;

/**
 * MainController 
 * This controller contains methods for main pages
 */
class MainController extends Controller {

    private $daysCount = 7;

    /**
     * Method main - charts page.
     * @param void
     */
    public function main(): void {
        $model = new LocationModel();
        $locations = $model->get($this->language->id);

        //last 7 days
        // $today = date('Y-m-d');
        $dateFrom = date("Y-m-d", strtotime("-{$this->daysCount} days"));
        // $dateTo = date("Y-m-d", strtotime("-1 days"));
        // echo $dateTo; exit;

        $dates = [];
        $timeFrom = strtotime($dateFrom);

        $model = new ForecastModel();

        for ($i = 0; $i < $this->daysCount; $i++) {
            $date = ($i == 0) ? $dateFrom : date('Y-m-d', strtotime("+{$i} days", $timeFrom));
            $rows = $model->getByPeriod($date, $date);

            if(!$rows || count($rows) < 1) {
                $dates[] = $date;
            }
        }

        $this->template->set( _ROOT_TPL_ . 'main.html');

        $tplVars = [
            '_path_html_' => _URL_WEB_, 
            '_locations_' => json_encode($locations), 
            '_dates_' => json_encode($dates), 
            'LOCATION_DEFAULT' => $locations[0]['location'], 
            'STR_ALL_LOCATIONS' => $this->locale['STR_ALL_LOCATIONS'], 
            'STR_DATE_FROM' => $this->locale['STR_DATE_FROM'], 
            'STR_DATE_TILL' => $this->locale['STR_DATE_TILL'], 
            'STR_SHOW' => $this->locale['STR_SHOW']
        ];

        $this->template->setVars( $tplVars );

        $this->content->html = $this->template->parse();
    }

    /**
     * Method error404 - show 404 error page
     * @param void
     */
    public function error404(): void {
        $this->template->set( _ROOT_TPL_ . 'error404.html');

        $tplVars = [
            'HDR_ERROR' => $this->locale['ERR_404'], 
            'TXT_ERROR' => $this->locale['TXT_SOMETHING_WRONG']
        ];

        $this->template->setVars( $tplVars );

        $this->content->html = $this->template->parse();
    }
}
