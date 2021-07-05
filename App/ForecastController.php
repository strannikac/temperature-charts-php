<?php 

namespace App;

use Helper\System;
use Model\ForecastModel;

/**
 * Class ForecastController
 * This controller contains methods for forecasts 
 */
class ForecastController extends Controller {

    private $dateFormat = 'Y-m-d';

    /**
     * Method main (default) - get data or save item
     * @param void
     */
    public function main() {
        // var_dump($this->request->params);
        // var_dump($_POST);

        if($this->request->method == 'POST') {
            //add item
            $this->add();
        } elseif($this->request->method == 'GET') {
            $params = $this->request->params->get;

            if ((!empty($params->dateFrom) && !$this->validator->checkDateTime($params->dateFrom, $this->dateFormat)) 
                || (!empty($params->dateTill) && !$this->validator->checkDateTime($params->dateTill, $this->dateFormat))
            ) {
                $this->error[] = $this->locale['ERR_1005'];
                return false;
            }

            $dateFrom = isset($params->dateFrom) ? $params->dateFrom : '';
            $dateTill = isset($params->dateTill) ? $params->dateTill : '';

            $model = new ForecastModel();
            $res = $model->getByPeriod($dateFrom, $dateTill);

            if ($res && count($res) > 0) {
                $this->data->items = $res;
            }
        } else {
            $this->error[] = $this->locale['ERR_1002'];
        }
    }

    /**
     * Method add - add item
     * @param void
     */
    public function add() {
        $post = $this->request->params->post;
        
        if (empty($post->date) || !$this->validator->checkDateTime($post->date, $this->dateFormat)) {
            echo 'err date';
        }

        if (empty($post->location) || !$this->validator->isPositiveInteger($post->location) 
            || empty($post->date) || !$this->validator->checkDateTime($post->date, $this->dateFormat) 
            || !isset($post->minTemp) || !is_numeric($post->minTemp) 
            || !isset($post->maxTemp) || !is_numeric($post->maxTemp) 
            || !isset($post->avgTemp) || !is_numeric($post->avgTemp) 
         ) {
            $this->error[] = $this->locale['ERR_1005'];
            return false;
        }

        $model = new ForecastModel();
        $res = $model->getByPeriod($post->date, $post->date, $post->location);

        if (!$res || count($res) < 1) {
            $arr = [
                'location_id' => $post->location, 
                'date' => $post->date, 
                'max_temp' => $post->maxTemp, 
                'min_temp' => $post->minTemp, 
                'avg_temp' => $post->avgTemp, 
                'creation_time' => time() 
            ];

            if (!$model->insert($arr)) {
                $this->error[] = $this->locale['ERR_1009'];
                return false;
            }
        }
    }
}

?>