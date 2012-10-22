<?php

/** 
 * @author wei
 * 
 * 
 */
class Twitter {
	//TODO - Insert your code here
	
	private $_saniti;

	function __construct() {
	
		//TODO - Insert your code here
	}
	    public function sanitize($value)
        {
            if (!$this->_saniti instanceof Zend_Filter) {
                $this->_saniti= new Zend_Filter();
                $tagFilter=new Zend_Filter_StripTags();
                $tagFilter->setTagsAllowed(array('br'));

                $this->_saniti->addFilter(new Zend_Filter_StringTrim())
                                     ->addFilter($tagFilter);
           }
	           // filter out any line feeds / carriage returns
            $ret = preg_replace('/[\r\n]+/', '', $value);

            // filter using the above chain
            return $this->_saniti->filter($ret);
		}
		public function sanitizeUrl($value)
		{
            if (!$this->_saniti instanceof Zend_Filter) {
                $this->_saniti= new Zend_Filter();
                $tagFilter=new Zend_Filter_StripTags();
                $tagFilter->setTagsAllowed(array('a'));
                $tagFilter->setAttributesAllowed(array('href','target'));
                $this->_saniti->addFilter(new Zend_Filter_StringTrim())
                                     ->addFilter($tagFilter);
           }
	           // filter out any line feeds / carriage returns
            $ret = preg_replace('/[\r\n]+/', '', $value);

            // filter using the above chain
            return $this->_saniti->filter($ret);		
		}
		public function getInt($number)
		{
			$filter=new Zend_Filter_Int();
			return $filter->filter($number);
		}
		
		

}