<?php
require_once 'Database/Friend/Friend.php';
/** 
 * @author wei
 * 
 * 
 */
class Userfriend_Delete extends Userfriend {
	//TODO - Insert your code here
	private $_info;
	private $_user;
	private $_db;
	/**
	 * 
	 */
	public function __construct($db) {
		$this->db=$db;
		parent::__construct ( $db );
		$this->_user=new Database_Friend_Friend($db);
		
	
		//TODO - Insert your code here
	}
	public function process(Zend_Controller_Request_Abstract $request,$userId)
	{
		$friendId=$this->sanitize($request->getQuery('id'));
		$result=$this->getPermit($userId, $friendId);
		if (!$result){
			$this->_info="你并未收藏此人，因此你无法取消收藏";
			return false;
		}
		$deleteResult=$this->deleteFriend($userId, $friendId);
		if (!$deleteResult){return false;}
		return true;
		
	}
	
	/**
	 * 
	 */
	public function getInfo()
	{
		return $this->_info;
	}
	
	private function deleteFriend($userId,$friendId)
	{
		$this->db->beginTransAction();
		try{
		$sql=$this->db->query('DELETE FROM friend WHERE user_id=? AND friend_id=?',array($userId,$friendId));
	
		$this->db->commit();

		}catch(Zend_Db_Statement_Mysqli_Exception $e)
		{
			$this->_info="发生了错误，请重试!";

			$this->db->rollback();
			return false;
		}
		return true;
	}
	

}

?>