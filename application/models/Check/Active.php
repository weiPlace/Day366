<?php
require_once 'Database/Account/UserRegister.php';
require_once 'Check.php';
/** 
 * @author wei
 * 
 * 
 */
class Check_Active extends Check {
	//TODO - Insert your code here
	private $_user;
	

	function __construct($db) {
		$this->_user=new Database_Account_UserRegister($db);
	}

	public function process(Zend_Controller_Request_Abstract $request) {
		$id=$this->sanitize($request->getQuery('id'));
		$valid=$this->sanitize($request->getQuery("variable"));
		$this->_user->load($id);
		$variable=$this->_user->register_signal;
		if (!$valid===$variable)
		{
			return false;
		}
		$this->_user->register_active=1;
		$this->_user->save();
		return true;
	}
	
	/**
	 * 
	 * @see Check::getError()
	 */
	public function getError() {
			return true;
	}
}

?>