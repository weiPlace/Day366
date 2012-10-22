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
<div class="span10 thumbnail offset1" id="userRule">
			<div class="blue"></div>
			<div id="contactUs"  >
				<h3>不作恶</h3>
				<p>只有一条，如谷歌所说的不作恶，任何被我认定为作恶之事我们会采取一切手段对这种行为进行打压。</p>
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