<?php
/**
 * 
 * 分页插件
 * @param int  $number
 * @author wei
 */
function smarty_modifier_my_forother($number,$type,$month,$day)
{
	if ($number >=15){$number=15;}
	if ($type==1){
	echo "<ul>";
	for ($i=1;$i<=$number;$i++)
	{
		echo <<<PAGE

		<li><a href="http://www.days366.com/twitter/index?number={$i}" >$i</a></li>
PAGE;
	}
	echo "</ul>";
	}else
	{
	echo "<ul>";
	for ($i=1;$i<=$number;$i++)
	{
		echo <<<HELLO

		<li><a href="http://www.days366.com/twitter/findday?&month={$month}&day={$day}&number={$i}" >$i</a></li>
HELLO;
	}
	echo "</ul>";
	
	}

}