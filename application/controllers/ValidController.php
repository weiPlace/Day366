<?php

/**
 * ValidController
 *
 * @author
 * @version
 */

require_once 'Zend/Controller/Action.php';
require_once 'Mail/Send.php';
require_once 'Check/Userinfo.php';
require_once 'Check/Userimg.php';
require_once 'Check/Us.php';
require_once 'Check/Imgfinish.php';
require_once 'Twitter/Twitter.php';
class ValidController extends Zend_Controller_Action
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
		$this->_redirect($this->_config->pathweb->base.'account');
	}

	public function userinfoAction()
	{
		$request=$this->getRequest();
		$valid=new Check_Userinfo($this->db);

		if ($valid->process($request))
		{
			if (!$valid->primaryName)
			{
				$this->_redirect($this->_config->pathweb->base.'search');
			
			}			
			$this->message->addMessage("资料修改成功,导航条的数据将在你下次登录时自动修改");
			$this->_redirect($this->_config->pathweb->base.'userinfo/label');
		}else
		{
			$error=$valid->getError();
			$this->message->addMessage($error);
			$this->_redirect($this->_config->pathweb->base.'userinfo/index');
			
		}
		
	}
	
	

	//处理头像
	public function userimgAction()
	{
		$request=$this->getRequest();
		$valid=new Check_Userimg($this->db);
		if ($valid->process($request))
		{
			if ($valid->saveImg())
			{
				$name=$valid->getFileName();

				$this->_smarty->assign('img',$name);
				$this->_smarty->display('user/imgcheck.tpl');

				
			}else
			{
			$error=$valid->getError();
			$this->message->addMessage($error);
			$this->_redirect($this->_config->pathweb->base.'userinfo/changeimg');			
			}
		}else
		{
			$error=$valid->getError();
			$this->message->addMessage($error);
			$this->_redirect($this->_config->pathweb->base.'userinfo/changeimg');
		}
	}
	public function addusAction()
	{
		try{
		$request=$this->getRequest();
		$valid=new Check_Us($this->db);
		
		if ($valid->process($request))
		{
			$this->message->addMessage('感谢你的补充，我们会尽快完善数据库！');
			
			$this->_redirect($this->_config->pathweb->base.'userinfo/index');
			
		}else
		{
			
			$error=$valid->getError();
			$this->message->addMessage($error);
			$this->_redirect($this->_config->pathweb->base.'userinfo/index');
		
		}}catch(Zend_Exception $e){echo $e.get_current_user();}
	}
	public function imgfinishAction()
	{
		$request=$this->getRequest();
		$valid=new Check_Imgfinish($this->db);
		if ($valid->process($request))
		{
			
			$this->_redirect($this->_conifig->pathweb->base.'userinfo/label');
			
		}else
		{	$error=$valid->getError();
			$this->message->addMessage($error);
			$this->_redirect($this->_config->pathweb->base.'userinfo/changeimg');
		}
	}
}
