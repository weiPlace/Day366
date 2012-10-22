<?php
require_once 'Database/User/Userinfo.php';
/**
 * UserinfoController
 *
 * @author wei
 * @version 0.1
 */

require_once 'Zend/Controller/Action.php';
require_once 'Twitter/Twitter.php';
class UserinfoController extends Zend_Controller_Action
{
	private $_smarty;
	private $_config;
	private $_auth;
	protected $db;
	public $message;
	private $_userId;
	private $_friendNumber;
	private $_followerNumber;
	private $_birthdayNumber;
	private $_twitter;
	public function init()
	{

		
		$this->_smarty=Zend_Registry::get('smarty');
		$this->_config=Zend_Registry::get('config');
		$this->db=Zend_Registry::get('db');
		$this->message=$this->_helper->getHelper('FlashMessenger');
		$this->_auth=Zend_Auth::getInstance();

		if ($this->_auth->hasIdentity())
		{	
			$user=new Database_User_Userinfo($this->db);
			$user->load($this->_auth->getIdentity()->user_id,'user_id');
			$this->_img=$user->user_img;

			$this->_userId=$this->_auth->getIdentity()->user_id;
			$userName=$this->_auth->getIdentity()->user_name;

			$userUs=$this->_auth->getIdentity()->user_us;
			$userBirthday=$user->user_birthday;
			$valid=new Twitter_Twitter($this->db, $this->_userId);
			$this->_friendNumber=$valid->getFriend();
			$this->_followerNumber=$valid->getFollower();
			$this->_birthdayNumber=$valid->getSpecial($userBirthday);
		$specialImg=$valid->getImage();
		$this->_smarty->assign('specialImg',$specialImg);
		$this->_smarty->assign('friendNumber',$this->_friendNumber);
		$this->_smarty->assign('followerNumber',$this->_followerNumber);
		$this->_smarty->assign('birthdayNumber',$this->_birthdayNumber);		

    	$this->_smarty->assign('userId',$this->_userId);
    	$this->_smarty->assign('userName',$userName);

    	$this->_smarty->assign('userUs',$userUs);
    	$this->_smarty->assign('userBirthday',$userBirthday);
    	$this->_smarty->assign('userImg',$this->_img);
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
	public function indexAction()
	{
		$error=$this->message->getMessages();
		$this->_smarty->assign('error',$error);
		$this->_smarty->display('user/userinfo.tpl');
	}
	
	public function labelAction()
	{
		$user=new Database_User_Userinfo($this->db);
		if ($this->_auth->hasIdentity())
		{
			$id=$this->_auth->getIdentity()->user_id;
		}
		$user->load($id,'user_id');
		$firstname=$user->user_firstname;
		$lastname=$user->user_lastname;
		$gender=$user->user_gender;
		$provinceCites=$user->user_province;
		$city=$user->user_city;
		$usProvince=$user->user_us_province;
		$us=$user->user_us;
		$permit=$user->user_permit;
		$zip=$user->user_zip;
		$img=$user->user_img;
		$people=$firstname.$lastname;
		$birthday=$user->user_birthday;
		$this->_smarty->assign('birthday',$birthday);
		$this->_smarty->assign('people',$people);
		
		
		if ($gender=='0')
		{
			$this->_smarty->assign('gender',"是个男生");
		}else 
		{
			$this->_smarty->assign('gender','是个女生');
		}
		
		$hometown=$provinceCites.$city;
		$this->_smarty->assign('hometown',$hometown);
		$this->_smarty->assign('us',$us);
		
		if($permit=='2')
		{
			$this->_smarty->assign('permit','仅好友可见');
		}elseif ($permit=='3')
		{
			$this->_smarty->assign('permit','允许自己的资料出现在公共主页上');
		}else
		{
			$this->_smarty->assign('permit','仅自己可见');
		}
		if ($img==null)
		{
			$img='default.jpg';
		}
		$this->_smarty->assign('img',$img);
		$error=$this->message->getMessages();
		$this->_smarty->assign('error',$error);
		$this->_smarty->display('user/label.tpl');
		
	}
	

	public function changeimgAction()
	{
		$time=time();
		$this->_smarty->assign('time',$time);
		$error=$this->message->getMessages();
		$this->_smarty->assign('error',$error);
		$this->_smarty->display('user/changeImg.tpl');
	}
}
