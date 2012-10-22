<?php

/**
 * WallController
 * 
 * @author
 * @version 
 */

require_once 'Zend/Controller/Action.php';
require_once 'Database/User/Userinfo.php';
require_once 'Twitter/Twitter.php';
require_once 'Twitter/Comment.php';
require_once 'Twitter/Like.php';
class WallController extends Zend_Controller_Action {
	private $_smarty;
	private $_config;
	private $_auth;
	protected  $db;
	protected $message;	
	private $_userId;
	private $_img;
	public function init()
	{
		$this->_smarty=Zend_Registry::get('smarty');
		$this->_config=Zend_Registry::get('config');
		$this->db=Zend_Registry::get('db');
		$this->message=$this->_helper->getHelper('FlashMessenger');
		$this->_auth=Zend_Auth::getInstance();
		if ($this->_auth->hasIdentity())
		{
			$this->_userId=$this->_auth->getIdentity()->user_id;
			$user=new Database_User_Userinfo($this->db);
			$user->load($this->_userId,'user_id');
			$this->_img=$user->user_img;

			$userId=$this->_auth->getIdentity()->user_id;
			$userName=$this->_auth->getIdentity()->user_name;

			$userUs=$this->_auth->getIdentity()->user_us;
			$userBirthday=$user->user_birthday;
		
		$this->_smarty->assign('daysActive','class="active"');
    	$this->_smarty->assign('userId',$userId);
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
	public function indexAction() {
		
				$request=$this->getRequest();	
				$month=date('n');
				$day=date('j');
				$valid=new Twitter_Twitter($this->db, $this->_userId,$month);
				$date=$month.'-'.$day;
				$this->_smarty->assign('month',$month);
				$this->_smarty->assign('day',$day);
				$twitterResult=$valid->showTwitter($date);
				$days366Result=$valid->showDays366($date);
				$this->_smarty->assign('days366Result',$days366Result);
				$this->_smarty->assign('twitterResult',$twitterResult);
			$this->_smarty->display('wall/wall.tpl');
				
				
}
	public function deletetwitterAction()
	{
		$request=$this->getRequest();
		$valid=new Twitter_Like($this->db);
		if (!$valid->delete($request))
		{
		header('Content-Type:application/json,text/javascript');
	
		echo '{"result":{"state":"fail"}}';		
		return true;
		}
		header('Content-Type:application/json,text/javascript');
	
		echo '{"result":{"state":"success"}}';	
		return true;	



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
	public function choosedayAction()
	{
				$request=$this->getRequest();
				$primaryDate=$request->getQuery('wallDate');
				$month=explode('月',$primaryDate);
				$filter=new Zend_Filter_Digits();
				$day=$filter->filter($month[1]);
				$date=$month[0].'-'.$day;
				$valid=new Twitter_Twitter($this->db, $this->_userId,$month);

				$this->_smarty->assign('month',$month[0]);
				$this->_smarty->assign('day',$day);
				$twitterResult=$valid->showTwitter($date);
				$days366Result=$valid->showDays366($date);
				$this->_smarty->assign('days366Result',$days366Result);
				$this->_smarty->assign('twitterResult',$twitterResult);

				$this->_smarty->display('wall/wall.tpl');	
				
	}	

}
