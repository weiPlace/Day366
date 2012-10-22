{include file="header.tpl"}
<link rel="stylesheet" href="{#css#}twitter.css" />
<script  type="text/javascript" src="{#js#}jquery.validate.min.js"></script>
<script type="text/javascript" src="{#js#}ajaxfileupload.js"></script>
</head>
<body>
	<div class="container">
		{include file="login/day.tpl"}
		<div class="row">
			{include file="login/colNav.tpl"}

		<div class="span9">
			<div id="rowNav" >
				<ul class="nav nav-tabs">
					<li class="active" id="userTwi"><a href="#"  >点滴</a></li>
					<li id="userFav"><a href="{#public#}favourite/index" target="_blank">用户收藏</a></li>
					<li id="userDel"><a href="{#public#}dayword/index"  target="_blank">每日心情</a></li>
				</ul>
			</div>

{include file="twitter/add.tpl"}

<hr />
<div id="result" class=" thumbnails">
{if $allTwitterResult|my_count}
{foreach from=$allTwitterResult item=item}
<div class="result thumbnail">
	<div class="blue"></div>
	{if $item.twitter_image}
		<div class="displayImage"><img class="thumbnail" src="{#public#}userImg/favourite/{$item.twitter_image}" alt="this is a picture" /></div>
	{/if}
	<div class="resultImgData">
   			<a href="{#public#}friend/findfriendmainpage?id={$item.twitter_user_id}">
   				<img src="{#imgsmall#}{$item.action_user_image}" alt="这是用户的头像" >
   			</a>
	</div>
	<div class="resultTextData" data="{$item.twitter_id}">
   		<div class="textData">
   			<h6><span><a href="{#public#}friend/findfriendmainpage?id={$item.twitter_user_id}">{$item.action_user_name}</a></span>&nbsp;&nbsp;发表于{$item.twitter_time}</h6>
   			<p>{$item.twitter_content}
   			<div class="buttons">
				<span class="dayLike"><button class="btn btn-mini " ><i class="icon-thumbs-up"></i>喜欢(<span>{$item.twitter_like}</span>)</button></span>
				<span class="dayFavourite"><button class="btn btn-mini" ><i class="icon-share "></i>收藏(<span>{$item.twitter_favourite}</span>)</button></span>
				<span class="dayComment"><button class="btn btn-mini " ><i class="icon-comment"></i>评论(<span>{$item.twitter_comment}</span>)</button></span>
   			</div>
   		</div>
   	<div class="hiddenComment"></div>	
	</div>



</div>

{/foreach}

{else}
<h3 class="noRecord">你没有记录,赶快写点什么！</h3>
{/if}
</div>
{if $recordNumber eq 15}
<div id="moreRecord">
<button class="span8 btn" value='15'>查看更多</button>
<img src="{#img#}loading.jpg" class="hidden" id="loading"  alt="loading" />
</div>
{/if}		
<div id="navPage" >
	<ul class="pager">
		<li><a href="http://www.days366.com/twitter/findday?day={$day-2}">{$month}月{$day-2}日</a></li>
		<li><a href="http://www.days366.com/twitter/findday?day={$day-1}">{$month}月{$day-1}日</a></li>
		<li><a href="http://www.days366.com/twitter/findday?day={$day}">{$month}月{$day}日</a></li>
	</ul>
</div>
		</div> 
		</div>

	</div>	
		<div id="footer">
		{include file="footer.tpl"}		
		</div>
		<div id="month" class="hidden">{$month}</div>
		<div id="day" class="hidden">{$day}</div>
<script type="text/javascript" src="{#js#}allAjax.js"></script>
{literal}
<script type="text/javascript" >

