<?php
require_once 'Check/Search.php';
class Check_Search_Friend extends Check_Search {

	private $_info;
	protected $db;
	private $_message=null;
	private $_name;
	private $_type;
	public $error;
	public function __construct($db) {
		$this->db=$db;
		parent::__construct ($db);

	
	}
	public function process(Zend_Controller_Request_Abstract $request)
	{
		
		$name=$this->sanitize($request->getPost('search'));
		$type=$this->sanitize($request->getPost('type'));

		$this->_name=$name;
		//判断种类
		if($type=="day")
		{
				$this->_type='day';
				$result=$this->searchSameDay($name);
				if (!$result){return false;}
				return true;
		}else
		{
			
			$validNameLength=new Zend_Validate_StringLength(1,50);
			$validNameNotEmpty=new Zend_Validate_NotEmpty();
		
			if (!$validNameNotEmpty->isValid($name))
			{
				$this->error="您所输入姓名不能为空！";
				return false;	
			}
			if (!$validNameLength->isValid($name))
			{
				$this->error="请输入在字数限制内的字符串";
				return false;
			}
		
			$dealName=$this->dealInput();
			$result=$this->queryName($dealName);
		}
		if (!$result)
		{
			return false;
		}
			return true;
		}
	public function ajaxProcess(Zend_Controller_Request_Abstract $request)
	{

		$search=$this->sanitize($request->getPost('search'));
		$page=$this->sanitize($request->getPost('page'));
		$type=$this->sanitize($request->getPost('type'));
	
		if ($type=="day")
		{
				$this->_type='day';
				$result=$this->searchSameDay($search,$page-1);
				return true;		
		}
	
			$validNameLength=new Zend_Validate_StringLength(1,50);
			$validNameNotEmpty=new Zend_Validate_NotEmpty();
		
			if (!$validNameNotEmpty->isValid($search))
			{
				$this->error="您所输入姓名不能为空！";
				return false;	
			}
			if (!$validNameLength->isValid($search))
			{
				echo 'hello';
				$this->error="请输入在字数限制内的字符串";
				return false;
			}
		
			$dealName=explode(' ',$search,2);
			$result=$this->queryName($dealName,$page-1);
			if (!!$result){return true;}
			return false;
	
	}
	public function queryName($dealName,$pageNumber=0)
	{
		if(!!(count($dealName)==1))
		{
				$result=$this->db->query('SELECT * FROM user WHERE (user_name=? OR user_us= ?) AND NOT (user_name="未命名") LIMIT ?,30',array(trim($dealName[0]),trim($dealName[0]),$pageNumber*30));
				$r_a=$result->fetchAll();
				$this->addInfo($r_a);
				if ((count($r_a)==0) && $pageNumber==0)
				{	
					$this->_message="我们未能找到符合要求的人名，因此我们为你选择了可能符合你查询要求的人名";
					$result=$this->dealString(trim($dealName[0]),null);
					if (!$result)
					{
						return false;
					}
				}
				
				return true;

		}
		$sql=$this->db->query('SELECT * FROM user WHERE (user_name= ? AND user_us =? ) AND NOT (user_name="未命名") LIMIT ?,30',array(trim($dealName[1]),trim($dealName[0]),$pageNumber*30));

		$result=$sql->fetchAll();

		if (count($result)==0 && $pageNumber=0)
		{
					$this->_message="我们未能找到符合要求的人名，因此我们为你选择了可能符合你查询要求的人名";
					if (!$this->dealString(trim($dealName[1]),trim($dealName[0])))
					{
						return false;
					}
					return true;			
		}

		$this->addInfo($result);
		return true;
		
	}
	//处理未得到最匹配结果的数据
	public function dealString($name,$us=null)
	{
		$firstName=trim(substr($name, 0,3));
		$lastName=trim(substr($name, 3));
			if (!!$us==null)
			{
				//查询只输入一个字符串的结果，分为输入大学和输入姓名
				$sql=$this->db->query('SELECT * FROM user WHERE (user_firstname=? OR user_lastname=?) AND NOT (user_name="未命名")  LIMIT 30',array(trim($firstName),trim($lastName)));
			
				}else{
				
				$sql=$this->db->query('SELECT * FROM user WHERE (user_firstname=?  OR user_us =?) AND NOT (user_name="未命名") LIMIT 30',
						array(trim($firstName),trim($us)));
			}

			$result=$sql->fetchAll();
			if (!!count($result)==0)
			{
				$this->error="未能找到符合要求的人名";
				return false;
			}
			$this->addInfo($result);

			return true;
		
	}
	//获取提示信息
	public function getMess()
	{
		return $this->_message;
	}
	
