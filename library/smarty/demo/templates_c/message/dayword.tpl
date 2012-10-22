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
		
		<div id="displayExpression"> </div>
		<div id="result" class="thumbnails span8">
			<div class="result thumbnail">
				<div class="blue"></div>
					{if $content.dayword_image}
				<div class="displayImage displayImageDayword">
					<img class="thumbnail" alt="this is a picture" src="http://www.days366.com/userImg/dayword/{$content.dayword_image}">
				</div>
				{/if}
				<div class="row">
					<div class="span2">
						<h3>今天心情</h3>
						<img alt="expression" src="http://www.days366.com/img/expression/{$content.dayword_state}.png">
					</div>
					<div class="span5">
						<div class="resultImgData">
							<a href="#">
							<img alt="这是用户的头像" src="http://www.days366.com/userImg/userimg/small/{$userImg}">
							</a>
						</div>
						<div class="resultTextData" data="70">
							<div class="textData">
							<h6>
							<span>
							<a href="#">{$userName}</a>
							&nbsp;&nbsp;{$content.dayword_day}
							</span>
							&nbsp;&nbsp;发表于{$content.dayword_time}
							</h6>
							<p>{$content.dayword_content}</p>
							<div class="daywordLabel">
							{if $content.dayword_type eq 'goal'}
								<h5>标签:一天目标</h5>
							{elseif $content.dayword_type eq 'sum'}
								<h5>标签:一天总结</h5>
							{else}
								<h5>标签:一天随感</h5>
							{/if}
							</div>
							<div>
							<span class="dayLike">
							<button class="btn btn-mini " disabled>
							<i class="icon-thumbs-up"></i>
							喜欢(
							<span>{$content.dayword_like}</span>
							)
							</button>
							</span>
							<span class="dayComment">
							<button class="btn btn-mini " disabled>
							<i class="icon-comment" ></i>
							评论(
							<span>{$content.dayword_comment}</span>
							)
							</button>
							</span>
							</div>

							<div class="hiddenComment">
							   	{if $number neq 0}
   								{foreach from=$comment item=item}
									<hr />
									<div class="commentImgData">
									<a href="http://www.days366.com/friend/findfriendmainpage&id={$item.dayword_user_id}">
									<img alt="这是用户的头像" src="http://www.days366.com/userImg/userimg/small/{$item.action_user_img}">
									</a>
									</div>
									<div class="commentTextData">
									<span>
									<a href="#">{$item.action_user_name}</a>
									</span>
									<h6>评论于{$item.dayword_time}</h6>
									<p>{$item.dayword_comment}</p>
									</div>
									{/foreach}
   									{/if}
							</div>
							</div>
						</div>
					</div>
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