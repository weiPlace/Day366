<?php

/**
 * ValidnoidController
 * 
 * @author
 * @version 
 */

require_once 'Zend/Controller/Action.php';
require_once 'Check/Register.php';
require_once 'Check/Login.php';
require_once 'Check/Findpass.php';
class ValidnoidController extends Zend_Controller_Action {
	/**
	 * The default action - show the home page
	 */
	
	private $_smarty;
	private $_config;
	protected $db;
	protected $message;
	public function init()
	{
		$this->_smarty=Zend_Registry::get('smarty');
		$this->_config=Zend_Registry::get('config');
		$this->db=Zend_Registry::get('db');
		$this->message=$this->_helper->getHelper('FlashMessenger');
	
	}
	
	public function indexAction()
 {

		$valid=new Check_Register($this->db);
		$request=$this->getRequest();
		if ($valid->process($request))
		{
				$this->_redirect($this->_config->pathweb->base.'account/registersuccess');
				
		}else
		{
			
		   	 $validErrors=$valid->getError();
			 $this->message->addMessage($validErrors);
			 $this->_redirect($this->_config->pathweb->base.'account/register');
			 
		}
		

}

	public function loginAction()
	{
		$request=$this->getRequest();
		
		
		$valid=new Check_Login($this->db);
	
		if ($valid->process($request))
		{	
			if (!$valid->active)
			{
				$this->_redirect($this->_config->webpath->base.'userinfo/index');
			}
			$this->_redirect($this->_config->webpath->base.'twitter/index');
			
		}else
		{
				$error=$valid->getError();
				$this->message->addMessage($error);
				$this->_redirect($this->_config->webpath->base.'account/index');
	
		}
		
	}

}
