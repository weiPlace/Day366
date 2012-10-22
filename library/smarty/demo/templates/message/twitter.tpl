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
<div class="result thumbnail">
	<div class="blue"></div>
	{if $content.twitter_image}
		<div class="displayImage"><img class="thumbnail" src="{#public#}userImg/favourite/{$content.twitter_image}" alt="this is a picture" /></div>
	{/if}
	<div class="resultImgData">
   			<a href="#">
   				<img src="{#imgsmall#}{$userImg}" alt="这是用户的头像" >
   			</a>
	</div>
	<div class="resultTextData" data="{$content.twitter_id}">
   		<div class="textData">
   			<h6><span><a href="#">{$userName}</a></span>&nbsp;&nbsp;发表于{$content.twitter_time}</h6>
   			<p>{$content.twitter_content}
   			<div class="buttons">
				<span class="dayLike"><button class="btn btn-mini " disabled ><i class="icon-thumbs-up"></i>喜欢(<span>{$content.twitter_like}</span>)</button></span>
				<span class="dayFavourite"><button class="btn btn-mini"  disabled><i class="icon-share "></i>收藏(<span>{$content.twitter_favourite}</span>)</button></span>
				<span class="dayComment"><button class="btn btn-mini " disabled><i class="icon-comment"></i>评论(<span>{$content.twitter_comment}</span>)</button></span>
   			</div> 

   		</div>

   	<div class="hiddenComment">
   	{if $number neq 0}
   	{foreach from=$comment item=item}
   	<hr />
   	<div class="twiiterComment">
   	<div class="commentImgData">
   		<a href="http://www.days366.com/friend/findfriendmainpage?id={$item.tc_user_id}">
			<img alt="这是用户的头像" src="http://www.days366.com/userImg/userimg/small/{$item.action_user_img}">
		</a>
   	</div>
	<div class="commentTextData">
	<span>
	<a href="http://www.days366.com/friend/findfriendmainpage?id={$item.tc_user_id}">{$item.action_user_name}</a>
	</span>
	<h6>评论于{$item.tc_time}</h6>
	<p>{$item.tc_comment}</p>
	</div>
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