$(function(){
	var userImg=$('#userImage').text();
	var userName=$('#userName').text();
	var d=new Date();
	$('.formComment').live('submit',function()
	{
		var textContent=$(this).children('textarea').val();
		var length=textContent.length;
		if (length>130)
			{
				$('.formComment').append('<label class="error">输入不能超过130字节</label>');
				return false;
			}else if (length=0)
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
					data:{content:textContent,id:itemId},
					url:'http://www.days366.com/twitter/comment',
					success:function(data)
					{
						var result=data;
						if (result.result.state=='fail')
						{
										Error();
										return 1;
						}
						var imgData=$('<div class="commentImgData">').append('<a href="#" >'+'<img src="http://www.days366.com/userImg/userimg/small/'+userImg+'" alt="这是用户的头像" />'+'</a>');
						var textData=$('<div class="commentTextData">').append('<span><a href="#" >'+userName+'</a></span>&nbsp;&nbsp;<h6>评论于'+d.toLocaleTimeString()+'</h6>')
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
	$('.dayComment button').live('click',function()
			{
				var item=$(this).parent().parent().parent().parent();
				var id=item.attr('data');
				getComment(id,item);
				var formComment=$('<form>').append('<textarea name="textareaComment" class="textareaComment" id="textareaComment"/><button class="btn btn-mini">提交</button>');
				formComment.attr('class','formComment');
				formComment.attr('onSubmit','return false');
				$(this).parent().parent().parent().append(formComment);
				$(this).attr('disabled','disabled');
		});

	$('#formTwitterAdd').live('submit',function()
			{
				var item=$(this).parent();
				var textContent=$('#formTwitterAdd textarea').val();
				$.ajax(
						{
							type:'POST',
							dataType:'json',
							data:{content:$('#formTwitterAdd textarea').val()},
							url:'http://www.days366.com/twitter/save',
							success:function(data)
							{
								var result=data;
								if (result.result.state=='fail')
								{
												Error();
												return 1;
								}
								twitterId=result.result.id;
								if ($('h3').hasClass('noRecord'))
									{
											$('h3.noRecord').css('display','none');
									}

								var userImage=$('#userImage').text();
								var userName=$('.textInfo a').text();
								var imgData=$('<div class="resultImgData">').append('<a href="#" >'+'<img src="http://www.days366.com/userImg/userimg/small/'+userImage+'" alt="这是用户的头像" />'+'</a>');
								var h6=$('<h6>').append('<span><a href="#">'+userName+'</a></span>&nbsp;&nbsp;发表于'+d.toLocaleTimeString());
								var buttons=$('<div class="buttons">').append('<span class="dayLike"><button class="btn btn-mini " ><i class="icon-thumbs-up"></i>喜欢(<span>0</span>)</button></span>&nbsp;<span class="dayFavourite"><button class="btn btn-mini" ><i class="icon-share"></i>收藏(<span>0</span>)</button></span>&nbsp;<span class="dayComment"><button class="btn btn-mini " ><i class="icon-comment"></i>评论(<span>0</span>)</button></span>');
								var textData=$('<div class="textData">').append(h6)
																										.append('<p>'+textContent)
																										.append(buttons);
								var 	resultTextData=$('<div class="resultTextData" data='+twitterId+'>').append(textData)
																																								.append('<div class="hiddenComment"></div>');
								var selftwitter=$('<div class="result thumbnail">').append('<div class="blue"></div>')
																														.append(imgData)
																														.append(resultTextData);
								$('#result').prepend(selftwitter);
								},

								error:function()
								{
									Error();
								}
						});

			});
	$('#formImage').live('submit',function()
			{
				$(this).hide();
	
		        $("#loading")
		        .ajaxStart(function(){
		            $(this).show();
		        })
		        .ajaxComplete(function(){
		            $(this).hide();
		        });
				$.ajaxFileUpload(
						{
							url:'http://www.days366.com/twitter/imagesave',
							timeout:30,
							secureuri:false,
							fileElementId:'file',
							dataType:'json',
							success:function(data,status){
										var result=data;
										if (result.result.state=='fail')
										{
												$('#formImage').show();
												$('#formImage').append('<label class="error">'+result.result.message+'"</label>"');
												return 1;
										}
										$('#formAllAdd input:hidden').val(result.result.id);
										$('.tab-pane label').removeClass('hidden');
								},

								error:function(data,status,e)
								{
									alert(e);
								}
						});
					return false;
			});
	$('#formTwitterAdd').validate(
			{
				rules:{textareaContent:{required:true,maxlength:140}},
				messages:{textareaContent:{required:"输入不能为空",maxlength:"字符数不应超过140字符"}}

			});

	$('#formAllAdd').validate(
			{
				rules:{
					imageContent:
						{required:true,maxlength:140},
					file:{required:true}
						},
				messages:
					{
					imageContent:
						{required:"输入不能为空",maxlength:"字符数不应超过140字符"},
						file:{required:"你还未添加图片"}
					}
			});	
	$('#formAllAdd').live('submit',function()
			{
				var item=$(this).parent();
				var textContent=$('#imageContent').val();
				var imgId=$('#imgHidden').val();
				
				if (!!imgId==""){$(this).append('<p><label class="error" >请先上传图片</label>');return false;}
				$.ajax(
						{
							type:'POST',
							dataType:'json',
							data:{content:textContent,id:imgId},
							url:'http://www.days366.com/twitter/save',
							success:function(data)
							{
								var result=data;
								if (result.result.state=='fail')
								{
												Error();
												return 1;
								}
								twitterId=result.result.id;
								if ($('h3').hasClass('noRecord'))
									{
											$('h3.noRecord').css('display','none');
									}

								$('#formImage').show();
								$('#formImage file').val();
								var userName=$('.textInfo a').text();
								var uploadImg=$('<div class="displayImage">').append('<img class="thumbnail" src="http://www.days366.com/userImg/favourite/'+imgId+'" alt="this is a picture" />');
								var imgData=$('<div class="resultImgData">').append('<a href="#" >'+'<img  src="http://www.days366.com/userImg/userimg/small/'+userImg+'" alt="这是用户的头像" />'+'</a>');
								var h6=$('<h6>').append('<span><a href="#">'+userName+'</a></span>&nbsp;&nbsp;发表于'+d.toLocaleTimeString());
								var buttons=$('<div class="buttons">').append('<span class="dayLike"><button class="btn btn-mini "  ><i class="icon-thumbs-up"></i>喜欢(<span>0</span>)</button></span>&nbsp;<span class="dayFavourite"><button class="btn btn-mini" ><i class="icon-share"></i>收藏(<span>0</span>)</button></span>&nbsp;<span class="dayComment"><button class="btn btn-mini " ><i class="icon-comment"></i>评论(<span>0</span>)</button></span>');
								var textData=$('<div class="textData">').append(h6)
																										.append('<p>'+textContent)
																										.append(buttons);
								var 	resultTextData=$('<div class="resultTextData" data='+twitterId+'>').append(textData);
								var selftwitter=$('<div class="result thumbnail">').append('<div class="blue"></div>')
																														.append(uploadImg)
																														.append(imgData)
																														.append(resultTextData);
								$('#result').prepend(selftwitter);
								},

								error:function()
								{
									Error();
								}
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
		url:'http://www.days366.com/twitter/favourite?id='+itemId,
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
		$('#moreRecord button').live('click',function()
				{

					var recordNumber=$(this).val();
					var month=$('#month').text();
					var day=$('#day').text();
			        $("#moreRecord #loading")
			        .ajaxStart(function(){
			            $(this).show();
			        })
			        .ajaxComplete(function(){
			            $(this).hide();
			        });
					$.ajax(
							{
								dataType:'json',
								data:{number:recordNumber,month:month,day:day},
								url:'http://www.days366.com/twitter/more',
								success:function(data)
								{
									var result=data;
									if (result.result.state=='fail')
									{
													Error();
													return 1;
									}
									if (result.number==recordNumber)
									{
											$('#moreRecord  button').text('没有更多内容了');

									}
									for (var i=0;i<result.result.length;i++)
									{
										

											var imgData=$('<div class="resultImgData">').append('<a href="http://www.days366.com/friend/friendmainpage?id='+result.result[i].userId+'"'+' >'+'<img src="http://www.days366.com/userImg/userimg/small/'+result.result[i].userImg+'" alt="这是用户的头像" />'+'</a>');
								
											var h6=$('<h6>').append('<span><a href="http://www.days366.com/friend/friendmainpage?id='+result.result[i].userId+'">'+result.result[i].userName+'</a></span>&nbsp;&nbsp;发表于'+result.result[i].twitterTime);
											var buttons=$('<div class="buttons">').append('<span class="dayLike"><button class="btn btn-mini " ><i class="icon-thumbs-up"></i>喜欢(<span>'+result.result[i].twitterLike+'</span>)</button></span>&nbsp;<span class="dayFavourite"><button class="btn btn-mini" ><i class="icon-share"></i>收藏(<span>'+result.result[i].twitterFavourite+'</span>)</button></span>&nbsp;<span class="dayComment"><button class="btn btn-mini "  ><i class="icon-comment"></i>评论(<span>'+result.result[i].twitterComment+'</span>)</button></span>');
											var textData=$('<div class="textData">').append(h6)
																													.append('<p>'+result.result[i].twitterContent)
																													.append(buttons);
											var 	resultTextData=$('<div class="resultTextData" data="'+result.result[i].twitterId+'" >').append(textData)
																																															.append('<div class="hiddenComment"></div>');



											var selftwitter=$('<div class="result thumbnail">').append('<div class="blue"></div>');

											if (result.result[i].twitterImg!="")
											{
											var twitterImg=$('<div class="displayImage">').append('<img class="thumbnail" src="http://www.days366.com/userImg/favourite/'+result.result[i].twitterImg+'" alt="this is a picture" />');
											selftwitter.append(twitterImg);
											}
											selftwitter.append(imgData)
																.append(resultTextData);										
											$('#result').append(selftwitter);
											$('#moreRecord button').val(result.number);
										}
								},
								error:function(){}
							}

							);
			});
});
function getComment(id,item)
{
	$.ajax(
			{
				dataType:'json',
				url:'http://www.days366.com/twitter/getcomment?id='+id,
				success:function(data)
					{
						var result=data;
						for (var i=0;i<result.result.length;i++)
						{

						var imgData=$('<div class="commentImgData">').append('<a href="http://www.days366.com/friend/friendmainpage?id='+result.result[i].userId+'"'+' >'+'<img src="http://www.days366.com/userImg/userimg/small/'+result.result[i].userImg+'" alt="这是用户的头像" />'+'</a>');
						var textData=$('<div class="commentTextData">').append('<span><a href="http://www.days366.com/friend/friendmainpage?id='+result.result[i].userId+'"'+' >'+result.result[i].userName+'</a></span>&nbsp;&nbsp;<h6>评论于'+result.result[i].userTime+'</h6>')
																					.append('<p>'+result.result[i].userContent+'</p>');

						var twitterComment=$('<div class="twitterComment">').append(imgData)
															.append(textData);
						var hiddenComment=item.children('.hiddenComment');
						hiddenComment.append('<hr />')
								.append(twitterComment);
						}

					},
				beforeSend:function()
				{
					addLoading(item);
				},
				error:function()
				{
					Remove();
					Error();
				}

			});

	
}
</script>
{/literal}
</body>
</html>