<?php

require_once('Zend/Db/Table/Abstract.php');


class Database_Table_Userinfo extends Zend_Db_Table {
	protected function _setup(){
		$this->_name='user';
		$this->_primary='user_id';
		parent::_setup();
	}

}


?>