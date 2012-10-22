<?php
require_once 'Zend/Filter.php';
require_once 'Zend/Filter/StripTags.php';
require_once 'Zend/Filter/StringTrim.php';
require_once 'Zend/Validate/EmailAddress.php';
require_once 'Zend/Validate/StringLength.php';
abstract class Check
{	
    private $_saniti;
    protected function __construct($db){}
  
 
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

        
        
     abstract public  function process(Zend_Controller_Request_Abstract $request);
     abstract public function getError();
}
?>