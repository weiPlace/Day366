<?php
require_once 'Database.php';
/** 
 * @author wei
 * 
 * 
 */
class Database_Day_Comment extends Database {
	//TODO - Insert your code here
	

	function __construct($db) {
		parent::__construct($db, 'days_comment', 'days_id');
		//TODO - Insert your code here
		$this->add('days_id');
		$this->add('days_item_id');
		$this->add('days_user_id');
		$this->add('days_date',date('n-j'));
		$this->add('days_time',date('H:i:s'));
		$this->add('days_comment');
	}
}

?>