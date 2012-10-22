<?php
require_once 'Twitter.php';
require_once 'Database/Response.php';
class Response_Index extends Twitter {
	private $_user;
	protected  $db;
	public function __construct($db)
	{
		$this->db=$db;
		$this->_user=new Database_Response($db);
		
		
	}
	public function checkResponse($userId)
	{
		$sql=$this->db->query('SELECT DISTINCT item_id,type FROM response WHERE user_id=?',array($userId));
		$result=$sql->fetchAll();
		return $result;

	}
}

?>