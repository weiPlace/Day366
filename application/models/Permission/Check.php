<?php
require_once 'Permission.php';
class Permission_Check extends Permission {
	private $_userId;
	private $_friendId;
	private $_id;
	protected $db;		
	function __construct($id,$db) {
		parent::__construct($id, $db);
	}
	
	function checkRelation($friendId) {
		$sql=$this->db->query('SELECT COUNT(id) count FROM friend WHERE user_id=? AND friend_id=?',array($this->_userId,$this->_friendId));
		$result=$sql->fetch();
		if ($result['count'] != 0){
			return true;
		}
		return false;
	}
	
	function checkSetting($friendId) {
		$sql=$this->db->query('SELECT user_permit FROM user WHERE user_id=?)',$friendId);
		$result=$sql->fetch();
		return $result['user_permit'];
	}
}

?>