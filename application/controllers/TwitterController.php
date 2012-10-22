<?php

/**
 * TwitterController
 * 
 * @author
 * @version 
 */
require_once 'Database/User/Userinfo.php';
require_once 'Zend/Controller/Action.php';
require_once 'Twitter/Save.php';
require_once 'Twitter/Twitter.php';
require_once 'Twitter/Like.php';
require_once 'Twitter/Favourite.php';
require_once 'Twitter/Comment.php';
require_once 'Img/Deal.php';
require_once 'Date/Date.php';
class TwitterController extends Zend_Controller_Action {
	/**
	 * The default action - show the home page
	 */
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
		/*设置cookie*/
		setcookie('userImg',$this->_userImg,time()+60000,'/');

		$valid=new Twitter_Twitter($this->db, $this->_userId);
		$day=date('j');
		$month=date('n');
		$date=$month.'-'.$day;
		$request=$this->getRequest();
		$number=$request->getQuery('number');
		
		if ($number != null OR $number != ''){
			$allTwitterResult=$valid->showAllTwitter($date,$number-1);		
		}else{
		$allTwitterResult=$valid->showAllTwitter($date);
		}
		$recordNumber=count($allTwitterResult);

		$friend=$valid->getFriend();
		$follower=$valid->getFollower();
		$birthday=$valid->getSpecial($this->_userBirthday);
		$specialImg=$valid->getImage();
		
