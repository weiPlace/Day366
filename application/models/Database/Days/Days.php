<?php
require_once 'Database.php';
/** 
 * @author wei
 * 
 * 
 */
class Database_Day_Days extends Database {
	//TODO - Insert your code here
	private $_month;
	protected $db;

	function __construct($db,$number) {
		
		//TODO - Insert your code here
		$this->db=$db;
		$this->chooseMonth($number);
		parent::__construct($db, $this->_month, 'id');
		$this->add('day');
		$this->add('content');
		$this->add('like');
		$this->add('favourite');
	}
	
	private function chooseMonth($number)
	{
		switch ($number)
		{
			case'1':
				$this->_month="jan";
				break;
			case '2':
				$this->_month="feb";
				break;
			case '3':
				$this->_month="mar";
				break;
			case '4':
				$this->_month="apr";
				break;
			case '5':
				$this->_month="mar";
				break;
			case '6':
				$this->_month="jun";
				break;
			case '7':
				$this->_month="jul";
				break;
			case '8':
				$this->_month="aug";
				break;
			case '9':
				$this->_month='sep';
				break;
			case '10':
				$this->_month="oct";
				break;
			case '11':
				$this->_month="nov";
				break;
			case '12':
				$this->_month="december";
				break;
		}
		
	}
	public function showDays($day)
	{
		try{
		
		$sql=$this->db->query("SELECT * FROM  $this->_month WHERE day= ?",array($day));
		$result=$sql->fetchAll();
		return $result;
		}catch (Zend_Db_Statement_Mysqli_Exception $e)
		{
			echo $e.get_current_user();
			return false;
		}
	}
	public function addLike($id)
	{
		try{
			$this->db->beginTransAction();
			$sql=$this->db->query("SELECT * FROM  $this->_month WHERE id= ?",array($id));
			$result=$sql->fetch();
			$nowLike=$result['like']+1;
			$this->db->update($this->_month,array('like'=>$nowLike),"id=$id");
			$this->db->commit();
			return true;
		}catch (Zend_Db_Statement_Mysqli_Exception $e)
		{
			$this->db->rollback();
			echo $e.get_current_user();
			return false;
		}
	}
	public function addFavourite($id)
	{
		try{
			$this->db->beginTransAction();
			$sql=$this->db->query("SELECT * FROM  $this->_month WHERE id= ?",array($id));
			$result=$sql->fetch();
			$nowLike=$result['favourite']+1;
			$this->db->update($this->_month,array('favourite'=>$nowLike),"id=$id");
			$this->db->commit();
			return $result;
		}catch (Zend_Db_Statement_Mysqli_Exception $e)
		{
			$this->db->rollback();
			echo $e.get_current_user();
			return false;
		}
				
	}
}




