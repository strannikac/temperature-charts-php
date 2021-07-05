<?php 

namespace Model;

use Model\Model;

/**
 * Class LocationModel
 * This model contains methods for regions and countries
 */
class LocationModel extends Model {
    private $tableCountries = 'countries';
    private $tableCountriesLangs = 'countries_langs';
    private $tableLangs = 'locations_langs';

	public function __construct() {
		parent::__construct();

		$this->table = 'locations';
	}

    public function getCountries(int $lang) {
        $sql = 'SELECT c.id, c.iso, c.iso2, cl.title 
            FROM `' . $this->tableCountries . '` c 
            LEFT JOIN `' . $this->tableCountriesLangs . '` cl ON (cl.country_id = c.id AND cl.language_id = ' . $lang . ') 
            WHERE c.status_id = 1 
            ORDER BY c.pos';

        return $this->list($sql);
    }

    public function get(int $lang) {
        $sql = 'SELECT l.id, l.country_id, l.title, l.latitude, l.longitude, ll.title AS `location`, c.iso, c.iso2, cl.title AS `country`
            FROM `' . $this->table . '` l 
            LEFT JOIN `' . $this->tableLangs . '` ll ON (ll.location_id = l.id AND ll.language_id = ' . $lang . ') 
            LEFT JOIN `' . $this->tableCountries . '` c  ON (c.id = l.country_id) 
            LEFT JOIN `' . $this->tableCountriesLangs . '` cl ON (cl.country_id = c.id AND cl.language_id = ' . $lang . ') 
            WHERE l.status_id = 1 
            ORDER BY l.is_def DESC, l.pos';

        return $this->list($sql);
    }
}
?>