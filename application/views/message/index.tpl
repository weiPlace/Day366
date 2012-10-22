<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>{$userName|default:'days366'}</title>
<link rel="icon" type="image/ico" href="http://www.days366.com/favicon.ico">
{config_load file="smarty.config.ini" section="path" scope="global" }
<link rel="stylesheet" href="{#css#}bootstrap.min.css"/>
<link rel="stylesheet" href="{#css#}style.css" />
<link rel="stylesheet" href="{#css#}twitter.css" />
<!--[if lt IE 10]>
<link rel="stylesheet" href="{#css#}fixie.css" />
<![endif]-->
<!--[if lt IE 8]>
<script type="text/javascript">
	window.location.href="http://www.days366.com/global/mainifesto#browser"
</script>
<![endif]-->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script type="text/javascript">
 !window.jQuery && document.write("<script type=\"text/javascript\" src=\"http://www.days366.com/js/jquery-1.7.1.min.js\"><\/script>");
</script>
<script type="text/javascript" src="{#js#}bootstrap.min.js"></script>
<script type="text/javascript" src="{#js#}ajaxfileupload.js"></script>
</head>
<body>
{include file="login/day.tpl"}
<div class="container">
	<div class="row">
		
		<div class="row">
			<div class="span9">
				<div id="result" class="span8">
				<h3><span class="badge badge-success">Who followed you</span></h3>
				{if $resultNumber eq 0}
					<div class="thumbnail"><h4>No news</h4></div>
				{else}
					{foreach from=$result item=item}	
						<div class="thumbnail result" >
							<div class="blue"></div>
							<div><a href="http://www.days366.com/message/find?type=twitter&id={$item.item_id}" target="_blank">你的生活点滴有一条追随消息</a></div>
						</div>
					{/foreach}
				{/if}
				</div>
				<div id="result" class="span8">
				<h3><span class="badge badge-info">You once followed</span></h3>
				{if $responseNumber eq 0}
				
					<div class="thumbnail">
					<h4>No response</h4></div>
				{else}
					{foreach from=$responseResult item=item}	
						<div class="thumbnail result" >
							<div class="blue"></div>
				
							<div><a href="http://www.days366.com/response/index?type=twitter&id={$item.item_id}" target="_blank">你追随的生活点滴有一条回复消息</a></div>
	
		
						</div>
					{/foreach}
				{/if}
				</div>
			</div>

		</div>
		{include file="footer.tpl"}
	</div>
</div>
<script type="text/javascript" src="{#js#}days366.js"></script>
</body>
</html>