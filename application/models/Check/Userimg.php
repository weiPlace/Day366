<?php
require_once ('Check.php');
/** 
 * @author wei
 * 
 * 
 */
class Check_Userimg extends Check
{	
	public $error=null;
	private $_config;
	private $_auth;
	private $_name;
	private $_imgName;
	private $_id;
	private $_type;
	public $db;
	private $_o_height;
	private $_o_width;
	private $_width=600;
	private $_height;
    //TODO - Insert your code here
    function __construct ($db)
    {
    	$this->db=$db;
        $this->_config=Zend_Registry::get('config');
        $this->_auth=Zend_Auth::getInstance();
        if ($this->_auth->hasIdentity())
        {
        	$this->_id=$this->_auth->getIdentity()->user_id;
        }
    }
    public function process(Zend_Controller_Request_Abstract $request)
    {
		$this->_name=$this->sanitize($request->getPost('photoId'));
    	
    	
    	if (!isset($_FILES['file']) || !is_array($_FILES['file'])) 
    	    {
                $this->error="无效的图像";
                return false;
            }

            $file = $_FILES['file'];

            switch ($file['error']) {
                case UPLOAD_ERR_OK:
                    // success
                    break;

                case UPLOAD_ERR_FORM_SIZE:
                    // only used if MAX_FILE_SIZE specified in form
                case UPLOAD_ERR_INI_SIZE:
                    $this->error="上传的图像过大";
                    break;

                case UPLOAD_ERR_PARTIAL:
                    $this->error='图像格式不对';
                    break;

                case UPLOAD_ERR_NO_FILE:
                    $this->error='未发现图像';
                    break;

                case UPLOAD_ERR_NO_TMP_DIR:
                    $this->error='发生错误，请重试';
                    break;

                case UPLOAD_ERR_CANT_WRITE:
                    $this->error='发生错误，请重试!';
                    break;

                case UPLOAD_ERR_EXTENSION:
                    $this->error='发生错误，请重试!';
                    break;

                default:
                    $this->error='发生不知名错误';
            }

            if ($this->error != null)
                return false;

            $info = getImageSize($file['tmp_name']);
            if (!$info) {
                $this->error="你所上传的文件并不是一个图像！";
                return false;
            }

            switch ($info[2]) {
                case IMAGETYPE_PNG:
                	$this->_type='png';
                	break;
                case IMAGETYPE_GIF:
                	$this->_type='gif';
                	break;
                case IMAGETYPE_JPEG:
                	$this->_type="jpg";
                    break;

                default:
                    $this->error('你上传了一个无效的头像');
                    return false;
            }
            // if no errors have occurred, save the image
				return true;

    }
    
    public function getError()
    {
    	return $this->error;
    }
    
    public function saveImg()
    {
		$this->_imgName=$this->_id.$this->_name.'.'.$this->_type;
		$result=move_uploaded_file($_FILES['file']['tmp_name'], $this->_config->path->data."/userimg/tmp/".$this->_imgName);
		
    	if (!$result)
    	{
    		$this->error="图像上传失败";
    		return false;
    	}
    	$src=$this->_config->path->data."/userimg/tmp/".$this->_imgName;
    	
    	if (!$this->dealSendPhoto($src))
    	{
    		$this->error="图像上传失败";
    		return false;
    		
    	}
    	return true;
    }
    
    //使发送给用户的图像是600*X的
    public function dealSendPhoto($src)
    {
    	$imgType=explode('.', $this->_imgName);
    	$jpeg_quality=90;
		switch ($imgType[1])
		{
			case 'jpg':
				{
					$img_r = imagecreatefromjpeg($src);
					$this->getO($img_r);
					if ($this->_o_width<600)
					{
						rename($this->_config->path->data.'/userimg/tmp/'.$this->_imgName, $this->_config->path->data.'/userimg/send/'.$this->_imgName);
						return true;
					}
					$scale=$this->_o_width/600;
					$this->_height=$this->_o_height/$scale;
					$dst_r = ImageCreateTrueColor( $this->_width, $this->_height );
					try
					{
						imagecopyresampled($dst_r,$img_r,0,0,0,0,
							$this->_width,$this->_height,$this->_o_width,$this->_o_height);
					}catch(Exception $e)
				{
					$this->error="图像处理失败，请待会重试!";
					return false;
				}	
					$result=imagejpeg($dst_r,$this->_config->path->data.'/userimg/send/'.$this->_imgName,$jpeg_quality);
			}
			break;
			case 'gif':
			{
					$img_r = imagecreatefromgif($src);
					$this->getO($img_r);
					if ($this->_o_width<600)
					{
						rename($this->_config->path->data.'/userimg/tmp/'.$this->_imgName, $this->_config->path->data.'/userimg/send/'.$this->_imgName);						
						return true;
					}
					$scale=$this->_o_width/600;
					$this->_height=$this->_o_height/$scale;
					$dst_r = ImageCreateTrueColor( $this->_width, $this->_height );
					try
					{
						imagecopyresampled($dst_r,$img_r,0,0,0,0,
							$this->_width,$this->_height,$this->_o_width,$this->_o_height);
					}catch(Exception $e)
				{
					$this->error="图像处理失败，请待会重试!";
					return false;
				}	
					$result=imagegif($dst_r,$this->_config->path->data.'/userimg/send/'.$this->_imgName,$jpeg_quality);
			}
			break;
			default:
			{
					$img_r = imagecreatefrompng($src);
					$this->getO($img_r);
					if ($this->_o_width<600)
					{
						rename($this->_config->path->data.'/userimg/tmp/'.$this->_imgName, $this->_config->path->data.'/userimg/send/'.$this->_imgName);						
						return true;
					}
					$scale=$this->_o_width/600;
					$this->_height=$this->_o_height/$scale;
					$dst_r = ImageCreateTrueColor( $this->_width, $this->_height );
					try
					{
						imagecopyresampled($dst_r,$img_r,0,0,0,0,
							$this->_width,$this->_height,$this->_o_width,$this->_o_height);
					}catch(Exception $e)
				{
					$this->error="图像处理失败，请待会重试!";
					return false;
				}	
					$result=imagepng($dst_r,$this->_config->path->data.'/userimg/send/'.$this->_imgName);
			}
		}

    	if (file_exists($this->_config->path->data.'/userimg/tmp/'.$this->_imgName))
		{
			unlink($this->_config->path->data.'/userimg/tmp/'.$this->_imgName);
		}
		return true;
    }
    
    public function getFileName()
    {
    	return $this->_imgName;
    }
    
	public function getO($img_r)
	{
		$this->_o_height=imagesy($img_r);
		$this->_o_width=imagesx($img_r);
	}
}
?>