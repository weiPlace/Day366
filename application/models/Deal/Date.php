<?php

/** 处理日期的类
 * @author wei
 * 
 * 
 */
class Deal_Date {
	//TODO - Insert your code here
	//一般日期，就像1989-11-12日期的形式
	private $_normalDate;
	private $_year;
	private $_month;
	private $_day;

	function __construct($date)
	 {
		$this->deal($date);
	}
	
	private  function deal($date)
	{
		$this->_normalDate=explode('-', $date);
		$normalDate=$this->_normalDate;
		$this->_year=$normalDate[0];
		$this->_month=$normalDate[1];
		$this->_day=$normalDate[2];

		return true;
		
	}
	public function getYear(){ return $this->_year;}
	public function getMonth(){return $this->_month;}
	public function getDay(){return $this->_day;}
	/* 4-7*/
	public function getDateNoZero()
	{
		 return $time=date('n-j');
	}
	/* 04-07*/
	public function getDate()
	{
		return $time=date('m-d');
	}
	/*1990-9-7*/
	public function getFullDateNoZero()
	{
		return $time=date('Y-n-j');
	}
	/*1900-01-11*/
	public function getFullDate()
	{
		return date('Y-m-d');
	}
	/*04-33*/
	public function getTime()
	{
		return date('H-i');
	}
	/*6-59*/
	public function getTimeNoZero()
	{
		return date('G-i');
	}
	
	/*11-23-34*/
	public function getFullTime()
	{
		return date('H-i-s');
	}
}

?>