<?php
require_once 'Database.php';
class Database_Favourite_Comment extends Database{
	protected $db;
	private $_month;
	function __construct($db,$number) {
		$this->db=$db;
		$this->chooseMonth($number);
		parent::__construct($db, $this->_month, 'id');
		//TODO - Insert your code here
		$this->add('id');
		$this->add('item_id');
		$this->add('user_id');
		$this->add('date',date('n-j'));
		$this->add('time',date('H:i:s'));
		$this->add('comment');
	}
	private function chooseMonth($number)
	{
		switch ($number)
		{
			case'1':
				$this->_month="favourite_jan_comment";
				break;
			case '2':
				$this->_month="favourite_feb_comment";
				break;
			case '3':
				$this->_month="favourite_mar_comment";
				break;
			case '4':
				$this->_month="favourite_apr_comment";
				break;
			case '5':
				$this->_month="favourite_may_comment";
				break;
			case '6':
				$this->_month="favourite_jun_comment";
				break;
			case '7':
				$this->_month="favourite_jul_comment";
				break;
			case '8':
				$this->_month="favourite_aug_comment";
				break;
			case '9':
				$this->_month='favourite_sep_comment';
				break;
			case '10':
				$this->_month="favourite_oct_comment";
				break;
			case '11':
				$this->_month="favourite_nov_comment";
				break;
			case '12':
				$this->_month="favourite_dec_comment";
				break;
		}
	}
	public function getMonth()
		{
			return $this->_month;
		}
}

?>