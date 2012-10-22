<?php

/** 
 * @author wei
 * 
 * 
 */
 class Day {
	//TODO - Insert your code here
	private $_saniti;
	private $_month;
	function __construct() {
	
		//TODO - Insert your code here
	}
	    public function sanitize($value)
        {
            if (!$this->_saniti instanceof Zend_Filter) {
                $this->_saniti= new Zend_Filter();
                $this->_saniti->addFilter(new Zend_Filter_StringTrim())
                                     ->addFilter(new Zend_Filter_StripTags());
            }

            // filter out any line feeds / carriage returns
            $ret = preg_replace('/[\r\n]+/', '', $value);

            // filter using the above chain
            return $this->_saniti->filter($ret);
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

?>