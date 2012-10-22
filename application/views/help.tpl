<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
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
			<div class="span12" >
				<div>
					<h4>关于本网站的主题</h4>
					<hr />
					<p>网站的口号是"记住每一天".这也是days366最想传达给每个人的信息。days366帮助大家珍藏生活的点滴，分享自己每一天的趣事，寻找志趣相投，有缘的朋友。
				</div>
				<div id="dayWall">
					<h4>关于天墙</h4>
					<hr />
					<p>每一个人都有366个天墙,也就是说你生活的每一天都各自有一个墙壁。你在这一天所记录的事情，收藏的事物都将出现在你对应的天墙之内。
				</div>
				<div id="dayWall">
					<h4>关于公共主页</h4>
					<hr />
					<p>与天墙一样，公共主页也有366份天墙。但它记录了每一天发生的最有趣的事情。同时，你可以为公共主页添加内容。找到对应这天出生的朋友。
				</div>
				<div id="dayWall">
					<h4>关于收藏好友</h4>
					<hr />
					<p>在days366.你可以找到与自己出生同一天的人，并且收藏他们。同时，你也可以收藏有共同爱好的人，在生活中的朋友，同事以及家人。
				</div>
				<div id="dayWall">
					<h4>关于农历和公历的问题</h4>
					<hr />
					<p>days366支持公历，不支持农历。这一点我深感抱歉。
				</div>				
				<div>
					<h4>关于用户隐私</h4>
					<hr />
					<p>我相信人的隐私高于一切。因此我们只需要你最低限度的信息。但有些是必须的:一个有效的电子邮件地址,真实姓名,公历生日,出生日期，当然还包括真实的性别。这样我们才能更好地为你提供服务。
				</div>
			
				<a href="{#public#}account" >点此返回</a>	
		</div>
		{include file="footer.tpl"}	
	</div>
</div>
<script type="text/javascript" src="{#js#}gg.js"></script>
</body>
</html>