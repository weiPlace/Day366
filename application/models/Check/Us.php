<?php
require_once ('Check.php');
require_once 'Database/Us.php';
/** 
 * @author wei
 * 
 * 
 */
class Check_Us extends Check
{
	private $_us;
	public $error;
	private $_user;
	private $_auth;
	public $db;

    function __construct ($db)
    {
        //TODO - Insert your code here
        $this->db=$db;
        $this->_user=new Database_Us($db);
        $this->_auth=Zend_Auth::getInstance();
    }
    public function process (Zend_Controller_Request_Abstract $request)
    {
        $this->_us=$this->sanitize($request->getPost('addUs'));
        $this->_us=mb_convert_encoding($this->_us, 'utf-8');
        $validateUs=new Zend_Validate_StringLength(1,30);
    	if (!$validateUs->isValid($this->_us))
    	{

			$this->error="你所输入的大学名称过长,请重新输入";
			return false;

    	}
    	try{
    	 $user_id=$this->_auth->getIdentity()->user_id;
    	$this->_user->user_id=$user_id;
    	$this->_user->us_name=$this->_us;
    	$this->_user->save();
    	}
    	catch(Zend_Exception $e)
    	{
			$this->error="你已经提交过一次数据，不可以重复提交";
			return false;
    	}
    	return true;
    }

    public function getError ()
    {
        //TODO - Insert your code here
        return $this->error;
    }
}
?>