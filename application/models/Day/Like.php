<?php
require_once 'Twitter.php';
require_once 'Database/Day.php';
class Day_Like extends Twitter {
	private $_user;
	protected $db;
	public function __construct($db)
	{
			$this->_user=new Database_Day($db);
			$this->db=$db;
	}
	public function process($request)
	{
		$id=$this->sanitize($request->getQuery('id'));
	
		$this->_user->load($id);
		$nowId=$this->_user->days_like;
		$nowId=$nowId+1;
		$this->_user->days_like=$nowId;
		$this->_user->save();
		return true;
	}
	
}

?>