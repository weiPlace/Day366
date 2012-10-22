<?php
require_once 'Database.php';
/** 
 * @author wei
 * 
 * 
 */
class Database_Friend_Friend extends Database {
	//TODO - Insert your code here
	protected $db;
	
	function __construct($db) {
	
		//TODO - Insert your code here
		parent::__construct($db,'friend','id');
		$this->add('user_id');
		$this->add('friend_id');
		$this->db=$db;
	}
	
	public function searchUser($id,$limit=0)
	{
		//获取行数
		$result=$this->db->query(
		'SELECT * 
		FROM friend f,user u
		 WHERE 
		 f.friend_id=u.user_id AND f.user_id=? AND NOT f.friend_id=?
		 LIMIT ?,30',
		array($id,$id,$limit*30)
		);
		$r_a=$result->fetchAll();
		return $r_a;
	}
	public function searchBeUser($id,$limit=0)
	{
		$result=$this->db->query(
		'SELECT * 
		FROM friend f,user u
		 WHERE 
		 f.user_id=u.user_id AND f.friend_id=? AND NOT f.user_id=?
		 LIMIT ?,30',
		array($id,$id,$limit*30)
		);
		$r_a=$result->fetchAll();
		return $r_a;		
		
		
	}
	
	public function getRows($id)
	{
		$row=$this->db->query('SELECT COUNT(*) AS rows FROM friend WHERE user_id=? AND NOT friend_id=? ',array($id,$id));
		$r_a=$row->fetchAll();
		$pages=ceil($r_a[0]['rows']/30);
		return $pages;
	}
	//寻找你被谁收藏的记录
	public function getBeRows($id)
	{
		$row=$this->db->query('SELECT COUNT(*) AS rows FROM friend WHERE friend_id=? AND NOT user_id=? ',array($id,$id));
		$r_a=$row->fetchAll();
		$pages=ceil($r_a[0]['rows']/30);
		return $pages;
	}
	
	/**
	 * @param (int) user_id (int)friend_id
	 * @return bool
	 * 检查此人是否为其好友
	 */
	public function checkRelation($user_id,$friend_id)
	{
		$sql=$this->db->query('SELECT COUNT(user_id) AS  row FROM friend WHERE user_id=? AND friend_id=?',array($user_id,$friend_id));
		$result=$sql->fetch();
		if ($result['row']==0)
		{
			return false;
		}

		return true;
	}
	/**
	 * @param (Int) friend_id
	 * @return 2:仅限自己
	 * @return 3:允许自己的收藏者
	 * @return 4:允许信息出现在公共主页
	 * 
	 */
	public function checkPermit($friend_id)
	{
		$sql=$this->db->quoteInto('SELECT user_permit FROM user WHERE user_id=?',$friend_id);
		$result=$this->db->query($sql);
		$r_a=$result->fetch();
		return $r_a['user_permit'];
	}
	
}

?>