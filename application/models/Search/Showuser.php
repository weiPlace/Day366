<?php
require_once 'Database/Friend/Friend.php';
class Search_Showuser {
	protected $db;	
	private $_user;
	private $_friendId=array();
	private $_friendName=array();
	private $_result;
	public function __construct($db)
	{
		$this->db=$db;
		$this->_user=new Database_Friend_Friend($this->db);
	}
	
	/**
	 * @author wei
	 * @param userId
	 * @return mixed
	 */
	public function searchFriend($userId,$numberPage=0)
	{
		$this->result=$this->_user->searchUser($userId,$numberPage);
		return $this->result;
	
	}
	public function searchBeFriend($userId,$numberPage=0)
	{
		$this->result=$this->_user->searchBeUser($userId,$numberPage);
		return $this->result;
	}
	public function getRows($id)
	{
		return $this->_user->getRows($id);
	}
	public function getBeRows($id)
	{
		return $this->_user->getBeRows($id);
	}
	
	public function getFriendId()
	{
		foreach ($this->result as $key=>$value)
		{
			$this->_friendId[]=$value['friend_id'];
		
		}
		return $this->_friendId;
	}
	
	public function getFriendName()
	{
		foreach ($this->result as $key=>$value)
		{
			$this->_friendName[]=$value['friend_name'];
		}
		return $this->_friendName;
	}
}

?>