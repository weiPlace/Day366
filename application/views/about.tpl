<!DOCTYPE html>
<html lang="zh-CN">
<meta charset="utf-8">
<head>
<title>{$userName|default:'days366'}</title>
<link rel="icon" type="image/ico" href="http://www.days366.com/favicon.ico">
{config_load file="smarty.config.ini" section="path" scope="global" }
<link rel="stylesheet" href="{#css#}bootstrap.min.css"/>
<link rel="stylesheet" href="{#css#}style.css" />
<link rel="stylesheet" href="{#css#}global.css" />
<!--[if lt IE 10]>
<link rel="stylesheet" href="{#css#}fixie.css" />
<![endif]-->
<!--[if lt IE 8]>
<script type="text/javascript">
	window.location.href="http://www.days366.com/global/mainifesto#browser"
</script>
<![endif]-->
</head>
<body>
	<div class="header row">
		<div class="span10 offset1">
			<div class="pull-left">
				<img src="{#img#}logo.png" alt="this is logo" />
			</div>
		</div>
	</div>
<div class="container">
<div class="row">
	<div class="row">
		<div class="span12 about">	
				<div class="span12">
					<h3>网站的构思</h3>
					<hr />
					<p>网站的构思来源于我想送给一位女性朋友的生日礼物.后来我想到每一天都有人过生日。那么，每一天对某些人来说都具有极其特殊的意义。所以为什么不珍藏每一天，并且大家可以找到与自己同一天出生的朋友，与自己的朋友分享每一天的趣事，并将它永久珍藏。于是days366诞生了。
					<p><a href="{#public#}account" >点此返回</a>						
				</div>
			</div>
	</div>
	{include file="footer.tpl"}
</div>
</div>
<script type="text/javascript" src="{#js#}gg.js"></script>
</body>
</html>