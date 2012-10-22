<?php
/** 
 * @author wei
 * 
 * 
 */
require_once 'Database.php';
class Database_Account_UserRegister extends Database
{
	public $db;
	private $_Mytable='register';
	private $_primaryKey="user_id";
	private $_email;
	private $_char="sww";
    // TODO - Insert your code here
    function __construct ($db)
    {
        // TODO - Insert your code here
        $this->db=$db;
        parent::__construct($db,'register','register_id');
        $this->add('register_id');
        $this->add('register_email');
        $this->add('register_password');
        $this->add('register_active',0);
       	$this->add('register_time',time(),self::TYPE_TIMESTAMP);
  		$this->add('register_signal');
    }
   
    public function __set($name,$value){
    	switch ($name){
    		case 'register_password':
    		    $value=md5($value);
    		    break;
    		case 'register_signal':
    			$value=md5($this->_char.$value);
    	}
        return parent::__set($name,$value);
        
    }
    public function queryEmail($email)
    {
    	$this->_email=$email;
    	$sql=$this->db->quoteInto('SELECT * FROM register WHERE register_email = ?',$email);
    	$result=$this->db->query($sql);
    	$r_a=$result->fetch();
        if($r_a == false)
    		{
    			return false;
    		}
    	return true;   	
    }
    public function getEmail()
    {
    	return $this->_email;
    }
}
