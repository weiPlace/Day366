<?php
require_once ('Database.php');
/** 
 * @author wei
 * 
 * 
 */
class Upload_Imgheader extends Database
{
    //TODO - Insert your code here
    function __construct ($db)
    {
        //TODO - Insert your code here
        parent::__construct($db, 'user_image', 'user_id');
        $this->add('user_id');
   		$this->add('file');
   		$this->add('post_id');
    }
}
?>