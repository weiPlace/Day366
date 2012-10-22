<?php

require_once 'Database/Account/Login.php';
require_once 'Database/User/Userinfo.php';
require_once 'Database/Friend/Friend.php';
/**
 * @author wei
 *
 *
 */
class Check_Login extends Check  {
	//TODO - Insert your code here
	private $_db;
	private $_email;
	private $_password;
	private $_user;
	protected $error;
	private $_auth;
	public $active=true;
	function __construct($db) 
	{
		$this->_db=$db;
		$this->_auth=Zend_Auth::getInstance();
	}
	
	public function process(Zend_Controller_Request_Abstract $request)
	{
		$email=$request->getPost('account');
		$password=$request->getPost('password');
		if (strlen($email)==0)
		{
			$this->error="账户地址不能为空";
			return  false;
		}
		if (strlen($password)==0)
		{
			$this->error="密码不能为空";
			return false;
		}
		$this->_email=$this->sanitize($email);
		$this->_password=$this->sanitize($password);
		$adapter=new Zend_Auth_Adapter_DbTable($this->_db,'register','register_email','register_password','md5(?)');
		$adapter->setIdentity($this->_email);
		$adapter->setCredential($this->_password);
		
		$result=$this->_auth->authenticate($adapter);
		if ($result->isValid())
		{
			
			$this->_user=new Database_Account_Login($this->_db);
		
			
			$id=$adapter->getResultRowObject()->register_id;
		
			$this->_user->load($id);
			/*
			 * 验证其账户是否激活
			 */
			$active=$this->_user->register_active;
			if ($active==0)
			{
				$this->active=false;
				$this->_user->register_active=1;
				$this->_user->save();
				$friend=new Database_Friend_Friend($this->_db);
				$friend->user_id=$id;
				$friend->friend_id=96;
				$friend->save();
			}
			$identity=$this->_user->createAuthIdentity();
			$this->_auth->getStorage()->write($identity);
			
			
			return true;
		}
		
		$this->error="你所输入的密码与用户名不相符，请重新输入";
		return false;
		
	}
	
	public function getError()
	{
		return $this->error;
	}
}


