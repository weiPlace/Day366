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
				{include file="wall/nav.tpl"}
			</div>
		</div>
	</div>
</div>
<div class="container-fluid">
	<div class="row-fluid">
			<div class="span12" id="displayWall">
				<hr />
				<h4 class="success">Your Personal {$month}月{$day}日 Wall</h4>
				<div class="result">
					{if $days366Result|my_count}
					{foreach from=$days366Result item=item}
					<div class="item thumbnail" id="itemDays366">
					{if $item.twitter_image && $item.twitter_image neq 'none'}
					<a href="{#public#}response/index?type=twitter&id={$item.twitter_id}"  target="_blank">
						<img src="{#wall#}{$item.twitter_image}"  class="thumbnail"  alt="this is a picture" />
					</a>
					{/if}
						<div class="resultImgData">
					   			<a href="{#public#}friend/findfriendmainpage?id=96">
					   				<img src="{#imgsmall#}days366.png" alt="这是用户的头像" >
					   			</a>
						</div>
						<div class="resultTextData" data="{$item.twitter_id}">
					   		<div class="textData">
					   			<h6><span><a href="{#public#}friend/findfriendmainpage?id=96">Days366's </a>&nbsp;Collect </span></h6>
					   			<hr />
					<h4>{$item.twitter_title}</h4>
		   			<p>{$item.twitter_content}
		   			{if $item.twitter_url neq 'http://' && $item.twitter_url}
		   			<p>Source URL:<a href="{$item.twitter_url}">{$item.twitter_url}</a>
		   			{/if}
					
							</div>		   	
					   	</div>
					</div>
					{/foreach}
					{/if} 
					{if $twitterResult|my_count}
					{foreach from=$twitterResult item=item}
					<div class="item thumbnail" id="items">
					<a class="close" title="删除" href="#delete" data-toggle="modal">&times;</a>
					{if $item.twitter_image && $item.twitter_image neq 'none'}
					<a href="{#public#}message/find?type=twitter&id={$item.twitter_id}" >
						<img src="{#wall#}{$item.twitter_image}"  class="thumbnail  ownWallImg"  alt="this is a picture" />
					</a>
					{/if}
						<div class="resultImgData">
					   			<a href="{#public#}friend/findfriendmainpage?id={$item.twitter_user_id}">
					   				<img src="{#imgsmall#}{$userImg}" alt="这是用户的头像" >
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
						   			in {$item.twitter_time}</h6>
						   		<hr />
					<h4>{$item.twitter_title}</h4>
		   			<p>{$item.twitter_content}
		   			{if $item.twitter_url neq 'http://' && $item.twitter_url}
		   			<p>Source URL:<a href="{$item.twitter_url}">{$item.twitter_url}</a>
		   			{/if}
					   			<div class="buttons">
									<span class="dayLike"><button disabled class="btn btn-mini" title="Like"><i class="icon-heart"></i>{$item.twitter_like}</button></span>
									<span class="dayFavourite"><button disabled class="btn btn-mini" title="Collect"><i class="icon-plus-sign"></i>{$item.twitter_favourite}</button></span>
									<span class="dayComment"><a class="btn btn-mini"  href="{#public#}message/find?type=twitter&id={$item.twitter_id}" title="Comment" ><i class="icon-comment"></i>{$item.twitter_comment}</a></span>
							</div>
							</div>		   	
						</div>
					</div>
					{/foreach} 
					{/if}
				</div>
			</div>
	</div>
</div>
<div class="container">
	<div class="row">
		{include file="footer.tpl"}
	</div>
</div>

<div class="modal fade" id='delete' >
		<div class="modal-header">
			<a class="close" data-dismiss="modal">×</a>
			<h4>Delete</h4>
		</div>
		<div class="modal-body">
				<p>你确定要删除?一经删除后，数据将不可恢复,所有的评论,喜欢,收藏的数据都将消失!
		</div>
		<div class="modal-footer">
			<button class="btn" id="close">Cancel </button>
			<button class="btn" id="buttonDelete">Sure</button>
		</div>
</div>
<div class="modal fade" id='deleteSuccess' >
		<div class="modal-header">
			<a class="close" data-dismiss="modal">×</a>
			<h4>Delete successfully</h4>
		</div>
		<div class="modal-body">
				<p>Delete successuflly!
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">Sure</button>
		</div>
</div>
<div class="hidden" id="userImage">{$userImg}</div>
<div class="hidden"><div id="month">{$month}</div><div id="day">{$day}</div></div>

<script type="text/javascript" src="{#js#}allAjax.js"></script>
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

		$('#close').click(function(){$('#delete').modal('hide');});
	 	var deleteType;
	 	var id;
	 	var month=$('#month').text();
	 	var day=$('#day').text();
		var month=$('#month').text();

		$('#items .close').live('click',function()
				{

					 id=$(this).parent().children('.resultTextData').attr('data');
			});
		$('.modal-footer #buttonDelete').live('click',function()
				{
					$.ajax(
							{
								dataType:'json',
								url:"http://www.days366.com/wall/deletetwitter"+'?id='+id,
								error:function(){Remove();$('#delete').modal('hide');Error();},
								success:function(){Remove();$('#delete').modal('hide');$('#deleteSuccess').modal('show');},
								beforeSend:function(){addLoading($('.modal-footer'));}
							});
					

			});

		});
			
 </script>
 
 {/literal}
 <script type="text/javascript" src="{#js#}days366.js"></script>
</body>
</html>