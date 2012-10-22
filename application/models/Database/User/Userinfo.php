<?php

require_once('Database.php');

/**
 * @author wei
 *
 *
 */
class Database_User_Userinfo extends Database {
	//TODO - Insert your code here
	protected  $db;

	function __construct($db) {

		$this->db=$db;
		//TODO - Insert your code here
		parent::__construct($db, 'user', 'id');
		$this->add('user_id');
		$this->add('user_firstname');
		$this->add('user_lastname');
		$this->add('user_birthday');
		$this->add('user_gender');
		$this->add('user_province');
		$this->add('user_city');
		$this->add('user_us_province');
		$this->add('user_us');
		$this->add('user_permit','2');
		$this->add('user_img');
		$this->add('user_name');
	}
		public function __set($name, $value){
			return parent::__set($name, $value);
		}
		public function mySelect()
		{
			$select=$this->db->select();
			$table="user";
			$select->from($table,'user_id');
			$result=$this->db->fetchAll($select);
			return $result;
		}
}


?>
