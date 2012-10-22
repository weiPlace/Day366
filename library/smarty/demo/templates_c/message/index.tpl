<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="Keywords" content="day,birthday,days366,大学,同学,朋友,交友,每一天" />
<meta name="Description" content="remember every day!,记住每一天" />
<title>{$userName|default:'days366'}</title>
<link rel="icon" type="image/ico" href="http://www.days366.com/logo.ico">
{config_load file="smarty.config.ini" section="path" scope="global" }
<link rel="stylesheet" href="{#css#}bootstrap.min.css"/>
<link rel="stylesheet" href="{#css#}style.css" />
<link rel="stylesheet" href="{#css#}styleLogin.css" />
<link rel="stylesheet" href="{#css#}twitter.css" />
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
		{include file="login/colNav.tpl"}
	<div class="span9">

			<div id="result" class="span8">
			{if $resultNumber eq 0}
			
				<div class="thumbnail"><div class="blue"></div><h3>无追随消息</h3></div>
			{else}
				{foreach from=$result item=item}	
					<div class="thumbnail result" >
						<div class="blue"></div>
					{if $item.type eq 2}
						<div><a href="http://www.days366.com/message/find?type=twitter&id={$item.item_id}" target="_blank">你的生活点滴有一条追随消息</a></div>
					{elseif $item.type eq 3}
						<div><a href="http://www.days366.com/message/find?type=favourite&id={$item.item_id}"  target="_blank">你的用户收藏上有一条追随消息</a></div>
					{else}
						<div ><a href="http://www.days366.com/message/find?type=dayword&id={$item.item_id}"  target="_blank" >你的每日心情有一条追随消息</a></div>
					{/if}
					</div>
				{/foreach}
			{/if}
			</div>
		</div>
	</div>
</div>

</div>
<div id="footer">
{include file="footer.tpl"}
</div>

</body>
</html>