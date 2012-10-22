<?php
require_once 'Twitter.php';
require_once 'Database/Comment.php';
class Message_Index extends Twitter {
	private $_user;
	protected  $db;
	public function __construct($db)
	{
		$this->db=$db;
		$this->_user=new Database_Comment($db);
		
		
	}
	public function checkMessage($userId)
	{
		$sql=$this->db->query('SELECT DISTINCT item_id,type FROM comment WHERE user_id=?',array($userId));
		$result=$sql->fetchAll();
		return $result;

	}
}

?>