<?php

/**
 * FriendController
 * 
 * @author
 * @version 
 */
require_once 'Database/User/Userinfo.php';
require_once 'Zend/Controller/Action.php';
require_once 'Check/Search/Save.php';
require_once 'Search/Showuser.php';
require_once 'Userfriend.php';
require_once 'Userfriend/Delete.php';
require_once 'Twitter/Twitter.php';
require_once 'Twitter/Comment.php';
require_once 'Twitter/Like.php';
class FriendController extends Zend_Controller_Action {
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
	private $_twitter;
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
		$this->_smarty->assign('friendActive','class="active"');
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
	/**
	 * The default action - show the home page
	 */
	public function indexAction() {
		// TODO Auto-generated FriendController::indexAction() default action
		//显示当前的好友
		$request=$this->getRequest();

		$id=$this->_auth->getIdentity()->user_id;
		$showFriend=new Search_Showuser($this->db);
		$pageNumber=$showFriend->getRows($id);
		$result=$showFriend->searchFriend($id);
		$this->_smarty->assign('pageNumber',$pageNumber);
		$this->_smarty->assign('result',$result);

		$message=$this->message->getMessages();
		$this->_smarty->assign('error',$message);
		$this->_smarty->display('friend/index.tpl');
		
	}

	
	public function saveAction()
	{
		$request=$this->getRequest();
		$id=$this->_auth->getIdentity()->user_id;
		$valid=new Check_Search_Save($this->db,$id);
		$result=$valid->process($request);
		if (!$result)
		{
			header('Content-Type:application/json,text/javascript');
	
			echo '{"result":{"state":"fail"}}';
			return true;

		}elseif ($result===2)
		{
			header('Content-Type:application/json,text/javascript');
	
			echo '{"result":{"state":"fail","type":"exist"}}';
			return true;
		}else{
			header('Content-Type:application/json,text/javascript');
			echo '{"result":{"state":"success","type":"true"}}';

			return true;
		}
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
		$result=$showFriend->searchFriend($id,$pageNumber);
		header('Content-Type:application/json,text/javascript');
	
		echo'{"result":[';
		for ($i=0;$i<count($result);$i++)
		{
if ($i==(count($result)-1))
{
		echo <<<friendResult
{
	"friendId":"{$result[$i]['friend_id']}",
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
	"friendId":"{$result[$i]['friend_id']}",
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

		if ($friendId==$this->_userId)
		{
			$this->_redirect($this->_config->pathweb->base.'userinfo/label');
		}	
		$friendUser=new Database_User_Userinfo($this->db);
		$friendUser->load($friendId,'user_id');
		$this->_smarty->assign('friendId',$friendUser->user_id);
		$this->_smarty->assign('friendImg',$friendUser->user_img);
		$this->_smarty->assign('friendName',$friendUser->user_name);
		$this->_smarty->assign('friendProvince',$friendUser->user_province);
		$this->_smarty->assign('friendCity',$friendUser->user_city);
		$this->_smarty->assign('friendBirthday',$friendUser->user_birthday);
		$this->_smarty->assign('friendUs',$friendUser->user_us);
		$user=new Userfriend($this->db);
		$result=$user->getPermit($this->_userId,$friendId);
		if (!$result || !!($result==4))
		{
			$this->_smarty->display('friend/stranger.tpl');
			return true;
		}
			$this->_redirect('http://www.days366.com/friend/tofriendwall?id='.$friendId);
		
	
	}
	//用户要求删除收藏好友时调用
	public function deleteAction()
	{
		$request=$this->getRequest();
		$valid=new Userfriend_Delete($this->db);
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

	public function tofriendwallAction(){
		$request=$this->getRequest();	
		$id=$request->getQuery('id');
		$date=date('n-j');
		$user=new Userfriend($this->db);
		$result=$user->getPermit($this->_userId,$id);
		if (!$result || !!($result==4))
		{
			$this->_smarty->display('friend/stranger.tpl');
			return true;
		}
		$friendUser=new Database_User_Userinfo($this->db);
		$friendUser->load($id,'user_id');
		$this->_smarty->assign('friendId',$friendUser->user_id);
		$this->_smarty->assign('friendImg',$friendUser->user_img);
		$this->_smarty->assign('friendName',$friendUser->user_name);
		$this->_smarty->assign('friendProvince',$friendUser->user_province);
		$this->_smarty->assign('friendCity',$friendUser->user_city);
		$this->_smarty->assign('friendBirthday',$friendUser->user_birthday);
		$this->_smarty->assign('friendUs',$friendUser->user_us);
		$user=new Userfriend($this->db);
		$month=date('n');
		$day=date('j');
		$valid=new Twitter_Twitter($this->db, $id,$month);

		$this->_smarty->assign('month',$month);
		$this->_smarty->assign('day',$day);

		$twitterResult=$valid->showTwitter($date);

				
		$this->_smarty->assign('twitterResult',$twitterResult);	
		$this->_smarty->display('friend/friendwall.tpl');
}
public function choosedayAction()
{
		$request=$this->getRequest();

		$id=$request->getQuery('friendId');
		$user=new Userfriend($this->db);

		$friendUser=new Database_User_Userinfo($this->db);
		$friendUser->load($id,'user_id');
		$this->_smarty->assign('friendId',$friendUser->user_id);
		$this->_smarty->assign('friendImg',$friendUser->user_img);
		$this->_smarty->assign('friendName',$friendUser->user_name);
		$this->_smarty->assign('friendProvince',$friendUser->user_province);
		$this->_smarty->assign('friendCity',$friendUser->user_city);
		$this->_smarty->assign('friendBirthday',$friendUser->user_birthday);
		$this->_smarty->assign('friendUs',$friendUser->user_us);
		$primaryDate=$request->getQuery('wallDate');
		$month=explode('月',$primaryDate);
		$filter=new Zend_Filter_Digits();
		$day=$filter->filter($month[1]);
		$date=$month[0].'-'.$day;
		$valid=new Twitter_Twitter($this->db, $id,$month);
		$result=$user->getPermit($this->_userId,$id);
		//权限控制
		if (!$result || !!($result==4))
		{
			$this->_smarty->display('friend/stranger.tpl');
			return true;
		}
		$this->_smarty->assign('month',$month[0]);
		$this->_smarty->assign('day',$day);
		$twitterResult=$valid->showTwitter($date);
		$this->_smarty->assign('twitterResult',$twitterResult);		
		$this->_smarty->display('friend/friendwall.tpl');

}
}