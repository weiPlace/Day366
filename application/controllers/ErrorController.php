<?php 
class ErrorController extends Zend_Controller_Action{
	private $_smarty;
	private $_config;
	private $_db;
	protected $message;
	public function init()
	{

		$this->_smarty=Zend_Registry::get('smarty');
		$this->_config=Zend_Registry::get('config');
		$this->_db=Zend_Registry::get('db');
		$this->message=$this->_helper->getHelper('FlashMessenger');
	
	}
	public function errorAction(){
			$errors=$this->_getParam('error_handler');
			switch ($errors->type){
			   
				case Zend_Controller_Plugin_ErrorHandler::EXCEPTION_NO_ACTION:
				case Zend_Controller_Plugin_ErrorHandler::EXCEPTION_NO_CONTROLLER:
				case Zend_Controller_Plugin_ErrorHandler::EXCEPTION_NO_ROUTE:
				$this->getResponse()->setRawHeader('HTTP/1.1 404 Not Found');
				$this->_smarty->display('errors/notfound.tpl');
				break;
				default:
				
				$smarty=Zend_Registry::get('smarty');

				$this->_smarty->display('errors/unknown.tpl');
				

			}
			$this->getResponse()->clearBody();
		}
}