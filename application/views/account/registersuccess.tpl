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

			<div class="span12">
				<div class="registerSuccess">
				<h3>Success</h3>
				<hr />
					<p> Congratulation,you register successfully!
					<p><a href="{#public#}twitter/index" >Return </a>
				</div>
			</div>
		</div>

	<div >
	{include file="footer.tpl"}
	</div>
</div>
<script type="text/javascript" src="{#js#}gg.js"></script>
</body>
</html>
