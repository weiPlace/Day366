<!doctype html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="Keywords" content="day,birthday,days366,大学,同学,朋友,交友,每一天" />
<meta name="Description" content="remember every day!,记住每一天" />
<title>{$userName|default:'days366'}</title>
<link rel="icon" type="image/ico" href="http://www.days366.com/favicon.ico">
{config_load file="smarty.config.ini" section="path" scope="global" }
<link rel="stylesheet" href="{#css#}bootstrap.min.css"/>
<link rel="stylesheet" href="{#css#}friend.css" />
<link rel="stylesheet" href="{#css#}style.css" />
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
{include file="login/day.tpl"}
<div class="container">
<div class="row">
	<div class="span4 thumbnail" style="margin-left:33.3%">

		<div id="strangerInformation">
			<a href="{#public#}friend/findfriendmainpage?id={$friendId}" target="_blank" >
				<img src="{#imgfinish#}{$friendImg}" alt="这是用户的头像" />
			</a>
		</div>
		<div id="textInformation">
				<h4><a href="{#public#}friend/findfriendmainpage?id={$friendId}" target="_blank" ><span>{$friendName}</span></a>&nbsp;&nbsp;<span>{$friendBirthday}</span></h4>
				<h4><span>{$friendProvince}</span><span>{$friendCity}</span></h4>
				<h4><span>{$friendUs}</span></h4>
				<p>You have no rights to access this man.
				<p><a href="{#public#}twitter/index" >Return </a>
		</div>
	</div>
<div class="span12">{include file="footer.tpl"}</div>	
</div>
</div>


</body>
</html>