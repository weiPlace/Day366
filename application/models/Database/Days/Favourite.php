<?php
require_once 'Database.php';
/** 
 * @author wei
 * 
 * 
 */
class Database_Days_Favourite extends Database {
	//TODO - Insert your code here
	
	private $_month;
	protected $db;

	function __construct($db,$number) {
		
		//TODO - Insert your code here
		$this->db=$db;
		$this->chooseMonth($number);
		parent::__construct($db, $this->_month, 'favourite_id');
		$this->add('favourite_id');
		$this->add('favourite_user_id');
		$this->add('favourite_from_id');
		$this->add('favourite_from_type',2);
		$this->add('favourite_label');
		$this->add('favourite_date');
		$this->add('favourite_time',date('H:i:s'));
		$this->add('favourite_image');
		$this->add('content');
		$this->add('comment',0);
		$this->add('like',0);
		$this->add('favourite',0);
	}
	
	private function chooseMonth($number)
	{
		switch ($number)
		{
			case'1':
				$this->_month="favourite_jan";
				break;
			case '2':
				$this->_month="favourite_feb";
				break;
			case '3':
				$this->_month="favourite_mar";
				break;
			case '4':
				$this->_month="favourite_apr";
				break;
			case '5':
				$this->_month="favourite_may";
				break;
			case '6':
				$this->_month="favourite_jun";
				break;
			case '7':
				$this->_month="favourite_jul";
				break;
			case '8':
				$this->_month="favourite_aug";
				break;
			case '9':
				$this->_month='favourite_sep';
				break;
			case '10':
				$this->_month="favourite_oct";
				break;
			case '11':
				$this->_month="favourite_nov";
				break;
			case '12':
				$this->_month="favourite_dec";
				break;
		}
	}
	public function getMonth()
		{
			return $this->_month;
		}
}