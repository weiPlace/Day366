<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>{$userName|default:'days366'}</title>
<link rel="icon" type="image/ico" href="http://www.days366.com/favicon.ico">
{config_load file="smarty.config.ini" section="path" scope="global" }
<link rel="stylesheet" href="{#css#}bootstrap.min.css"/>
<link rel="stylesheet" href="{#css#}style.css" />
<link rel="stylesheet" href="{#css#}wall.css" />
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
<script type="text/javascript" src="{#js#}jquery.masonry.min.js"></script>
<script type="text/javascript" src="{#js#}jquery.imagesloaded.min.js"></script>
</head>
<body>
{include file="login/day.tpl"}
<div class="container" >
	<div class="row" >
		<div class="span10 offset1">
			{include file="twitter/nav.tpl"}		
		</div>

	</div>
</div>
<div class="container-fluid">
	<div class="row-fluid">
		<div id="#displayWall" class="span12">
		<hr id="specialHr"/>
				<div class="pagination pagination-centered">
					<ul >
						<li><a href="http://www.days366.com/twitter/findday?month={$preLastMonth}&day={$preYesterday}">&larr; Two days ago</a></li>
						<li><a href="http://www.days366.com/twitter/findday?month={$lastMonth}&day={$yesterday}">&larr; Yesterday</a></li>
						<li><a href="http://www.days366.com/twitter/findday?month={$month}&day={$day}">Today</a></li>
					</ul>
				</div>		
		<div class="result">

		{foreach from=$allTwitterResult item=item}
		<div class="item thumbnail">
		{if $item.twitter_image neq 'none'} 
		<a href="{#public#}response/index?type=twitter&id={$item.twitter_id}" >
			<img src="{#favourite#}{$item.twitter_image}" class="thumbnail" alt="this is a picture" />
		</a>
		{/if}
			<div class="resultImgData">
		   			<a href="{#public#}friend/findfriendmainpage?id={$item.twitter_user_id}">
		   				<img src="{#imgsmall#}{$item.action_user_image}" alt="这是用户的头像" >
		   			</a>
			</div>
			<div class="resultTextData" data="{$item.twitter_id}">
		   		<div class="textData">
					   <h6><span><a href="{#public#}friend/findfriendmainpage?id={$item.twitter_user_id}">{$item.action_user_name}</a></span>&nbsp;	
					   		{if $item.twitter_type eq 2}
						   	Publish
						   	{else}
						   	Collect
						   	{/if}
						   	于{$item.twitter_time}</h6>
						   <hr />
					<h4>{$item.twitter_title}</h4>
		   			<p>{$item.twitter_content}
		   			{if $item.twitter_url neq 'http://' && $item.twitter_url}
		   			<p>来源URL:<a href="{$item.twitter_url}">{$item.twitter_url}</a>
		   			{/if}
		   			<div class="buttons">
						<span class="dayLike"><button class="btn btn-mini" title="Like"><i class="icon-heart"></i>&nbsp;<span>{$item.twitter_like}</span></button></span>
						<span class="dayFavourite"><button  class="btn btn-mini" title="Collect"><i class="icon-plus-sign"></i>&nbsp;<span>{$item.twitter_favourite}</span></button></span>
						<span class="dayComment"><a href="{#public#}response/index?id={$item.twitter_id}" title="Comment" class="btn btn-mini"><i class="icon-comment"></i>&nbsp;<span>{$item.twitter_comment}</span></a></span>
		 				
		   				
		   			</div>
		
		   		</div>		   	
			</div>
		
		</div>
		{/foreach} 

		</div>
		{if $pageNumber neq 1 AND $pageNumber neq 0}
		<div class="pagination pagination-centered">
 			{$pageNumber|my_forother:$type:$pageMonth:$pageDay|default:''}
		</div>
		{/if}
		</div>
	</div>
</div>
<div class="container">
	<div class="row">
		{include file="footer.tpl"}
	</div>
</div>
<div id="month" class="hidden">{$month}</div>
<div id="day" class="hidden">{$day}</div>
<div id="pageDay" class="hidden">{$pageDay}</div>
<div id="pageMonth" class="hidden">{$pageMonth}</div>


<script type="text/javascript" src="{#js#}allAjax.js"></script>
<script type="text/javascript" src="{#js#}microBlogAction.js"></script>
<script type="text/javascript" src="{#js#}days366.js"></script>
</body>
</html>