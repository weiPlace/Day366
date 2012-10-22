<?php
/** 
 * @author wei
 * 
 * 
 */
class Mail_Send
{	
    private $_mail;
    public $receive;
	public $server;
    public $send;
    // TODO - Insert your code here
    function __construct ()
    {
        $this->_mail=new Zend_Mail();
    }
    public function sendMail($receive){
 

    	$server=explode('@',$receive);
    	$serverName=explode('.',$server[1]);
    	$this->server=$serverName[0];
  		

    }
}
?>