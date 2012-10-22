<?php

require_once('Database.php');
require_once ('Database/User/Userinfo.php');
class Database_Account_Login extends Database {

	public $db;
	private $_session;
	private $_id;
	private $_user;
	function __construct($db) {
        $this->db=$db;
        parent::__construct($db,'register','register_id');
        $this->add('register_id');
        $this->add('register_email');
        $this->add('register_password');
        $this->add('register_active');
       	$this->add('register_time',time(),self::TYPE_TIMESTAMP);
  		$this->add('register_signal');

	}
        public function createAuthIdentity()
        {	
			$identity=new stdClass;
			$this->_id=$this->getId();
			$this->_user=new Database_User_Userinfo($this->db);
        	$identity->user_id=$this->_id;
        	$this->_user->load($this->_id,'user_id');
        	$identity->user_email=$this->rigister_email;
        	$identity->userType="user";   	

        	$name=$this->_user->user_name;
        	$identity->user_us=$this->_user->user_us;
        	
			if($name==""){$name="无名氏";}
			$identity->user_name=$name;
		
        	return $identity;
        }

        

}


