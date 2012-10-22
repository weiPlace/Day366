<?php

/** 
 * @author wei
 * 
 * 
 */
require_once 'Twitter.php';
require_once 'Database/Twitter.php';
require_once 'Database/Twitter_Comment.php';
require_once 'Database/Comment.php';
require_once 'Database/Response.php';
class Twitter_Comment extends Twitter {
	//TODO - Insert your code here
	private $_user;
	private $_twitter;
	private $_number;
	private $_content;
	private $_userId;
	protected $db;
	private $_comment;
	private $_type;

	/**
	 * 	@author wei
	 * @desciption repair bug 0000001
	 */
	public function __construct($db,$userId) {
			$this->_user=new Database_Twitter_Comment($db);
			$this->_twitter=new Database_Twitter($db);
			$this->_comment=new Database_Comment($db);
			$this->_userId=$userId;
			$this->db=$db;
	}
	
	public function process(Zend_Controller_Request_Abstract $request)
	{
		$this->_number=$this->sanitize($request->getPost('id'));
		$this->_number=$this->getInt($this->_number);
		$this->_content=$this->sanitize($request->getPost('content'));
		$valid=new Zend_Validate_StringLength(1,1200);
		$this->_type=$this->sanitize($request->getPost('attr'));		
		if (!$valid->isValid($this->_content)){return false;}
		//写入评论列表
		if (!$this->writeToDatabase()){return false;}
		//评论数目+1
		if (!$this->addComment()){return false;}
		$number=$this->sanitize($request->getPost('type'));

		if ($number==2)
		{
			$userId=$this->sanitize($request->getPost('userId'));
			$this->repeat($userId);
		}
		return true;
		
		
		
	}
	private function repeat($userId)
	{
		$user=new Database_Response($this->db);
		$user->item_id=$this->_number;
		$user->user_id=$userId;
		$user->type=2;
		$user->save();
		
	}
	private function writeToDatabase()
	{
		$this->_user->tc_item_id=$this->_number;
		$this->_user->tc_user_id=$this->_userId;
		$this->_user->tc_comment=$this->_content;
		$this->_user->save();
		return true;
	}
	private function addComment()
	{
		$this->_twitter->load($this->_number);
		$commentNumber=$this->_twitter->twitter_comment;
		$commentNumber=$commentNumber+1;
		$this->_twitter->twitter_comment=$commentNumber;
		$owner=$this->_twitter->twitter_user_id;
		$this->_twitter->save();
		if ($this->_type == 2)
		{
			return true;
		}	
		$this->_comment->item_id=$this->_number;
		$this->_comment->user_id=$owner;
		$this->_comment->type=2;
		$this->_comment->save();
		return true;
		
	}
	public function getComment(Zend_Controller_Request_Abstract $request)
	{
		$number=$this->sanitize($request->getQuery('id'));
		$number=$this->getInt($number);
				$sql=$this->db->query('SELECT u.user_name action_user_name,u.user_img action_user_img,t.*
									FROM tc_comment t INNER JOIN user u
									ON t.tc_user_id=u.user_id
									WHERE t.tc_item_id=?
									ORDER BY t.tc_time DESC ',array($number));
				$result=$sql->fetchAll();
				return $result;
	}
	

}

?>