<?php

/**
 * ResponseController
 * 
 * @author
 * @version 
 */

require_once 'Zend/Controller/Action.php';
require_once 'Database/User/Userinfo.php';
require_once 'Response/More.php';
require_once 'Twitter/Twitter.php';
require_once 'Date/Date.php';
require_once 'Response/Day.php';
class ResponseController extends Zend_Controller_Action {
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

	
	public function init()
	{
		$this->_smarty=Zend_Registry::get('smarty');
		$this->_config=Zend_Registry::get('config');
		$this->db=Zend_Registry::get('db');
		$this->message=$this->_helper->getHelper('FlashMessenger');
		$this->_auth=Zend_Auth::getInstance();
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
		
		/**
		 * @decription deal the question with date
		 * @author wei
		 * @time 2012-6-29 16:28:32
		 */
		$this->_day=new Date_Date();
		$this->_day->dealNav();
		$this->_yesterday=$this->_day->getYesterday();
		$this->_preYesterday=$this->_day->getPreYesterday();
		$this->_lastMonth=$this->_day->getMonthYesterday();
		$this->_preLastMonth=$this->_day->getMonthPreYesterday();
		$this->_smarty->assign('yesterday',$this->_yesterday);
		$this->_smarty->assign('preYesterday',$this->_preYesterday);

		$this->_smarty->assign('lastMonth',$this->_lastMonth);
		$this->_smarty->assign('preLastMonth',$this->_preLastMonth);
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
		$request=$this->getRequest();
		$valid=new Response_More($this->db);
		$valid->process($request);
		$content=$valid->getContent();
		$comment=$valid->getComment();
		$type=$valid->getType();
		$this->_smarty->assign('content',$content);
		$this->_smarty->assign('comment',$comment);
		$number=count($comment);
		$this->_smarty->assign('number',$number);
		$this->_smarty->display('response/twitter.tpl');	
	}
	public function daysAction() {
		$request=$this->getRequest();
		$valid=new Response_Day($this->db);
		$valid->process($request);
		$content=$valid->getContent();
		$comment=$valid->getComment();
		$type=$valid->getType();
		$this->_smarty->assign('content',$content);
		$this->_smarty->assign('comment',$comment);
		$number=count($comment);
		$this->_smarty->assign('number',$number);
		$this->_smarty->display('response/day.tpl');	
	}

}
