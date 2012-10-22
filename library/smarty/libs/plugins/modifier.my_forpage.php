<?php
/**
 * 
 * 分页插件
 * @param int  $number
 * @author wei
 */
function smarty_modifier_my_forpage($number)
{
	if ($number >=15){$number=15;}
	if (!!($number==1) ){return false;}
	echo "<div id=\"page\" class=\"pagination\">";
	echo "<ul>";
	for ($i=1;$i<=$number;$i++)
	{
		echo <<<PAGE

		<li><a href="#" value="$i">$i</a></li>
PAGE;
	}
	echo "</ul>";
	echo "</div>";
}