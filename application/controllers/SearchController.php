<?php
require_once 'Check/Search/Friend.php';
require_once 'Database/User/Userinfo.php';
require_once 'Zend/Controller/Action.php';
require_once 'Twitter/Twitter.php';

class SearchController extends Zend_Controller_Action {
	/**
	 * The default action - show the home page
	 */
	private $_smarty;
	private $_config;
	private $_auth;
	protected $db;
	public $message;
	private $_userId;
	private $_friendNumber;
	private $_followerNumber;
	private $_birthdayNumber;
	private $_us;
	private $_city;
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
			$this->_city=$user->user_city;
			$this->_us=$user->user_us;
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
	public function indexAction(){
		$request=$this->getRequest();
		$valid=new Check_Search_Friend($this->db);
		$result=$valid->getFriend($this->_us,$this->_city);
		$this->_smarty->assign('result',$result);
		$this->_smarty->assign('error','你的资料会在下一次登录进行修改,同时我们为你找到了一些你可能认识的人');
		$this->_smarty->display('search/user.tpl');	
	}
	public function nameAction()
	{
		
		$request=$this->getRequest();

		$valid=new Check_Search_Friend($this->db);

		if (!$valid->process($request))
		{
			$error=$valid->getError();
			$this->_smarty->assign('error',$error);
			$this->_smarty->assign('result',array());		
			$this->_smarty->display('search/user.tpl');
		}else
		{		

			$pageNumber=$valid->getRows();
			$result=$valid->getInfo();

			$this->_smarty->assign('result',$result);
			$type=$request->getPost('type');
			
			$message=$valid->getMess();

			$this->_smarty->assign('type',$type);

			$this->_smarty->assign('pageNumber',$pageNumber);
			$this->_smarty->assign('message',$message);
			$this->_smarty->assign('userInput',$valid->getName());
			$this->_smarty->display('search/user.tpl');
	
		
		}
		
	}


	public function choosepageAction()
	{


		$request=$this->getRequest();
		$valid=new Check_Search_Friend($this->db);

		if (!$valid->ajaxProcess($request))
		{
			header('Content-Type:application/json,text/javascript');
			echo '{"result":{"state":"fail"}}';
		}else
		{
			$result=$valid->getInfo();
			header('Content-Type:application/json,text/javascript');
	
			echo'{"result":[';
			for ($i=0;$i<count($result);$i++)
			{
				if ($i==(count($result)-1))
				{
		echo <<<friendResult
{
	"friendId":"{$result[$i]['user_id']}",
	"userName":"{$result[$i]['user_name']}",
	"userImg":"{$result[$i]['user_img']}",
	"userBirthday":"{$result[$i]['user_birthday']}",
	"userProvince":"{$result[$i]['user_province']}",
	"userCity":"{$result[$i]['user_city']}",
	"userUs":"{$result[$i]['user_us']}"
}
			
friendResult;


				}else{
			echo <<<friendResult
{
	"friendId":"{$result[$i]['user_id']}",
	"userName":"{$result[$i]['user_name']}",
	"userImg":"{$result[$i]['user_img']}",
	"userProvince":"{$result[$i]['user_province']}",
	"userCity":"{$result[$i]['user_city']}",
	"userBirthday":"{$result[$i]['user_birthday']}",
	"userUs":"{$result[$i]['user_us']}"
},
			
friendResult;
}
		}
		echo '],"state":"success"}';
		}
	
	}
	
	public function samedayAction()
	{
		$request=$this->getRequest();
		$valid=new Check_Search_Friend($this->db);
		$result=$valid->getSpecial($request);
		$this->_smarty->assign('result',$result);
		$this->_smarty->display('search/user.tpl');		
	}

}
