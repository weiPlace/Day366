<?php
require_once 'Database/Day.php';
require_once 'Twitter.php';
/** 
 * @author wei
 * 
 * 
 */
final class Day_Show extends Twitter {
	protected $db;
	private $_user;
	public function __construct($db) {
		$this->db=$db;
		$this->_user=new Database_Day($db);
	}
	public function showAll($date)
	{
				$sql=$this->db->query('SELECT u.user_name action_user_name,u.user_img action_user_image,d.*
									FROM days d INNER JOIN user u
									ON d.days_user_id=u.user_id
									WHERE days_day=?
									ORDER BY d.days_time DESC LIMIT 30',array($date));
				
				$result=$sql->fetchAll();
	
				return $result;
	}
	public function showOtherAll(Zend_Controller_Request_Abstract $request)
	{
		$date=$this->sanitize($request->getQuery('month')).'-'.$this->sanitize($request->getQuery('day'));

		$number=$this->sanitize($request->getQuery('number'));
	
				$sql=$this->db->query('SELECT u.user_name action_user_name,u.user_img action_user_image,d.*
									FROM days d INNER JOIN user u
									ON d.days_user_id=u.user_id
									WHERE u.user_id IN (SELECT friend_id FROM friend WHERE user_id=?)
									AND days_day=?
									ORDER BY d.days_time DESC LIMIT ?,15',array($this->_userId,$date,$number));
				
		$result=$sql->fetchAll();
		return $result;
		
	}

}

?>