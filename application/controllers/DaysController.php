<?php

/**
 * DaysController
 * 
 * @author
 * @version 
 */

require_once 'Zend/Controller/Action.php';
require_once 'Day/Show.php';
require_once 'Database/User/Userinfo.php';
require_once 'Day/Like.php';
require_once 'Day/Favourite.php';
require_once 'Day/Add.php';
require_once 'Img/Days.php';
require_once 'Day/Save.php';
require_once 'Day/Comment.php';
require_once 'Date/Date.php';
require_once 'Twitter/Twitter.php';
class DaysController extends Zend_Controller_Action {
	protected  $db;
	private $_smarty;
	private $_config;
	public $message;
	private $_auth;
	//得到用户的基本信息
	private $_userName;
	private $_userId;
	private $_userBirthday;
	private $_us;
	private $_userImg;
	private $_day;
	private $_yesterday;
	private $_preYesterday;
	private $_lastMonth;
	private $_preLastMonth;
	private $_valid;
	
	public function init()
	{
		$this->_smarty=Zend_Registry::get('smarty');
		$this->_config=Zend_Registry::get('config');
		$this->db=Zend_Registry::get('db');
		$this->message=$this->_helper->getHelper('FlashMessenger');
		$this->_auth=Zend_Auth::getInstance();
		if ($this->_auth->hasIdentity()){
			$this->_userName=$this->_auth->getIdentity()->user_name;
			$this->_userId=$this->_auth->getIdentity()->user_id;
			$this->_us=$this->_auth->getIdentity()->user_us;
			$user=new Database_User_Userinfo($this->db);
			$user->load($this->_userId,'user_id');
			$this->_userImg=$user->user_img;
			$this->_userBirthday=$user->user_birthday;
			$this->_smarty->assign('twitterActive','class="active"');
			$this->_smarty->assign('userId',$this->_userId);
			$this->_smarty->assign('userName',$this->_userName);
			$this->_smarty->assign('userBirthday',$this->_userBirthday);
			$this->_smarty->assign('userUs',$this->_us);
			$this->_smarty->assign('userImg',$this->_userImg);
		}


		
		/**
		 * @description give the messeages for users;
		 * @author wei
		 * @time 2012-8-16 19:26:15
		 */
		$this->_valid=new Twitter_Twitter($this->db, $this->_userId);
		$message=$this->_valid->message();
		$response=$this->_valid->response();
		$this->_smarty->assign('messageNumber',$message+$response);		
	}
	public function indexAction() {
		
		// TODO Auto-generated NoidDaysController::indexAction() default action
		$user=new Day_Show($this->db);
		$result=$user->showAll(date('n-j'));
		$this->_smarty->assign('result',$result);
		$month=date('n');
		$day=date('j');
		$this->_smarty->assign('month',$month);
		$this->_smarty->assign('day',$day);
		if ($this->_auth->hasIdentity()){
		$this->_smarty->display('days/login.tpl');
		}else{
		$this->_smarty->display('days/notlogin.tpl');
		}
		
	}
	public function findAction()
	{
		$request=$this->getRequest();
		$primaryDate=$request->getQuery('wallDate');
		$month=explode('-',$primaryDate);
		$filter=new Zend_Filter_Digits();
		$day=$filter->filter($month[1]);
		$user=new Day_Show($this->db);
		$result=$user->showAll($month[0].'-'.$day);
		$this->_smarty->assign('month',$month[0]);
		$this->_smarty->assign('day',$day);
		$this->_smarty->assign('result',$result);
		if ($this->_auth->hasIdentity()){
		$this->_smarty->display('days/login.tpl');
		}else{
		$this->_smarty->display('days/notlogin.tpl');
		}
	
	
	}
	public function likeAction()
	{
		$request=$this->getRequest();
	
		$valid=new Day_Like($this->db);
		if (!$valid->process($request))
		{
		header('Content-Type:application/json,text/javascript');
	
		echo "{\"result\":{\"state\":\"fail\"}}";		
		return true;
		}
		
		
		header('Content-Type:application/json,text/javascript');
	
		echo "{\"result\":{\"state\":\"success\"}}";	
		return true;	
			
	}
	public function favouriteAction()
	{
		$request=$this->getRequest();
		$valid=new Day_Favourite($this->db,$this->_userId);
		if (!$valid->process($request))
		{
		header('Content-Type:application/json,text/javascript');
	
		echo "{\"result\":{\"state\":\"fail\"}}";		
		return true;
		}
		
		
		header('Content-Type:application/json,text/javascript');
	
		echo "{\"result\":{\"state\":\"success\"}}";	
		return true;
	}
	public function addAction()
	{
		$valid=new Twitter_Twitter($this->db, $this->_userId);
		$birthday=$valid->getSpecial($this->_userBirthday);
		$message=$this->message->getMessages();
		$this->_smarty->assign('error',$message);
		$this->_smarty->assign('birthdayNumber',$birthday);
		$this->_smarty->display("days/add.tpl");
		
		
	}
	public function listAction(){
					$request=$this->getRequest();
	
	
					$this->_smarty->display('days/list.tpl');
	
	}
	public function imagesaveAction()
	{
			$request=$this->getRequest();
		$valid=new Img_Days($this->db);
		if (!$valid->process($request))
		{		
		echo "{\"result\":{\"state\":\"fail\",\"message\":\"{$valid->error}\"}}";		
		return true;
			
		}
		if (!$valid->saveImg())
		{

		echo "{\"result\":{\"state\":\"fail\",\"message\":\"{$valid->error}\"}}";		
		return true;		
		
		
		}
		$id=$valid->getFileName();
	
		echo "{\"result\":{\"state\":\"success\",\"id\":\"$id\"}}";	
		return true;	
	
	
	}
	public function saveAction()
	{
		$request=$this->getRequest();
		$valid=new Day_Save($this->db,$this->_userId);
		$date=date("n-j", strtotime($this->_userBirthday));		
		if (!$valid->process($request,$date))
		{
			$error=$valid->error;
			$this->message->addMessage($error);
			$this->_redirect('http://www.days366.com/days/add');

		}
		$this->_redirect('http://www.days366.com/days');
		return true;	
		
		
	}
	public function commentAction()
	{
		$request=$this->getRequest();
		$valid=new Day_Comment($this->db, $this->_userId);
		if (!$valid->process($request))
		{
		header('Content-Type:application/json,text/javascript');
	
		echo "{\"result\":{\"state\":\"fail\"}}";		
		return true;
		}
		
		
		header('Content-Type:application/json,text/javascript');
	
		echo "{\"result\":{\"state\":\"success\"}}";	
		return true;
	}
}
