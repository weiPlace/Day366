<?php 
	require_once 'Smarty.class.php';
	class Smarty_My extends Smarty
	{
	
		public function __construct(){
		parent::__construct();
		$this->setTemplateDir("/alidata/www/application/views/");
		$this->setCompileDir("/alidata/www/application/controllers/");
		$this->setConfigDir("/alidata/www/application/configs/");
	
		$this->setCacheDir("/alidata/www/application/cache/");
		$this->caching=Smarty::CACHING_LIFETIME_CURRENT;
	
		}
		
		
	}