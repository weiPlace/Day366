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
<div class="span10 offset1 thumbnail" id="help">
			<div class="blue"></div>
			<div>
				<h3>主题</h3>	
				<p>了解历史上每一天出现的大事,找到与自己出生在同一天的名人，好朋友。你也可以了解自己喜欢的偶像(已逝世的)具体去世的时间。
				<p>同时你还可以收藏自己每一天发生的点点滴滴，让每一天都过得非常精彩。
			</div>
			<div >
				<h3>366天墙</h3>
				<p>你可以将你喜欢的贴到你的366天墙上，你也可以收藏你所收藏之人366天墙的内容，并且你每天发表的状态都会自动贴到你的366天墙上
			</div>
			<div>
				<h3>隐私</h3>
				<p>我相信人的隐私高于一切。因此我们只需要你最低限度的信息。但有些是必须的:一个有效的电子邮件地址,真实姓名,公历生日,出生日期，当然还包括真实的性别。这样我们才能更好地为你提供服务。
			</div>

			<a href="{#public#}account" >点此返回</a>	
			</div>

</div>

<div id="fixed">
{include file="footer.tpl"}
</div>
</div>
</body>
</html>