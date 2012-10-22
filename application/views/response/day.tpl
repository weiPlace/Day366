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
			<div class="span9">
				<div class="result">
					<div class="displayItem row">
						<div class="span302">
					   			<a href="{#public#}friend/findfriendmainpage?id={$content.days_user_id}">
					   				<img src="{#imgfinish#}{$content.action_user_img}" alt="这是用户的头像" style="width:80px;height:80px;">
					   			</a>
						</div>
						<div class="span7 thumbnail" data="{$content.days_id}">
					   		<div class="textData">
						   		<h4>
						   			<span><a href="{#public#}friend/findfriendmainpage?id={$content.days_user_id}">{$content.action_user_name}</a></span>发表于{$content.days_time}
						   		</h4>
						   		<hr />

					   	{if $content.days_image && $content.days_image neq 'none' }
							<div class="displayImage"><img class="thumbnail" src="{#public#}userImg/favourite/{$content.days_image}" alt="this is a picture" /></div>
						{/if}
						<h4>{$content.days_title}</h4>
			   			<p>{$content.days_content}
			   			{if $content.days_url neq 'http://'}
			   			<p>来源URL:<a href="{$item.days_url}" target="_blank">{$content.days_url}</a>
			   			{/if}
					   			<div class="buttons">
									<span class="dayLike"><button class="btn btn-mini "  ><i class="icon-heart"></i>(<span>{$content.days_like}</span>)</button></span>
									<span class="dayFavourite"><button class="btn btn-mini "  ><i class="icon-plus-sign"></i>(<span>{$content.days_favourite}</span>)</button></span>
									<span class="dayComment"><button class="btn btn-mini" ><i class="icon-comment"></i>(<span>{$content.days_comment}</span>)</button></span>
					   			</div>
					   			<form class="formComment" onSubmit="return false;" >
					   				<textarea name="textareaComment" class="textareaComment" id="textareaComment"></textarea>
					   				<button class="btn btn-mini">评论</button>
					   			</form>
					
					   		</div>

					   	<div class="hiddenComment">
					   	{if $number neq 0}
					   	{foreach from=$comment item=item}
					   	<hr />
					   	<div class="twiiterComment">
					   	<div class="commentImgData pull-left">
					   		<a href="http://www.days366.com/friend/findfriendmainpage?id={$item.days_user_id}">
								<img alt="这是用户的头像" src="http://www.days366.com/userImg/userimg/small/{$item.action_user_img}">
							</a>
					   	</div>
						<div class="commentTextData">
						<h6><a href="http://www.days366.com/friend/findfriendmainpage?id={$item.days_user_id}">{$item.action_user_name}</a>&nbsp;评论于{$item.days_time}</h6>
						<p>{$item.days_comment}</p>
						</div>
					   	</div>
						{/foreach}
					   	{/if}
						   	</div>	
						</div>
					</div>
				</div>
			</div>
		
	</div>{include file="footer.tpl"}
</div>
<script type="text/javascript" src="{#js#}allAjax.js"></script>
{literal}
<script type="text/javascript" >

$(function(){
	var userName=$('#userName').text();
	var d=new Date();
	$('.formComment').live('submit',function()
	{
		var textContent=$(this).children('textarea').val();
		if (strlen(textContent)>240)
			{
				$('.formComment').append('<label class="error">输入不能超过240字节</label>');
				return false;
			}else if (strlen(textContent)== 0)
				{
					$('.formComment').append('<label class="error">输入不能为空</label>');
					return false;
				}
		var item=$(this).parent().parent();
		var itemId=item.attr('data');

		$.ajax(
				{
					type:'POST',
					dataType:'json',
					async:false,
					data:{content:textContent,id:itemId},
					url:'http://www.days366.com/days/comment',
					success:function(data)
					{
						var result=data;
						if (result.result.state=='fail')
						{
										Error();
										return 1;
						}
						var userImg=getCookie('userImg');
						var imgData=$('<div class="commentImgData pull-left">').append('<a href="#" >'+'<img src="http://www.days366.com/userImg/userimg/small/'+userImg+'" alt="这是用户的头像" />'+'</a>');
						var textData=$('<div class="commentTextData">').append('<h6><a href="#" >'+userName+'</a>&nbsp;评论于'+d.toLocaleTimeString()+'</h6>')
																					.append('<p>'+textContent+'</p>');

						var twitterComment=$('<div class="twitterComment">').append(imgData)
															.append(textData);
						var hiddenComment=item.children('.hiddenComment');
						hiddenComment.prepend(twitterComment)
								.prepend('<hr />');
						var comment=item.children('div').children('div').children('.dayComment').children('button').children('span');
						comment.text(parseInt(comment.text())+1);						
					},

					error:function()
					{

						Error();
					},
					complete:function(){$('.formComment').empty();}
				});
	});
$('.dayLike button').live('click',function()
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
		async:false,
		url:'http://www.days366.com/days/like?id='+itemId,
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
	$('.dayFavourite button').live('click',function()
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
		url:'http://www.days366.com/days/favourite?id='+itemId,
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

});
function getCookie(value){
	var cookie=document.cookie;
	var first=cookie.indexOf(value+'=');
	if (first >= 0){
			var str=cookie.substring(first,cookie.length);
			var last=str.indexOf(';');
			if (last<0){
					last=str.length;
				}
			str=str.substring(0,last).split('=');
			return str[1];
		}else
		{
			return null;
		}
}
function strlen(str){  
    var len = 0;  
    for (var i=0; i<str.length; i++) {   
     var c = str.charCodeAt(i);    
     if ((c >= 0x0001 && c <= 0x007e) || (0xff60<=c && c<=0xff9f)) {   
       len++;   
     }   
     else {   
      len+=2;   
     }   
    }   
    return len;  
} 
</script>
{/literal}
<script type="text/javascript" src="{#js#}days366.js"></script>
</body>
</html>