<?php

/**
 * BefriendController
 * 
 * @author
 * @version 
 */

require_once 'Zend/Controller/Action.php';
require_once 'Database/User/Userinfo.php';
require_once 'Search/Showuser.php';
require_once 'Userfriend.php';
require_once 'Befriend/Delete.php';
require_once 'Twitter/Twitter.php';
class BefriendController extends Zend_Controller_Action {
	private $_smarty;
	private $_config;
	protected  $db;
	private $_auth;
	public $message;
	private $_img;
	private $_userId;
	private $_friendNumber;
	private $_followerNumber;
	private $_birthdayNumber;
	public function init()
	{
		$this->_smarty=Zend_Registry::get('smarty');
		$this->_config=Zend_Registry::get('config');
		$this->db=Zend_Registry::get('db');
		$this->_auth=Zend_auth::getInstance();
	
		$this->message=$this->_helper->getHelper('FlashMessenger');	
		if ($this->_auth->hasIdentity())
		{	
			$user=new Database_User_Userinfo($this->db);
			$user->load($this->_auth->getIdentity()->user_id,'user_id');
			$this->_img=$user->user_img;
			$userBirthday=$user->user_birthday;
			$this->_userId=$this->_auth->getIdentity()->user_id;
			$userName=$this->_auth->getIdentity()->user_name;

			$userUs=$this->_auth->getIdentity()->user_us;
			$valid=new Twitter_Twitter($this->db, $this->_userId);
			$this->_friendNumber=$valid->getFriend();
			$this->_followerNumber=$valid->getFollower();
			$this->_birthdayNumber=$valid->getSpecial($userBirthday);
		$specialImg=$valid->getImage();
		$this->_smarty->assign('specialImg',$specialImg);
		$this->_smarty->assign('friendNumber',$this->_friendNumber);
		$this->_smarty->assign('followerNumber',$this->_followerNumber);
		$this->_smarty->assign('birthdayNumber',$this->_birthdayNumber);
		$this->_smarty->assign('friendActive','class="active"');
    	$this->_smarty->assign('userId',$this->_userId);
    	$this->_smarty->assign('userName',$userName);

    	$this->_smarty->assign('userUs',$userUs);
    	$this->_smarty->assign('userBirthday',$userBirthday);
    	$this->_smarty->assign('userImg',$this->_img);
    	
    	$this->_valid=new Twitter_Twitter($this->db, $this->_userId);
		$message=$this->_valid->message();
		$response=$this->_valid->response();
		$this->_smarty->assign('messageNumber',$message+$response);
		}
	}
	/**
	 * The default action - show the home page
	 */
	public function indexAction() {
		// TODO Auto-generated FriendController::indexAction() default action
		//显示当前的好友
		$request=$this->getRequest();

		$id=$this->_auth->getIdentity()->user_id;
		$showFriend=new Search_Showuser($this->db);
		$pageNumber=$showFriend->getBeRows($id);
		$result=$showFriend->searchBeFriend($id);
		$this->_smarty->assign('pageNumber',$pageNumber);
		$this->_smarty->assign('result',$result);

		$message=$this->message->getMessages();
		$this->_smarty->assign('error',$message);
		$this->_smarty->display('befriend/index.tpl');
		
		
	}


	/**
	 * @author WEI
	 * @category ajax
	 * @deprecated 当用户选择分页时调用
	 */
	public function choosepageAction()
	{
		$request=$this->getRequest();
		$pageNumber=$request->getQuery('pageNumber')-1;
		$id=$this->_auth->getIdentity()->user_id;
		$showFriend=new Search_Showuser($this->db);
		$result=$showFriend->searchBeFriend($id,$pageNumber);
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
	"userBirthday":"{$result[$i]['user_birthday']}",
	"userProvince":"{$result[$i]['user_province']}",
	"userCity":"{$result[$i]['user_city']}",
	"userUs":"{$result[$i]['user_us']}"
},
			
friendResult;
}
		}
		echo ']}';
	}

	
	//用户要求进入收藏用户的主页时调用
	public function findfriendmainpageAction()
	{
		$request=$this->getRequest();
		$friendId=$request->getQuery('id');
		$user=new Userfriend($this->db);
		$result=$user->getPermit($this->_auth->getIdentity()->user_id,$friendId);
		switch($result)
		{
			//用户并未收藏此用户
			case 'false':
				{
					$this->_redirect($this->_config->pathweb->base.'Userfriend/stranger?id='.$friendId);
				}
			//权限设置为0
			case '2':
				{
					$this->_redirect($this->_config->pathweb->base.'Userfriend/stranger?id='.$friendId);
				}
			default:
				{
					echo "权限为4";
				}
		}
		
	
	}
	//用户要求删除收藏好友时调用
	public function deleteAction()
	{
		$request=$this->getRequest();
		$valid=new Befriend_Delete($this->db);
		$userId=$this->_auth->getIdentity()->user_id;
		if (!$valid->process($request,$userId))
		{
			header('Content-Type:application/json,text/javascript');
	
			echo '{"result":{"state":"fail"}}';
			return true;

		}
		header('Content-Type:application/json,text/javascript');
			echo '{"result":{"state":"success"}}';

		return true;
	}
}

