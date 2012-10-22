<?php 
	require_once 'Smarty.class.php';
	class Smarty_My extends Smarty
	{
	
		public function __construct(){
		parent::__construct();
		$this->setTemplateDir("D:/xampp/htdocs/web/application/views/");
		$this->setCompileDir("D:/xampp/htdocs/web/application/template_c/");
		$this->setConfigDir("D:/xampp/htdocs/web/application/configs/");
	
		$this->setCacheDir("D:/xampp/htdocs/web/application/cache/");
		$this->caching=Smarty::CACHING_LIFETIME_CURRENT;
	
		}
		
		
	}