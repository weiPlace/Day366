<?php
require_once ('Database.php');

class Database_Twitter extends Database
{
	public function __construct($db)
	{
		parent::__construct($db, 'twitter', 'twitter_id');
		$this->add('twitter_id');
		$this->add('twitter_from_id','0');
		$this->add('twitter_user_id');
		$this->add('twitter_day');
		$this->add('twitter_type',2);
		$this->add('twitter_time',date('H:i:s'));
		$this->add('twitter_title');
		$this->add('twitter_content');
		$this->add('twitter_url');
		$this->add('twitter_image');
		$this->add('twitter_comment',0);
		$this->add('twitter_like',1);
		$this->add('twitter_favourite',1);
	}
}
?>