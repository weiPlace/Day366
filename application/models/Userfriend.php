<?php
require_once 'Database/Friend/Friend.php';
/** 
 * @author wei
 * @access user
 * @deprecated 用户进入好友之后的操作
 * 
 */
class Userfriend {
	//TODO - Insert your code here
	protected $db;
	private $_user;
	private $_saniti;

	function __construct($db) {
		$this->db=$db;
		$this->_user=new Database_Friend_Friend($db);
		//TODO - Insert your code here
	}
	/**
	 * 
	 * 用户是否为好友，并且根据用户的权限设置进入不同的页面
	 * @param (int) $userId
	 * @param (int) $friendId
	 */
	
	public function getPermit($userId,$friendId)
	{
		$checkFriend=$this->_user->checkRelation($userId, $friendId);
		if (!$checkFriend){return false;}
		$result=$this->_user->checkPermit($friendId);
		return $result;
}
    public function sanitize($value)
        {
            if (!$this->_saniti instanceof Zend_Filter) {
                $this->_saniti= new Zend_Filter();
                $this->_saniti->addFilter(new Zend_Filter_StringTrim())
                                     ->addFilter(new Zend_Filter_StripTags());
            }

            // filter out any line feeds / carriage returns
            $ret = preg_replace('/[\r\n]+/', '', $value);

            // filter using the above chain
            return $this->_saniti->filter($ret);
        }
}

