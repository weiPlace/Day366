<?php
require_once 'Check.php';
/** 
 * @author wei
 * 
 * 
 */
class Check_Search extends Check {
	
	function __construct($db) {
		parent::__construct($db);
	}
	
	/**
	 * 
	 * @see Check::process()
	 */
	public function process(Zend_Controller_Request_Abstract $request) {
		return true;
		//TODO - Insert your code here
	}
	
	/**
	 * 
	 * @see Check::getError()
	 */
	public function getError() {
		return true;
		//TODO - Insert your code here
	}
}

?>