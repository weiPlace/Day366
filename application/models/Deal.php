<?php
//处理各种数据的类
abstract class Deal {

	abstract function deal($data)
	{
		return true;
	}
}

