<?php
require_once 'Database/User/Userinfo.php';
class Login_Work {
	protected $db;
	private $_user;
	private $_randNumber;
	private $_defaultImg;
	public function __construct($db)
	{
		$this->db=$db;
		$this->_user=new Database_User_Userinfo($db);
		$this->_randNumber=rand(1,20);
		$this->_defaultImg='defaul.png';
	}
	public function getUserImg()
	{
		$sql=$this->db->query('SELECT user_img,user_name,user_us FROM user  WHERE NOT user_img=? LIMIT ?,14',array($this->_defaultImg,$this->_randNumber));
		$result=$sql->fetchAll();
		return $result;
	}
}

