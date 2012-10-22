<?php
require_once ('Database.php');
/** 
 * @author wei
 * 
 * 
 */
class Database_Us extends Database
{
    //TODO - Insert your code here
    function __construct ($db)
    {
        //TODO - Insert your code here
        parent::__construct($db, 'unknown_us', 'us_id');
        $this->add('us_id');
        $this->add('us_name');
        $this->add('user_id');
    }
}
?>