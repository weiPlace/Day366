<?php
require_once 'Database.php';
/**
 *
 * @author wei
 *        
 *        
 */
class Database_Account_Invite extends Database
{
    // TODO - Insert your code here
    protected  $db;
    private $_id;
    function __construct ($db)
    {
        // TODO - Insert your code here
        $this->db=$db;
        parent::__construct($db,'invitenumber','invite_id');
        $this->add('invite_id');
        $this->add('number');
        $this->add('times');
    }
    /**
   * 
    */
    /**function __destruct ()
    {
        // TODO - Insert your code here
    }*/
      public function __set($name,$value){

        return parent::__set($name,$value);
        
    }
    	public function check($inviteNumber)
    	{
    		
    		$sql=$this->db->quoteInto("SELECT * FROM invitenumber WHERE number = ?",$inviteNumber);
    		$result=$this->db->query($sql);
    		$r_a=$result->fetch();
    		if($r_a == false)
    		{
    			return false;
    		}
    
    	
    		
    		return true;
    	}
    	public function deleteInvite($inviteNumber)
    		{
    			$sql=$this->db->query('DELETE  FROM invitenumber WHERE number=?',$inviteNumber);
    			$result=$sql->fetch();
    			return true;
    			
    		}
}
?>