<?php
require_once ('Database.php');

class Database_Day extends Database
{
	public function __construct($db)
	{
		parent::__construct($db, 'days', 'days_id');
		$this->add('days_id');
		$this->add('days_from_id','0');
		$this->add('days_user_id');
		$this->add('days_day');
		$this->add('days_type',2);
		$this->add('days_time',date('H:i:s'));
		$this->add('days_title');
		$this->add('days_content');
		$this->add('days_url');
		$this->add('days_image');
		$this->add('days_comment',0);
		$this->add('days_like',1);
		$this->add('days_favourite',1);
	}
}
?>