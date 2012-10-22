<?php
require_once 'Database.php';
class Database_Comment extends Database 
{
	public function  __construct($db)
	{
		parent::__construct($db, 'comment', 'id');
		$this->add('id');
		$this->add('item_id');
		$this->add('user_id');
		$this->add('type');
	}
}

?>