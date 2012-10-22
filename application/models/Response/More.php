<?php
require_once 'Twitter.php';
require_once 'Database/Twitter.php';
require_once 'Database/Twitter_Comment.php';
require_once 'Database/Comment.php';
class Response_More extends Twitter {
	private $_type;
	private $_user;
	private $_id;
	protected $db;
	private $_comment;
	private $_item;
	public function __construct($db)
	{
		$this->db=$db;
		$this->_item=new Database_Comment($db);
	}
	public function process(Zend_Controller_Request_Abstract $request)
	{
		$this->_type=$this->sanitize($request->getQuery('type'));
		$this->_id=$this->getInt($request->getQuery('id'));

			$this->_user=new Database_Twitter($this->db);
			$this->_comment=new Database_Twitter_Comment($this->db);
		$this->db->query('DELETE FROM response WHERE item_id=?',array($this->_id));
		return true;
	}
	
	public function getContent()
	{

			$sql=$this->db->query('SELECT u.user_name action_user_name,u.user_img action_user_img,t.* 
										FROM twitter  t INNER JOIN user u
										ON u.user_id=t.twitter_user_id
										WHERE t.twitter_id=?',array($this->_id));
			$result=$sql->fetch();
			return $result;
	}
	public function getComment()
	{

				$sql=$this->db->query('SELECT u.user_name action_user_name,u.user_img action_user_img,t.*
									FROM tc_comment t INNER JOIN user u
									ON t.tc_user_id=u.user_id
									WHERE t.tc_item_id=?
									ORDER BY t.tc_time DESC ',array($this->_id));
				$result=$sql->fetchAll();
			return $result;
	
		
	}
	public function getType()
	{
		return $this->_type;
	}
}

?>