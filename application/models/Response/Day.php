<?php
require_once 'Twitter.php';
require_once 'Database/Day.php';
require_once 'Database/Day_Comment.php';
class Response_Day extends Twitter {
	private $_type;
	private $_user;
	private $_id;
	protected $db;
	private $_comment;
	private $_item;
	public function __construct($db)
	{
		$this->db=$db;

	}
	public function process(Zend_Controller_Request_Abstract $request)
	{
		$this->_type=$this->sanitize($request->getQuery('type'));
		$this->_id=$this->getInt($request->getQuery('id'));

		$this->_user=new Database_Twitter($this->db);
		$this->_comment=new Database_Day_Comment($this->db);
		return true;
	}
	
	public function getContent()
	{

			$sql=$this->db->query('SELECT u.user_name action_user_name,u.user_img action_user_img,d.* 
										FROM days  d INNER JOIN user u
										ON u.user_id=d.days_user_id
										WHERE d.days_id=?',array($this->_id));
			$result=$sql->fetch();
			return $result;
	}
	public function getComment()
	{

				$sql=$this->db->query('SELECT u.user_name action_user_name,u.user_img action_user_img,d.*
									FROM days_comment d INNER JOIN user u
									ON d.days_user_id=u.user_id
									WHERE d.days_item_id=?
									ORDER BY d.days_time DESC ',array($this->_id));
				$result=$sql->fetchAll();
			return $result;
	
		
	}
	public function getType()
	{
		return $this->_type;
	}
}

?>