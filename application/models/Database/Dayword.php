<?php
require_once('Database.php');
class Database_Dayword extends  Database {
	public function __construct($db)
	{
		parent::__construct($db, 'dayword', 'dayword_id');
		$this->add('dayword_id');
		$this->add('dayword_user_id');
		$this->add('dayword_day');
		$this->add('dayword_time',date('H:i:s'));
		$this->add('dayword_content');
		$this->add('dayword_image');
		$this->add('dayword_state','happy');
		$this->add('dayword_type','feel');
		$this->add('dayword_comment',0);
		$this->add('dayword_like',0);
		$this->add('dayword_favourite',0);
	}
}

?>