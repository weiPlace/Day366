<?php
require_once 'Database/User/Userinfo.php';
/** 
 * @author wei
 * 
 * 
 */
class Check_Imgfinish extends Check {
	private $_x;
	private $_y;
	private $_w;
	private $_h;
	private $_img;
	protected  $db;
	private $_auth;
	private $_config;
	public $error;
	private $_user;
	private $_o_width;
	private $_o_height;
	private $_scale;
	function __construct($db)
	{
		$this->db=$db;
		$this->_auth=Zend_auth::getInstance();
		$this->_config=Zend_Registry::get('config');
		
	}
	
	/**
	 * 
	 * @see Check::process()
	 */
	public function process(Zend_Controller_Request_Abstract $request)
	{

		$this->_x=$this->sanitize($request->getPost('x'));
		$this->_y=$this->sanitize($request->getPost('y'));
		$this->_h=$this->sanitize($request->getPost('h'));
		$this->_w=$this->sanitize($request->getPost('w'));
		$this->_img=$this->sanitize($request->getPost('img'));
		if (!$this->dealImg())
		{
			return false;
		}
		
		$id=$this->_auth->getIdentity()->user_id;
		$this->_user=new Database_User_Userinfo($this->db);
		try
		{
		$this->_user->load($id,'user_id');
		$onceImg=$this->_user->user_img;
		$this->_user->user_img=$this->_img;
		$this->_user->save();
		}catch(Zend_Db_Statement_Mysqli_Exception $e)
		{
			$this->error="图像处理失败，请待会重试";
			return false;
		}
		if (file_exists($this->_config->path->data.'/userimg/small/'.$onceImg))
		{
			if (!$onceImg=="default.jpg")
			{
			unlink($this->_config->path->data.'/userimg/small/'.$onceImg);
			}
		}		
		if (file_exists($this->_config->path->data.'/userimg/img/'.$onceImg))
		{
			if (!$onceImg=="default.jpg")
			{
			unlink($this->_config->path->data.'/userimg/img/'.$onceImg);
			}
		}
		if (file_exists($this->_config->path->data.'/userimg/send/'.$this->_img))
		{
			unlink($this->_config->path->data.'/userimg/send/'.$this->_img);
		}
		
		return true;
	}
	
	/**
	 * 
	 * @see Check::getError()
	 */
	public function getError()
	{
		return $this->error;
		if (file_exists($this->_config->path->data.'/userimg/send/'.$this->_img))
		{
			unlink($this->_config->path->data.'/userimg/send/'.$this->_img);
		}		
	}
	
	private function dealImg()
	{
		$targ_w = 180;
		$targ_h = 240;
		$jpeg_quality = 90;
		
		$src =$this->_config->path->data.'/userimg/send/'.$this->_img;
		$imgType=explode('.', $this->_img);
		switch ($imgType[1])
		{
			case 'jpg':
				{
					$img_r = imagecreatefromjpeg($src);


					$dst_r = ImageCreateTrueColor( $targ_w, $targ_h );
					try
					{
						imagecopyresampled($dst_r,$img_r,0,0,$this->_x,$this->_y,
							$targ_w,$targ_h,$this->_w,$this->_h);
					}catch(Exception $e)
				{
					echo $e.get_current_user();
					$this->error="图像处理失败，请待会重试!";
					return false;
				}	
					$result=imagejpeg($dst_r,$this->_config->path->data.'/userimg/img/'.$this->_img,$jpeg_quality);
			}
			break;
			case 'gif':
			{
					$img_r = imagecreatefromgif($src);
					$dst_r = ImageCreateTrueColor( $targ_w, $targ_h );
					try
					{
						imagecopyresampled($dst_r,$img_r,0,0,$this->_x,$this->_y,
							$targ_w,$targ_h,$this->_w,$this->_h);
					}catch(Exception $e)
				{
					$this->error="图像处理失败，请待会重试!";
					return false;
				}	
					$result=imagegif($dst_r,$this->_config->path->data.'/userimg/img/'.$this->_img,$jpeg_quality);
			}
			break;
			default:
			{
					$img_r = imagecreatefrompng($src);
					$dst_r = ImageCreateTrueColor( $targ_w, $targ_h );
					try
					{
						imagecopyresampled($dst_r,$img_r,0,0,$this->_x,$this->_y,
							$targ_w,$targ_h,$this->_w,$this->_h);
					}catch(Exception $e)
				{
					$this->error="图像处理失败，请待会重试!";
					return false;
				}	
					$result=imagepng($dst_r,$this->_config->path->data.'/userimg/img/'.$this->_img);
			}
		}
		if	(!$result)
		{
			$this->error="图像处理失败,请待会重试!";
			return false;
		}
		$this->changeImg();
		return true;
	}
	public function changeImg()
	{
		$goalWidth = 50;
		$goalHeight= 50;
		$jpeg_quality = 90;
		$src =$this->_config->path->data.'/userimg/img/'.$this->_img;
		$imgType=explode('.', $this->_img);
		switch ($imgType[1])
		{
			case 'jpg':
				{
					$img_r = imagecreatefromjpeg($src);
					$this->getO($img_r);
					$dst_r = ImageCreateTrueColor( $goalWidth, $goalHeight );
					try
					{
						imagecopyresampled($dst_r,$img_r,0,0,0,0,
							$goalWidth,$goalHeight
							,$this->_o_width,$this->_o_height);
					}catch(Exception $e)
				{
					echo $e.get_current_user();
					$this->error="图像处理失败，请待会重试!";
					return false;
				}	
					$result=imagejpeg($dst_r,$this->_config->path->data.'/userimg/small/'.$this->_img,$jpeg_quality);
			}
			break;
			case 'gif':
			{
					$img_r = imagecreatefromgif($src);
					$this->getO($img_r);
					$dst_r = ImageCreateTrueColor( $goalWidth, $goalHeight );
					try
					{
						imagecopyresampled($dst_r,$img_r,0,0,0,0,
							$goalWidth,$goalHeight
							,$this->_o_width,$this->_o_height);
					}catch(Exception $e)
				{
					$this->error="图像处理失败，请待会重试!";
					return false;
				}	
					$result=imagegif($dst_r,$this->_config->path->data.'/userimg/small/'.$this->_img,$jpeg_quality);
			}
			break;
			default:
			{
					$img_r = imagecreatefrompng($src);
					$this->getO($img_r);
					$dst_r = ImageCreateTrueColor( $goalWidth, $goalHeight );
					try
					{
						imagecopyresampled($dst_r,$img_r,0,0,0,0,
							$goalWidth,$goalHeight
							,$this->_o_width,$this->_o_height);
					}catch(Exception $e)
				{
					$this->error="图像处理失败，请待会重试!";
					return false;
				}	
					$result=imagepng($dst_r,$this->_config->path->data.'/userimg/small/'.$this->_img);
			}
		}
		if	(!$result)
		{
			$this->error="图像处理失败,请待会重试!";
			return false;
		}
		return true;
	}
	
	public function getO($img_r)
	{
		$this->_o_height=imagesy($img_r);
		$this->_o_width=imagesx($img_r);
	}
		
	}


?>