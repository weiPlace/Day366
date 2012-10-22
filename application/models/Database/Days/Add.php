<?php
require_once 'Database.php';
/** 
 * @author wei
 * 
 * 
 */
class Database_Days_Add extends Database {
	//TODO - Insert your code here
	public function __construct($db)
	{
		parent::__construct($db, 'days_add', 'id');
		$this->add('days_add_user_id');
		$this->add('days_add_month');
		$this->add('days_add_day');
		$this->add('days_add_content');
		$this->add('days_add_image');
		$this->add('days_add_date',date('G:i:s'));
	}

}

