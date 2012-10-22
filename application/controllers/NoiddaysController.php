<?php

/**
 * NoidDaysController
 * 
 * @author
 * @version 
 */

require_once 'Zend/Controller/Action.php';
require_once 'Day/Show.php';
class NoiddaysController extends Zend_Controller_Action {
	/**
	 * The default action - show the home page
	 */
	private $_smarty;
	private $_config;

	protected  $db;
	protected $message;

	
	public function init()
	{
		$this->_smarty=Zend_Registry::get('smarty');
	
		$this->_config=Zend_Registry::get('config');
		$this->db=Zend_Registry::get('db');
		$this->message=$this->_helper->getHelper('FlashMessenger');


	}
	public function indexAction() {
		// TODO Auto-generated NoidDaysController::indexAction() default action
		
		$request=$this->getRequest();
		$month=$request->getQuery('month');
		$day=$request->getQuery('day');
		$this->_smarty->assign('date',$month.'月'.$day.'日');
		$showDay=new Day_Show($this->db,$month);
		if (!$showDay->show($request))
		{
		}
		$result=$showDay->getResult();
		
		$this->_smarty->assign('result',$result);
		echo "<!doctype html>";
		echo "<html lang=\"zh-CN\">";
		$this->_smarty->display('days/notlogin.tpl');
		
		
	}

}
