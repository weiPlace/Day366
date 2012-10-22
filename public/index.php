<?php
require_once 'Zend/Controller/Front.php';
date_default_timezone_set('Asia/Shanghai');
set_include_path(".".PATH_SEPARATOR."../library".
					PATH_SEPARATOR."../application/models".
					PATH_SEPARATOR."../library/smarty/libs".
					PATH_SEPARATOR.get_include_path());
require_once "Zend/Loader/Autoloader.php";
$loader=Zend_Loader_Autoloader::getInstance();
$loader->registerNamespace('Plugin_Acl_');
$config=new Zend_Config_Ini('../application/configs/config.ini');
Zend_Registry::set('config', $config);
$params=array(
	'host'=>$config->database->hostname,
	'username'=>$config->database->database->username,
	'password'=>$config->database->database->password,
	'dbname'=>$config->database->database->dbname
);
$db=Zend_Db::factory($config->database->database->type,$params);

Zend_Registry::set('db', $db);

 
$auth=Zend_Auth::getInstance();
$auth->setStorage(new Zend_Auth_Storage_Session());
$front=Zend_Controller_Front::getInstance();
$front->setControllerDirectory("../application/controllers");
$front->setDefaultControllerName('days');
$front->registerPlugin(new Plugin_Acl_Management($auth));
$front->setParam('noViewRenderer', true);
require_once 'Templater.php';
$smarty=new Smarty_My();
$smarty->caching=false;
Zend_Registry::set('smarty',$smarty );
$front->dispatch();
