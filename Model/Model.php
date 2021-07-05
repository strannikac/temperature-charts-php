<?php 

namespace Model;

use Service\Db;
use Helper\System;

/**
 * Class Model
 * This common model
 * contains common methods for all models
 */
abstract class Model {
	protected $db;
	protected $table = '';

	public function __construct() {
		$this->db = Db::getInstance();
	}

	//create table
    public function createTable(string $table = '', array $fields): void {
    	if( $table == '' ) {
			$table = $this->table;
		}

		if( count($fields) > 0 ) {
			$sql = 'CREATE TABLE IF NOT EXISTS ' . $table . ' (' . implode(', ', $fields) . ')';
			$this->db->execSql($sql);
		}
    }

	//get list (all rows)
	public function list(string $sql) {
		$this->db->querySql($sql);
        $res = $this->db->getAll();

        if( count( $res ) < 1 ) {
            return false;
        }

        return $res;
	}

	//get by id
	public function getById($id, string $table = '') {
		if( $table == '' ) {
			$table = $this->table;
		}

		$sql = 'SELECT * FROM `' . $table . '`
            WHERE id = \'' . $id . '\'';

        $this->db->querySql($sql);
        $row = $this->db->getRow();

        if( empty( $row['id'] ) ) {
            return false;
        }

        return $row;
	}

	//get by any field
	public function getByField(string $field, string $value, string $table = '') {
		if( $table == '' ) {
			$table = $this->table;
		}

		$sql = 'SELECT * FROM `' . $table . '`
            WHERE `' . $field . '` = \'' . $value . '\'';

        $this->db->querySql($sql);
        return $this->db->getRow();
	}

	//get by id
	public function getRow(string $sql) {
		$this->db->querySql($sql);
        $row = $this->db->getRow();

        if( empty( $row ) ) {
            return false;
        }

        return $row;
	}

	//save some data only
	public function update(array $arr, $id, string $table = '') {
		if( $table == '' ) {
			$table = $this->table;
		}

		$setFields = '';

		foreach($arr as $fld => $val) {
			if($setFields != '') {
				$setFields .= ', ';
			}
			$setFields .= '`' . $fld . '` = \'' . $val . '\'';
		}

		$sql = 'UPDATE `' . $table . '` 
			SET ' . $setFields . ' 
            WHERE id = \'' . $id . '\'';

        if( $this->db->execSql($sql) ) {
			return true;
		}

		return false;
	}

	public function updateBy(array $arr, string $where, string $table = '') {
		if( $table == '' ) {
			$table = $this->table;
		}

		$setFields = '';

		foreach($arr as $fld => $val) {
			if($setFields != '') {
				$setFields .= ', ';
			}
			$setFields .= '`' . $fld . '` = \'' . $val . '\'';
		}

		$sql = 'UPDATE `' . $table . '` 
			SET ' . $setFields . ' 
            WHERE ' . $where;

        if( $this->db->execSql($sql) ) {
			return true;
		}

		return false;
	}

	//add row in table 
	public function insert(array $arr, string $table = '') {
		if( $table == '' ) {
			$table = $this->table;
		}

		$fields = '';
		$values = '';

		foreach($arr as $fld => $val) {
			if($fields != '') {
				$fields .= ', ';
				$values .= ', ';
			}
			$fields .= '`' . $fld . '`';
			$values .= '\'' . $val . '\'';
		}

		$sql = 'INSERT INTO `' . $table . '` 
			(' . $fields . ') 
            VALUES (' . $values . ')';

        if( $this->db->execSql($sql) ) {
			return $this->db->getLastId();
		}

		return false;
	}

	//check unique field
	public function isUniqueValue(string $field, $value, string $table = '') {
		if( $table == '' ) {
			$table = $this->table;
		}

		$sql = 'SELECT COUNT(*) AS count FROM `' . $table . '` 
			WHERE `' . $field . '` = \'' . $value . '\'';

		$this->db->querySql($sql);
        $row = $this->db->getRow();

        if( $row['count'] > 0 ) {
			return false;
		}

		return true;
	}

	//delete row from table 
	public function delete($id, string $table = '') {
		if( $table == '' ) {
			$table = $this->table;
		}

		$sql = 'DELETE FROM `' . $table . '` 
			WHERE id = \'' . $id . '\'';

        if( $this->db->execSql($sql) ) {
			return true;
		}

		return false;
	}
}
?>