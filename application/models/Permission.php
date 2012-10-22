<?php

abstract class Permission {
	private $_userId;
	private $_friendId;
	private $_id;
	protected $db;	
	function __construct($id,$db) {
		$this->_userId=$id;
		$this->db=$db;
	}
	abstract function checkRelation($friendId);
	abstract function checkSetting($friendId);
	function checkOwn($id){
		//判断发表的文章是否为他所有
		$sql=$this->db->query('SELECT COUNT(twitter_id) count FROM twitter WHERE twitter_id=? AND twitter_user_id=?',array($id,$this->_userId));
		$result=$sql->fetch();
		if ($result['count']!= 0){
			return true;
		}
		return false;
	}
}

?>