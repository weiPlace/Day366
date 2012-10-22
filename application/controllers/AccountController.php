<?php
/**
 * @author wei
 * @time 2012-6-9 20:25:26
 * @version 0.1
 * 
 */
require_once 'Zend/Registry.php';
require_once 'Twitter/Twitter.php';
require_once 'Login/Work.php';
class AccountController extends Zend_Controller_Action
{	
	private $_smarty;
	private $_config;
	private $_auth;
	protected  $db;
	protected $message;
	private $_valid;

	
	public function init()
	{
		$this->_smarty=Zend_Registry::get('smarty');
		$this->_config=Zend_Registry::get('config');
		$this->db=Zend_Registry::get('db');
		$this->message=$this->_helper->getHelper('FlashMessenger');
		$this->_valid=new Twitter_Twitter($this->db, 0);
		$this->_auth=Zend_Auth::getInstance();

	}

	public function indexAction()
	{	
		$auth=Zend_Auth::getInstance();
		
		if ($auth->hasIdentity())
		{
			$this->_redirect($this->_config->pathweb->base.'twitter/index');
		}
		$request=$this->getRequest();
		$message=$this->message->getMessages();
		$this->_smarty->assign('error',$message);
		$this->_smarty->display('account/login.tpl');

		
	}
	

	
	public function logoutAction()
	{
		Zend_Auth::getInstance()->clearIdentity();
		$this->_redirect('/account/index');
	}
	
	public function registerAction()
    {
        // action
        $error=$this->message->getMessages();
        $this->_smarty->assign('error',$error);
		$this->_smarty->display('account/register.tpl');
	}
	public function registersuccessAction()
	{
		$this->_smarty->display('account/registersuccess.tpl');	
	}
	
	public function findpassAction()
	{
		$this->_smarty->display('account/findpass.tpl');
	}
	

}
