<?php
/**
 * 
 *deal the question of date and time
 * @author wei
 *@bug1 未解决跨年问题,即从今年的一月份跨到去年的12月份的问题。
 *@bug2 未解决闰年问题
 */
class Date_Date 
{
	private $_day;
	private $_yesterday;
	private $_preYesterday;
	private $_tomorrow;
	private $_month;
	private $_lastMonth;
	private $_preLastMonth;
	private $_nextMonth;
	public function __construct()
	{
		$this->_day=date('j');
		$this->_month=date('n');
		return $this->_day;
	}
	public function dealNav()
	{
		if ($this->_day==1)
		{
			//day 
			switch ($this->_month)
			{
				case 5:case 7:case 10:case 12:
					{
						$this->_yesterday=30;
						$this->_preYesterday=29;
						break;
					}
				case 1:case 2:case 4:case 6:case 8:case 9: case 11:
					{
						$this->_yesterday=31;
						$this->_preYesterday=30;
						break;
					}
				case 3:
					{
						$this->_yesterday=28;
						$this->_preYesterday=27;
					}
			}
			//month
			if ($this->_month==1)
			{
				$this->_lastMonth=12;
				$this->_preLastMonth=12;
				return true;
			}else
			{
				$this->_lastMonth=$this->_month-1;
				$this->_preLastMonth=$this->_month-1;
				return true;
			}
		}elseif ($this->_day==2)
		{
			$this->_yesterday=1;
			switch ($this->_month)
			{
				case 5:case 7:case 10:case 12:
					{
						$this->_preYesterday=30;
						break;
					}
				case 1:case 2:case 4:case 6:case 8:case 9: case 11:
					{
						$this->_preYesterday=31;
						break;
					}
				case 3:
					{
						$this->_preYesterday=28;
					}
			}
			if ($this->_month==1)
			{
				$this->_lastMonth=1;
				$this->_preLastMonth=12;
				return true;
			}else
			{
				$this->_lastMonth=$this->_month;
				$this->_preLastMonth=$this->_month-1;
				return true;
			}		
		}else
		{
			$this->_yesterday=$this->_day-1;
			$this->_preYesterday=$this->_day-2;
			$this->_lastMonth=$this->_month;
			$this->_preLastMonth=$this->_month;
			return true;
		}
	}
	public function getPreYesterday()
	{
		return $this->_preYesterday;
	}
	public function getMonthYesterday()
	{
		return $this->_lastMonth;
	}
	public function getMonthPreYesterday()
	{
		return $this->_preLastMonth;
	}
	public function getYesterday()
	{
		return $this->_yesterday;
	}
}