		$page=$valid->getRow($date);
		$this->_smarty->assign('pageNumber',$page);
		$this->_smarty->assign('type',1);
		$this->_smarty->assign('specialImg',$specialImg);
		$this->_smarty->assign('friendNumber',$friend);
		$this->_smarty->assign('followerNumber',$follower);
		$this->_smarty->assign('birthdayNumber',$birthday);
		$this->_smarty->assign('recordNumber',$recordNumber);
		$this->_smarty->assign('allTwitterResult',$allTwitterResult);
		$this->_smarty->assign('month',$month);
		$this->_smarty->assign('pageMonth',$month);
		$this->_smarty->assign('pageDay',$day);
		$this->_smarty->assign('day',$day);
		
	
		$this->_smarty->display('twitter/index.tpl');

	
	}
	public function moreAction()
	{
		$request=$this->getRequest();
		
		$valid=new Twitter_Twitter($this->db, $this->_userId);
		$result=$valid->showOtherAllTwitter($request);
		$number=$request->getQuery('number')+count($result);
			header('Content-Type:application/json,text/javascript');
	
		echo'{"result":[';
		for ($i=0;$i<count($result);$i++)
		{
		if ($i==(count($result)-1))
{
		echo <<<friendResult
{
	"twitterId":"{$result[$i]['twitter_id']}",
	"userName":"{$result[$i]['action_user_name']}",
	"userImg":"{$result[$i]['action_user_image']}",
	"twitterContent":"{$result[$i]['twitter_content']}",
	"twitterTime":"{$result[$i]['twitter_time']}",
	"userId":"{$result[$i]['twitter_user_id']}",
	"twitterImg":"{$result[$i]['twitter_image']}",
	"twitterLike":"{$result[$i]['twitter_like']}",
	"twitterFavourite":"{$result[$i]['twitter_favourite']}",
	"twitterComment":"{$result[$i]['twitter_comment']}"
}
			
friendResult;


}else{
		echo <<<friendResult
{
	"twitterId":"{$result[$i]['twitter_id']}",
	"userName":"{$result[$i]['action_user_name']}",
	"userImg":"{$result[$i]['action_user_image']}",
	"twitterContent":"{$result[$i]['twitter_content']}",
	"twitterTime":"{$result[$i]['twitter_time']}",
	"twitterImg":"{$result[$i]['twitter_image']}",
	"userId":"{$result[$i]['twitter_user_id']}",
	"twitterLike":"{$result[$i]['twitter_like']}",
	"twitterFavourite":"{$result[$i]['twitter_favourite']}",
	"twitterComment":"{$result[$i]['twitter_comment']}"
},
			
friendResult;
}
		}
		echo "],\"number\":\"{$number}\"}";

	}
	public function commentAction()
	{
		$request=$this->getRequest();
		$valid=new Twitter_Comment($this->db, $this->_userId);
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
		$valid=new Twitter_Favourite($this->db,$this->_userId);
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
	
	public function likeAction()
	{
		$request=$this->getRequest();
	
		$valid=new Twitter_Like($this->db);
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
	
	public function saveAction()
	{
		$request=$this->getRequest();
		$valid=new Twitter_Save($this->db,$this->_userId);
		
		if (!$valid->process($request))
		{
			$error=$valid->error;
			$this->message->addMessage($error);
			$this->_redirect('http://www.days366.com/twitter/add');

		}
		$this->_redirect('http://www.days366.com/twitter');
		return true;	
		
		
	}
	public function getcommentAction()
	{
		$request=$this->getRequest();
		$valid=new Twitter_Comment($this->db, $this->_userId);
		$result=$valid->getComment($request);
		header('Content-Type:application/json,text/javascript');
	
		echo'{"result":[';
		for ($i=0;$i<count($result);$i++)
		{
if ($i==(count($result)-1))
{
		echo <<<friendResult
{
	"userId":"{$result[$i]['tc_user_id']}",
	"userName":"{$result[$i]['action_user_name']}",
	"userImg":"{$result[$i]['action_user_img']}",
	"userContent":"{$result[$i]['tc_comment']}",
	"userTime":"{$result[$i]['tc_time']}"
}
			
friendResult;


}else{
		echo <<<friendResult
{
	"userId":"{$result[$i]['tc_user_id']}",
	"userName":"{$result[$i]['action_user_name']}",
	"userImg":"{$result[$i]['action_user_img']}",
	"userContent":"{$result[$i]['tc_comment']}",
	"userTime":"{$result[$i]['tc_time']}"
},
			
friendResult;
}
		}
		echo ']}';
		
	}
	public function imagesaveAction()
	{

		$request=$this->getRequest();
		$valid=new Img_Deal($this->db);
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
	
	public function finddayAction()
	{
		$request=$this->getRequest();
		$number=$request->getQuery('day');
		
		$validNumber=new Zend_Validate_Between($number-2,$number);
		if (!$validNumber->isValid($number)){$number=date('j')-2;}
		$valid=new Twitter_Twitter($this->db, $this->_userId);
		$month=$request->getQuery('month');

		$date=$month.'-'.$number;
		$numberDay=$request->getQuery('number');
		
		if ($numberDay != null OR $numberDay != ''){
			$allTwitterResult=$valid->showAllTwitter($date,$numberDay-1);		
		}else{
		$allTwitterResult=$valid->showAllTwitter($date);
		}
		$day=date('j');
		$this->_smarty->assign('pageMonth',$month);
		$this->_smarty->assign('pageDay',$number);
		$recordNumber=count($allTwitterResult);
		$friend=$valid->getFriend();
		$follower=$valid->getFollower();
		$birthday=$valid->getSpecial($this->_userBirthday);
		$specialImg=$valid->getImage();
		$message=$valid->message();
		$response=$valid->response();
		$page=$valid->getRow($date);
		$this->_smarty->assign('type',2);
		$this->_smarty->assign('pageNumber',$page);
		$this->_smarty->assign('specialImg',$specialImg);
		$this->_smarty->assign('friendNumber',$friend);
		$this->_smarty->assign('followerNumber',$follower);
		$this->_smarty->assign('birthdayNumber',$birthday);
		$this->_smarty->assign('recordNumber',$recordNumber);
		$this->_smarty->assign('allTwitterResult',$allTwitterResult);
		$this->_smarty->assign('month',date('n'));
		$this->_smarty->assign('day',$day);
		$this->_smarty->assign('messageNumber',$message);
		$this->_smarty->assign('responseNumber',$response);
		$this->_smarty->display('twitter/index.tpl');	

	}
	public function addAction(){
		$valid=new Twitter_Twitter($this->db, $this->_userId);
		$birthday=$valid->getSpecial($this->_userBirthday);
		$message=$this->message->getMessages();
		$this->_smarty->assign('error',$message);
		$this->_smarty->assign('birthdayNumber',$birthday);
		$this->_smarty->display("twitter/addmicroblog.tpl");
	
	}
	public function testAction()
	{
		$this->_smarty->display('test.tpl');
	}

}
