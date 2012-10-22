<?php
require_once 'Database/Friend/Friend.php';
/** 
 * @author wei
 * 
 * 
 */
class Befriend_Delete extends Userfriend {
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
		$sql=$this->db->query('DELETE FROM friend WHERE friend_id=? AND user_id=?',array($userId,$friendId));
	
		$this->db->commit();

		}catch(Zend_Db_Statement_Mysqli_Exception $e)
		{
			$this->_info="发生了错误，请重试!";
			echo $e.get_current_user();
			$this->db->rollback();
			return false;
		}
		return true;
	}
	

}

?>