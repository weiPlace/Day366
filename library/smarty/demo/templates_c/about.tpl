<!doctype html>
<html lang="zh-CN">
<head>
{config_load file="smarty.config.ini" section="path" scope="global" }
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="Keywords" content="day,birthday,days366,大学,同学,朋友,交友,每一天" />
<meta name="Description" content="remember every day!,记住每一天" />
<title>{$userName|default:'days366'}</title>
<link rel="stylesheet" href="{#css#}bootstrap.min.css"/>
<link rel="stylesheet" href="{#css#}style.css" />
<link rel="stylesheet" href="{#css#}global.css" />
<!--[if lt IE 10]>
<link rel="stylesheet" href="{#css#}fixie.css" />
<![endif]-->
<!--[if lt IE 8]>
<script type="text/javascript">
	window.location.href="http://localhost/web/public/global/mainifesto#browser
</script>
<![endif]-->	
<script type="text/javascript" src="{#js#}jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="{#js#}bootstrap.min.js"></script>
</head>
<body>
<div class="container">
{include file=$day}
<div class="row">
<div class="span10 offset1  thumbnail" id="aboutWebsite">
		<div >
			<div class="blue"></div>
			<div class="span6"><img src="{#img#}global/dongmin.jpg" alt="this is 董敏"/></div>
			<div class="span3">
			<h3>网站由来</h3>
			<p>这个网站原本是给董敏同学的生日礼物.但是我同样希望这个网站能给你们带来不一样的生活:使自己的每一天都过得有趣，有意义，简单。
			<a href="{#public#}account" >点此返回</a>						
			</p>
			</div>

			</div>

</div>
</div>
<div id="fixed">
{include file="footer.tpl"}
</div>
</div>
</body>
</html>