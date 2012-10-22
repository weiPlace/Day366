<?php
require_once 'Twitter.php';
require_once 'Database/Twitter.php';
class Twitter_Like extends Twitter {
	private $_user;
	protected $db;
	public function __construct($db)
	{
			$this->_user=new Database_Twitter($db);
			$this->db=$db;
	}
	public function process($request)
	{
		$id=$this->sanitize($request->getQuery('id'));
	
		$this->_user->load($id);
		$nowId=$this->_user->twitter_like;
		$nowId=$nowId+1;
		$this->_user->twitter_like=$nowId;
		$this->_user->save();
		return true;
	}
	
	public function delete(Zend_Controller_Request_Abstract $request)
	{
		try{
		$id=$this->sanitize($request->getQuery('id'));
		$id=$this->getInt($id);
		$sqlOne=$this->db->query('DELETE FROM twitter WHERE twitter_id=?',array($id));
		$sqlOne->fetch();
		$sqlTwo=$this->db->query('DELETE FROM tc_comment WHERE tc_item_id=?',array($id));
		$sqlTwo->fetch();}catch(Zend_Exception $e){echo $e.get_current_user();return false;}
		return true;
	}
}

?>