	//获取查询后的数值数组信息.
	public function addInfo(array $info)
	{
		$this->_info=$info;
	}
	public function getInfo()
	{
		return $this->_info;
	}
	public function getError()
	{
		return $this->error;
	}
	
	//计算得出来的总行数
	//只有当用户输入为单个数据时，才返回页码数
	public function getRows()
	{
		$dealName=$this->dealInput();
		if ($this->_type=="day")
		{
			$sql=$this->db->query('SELECT COUNT(user_id) AS rows FROM user WHERE user_birthday LIKE ? AND NOT (user_name="未命名")','%'.$this->_name);
			$result=$sql->fetch();
			$pages=ceil($result['rows']/30);
			return $pages;
		}

		$length=$this->vertictLength($dealName);
		if ($length==1)
		{

			$sql=$this->db->query('SELECT COUNT(user_id) AS rows FROM user WHERE (user_name=? OR user_us= ?)AND NOT (user_name="未命名") ',array(trim($dealName[0]),trim($dealName[0])));
			$result=$sql->fetch();
			$pages=ceil($result['rows']/30);
			return $pages;
		}
			$sql=$this->db->query('SELECT COUNT(user_id) AS rows FROM user WHERE (user_name=? AND user_us=?)AND NOT (user_name="未命名")',array(trim($dealName[1]),trim($dealName[0])));
			$result=$sql->fetch();
			$pages=ceil($result['rows']/30);
			return $pages;
		
	}
	
	//处理用户输入的数据
	public function dealInput()
	{
		return explode(' ',$this->_name,2);
		
	}
	
	public function vertictLength($dealName)
	{
		return count($dealName);
	}

	public function getName()
	{
		return $this->_name;
	}
	public function searchSameDay($name,$pageNumber=0)
	{
		$name=str_ireplace('年', '-', $name);
		$name=str_ireplace('月','-', $name);
		$name=str_ireplace('日', '', $name);
		if (!Zend_Date::isDate(trim($name),'m-d') && !Zend_Date::isDate(trim($name),'Y-m-d'))
		{
			$this->error="请输入格式类似01-02或1992-01-01形式的日期。注意，月份和日期都有前导零.";
			return false;
		}
			if (count(explode('-',trim($name)))==3)
			{
				$sql=$this->db->query('SELECT * FROM user WHERE user_birthday  LIKE ? AND NOT (user_name="未命名") LIMIT ?,30',array($name,$pageNumber*30));
			}else
			{
				$sql=$this->db->query('SELECT * FROM user WHERE user_birthday LIKE ?  AND NOT (user_name="未命名") LIMIT ?,30',array("%{$name}",$pageNumber*30));
			}
			$result=$sql->fetchAll();
			$this->addInfo($result);
			return true;
		
	}
	//得到与自己同一天生日人的信息。
	public function getSpecial(Zend_Controller_Request_Abstract $request)
	{
		$date=$this->sanitize($request->getQuery('day'));
		if ($date == 'today')
		{
			$date='0000-'.date('m-d');
		}
		$birthday=explode('-', $date,2);
		$sql=$this->db->query('SELECT * FROM user WHERE user_birthday LIKE ?  AND NOT (user_name="未命名")',array('____-'.$birthday[1]));
		$result=$sql->fetchAll();
		return $result;		
	}
	public function getFriend($userUs,$userCity)
	{
		$sql=$this->db->query('SELECT * FROM user WHERE user_us=? OR user_city=? LIMIT 20',array($userUs,$userCity));
		$result=$sql->fetchAll();
		return $result;
	
	}

}