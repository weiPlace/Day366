<?php
require_once 'Check.php';
require_once 'Database/Friend/Friend.php';
require_once 'Database/User/Userinfo.php';
/** 
 * @author wei
 * 
 * 
 */
class Check_Search_Save extends Check {
	
	protected $db;
	private $_friendId;
	private $_userId;
	function __construct($db,$id) {
	
		//TODO - Insert your code here
		parent::__construct($db);
		$this->db=$db;
		$this->_userId=$id;
	}
	
	/**
	 * 
	 * @see Check::process()
	 */
	public function process(Zend_Controller_Request_Abstract $request) {
	
		//TODO - Insert your code here
		$this->_friendId=$this->sanitize($request->getQuery('id'));

		$filter=new Zend_Filter_Int();
		$this->_friendId=$filter->filter($this->_friendId);
		$result=$this->checkRelation($this->_userId, $this->_friendId);
		if (!!$result)
		{
			return 2;
		}
		$resultTwo=$this->writeToDatabase();
		if (!$resultTwo)
		{
			return false;
		}
		return true;
	}
	
	/**
	 * 
	 * @see Check::getError()
	 */
	public function getError() 
	{
		return $this->error;
		//TODO - Insert your code here
	}
	
	public function writeToDatabase()
	{
		//引入朋友的姓名
		$this->db->beginTransAction();
		try{
		$user=new Database_Friend_Friend($this->db);
		$user->user_id=$this->_userId;
		$user->friend_id=$this->_friendId;
		$user->save();
		$this->db->commit();
		}catch(Zend_Db_Statement_Mysqli_Exception $e)
		{
			$this->db->rollBack();
			$this->error="收藏失败，请稍后重试";
			return false;
		}
		
		return true;
	}
	public function checkRelation($user_id,$friend_id)
	{
		$sql=$this->db->query('SELECT COUNT(user_id) AS  row FROM friend WHERE user_id=? AND friend_id=?',array($user_id,$friend_id));
		$result=$sql->fetch();
		if ($result['row']==0)
		{
			return false;
		}

		return true;
	}
}

