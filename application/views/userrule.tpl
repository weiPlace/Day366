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
				<div id="mainifesto" >
					<h3>使用条款</h3>
					<hr />
					<ul>
						<li>本站对维基百科中出现的中华民国（1949年以后）进行了修改，皆以'台湾'代替。本人虽不热衷于政治。但坚持"台湾是中国不可分割的一部分这一基本立场"。</li>
						<li>若注册用户依靠本网站进行违反法律法规的行为，本站会予以冻结账号，并且删除其有害言论。本站不承担任何法律责任。</li>
						<li>在用户不违背法律的基础之上。day366会尽力保护用户的隐私，以及使用畅通的使用网站的各种功能。
						<li>最终解释权归days366所有。
					</ul>
					<a href="{#public#}account" >点此返回</a>
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
  ·