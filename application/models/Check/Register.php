<?php
/** 
 * @author wei
 * 
 * 
 */
require_once 'Check.php';
require_once 'Database/Account/UserRegister.php';
require_once 'Database/User/Userinfo.php';
require_once 'Database/Friend/Friend.php';
class Check_Register extends Check
{	
    
	private  $_email;
	private $_password;
	private $_repeatPassword;
	private $_year;
	private $_month;
	private $_day;
	private $_user;

	protected $error;
	public $db;
    //TODO - Insert your code here
    function __construct ($db)
    {
        //TODO - Insert your code here
        //连接数据库
        $this->db=$db;
        $this->_user=new Database_Account_UserRegister($this->db);
     }
     
    public function process(Zend_Controller_Request_Abstract $request){
    	
    	$this->_email=$this->sanitize($request->getPost('email'));
		$this->_password=$this->sanitize($request->getPost('password'));
		$this->_repeatPassword=$this->sanitize($request->getPost('repeatPassword'));
    	//验证电子邮件
    	$validateEmail=new Zend_Validate_EmailAddress();
    	
    	 if (strlen($this->_email)==0)
    	 {
			$this->error="电子邮箱地址不能为空";
			return false;   	 
    	 }elseif (!$validateEmail->isValid($this->_email))
    	 {
    		$this->error="请输入正确的电子邮箱地址";
    		return false;
    	}
    	//验证密码
		if ( strcmp($this->_password, $this->_repeatPassword) != 0)
		 {
			$this->error="两次输入的密码不相符";
			return false;    	
    	}
   
    	$validatePass=new Zend_Validate_StringLength(6,16);
    	if (!$validatePass->isValid($this->_password))
    	{
			$this->error="你所输入的密码太长或太短，请重新输入";
			return false;
    	}

    	$this->writeToDatabase();
    	if (!$this->writeToDatabase()){
    			return false;
    	}
  
    	return true;
    	


    }
    
    	
    public function getErrors()
    {
    	return $this->error;
    }
    
    public function writeToDatabase(){

    	$this->_user->register_email=$this->_email;
    	$this->_user->register_password=$this->_password;
    	$this->_user->register_time=time();
    	$this->_user->register_signal=time();

    	try{
    	
    		$this->_user->save(); 
    		$user=new Database_User_Userinfo($this->db);
    		$id=$this->_user->getId();
    		if (!$user->load($id,'user_id'))
    		{
   				$user->user_id=$id;
   			}
    		$user->user_firstname="未";
    		$user->user_lastname="命名";
    		$user->user_name="未命名";
    		$user->user_birthday="0000-00-00";
    		$user->user_gender="0";
    		$user->user_province="未知";
    		$user->user_city="未知";
    		$user->user_zip="";
    		$user->user_us="未知";
    		$user->user_us_province="未知";
    		$user->user_permit="2";
    		$user->user_img="default.png";
    		$user->save();
    	
    	}catch(Zend_Db_Statement_Mysqli_Exception $e)
    	{
				$this->error="此账户已被注册";
    			return false;
    	}
    	$friend=new Database_Friend_Friend($this->db);
        if (!$friend->load($id,'user_id'))
    		{
   				$friend->user_id=$id;
   			}
		$friend->friend_id=$id;
    	$friend->save();
    	return true;
    }
    
	public function getEmail()
	{
		return $this->_email;
	} 

	public function getError()
	{
		return $this->error;
	}
	
	public function formatInvite($inviteNumber)
	{
		$filter=new Zend_Filter();
		$filter->addFilter(new Zend_Filter_StringToUpper());
		return $filter->filter($inviteNumber);	
	}
	private function _checkNumbers()
	{
		$sql=$this->db->query('SELECT COUNT(register_id) AS count FROM register');
		$result=$sql->fetch();
		if ($result['count'] > 10000)
		{
			return false;
		
		}
		return true;
	}
}

