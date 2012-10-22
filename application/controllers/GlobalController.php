<?php
/**
 * GlobalController
 * 
 * @author
 * @version 
 */
require_once 'Zend/Controller/Action.php';
class GlobalController extends Zend_Controller_Action
{
	
	private $_smarty;
	private $_config;
	private $_db;
	private $_auth;
	protected $message;
	public function init()
	{
		$this->_smarty=Zend_Registry::get('smarty');
		$this->_config=Zend_Registry::get('config');
		$this->_db=Zend_Registry::get('db');
		$this->message=$this->_helper->getHelper('FlashMessenger');
		$this->_auth=Zend_Auth::getInstance();
		if ($this->_auth->hasIdentity()){
		$userName=$this->_auth->getIdentity()->user_name;
		$this->_smarty->assign('userName',$userName);
		}
	}
    /**
     * The default action - show the home page
     */
    public function indexAction ()
    {
    	$this->_smarty->display('userrule.tpl');
    }    
    
    public function contactAction()
    {
    	$this->_smarty->display('contact.tpl');
    }
    
    public function mainifestoAction()
    {
    	$this->_smarty->display('mainifesto.tpl');
    }
    
    public function aboutAction()
    {
    	$this->_smarty->display('about.tpl');
    }    
	
    public function helpAction()
    {

    	$this->_smarty->display('help.tpl');
    }    
    public function testAction()
    {
    	$time=date('d');
    	echo $time;
    
    }
}
