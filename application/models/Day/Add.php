<?php
require_once 'Database/Days/Add.php';
require_once 'Database/Day.php';
/** 
 * @author wei
 * 
 * 
 */
class Day_Add extends Twitter {
	//TODO - Insert your code here
	protected $db;
	private $_user;
	private $_userId;
	private $_content;
	private $_month;
	private $day;
	private $_userImg;
	
	public function __construct($db,$userId) {
			$this->db=$db;
			$this->_userId=$userId;
			$this->_user=new Database_Days_Add($this->db);
	}
	
	public function process(Zend_Controller_Request_Abstract $request)
	{
		$this->_content=$this->sanitize($request->getPost('content'));
		$this->_month=$this->sanitize($request->getPost('month'));
		$this->_day=$this->sanitize($request->getPost('day'));
		$this->_userImg=$this->sanitize($request->getPost('id'));
		$filter=new Zend_Filter_Int();
		$month=$filter->filter($this->_month);
		$day=$filter->filter($this->_day);
		$validateContent=new Zend_Validate_StringLength(1,740);
		if (!$validateContent->isValid($this->_content)){return false;}
		$this->writeToDatebase();
		return true;
	}
	
	private  function writeToDatebase()
	{
		$this->_user->days_add_user_id=$this->_userId;
		$this->_user->days_add_month=$this->_month;
		$this->_user->days_add_day=$this->_day;
		$this->_user->days_add_content=$this->_content;
		$this->_user->days_add_image=$this->_userImg;
		$this->_user->save();
	}

}

?>