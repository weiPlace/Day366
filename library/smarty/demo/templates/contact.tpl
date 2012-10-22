
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
</head>
<body>
<div class="container">
{include file=$day}
<div class="row">
<div class="span10 offset1 thumbnail" id="contact">
			<div class="blue"></div>
			<div id="contactUs"  >
 				<h3>让我们做些有趣的事</h3>
				<p>sww201006@gmail.com</p>
				<p>15651687617</p>
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
