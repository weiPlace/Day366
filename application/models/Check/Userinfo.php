<?php
/** 
 * @author wei
 * @time:2012-4-11 21:05:38
 * 
 */
require_once 'Check.php';
require_once 'Database/User/Userinfo.php';
require_once 'Database/Account/UserRegister.php';
final class Check_Userinfo extends Check
{
	private $_firstName;
	private $_lastName;
	private $_gender;
	private $_year;
	private $_month;
	private $_day;
	private $_birthday;
	private $_provinceCities;
	private $_city;
	private $_usProvince;
	private $_us;
	private $_permit;
	public $error;
	private $_user;
	private $_id;
//帮助成员找到朋友
	public $primaryName=true;
	protected $db;
    //TODO - Insert your code here
    function __construct ($db)
    {
        //TODO - Insert your code here
        $this->db=Zend_Registry::get('db');
        $this->_user=new Database_User_Userinfo($this->db);
       
    }
    
    public function process(Zend_Controller_Request_Abstract $request)
    {
    	$this->_firstName=$this->sanitize($request->getPost('firstname'));
    	$this->_lastName=$this->sanitize($request->getPost('lastname'));
    	$this->_gender=$this->sanitize($request->getPost('gender'));
    	$this->_year=$this->sanitize($request->getPost('year'));
		$this->_month=$this->sanitize($request->getPost('month'));
		$this->_day=$this->sanitize($request->getPost('day'));
		$this->_birthday=$this->_year.'-'.$this->_month.'-'.$this->_day;
		$this->_birthday=$this->sanitize($this->_birthday);
    	$this->_provinceCities=$this->sanitize($request->getPost('provinceCities'));
    	$this->_city=$this->sanitize($request->getPost('city'));
    	$this->_usProvince=$this->sanitize($request->getPost('usProvince'));
    	$this->_us=$this->sanitize($request->getPost('us'));
    	$this->_permit=$this->sanitize($request->getPost('permit'));
    	
    	//检查用户的姓
    	$firstNameValidate=new Zend_Validate();
    	$firstNameValidate->addValidator(new Zend_Validate_StringLength(1,6));
    	if (!$firstNameValidate->isValid($this->_firstName))
    	{
    		$this->error="您所输入的姓有误，请重新输入";
    		return  false;
    		
    	}
    	//检查用户的名字
        $lastNameValidate=new Zend_Validate();
    	$lastNameValidate->addValidator(new Zend_Validate_StringLength(1,6));
    	if (!$firstNameValidate->isValid($this->_lastName))
    	{
    		$this->error="您所输入的名字有误，请重新输入";
    		return  false;
    	}  
    	
    	//检查用户的性别
    	if ($this->_gender!=('boy' && 'girl'))
    	{
    		$this->error="你私自篡改了数据，请重新输入！！！";
    		return false;
    	
    	}
    	//检查用户的生日
        $validDate=new Zend_Validate_Date();
    	if (!$validDate->isValid($this->_birthday))
    	{
    		$this->error="请输入有效地日期值";
    		return false;
    	}
    	else
    	{
    		$numberDate=explode('-',$this->_birthday);
    		$validYear=new Zend_Validate_Between('1910','2012');

    		if (!($validYear->isValid($this->_year)))
    		{
    			$this->error="请输入有效地日期值";
    			return false;
    		}
    	}
    	//检查用户所在省份
    	$provinceCitiesValidate=new Zend_Validate_StringLength(1,12);
    	$cityValidate=new Zend_Validate_StringLength(1,12);
    	$usProvinceValidate=new	Zend_Validate_StringLength(1,12);
    	$usValidate=new Zend_Validate_StringLength(1,45);
    	if (!($provinceCitiesValidate->isValid($this->_provinceCities) && $cityValidate->isValid($this->_city) && $usProvinceValidate->isValid($this->_usProvince) && $usValidate->isValid($this->_us)))
    		{
    			$error="你私自篡改了数据，或者是由于网络发生了错误，请过会重试";
    			return false;
    		}
    	//检查用户所在城市
    	//检查用户大学所在城市
    	//检查用户大学
   		
   		if ($this->_permit!=(2 || 3 || 4))
   		{
   			$this->error="权限设置有误";
   			return false;
   		}
   		if (!$this->writeToDatabase())
   		{
   			return false;
   		}
   		
   		return true;			
   							
    	
    }

    public function writeToDatabase(){

    	
    	$auth=Zend_Auth::getInstance();
    	if ($auth->hasIdentity())
    	{
    		$identity=$auth->getIdentity();
    		$this->_id=$identity->user_id;
 
    	}
    	
	
		if (!$this->_user->load($this->_id,'user_id'))
		{
    		$this->_user->user_id=$this->_id;
		}
		if ($this->_user->user_name == "未命名")
		{
			$this->primaryName=false;
		}
    	$this->_user->user_firstname=$this->_firstName;
    	$this->_user->user_lastname=$this->_lastName;
    	$this->_user->user_name=$this->_firstName.$this->_lastName;
    	$this->_user->user_birthday=$this->_birthday;
    	if ($this->_gender=="boy")
    	{
    		$this->_user->user_gender='0';
    	}else
    	{
    		$this->_user->user_gender="1";
    	}
    	$this->_user->user_province=$this->_provinceCities;
    	$this->_user->user_city=$this->_city;
    	$this->_user->user_us_province=$this->_usProvince;
    	$this->_user->user_us=$this->_us;
    	$this->_user->user_permit=$this->_permit;
    	
    	try
    	{
    		$this->_user->save();
    	}catch(Zend_Db_Statement_Mysqli_Exception $e)
    	{
    		echo $e.get_current_user();
    		$this->error="保存数据时发生错误,请重新尝试.";
    		return false;
    	}
  		$user=new Database_Account_UserRegister($this->db);
  		$user->load($this->_id);
  		$user->register_birthday=$this->_birthday;
  		$user->save();
    	return true;
    	
    }
    
    public function getError()
    {
    	return $this->error;
    }
   
}
?>