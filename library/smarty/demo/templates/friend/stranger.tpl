<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="Keywords" content="day,birthday,days366,大学,同学,朋友,交友,每一天" />
<meta name="Description" content="remember every day!,记住每一天" />
<title>{$userName|default:'days366'}</title>
{config_load file="smarty.config.ini" section="path" scope="global" }
<link rel="stylesheet" href="{#css#}bootstrap.min.css"/>
<link rel="stylesheet" href="{#css#}style.css" />
<link rel="stylesheet" href="{#css#}styleLogin.css" />
{literal}
<style>
.thumbnail .row{margin-top:6px;}
#fixed{margin-left:200px;}
</style>
{/literal}
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
	
	{include file="login/day.tpl"}
		<div class="row">
	
	<div class="thumbnail span8 offset2">
		<div class="blue"></div>
		<div class="row">
		<div id="strangerInformation" class="span3 offset1">
			<a href="{#public#}friend/findfriendmainpage?id={$friendId}" target="_blank" >
				<img src="{#imgfinish#}{$friendImg}" alt="这是用户的头像" />
			</a>
		</div>
			<div id="textInformation" class="span3">
				<h4><a href="{#public#}friend/findfriendmainpage?id={$friendId}" target="_blank" ><span>{$friendName}</span></a>&nbsp;&nbsp;<span>{$friendBirthday}</span></h4>
				<h4><span>{$friendProvince}</span><span>{$friendCity}</span></h4>
				<h4><span>{$friendUs}</span></h4>
				<p>由于你未收藏此人或者是此人未开放权限,因此你只能浏览到这些信息。你可以收藏此人得到浏览权限。但如果此人未开放权限，我深表遗憾.
				<p><a href="{#public#}twitter/index" >点此返回</a>
		</div>
	</div>	
	
	</div>
	</div>
	</div>
<div id="fixed">{include file="footer.tpl"}</div>
</body>
</html>