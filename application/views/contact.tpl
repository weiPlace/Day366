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

		<div class="row">
			<div class="span12">
				<div id="contact">
					<h3>联系我们</h3>
					<hr />
					<p>网站所有内容皆出自我手。但是我知道一个人的力量远没有团队的力量强大。如果你也想做点有趣的东西，希望锻炼自己的能力（当然前提你必须要有能力）。欢迎加入。我们的联系方式是sww201006@gmail.com.欢迎你的加盟。
					<p>又或者，你对网站有什么建议或者不满。我也欢迎你的来信。请发邮件至sww201006@126.com
					<p><a href="{#public#}account" >点此返回</a>
				</div>
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
