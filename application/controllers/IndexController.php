<?php

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
class IndexController extends Zend_Controller_Action {
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
	public function init(){
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
	}
	public function indexAction() {
		echo date("n-j", strtotime($this->_userBirthday));
	}

}
