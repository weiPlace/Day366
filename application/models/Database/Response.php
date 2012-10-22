<?php
require_once 'Database.php';
class Database_Response extends Database {
	public function  __construct($db)
	{
		parent::__construct($db, 'response', 'id');
		$this->add('id');
		$this->add('item_id');
		$this->add('user_id');
		$this->add('type');
	}
}

?>