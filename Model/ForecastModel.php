<?php 

namespace Model;

use Model\Model;

/**
 * Class ForecastModel
 * This model contains methods for forecasts (temperature)
 */
class ForecastModel extends Model {
    public function __construct() {
		parent::__construct();

		$this->table = 'forecasts';
	}

    public function getByPeriod(string $dateFrom = '', string $dateTill = '', int $locationId = 0) {
        $where = '1 = 1';

        if ($locationId > 0) {
            $where .= ' AND `location_id` = ' . $locationId;
        }

        if ($dateFrom != '') {
            $where .= ' AND `date` >= \'' . $dateFrom . '\'';
        }

        if ($dateTill != '') {
            $where .= ' AND `date` <= \'' . $dateTill . '\'';
        }

        $sql = 'SELECT * 
            FROM `' . $this->table . '` 
            WHERE ' . $where . '
            ORDER BY `date`';

        return $this->list($sql);
    }
}
?>