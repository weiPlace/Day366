<?php

function smarty_modifier_my_choosetype($type) {
		switch($type)
		{
			case 'goal':
			{
					return '一天目标';
			}
			case 'sum':
			{
				return '一天总结';
			}
			default:{
				return '一天随感';
			}
		}
}

?>