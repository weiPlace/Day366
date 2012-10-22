<?php

/** 
 * @author wei
 * 
 * 
 */
require_once 'Twitter.php';
require_once 'Database/Day.php';
require_once 'Database/Day_Comment.php';
class Day_Comment extends Twitter {
	//TODO - Insert your code here
	private $_user;
	private $_twitter;
	private $_number;
	private $_content;
	private $_userId;
	protected $db;
	private $_type;

	/**
	 * 	@author wei
	 * @desciption repair bug 0000001
	 */
	public function __construct($db,$userId) {
			$this->_user=new Database_Day_Comment($db);
			$this->_twitter=new Database_Day($db);
			$this->_userId=$userId;
			$this->db=$db;
	}
	
	public function process(Zend_Controller_Request_Abstract $request)
	{
		$this->_number=$this->sanitize($request->getPost('id'));
		$this->_number=$this->getInt($this->_number);
		$this->_content=$this->sanitize($request->getPost('content'));
		$valid=new Zend_Validate_StringLength(1,200);		
		if (!$valid->isValid($this->_content)){return false;}
		try{
		if (!$this->writeToDatabase()){return false;}
		
		if (!$this->addComment()){return false;}
		return true;
		}catch(Zend_Exception $e)
		{
			echo $e.get_current_user();
		}

		
	}

	private function writeToDatabase()
	{
		$this->_user->days_item_id=$this->_number;
		$this->_user->days_user_id=$this->_userId;
		$this->_user->days_comment=$this->_content;
		$this->_user->save();
		return true;
	}
	private function addComment()
	{
		$this->_twitter->load($this->_number);
		$commentNumber=$this->_twitter->days_comment;
		$commentNumber=$commentNumber+1;
		$this->_twitter->days_comment=$commentNumber;
		$owner=$this->_twitter->days_user_id;
		$this->_twitter->save();
		return true;
		
	}

	

}

?>