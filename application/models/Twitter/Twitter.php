<?php
require_once 'Database/Twitter.php';
require_once 'Database/Dayword.php';
require_once 'Database/Days/Favourite.php';
require_once 'Twitter.php';

/** 
 * @author wei
 * 
 * 
 */
class Twitter_Twitter extends Twitter {
	protected $db;
	private $_userDayword;
	private $_userTwitter;
	private $_userFavourite;
	private $_userId;
	public function __construct($db,$userId,$number=0) {
		$this->db=$db;
		$this->_userId=$userId;
		$this->_userDayword=new Database_Dayword($db);

		$this->_userFavourite=new Database_Days_Favourite($db, $number);
		$this->_userTwitter=new Database_Twitter($db);
	}


	public function showTwitter($date)
	{

		$sql=$this->db->query('SELECT * FROM twitter WHERE twitter_user_id=? AND twitter_day=?',array($this->_userId,$date));
		$result=$sql->fetchAll();
		return $result;
		
	}
	public function showAllTwitter($date,$page=0)
	{
				$sql=$this->db->query('SELECT u.user_name action_user_name,u.user_img action_user_image,t.*
									FROM twitter t INNER JOIN user u
									ON t.twitter_user_id=u.user_id
									WHERE u.user_id IN (SELECT friend_id FROM friend WHERE user_id=?)
									AND twitter_day=?
									ORDER BY t.twitter_time DESC LIMIT ?,30',array($this->_userId,$date,$page*30));
				
				$result=$sql->fetchAll();
	
				return $result;
	}

	public function getRow($date)
	{
		$sql=$this->db->query('SELECT COUNT(twitter_id) count
									FROM twitter t INNER JOIN user u
									ON t.twitter_user_id=u.user_id
									WHERE u.user_id IN (SELECT friend_id FROM friend WHERE user_id=?)
									AND twitter_day=?',array($this->_userId,$date));
		$result=$sql->fetch();
		$pages=ceil($result['count']/30);
		return $pages;		
	}

	public function message()
	{
		$sql=$this->db->query('SELECT COUNT(item_id) count FROM comment WHERE user_id=? ',array($this->_userId));
		$result=$sql->fetch();
		return $result['count'];
	}
	public function response()
	{
		$sql=$this->db->query('SELECT COUNT(item_id) count FROM response WHERE user_id=?',array($this->_userId));
		$result=$sql->fetch();
		return $result['count'];
	}
	
	public function getFriend()
	{
		$sql=$this->db->query('SELECT COUNT(id) count FROM friend WHERE user_id=?',array($this->_userId));
		$result=$sql->fetch();
		return $result['count']-1;
	}
	public function getFollower()
	{
		$sql=$this->db->query('SELECT COUNT(id) count FROM friend WHERE friend_id=?',array($this->_userId));
		$result=$sql->fetch();
		return $result['count']-1;
	}
	public function getSpecial($date)
	{
		$birthday=explode('-', $date,2);
		$sql=$this->db->query('SELECT COUNT(user_id) count FROM user WHERE user_birthday LIKE ?  AND NOT (user_name="未命名")',array('____-'.$birthday[1]));
		$result=$sql->fetch();
		return $result['count'];
	}
	public function getImage()
	{
		$sql=$this->db->query('SELECT user_img,user_id FROM user WHERE user_birthday LIKE ? AND NOT (user_name="未命名") LIMIT 30',array('____-'.date('m-d')));
		$result=$sql->fetchAll();
		return $result;
	}
	public function showDays366($date,$page=0)
	{

		$sql=$this->db->query('SELECT * FROM twitter WHERE twitter_user_id=96 AND twitter_day=? LIMIT ?,30',array($date,$page*30));
		$result=$sql->fetchAll();
		return $result;
		
	}
	
}

?>