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
<div class="span10 offset1 thumbnail" id="main">
		<div class="blue"></div>
		<div id="mainifesto" >
			<h3>声明</h3>
			<ul>
				<li>本站的文字材料基本上来源于<a href="http://zh.wikipedia.com">维基百科</a>，其中公共主页366天中有7天来自于百度百科.若您想知道本站所提供资料的更详细内容，<a href="http://zh.wikipedia.com">请点击此处.</a></li>
				<li>本站的图片材料一般取自于一些素材共享站点。如果其中有侵犯你个人或者你所在组织的权利，请尽快通知本站，本站会予以删除</li>
				<li>本站部分采用的源代码遵循The Apache License，MIT or GPL Version 2 licenses。例如jquery框架，bootstrap等开源框架，个人在此表示感谢。</li>
				<li>本站对维基百科中出现的中华民国（1949年以后）进行了修改，皆以'台湾'代替。本人虽不热衷于政治。但坚持"台湾是中国不可分割的一部分这一基本立场"。</li>
				<li>若注册用户依靠本网站进行违反法律法规的行为，本站会予以冻结账号，并且删除其有害言论。本站不承担任何法律责任。</li>

				
			</ul>
			<div id='browser'>
			<h3 >关于浏览器</h3>
			<p>网站并不支持IE以下版本的浏览器，并且永远不会支持IE6，IE7,它们是过期,危险的产品。现在有许多先进的浏览器，你使用它们将会有更好的上网体验，而且会更加安全，不易受到网络攻击。如果你是在网吧或者是使用公司的电脑,用着过时的IE6,7。那么是时候通知你的网管:是时候给浏览器升级换代了。
			<img src="{#img#}browser.jpg" alt="this is browser picture" />			
			<h3>在这里我们给出最新的浏览器的下载地址，你可以根据你的喜好进行下载</h3>
			<ul>
			<li><a href="http://firefox.com.cn/"  target="_blank">Firefox</a></li>
			<li><a href="http://www.google.cn/chrome/intl/zh-CN/landing_chrome.html?hl=zh-CN" target="_blank">Chrome</a></li>
			<li><a href="http://www.apple.com.cn/safari/"  target="_blank">Safari</a></li>
			<li><a href="http://windows.microsoft.com/zh-CN/internet-explorer/products/ie/home" target="_blank">IE</a></li>
			<li><a href="http://www.opera.com/download/" target="_blank">Opera</a></li>
			</ul>
			</div>

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
