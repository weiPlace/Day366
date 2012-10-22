<?php

require_once('Database/Database_Action.php');
require_once 'Database/Table/Register.php';
/**
 * @author wei
 *@access wei
 *@time 2012-4-18 22:27:50
 *
 */
class Database_Action_User extends Database_Action {
	private $_user;
	private $_table;
	private $_db;

	function __construct($db) {
		parent::__construct($db);
		$this->_db=$db;
		Zend_Db_Table::setDefaultAdapter($this->_db);
		$this->_table=new Database_Table_Register();
	}
	public function mySelect($id){
	
		$result=$this->_table->find($id);
		$resultArray=$result->toArray();
		return $resultArray;
	
	}
}


?>