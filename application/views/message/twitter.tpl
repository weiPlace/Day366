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
					   			<a href="{#public#}friend/findfriendmainpage?id={$content.twitter_user_id}">
					   				<img src="{#imgfinish#}{$userImg}" alt="This is an image" style="width:80px;height:80px;">
					   			</a>
						</div>
						<div class="span7 thumbnail" data="{$content.twitter_id}">
					   		<div class="textData">
						   		<h4>
						   			<span><a href="{#public#}friend/findfriendmainpage?id={$item.twitter_user_id}">{$userName}</a></span>
						   			{if $content.twitter_type eq 2}
						   			Publish
						   			{else}
						   			Collect
						   			{/if}
						   			at {$content.twitter_time}
						   		</h4>
						   		<hr />
						{if $content.twitter_image}
							<div class="displayImage"><img class="thumbnail" src="{#public#}userImg/favourite/{$content.twitter_image}" alt="this is a picture" /></div>
						{/if}
					<h4>{$content.twitter_title}</h4>
		   			<p>{$content.twitter_content}
		   			{if $content.twitter_url neq 'http://' && $content.twitter_url}
		   			<p>Source URL:<a href="{$item.twitter_url}">{$content.twitter_url}</a>
		   			{/if}
					   			<div class="buttons">
									<span class="dayLike"><button class="btn btn-mini "  ><i class="icon-heart"></i>&nbsp;(<span>{$content.twitter_like}</span>)</button></span>
									<span class="dayFavourite"><button class="btn btn-mini "  ><i class="icon-plus-sign"></i>&nbsp;(<span>{$content.twitter_favourite}</span>)</button></span>
									<span class="dayComment"><button class="btn btn-mini" ><i class="icon-comment"></i>&nbsp;(<span>{$content.twitter_comment}</span>)</button></span>
					   			</div>
					
					   		</div>

					   	<div class="hiddenComment">
					   	{if $number neq 0}
					   	{foreach from=$comment item=item}
					   	<hr />
					   	<div class="twiiterComment">
					   	<div class="commentImgData pull-left">
					   		<a href="http://www.days366.com/friend/findfriendmainpage?id={$item.tc_user_id}">
								<img alt="This is user image" src="http://www.days366.com/userImg/userimg/small/{$item.action_user_img}">
							</a>
					   	</div>
						<div class="commentTextData" data="{$item.tc_user_id}">
						<h6><a href="http://www.days366.com/friend/findfriendmainpage?id={$item.tc_user_id}">{$item.action_user_name}</a>&nbsp;Comment in {$item.tc_time}</h6>
						<p>{$item.tc_comment}</p>
						<span class="repeat"><button class="btn btn-mini">Response</button></span>
						</div>
					   	</div>
						{/foreach}
					   	{/if}
						   	</div>	
						</div>
					</div>
				</div>
			</div>

	</div>		{include file="footer.tpl"}
</div>
<script type="text/javascript" src="{#js#}allAjax.js"></script>
{literal}
<script type="text/javascript">
$(function()
		{
	var userName=$('title').text();
	var d=new Date();
	$('.repeat button').click(function()
			{
				visitorName=$(this).parent().parent().children('h6').children('a').text();
				var formComment=$('<form>').append('<textarea name="textareaComment" class="textareaComment" id="textareaComment"/><button class="btn btn-mini">Submit</button>');
				formComment.attr('class','formComment');
				formComment.attr('onSubmit','return false');
				$(this).parent().parent().append(formComment);
				$(this).attr('disabled','disabled');

		});
	$('.formComment').live('submit',function()
			{
				var content=$(this).children('textarea').val();
				var textContent='Response'+visitorName+':'+$(this).children('textarea').val();
				visitorName='';
			
				if (strlen(textContent)>240)
				{
					$('.formComment').append('<label class="error">Input characters\' size should not be over 240</label>');
					return false;
				}else if (strlen(content)== 0)
					{
						$('.formComment').append('<label class="error">Input can not be empty</label>');
						return false;
					}
		
				var itemId=$('.span7').attr('data');
				var userID=$(this).parent().attr('data');
				$.ajax(
						{
							type:'POST',
							dataType:'json',
							async:false,
							data:{content:textContent,id:itemId,userId:userID,type:2,attr:2},
							url:'http://www.days366.com/twitter/comment',
							success:function(data)
							{
								var result=data;
								if (result.result.state=='fail')
								{
												Error();
												return 1;
								}
								userImg=getCookie('userImg');
								var imgData=$('<div class="commentImgData pull-left">').append('<a href="#" >'+'<img src="http://www.days366.com/userImg/userimg/small/'+userImg+'" alt="This is user image" />'+'</a>');
								var textData=$('<div class="commentTextData">').append('<h6><a href="#" >'+userName+'</a>&nbsp;Comment at'+d.toLocaleTimeString()+'</h6>')
																							.append('<p>'+textContent+'</p>');

								var twitterComment=$('<div class="twitterComment">').append(imgData)
																	.append(textData);
								var hiddenComment=$('.hiddenComment');
								hiddenComment.prepend(twitterComment)
										.prepend('<hr />');
								var comment=$('.dayComment').children('button').children('span');
								comment.text(parseInt(comment.text())+1);		
							},
							error:function()
							{
								Remove();
								Error();
							},
							complete:function(){$('.formComment').empty();}
						});


			});


	});
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
</script>
{/literal}
<script type="text/javascript" src="{#js#}days366.js"></script>
</body>
</html>