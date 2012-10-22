<?php
require_once 'Check.php';
require_once "Database/Account/UserRegister.php";
class Check_Findpass extends Check
{	
	private $_email;
	private $_user;
	protected $error;
	
	public function __construct($db)
	{
		$this->_user=new Database_Account_UserRegister($db);
	}
	
	public function process(Zend_Controller_Request_Abstract $request)
	{
		$this->_email=$this->sanitize($request->getPost('email'));
	    	//验证电子邮件
    	$validateEmail=new Zend_Validate_EmailAddress();
    	
    	 if (strlen($this->_email)==0){
			$this->error="电子邮箱地址不能为空";
			return false;   	 
    	 }elseif (!$validateEmail->isValid($this->_email))
    	 {
    		$this->error="请输入正确的电子邮箱地址";
    		return false;
    	}
    	$result=$this->_user->queryEmail($this->_email);
    	if (!$result)
    	{
    		$this->error="此账户不存在！";
    		return false;
    	}else
    	{
    		//do something to send email
    	}
    	return true;
	}
	
	public function getError()
	{
		return $this->error;
	}
}
?>