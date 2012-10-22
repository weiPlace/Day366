<?php
require_once 'Twitter.php';
require_once 'Database/Day.php';
require_once 'Database/Twitter.php';
class Day_Favourite extends Twitter {
	private $_user;
	private $_userTwo;
	private $_userId;
	public function __construct($db,$id)
	{
		$this->_user=new Database_Day($db);
		$this->_userTwo=new Database_Twitter($db);
		$this->_userId=$id;
	}
	
	public function process(Zend_Controller_Request_Abstract $request)
	{try{
		$id=$this->sanitize($request->getQuery('id'));
		$this->_user->load($id);
		$number=$this->_user->days_favourite;
		$content=$this->_user->days_content;
		$image=$this->_user->days_image;
		$label=$this->_user->days_day;
		$title=$this->_user->days_title;
		$url=$this->_user->days_url;
		$number=$number+1;
		$this->_user->days_favourite=$number;
		
		$this->_user->save();
	
		$this->_userTwo->twitter_user_id=$this->_userId;
		$this->_userTwo->twitter_day=date('n-j');
		$this->_userTwo->twitter_type=3;
		$this->_userTwo->twitter_content=$content;
		$this->_userTwo->twitter_image=$image;
		$this->_userTwo->twitter_title=$title;
		$this->_userTwo->twitter_url=$url;
		$this->_userTwo->save();
		return true;}catch(Zend_Exception $e)
		{
		echo $e.get_current_user();
		}
	}
	

	
}

