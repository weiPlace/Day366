<?php
require_once 'Database.php';
class Database_Friend extends Database {
	
	public function __construct($db)
	{
		parent::__construct($db, 'friend', 'id');
		$this->add('id');
		$this->add('user_id');
		$this->add('friend_id');
	}
	
	
}

?>