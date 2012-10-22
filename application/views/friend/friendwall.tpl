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
<link rel="stylesheet" href="{#css#}wall.css" />
<!--[if lt IE 10]>
<link rel="stylesheet" href="{#css#}fixie.css" />
<![endif]-->
<!--[if lt IE 8]>
<script type="text/javascript">
	window.location.href="http://www.days366.com/global/mainifesto#browser"
</script>
<![endif]-->
<script type="text/javascript">
 !window.jQuery && document.write("<script type=\"text/javascript\" src=\"http://www.days366.com/js/jquery-1.7.1.min.js\"><\/script>");
</script>
<script type="text/javascript" src="{#js#}bootstrap.min.js"></script>
<script type="text/javascript" src="{#js#}jquery.masonry.min.js"></script>
<script type="text/javascript" src="{#js#}jquery.imagesloaded.min.js"></script>
</head>
<body>
{include file="login/day.tpl"}
<div class="container">
	<div class="row">
		
		<div class="row">
			<div class="span12">
				{include file="friend/nav.tpl"}
				
			</div>
		</div>
	</div>
</div>
<div class="container-fluid">
	<div class="row-fluid">
		<div id="#displayWall" class="span12">
		<hr />
		<h4 class="success">&nbsp;&nbsp;<a href="http://www.days366.com/friend/findfriendmainpage?id={$friendId}">{$friendName}</a>的{$month}月{$day}日墙</h4>		
		<div class="result">

		{foreach from=$twitterResult item=item}
		<div class="item thumbnail">
		{if $item.twitter_image && $item.twitter_image neq 'none'} 
		<a href="{#public#}response/index?type=twitter&id={$item.twitter_id}" >
			<img src="{#favourite#}{$item.twitter_image}" class="thumbnail" alt="this is a picture" />
		</a>
		{/if}
			<div class="resultImgData">
		   			<a href="{#public#}friend/findfriendmainpage?id={$friendId}">
		   				<img src="{#imgsmall#}{$friendImg}" alt="这是用户的头像" >
		   			</a>
			</div>
			<div class="resultTextData" data="{$item.twitter_id}">
		   		<div class="textData">
					   <h6><span><a href="{#public#}friend/findfriendmainpage?id={$item.twitter_user_id}">{$userName}</a></span>&nbsp;	
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
		   			<p>Source URL:<a href="{$item.twitter_url}">{$item.twitter_url}</a>
		   			{/if}
		   			<div class="buttons">
						<span class="dayLike"><button class="btn btn-mini" title="Like"><i class="icon-heart"></i><span>{$item.twitter_like}</span></button></span>
						<span class="dayFavourite"><button  class="btn btn-mini" title="Collect"><i class="icon-plus-sign"></i><span>{$item.twitter_favourite}</span></button></span>
						<span class="dayComment"><a class="btn btn-mini" title="Comment" href="{#public#}response/index?id={$item.twitter_id}"><i class="icon-comment"></i><span>{$item.twitter_comment}</span></a></span>
		 
		   				
		   			</div>
				</div>		   	
			</div>
		</div>
		{/foreach} 
		</div>
		</div>
	</div>
</div>
<div class="container">
	<div class="row">
		{include file="footer.tpl"}
	</div>
</div>
<script type="text/javascript" src="{#js#}allAjax.js"></script>
<script type="text/javascript" src="{#js#}days366.js"></script>
 {literal} 

 <script type="text/javascript">
 var container = $('.result');
 $(function()
		 {
		container.imagesLoaded(function(){
			container.masonry({
			itemSelector : '.item'

			  });
			});
		var userImg=$('#userImage').text();
		var userName=$('#userName').text();
		var d=new Date();
		var month=$('#month').text();
	 	var id;
	 	var month=$('#month').text();
	 	var day=$('#day').text();
		var month=$('#month').text();
				$('.result .dayLike button').live('click',function()
						{
					var item=$(this).parent().parent().parent().parent();
					var itemId=item.attr('data');
					var number=$(this).children('span').text();
					
					number=parseInt(number);
					var button=$(this);	
					$.ajax(
							{
					async:false,
					dataType:'json',
					global:true,
					url:'http://www.days366.com/twitter/like?id='+itemId,
					success:function(data)
					{
						var result=data;
						Remove();
						if (result.result.state=='fail')
						{
										Error();
										return 1;
						}
					
						button.children('span').text(number+1);
						button.attr('disabled','disabled');							
						},

					error:function()
					{

						Error();
					}
					});

								});

				$('.result .dayFavourite button').live('click',function()
						{
					var item=$(this).parent().parent().parent().parent();
					var itemId=item.attr('data');
					var number=$(this).children('span').text();
					number=parseInt(number);
					var button=$(this);	
					$.ajax(
							{
					async:false,
					dataType:'json',
					global:false,
					url:'http://www.days366.com/twitter/favourite?id='+itemId,
					success:function(data)
					{
						var result=data;
						button.children('span').text(number+1);
						button.attr('disabled','disabled');							
						}
					});
			});

		 });

 </script>
{/literal}
</body>
</html>