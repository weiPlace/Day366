<?php
require_once 'Twitter.php';
require_once 'Database/Day.php';
class Day_Save extends Twitter
{
	protected  $db;
	private $_user;
	private $_content;
	public $error;
	private $_userId;
	private $_id;
	private $_img;
	private $_title;
	private $_url;
	public function __construct($db,$id)
	{
		$this->db=$db;
		$this->_userId=$id;
		$this->_user=new Database_Day($this->db);
	}
	public function process(Zend_Controller_Request_Abstract $request,$date) {
		$this->_content=$this->sanitize($request->getPost('content'));
		$this->_url=$this->sanitizeUrl($request->getPost('href'));
		$this->_img=$this->sanitize($request->getPost('hiddenImg'));
		$this->_title=$this->sanitize($request->getPost('title'));
		$validNotEmpty=new Zend_Validate_NotEmpty();
		$validTwitter=new Zend_Validate_StringLength(1,2000);
		$validTitle=new Zend_Validate_StringLength(0,150);
		$validUrl=new Zend_Validate_StringLength(0,400);
		if (!$validUrl->isValid($this->_url)){
			$this->error="链接超过最高字符串限制，请重试";
			return false;
		}
		if (!$validNotEmpty->isValid($this->_content))
		{
			$this->error="您发表的状态不能为空,请重试";
			return false;
		}
		if (!$validTwitter->isValid($this->_content))
		{
			$this->error="你发表的状态超过了字符限制，请重试";
			return false;
		}
		if (!$validTitle->isValid($this->_title))
		{
			$this->error="标题超过字符串限制";
			return false;
		}
		$this->writeToDatabase($date);
		return true;
	}	
	

	private function writeToDatabase($date)
	{


	
		$this->_user->days_user_id=$this->_userId;
		$this->_user->days_day=$date;
		$this->_user->days_content=$this->_content;
		$this->_user->days_image=$this->_img;
		$this->_user->days_title=$this->_title;
		$this->_user->days_url=$this->_url;
		$this->_user->save();
		$this->_id=$this->_user->getId();
	}
	
	public function getId()
	{
		return $this->_id;
	}
	
	
}

