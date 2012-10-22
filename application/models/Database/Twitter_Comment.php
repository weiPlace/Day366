<?php
require_once 'Database.php';
/** 
 * @author wei
 * 
 * 
 */
class Database_Twitter_Comment extends Database {
	//TODO - Insert your code here
	

	function __construct($db) {
		parent::__construct($db, 'tc_comment', 'tc_id');
		//TODO - Insert your code here
		$this->add('tc_id');
		$this->add('tc_item_id');
		$this->add('tc_user_id');
		$this->add('tc_date',date('n-j'));
		$this->add('tc_time',date('H:i:s'));
		$this->add('tc_comment');
	}
}

?>