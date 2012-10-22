<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="Keywords" content="day,birthday,days366,大学,同学,朋友,交友,每一天" />
<meta name="Description" content="remember every day!,记住每一天" />
<title>{$userName|default:'days366'}</title>
{config_load file="smarty.config.ini" section="path" scope="global" }
<link rel="stylesheet" href="{#css#}bootstrap.min.css" />
<link rel="stylesheet" href="{#css#}style.css" />
<link rel="stylesheet" href="{#css#}styleLogin.css" />
<link rel="stylesheet" href="{#css#}wall.css" />

<!--[if lt IE 10]>
<link rel="stylesheet" href="{#css#}fixie.css" />
<![endif]-->
<script type="text/javascript" src="{#js#}jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="{#js#}bootstrap.min.js"></script>
<script type="text/javascript" src="{#js#}jquery.masonry.min.js"></script>
</head>
<body>
<div class="container">{include file="login/day.tpl"}
<div class="row">
<div class="span12">{include file="friend/nav.tpl"}
<hr />
<h3>他的{$month}月{$day}日墙&nbsp;&nbsp;他的名字:{$friendName}</h3>
<h3>每日心情</h3>
<div id="dayDayword" class="thumbnail span10 offset1">
<div class="blue"></div>

{if $daywordResult}
{if $daywordResult.dayword_image} <img src="{#dayword#}{$daywordResult.dayword_image}" class="thumbnail" alt="this is a picture" />
{/if}
	<div class="row" >
		<div class="span2 offset1">
			<h3>今天心情&nbsp;&nbsp;</h3>
			<img src="{#img#}expression/{$daywordResult.dayword_state}.png" alt="expression" />
		</div>
		<div class="span7">
			<div class="resultImgData">
		   			<a href="{#public#}friend/findfriendmainpage?id={$friendId}" target="_blank">
		   				<img src="{#imgsmall#}{$friendImg}" alt="这是用户的头像" >
		   			</a>
			</div>
	
			<div class="resultTextData" data="{$daywordResult.dayword_id}">
		   		<div class="textData">
		   			<h6><span><a href="{#public#}friend/findfriendmainpage?id={$friendId}">{$friendName}</a></span>&nbsp;&nbsp;发表于{$daywordResult.dayword_time}</h6>
		   			<p>{$daywordResult.dayword_content}
		   			<h5>标签:{$daywordResult.dayword_type|my_choosetype}</h5>
		   			<div class="buttons">
						<span class="dayLike"><button class="btn btn-mini "><i class="icon-thumbs-up"></i>喜欢(<span>{$daywordResult.dayword_like}</span>)</button></span>

						<span class="dayComment"><button class="btn btn-mini "  ><i class="icon-comment"></i>评论(<span>{$daywordResult.dayword_comment}</span>)</button></span>
		   			</div>
		   		</div>	
		   		<div class="hiddenComment"></div>
			</div>
		</div>
	</div>
{else}
<h4><a href="{#public#}dayword/index">此人未记录每日心情,可能是他的天墙不在这一天,因此他将无法在此墙展示每日心情.点此返回</a></h4>
{/if}
</div>
<h3>生活点滴 &nbsp;&nbsp;<button class="btn btn-mini" id="interestTwitter">当你需要的时候，尝试点击它！</button></h3>
<div id="dayTwitter" class="span12">


<div class="result">
{if $twitterResult|my_count} 
{foreach from=$twitterResult item=item}
<div class="twitterItem thumbnail">
<div class="blue"></div>
{if $item.twitter_image} <img src="{#favourite#}{$item.twitter_image}" class="thumbnail" alt="this is a picture" />
{/if}
	<div class="resultImgData">
   			<a href="{#public#}friend/findfriendmainpage?id={$friendId}">
   				<img src="{#imgsmall#}{$friendImg}" alt="这是用户的头像" >
   			</a>
	</div>
	<div class="resultTextData" data="{$item.twitter_id}">
   		<div class="textData">
   			<h6><span><a href="{#public#}friend/findfriendmainpage?id={$friendId}">{$friendName}</a></span>&nbsp;&nbsp;发表于{$item.twitter_time}</h6>
   			<p>{$item.twitter_content}
   			<div class="buttons">
				<span class="dayLike"><button class="btn btn-mini " title="喜欢"><i class="icon-thumbs-up"></i><span>{$item.twitter_like}</span></button></span>
				<span class="dayFavourite"><button  class="btn btn-mini" title="收藏"><i class="icon-share "></i><span>{$item.twitter_favourite}</span></button></span>
				<span class="dayComment"><button class="btn btn-mini " title="评论"><i class="icon-comment"></i><span>{$item.twitter_comment}</span></button></span>
 
   				
   			</div>

   		</div>		   	
   		<div class="hiddenComment"></div>
	</div>

</div>





{/foreach} {else}
<div class="thumbnail">
<div class="blue"></div>
<h4><a href="{#public#}twitter">此人次日无生活点滴展示,又或者.......还没到时间.点此返回</a></h4>
</div>

{/if}
</div>
</div>
<h3>每日收藏&nbsp;&nbsp;<button class="btn btn-mini" id="interestFavourite">当你需要的时候，尝试点击它！</button></h3>
<div id="dayFavourite" class="span12">


<div class="fresult">


{if $favouriteResult|my_count} 
{foreach from=$favouriteResult item=item}
<div class="favouriteItem thumbnail">
<div class="blue"></div>
{if $item.favourite_image} <img src="{#data#}favourite/{$item.favourite_image}" class="thumbnail"  alt="this is a picture" />
{/if}
	<div class="resultImgData">
   			<a href="{#public#}friend/findfriendmainpage?id={$friendId}">
   				<img src="{#imgsmall#}{$friendImg}" alt="这是用户的头像" >
   			</a>
	</div>
	<div class="resultTextData" data="{$item.favourite_id}">
   		<div class="textData">
   			<h6><span><a href="{#public#}friend/findfriendmainpage?id={$friendId}">{$friendName}</a></span>&nbsp;&nbsp;收藏于{$item.favourite_time}</h6>
   			<p>{$item.content}
   			{if $item.favourite_from_type eq 2}
   			<p><h5>标签:<a class="publicLabel"  >{$item.favourite_label}</a>&nbsp;&nbsp;来自于公共主页</h5>
   			{else}
   			<p><h5>标签:<a class="publicLabel"  >{$item.favourite_label}</a></h5>
   			{/if}
   			<div class="buttons">
				<span class="dayLike"><button class="btn btn-mini " type="button"  title="喜欢"><i class="icon-thumbs-up"></i><span>{$item.like}</span></button></span>
				<span class="dayFavourite"><button class="btn btn-mini"  type="button"  title="收藏"><i class="icon-share "></i><span>{$item.favourite}</span></button></span>
				<span class="dayComment"><button class="btn btn-mini " type="button" title="评论"><i class="icon-comment"></i><span>{$item.comment}</span></button></span>

   			</div>
   		</div>
   		<div class="hiddenComment"></div>	
	</div>
</div>

{/foreach} {else}
<div class="thumbnail">
<div class="blue"></div>
<h4><a href="{#public#}days/index?month={$month}&day={$day}">此人此天无收藏，点此返回</a></h4>
</div>

{/if}</div>
</div>
</div>



</div>
</div>

<div id="footer">
{include file="footer.tpl"}
</div>
<div class="hidden" id="userImage">{$userImg}</div>
<div class="hidden"><div id="month">{$month}</div><div id="day">{$day}</div></div>


 <script type="text/javascript" src="{#js#}allAjax.js"></script>
 {literal} 

 <script type="text/javascript">
 $(function()
		 {
		var userImg=$('#userImage').text();
		var userName=$('#userName').text();
		var d=new Date();
		var month=$('#month').text();
		$('#dayDayword .dayComment button').live('click',function()
				{
					var item=$(this).parent().parent().parent().parent()
					var id=item.attr('data');
					getDaywordComment(id,item);
					var formComment=$('<form>').append('<textarea name="textareaComment" class="textareaComment" id="textareaComment"/><button class="btn btn-mini">提交</button>&nbsp;&nbsp;<span>字数不能超过140字节</span>');
					formComment.attr('class','formComment');
					formComment.attr('onSubmit','return false');
					$(this).parent().parent().after(formComment);
					$(this).attr('disabled','disabled');
			});
		$('#dayDayword .formComment').live('submit',function()
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
						url:'http://www.days366.com/dayword/comment',
						success:function(data)
						{
							var result=data;
							if (result.result.state=='fail')
							{
											Error();
											return 1;
							}
							var imgData=$('<div class="commentImgData">').append('<a href="#" >'+'<img src="http://www.days366.com/userImg/userimg/small/'+userImg+'" alt="这是用户的头像" />'+'</a>');
							var textData=$('<div class="commentTextData">').append('<span><a href="#">'+userName+'</a></span>&nbsp;&nbsp;<h6>评论于'+d.toLocaleTimeString()+'</h6>')
																						.append('<p>'+textContent+'</p>');

							var twitterComment=$('<div class="twitterComment">').append(imgData)
																.append(textData);
							var hiddenComment=item.children('.hiddenComment');
							hiddenComment.prepend(twitterComment)
									.prepend('<hr />');
							var comment=item.children('div').children('div').children('.dayComment').children('button').children('span');
							comment.text(parseInt(comment.text())+1);	
							
						},
						beforeSend:function()
						{

							addLoading(item);
						},
						error:function()
						{
							Remove();
							Error();
						},
						complete:function(){$('.formComment').empty();}
					});
		});
		
		$('.result').masonry({
		      itemSelector: '.twitterItem',
		      isAnimated:true
			 });
		 
		$('.fresult').masonry({
		      itemSelector: '.favouriteItem'
			 });
	

	 	var id;
	 	var month=$('#month').text();
	 	var day=$('#day').text();
		var month=$('#month').text();



		$('#dayDayword .dayLike button').live('click',function()
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
			url:'http://www.days366.com/dayword/like?id='+itemId,
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

	});
		$('#dayTwitter .formComment').live('submit',function()
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
								beforeSend:function()
								{
									addLoading(item);
								},
								error:function()
								{
									Remove();
									Error();
								},
								complete:function(){$('.formComment').empty();}
							});
				});
				$('#dayTwitter .dayComment button').live('click',function()
						{
							
							var item=$(this).parent().parent().parent().parent();

							var id=item.attr('data');
							getTwitterComment(id,item);
							var formComment=$('<form>').append('<textarea name="textareaComment" class="textareaComment" id="textareaComment"/><button type="submit" class="btn btn-mini">提交</button><span>140字符限制</span><h6><a  class="refreshTwitter">想要看到用户的评论,为什么不点击这里呢?</a></h6>');
							formComment.attr('class','formComment');
							formComment.attr('onSubmit','return false');
							$(this).parent().parent().parent().append(formComment);
							refreshTwitter();
							$(this).attr('disabled','disabled');
							return true;
					});
				$('#dayFavourite .dayComment button').live('click',function()
						{
							var item=$(this).parent().parent().parent().parent();
							var id=item.attr('data');
							getFavouriteComment(id,item,month);
							var formComment=$('<form>').append('<textarea autofocus name="textareaComment" class="textareaComment" id="textareaComment"/><button class="btn btn-mini">提交</button><span>140字符限制</span><h6><a  class="refreshFavourite">想要看到用户的评论,为什么不点击这里呢?</a></h6>');
							formComment.attr('class','formComment');
							formComment.attr('onSubmit','return false');
							$(this).parent().parent().after(formComment);
							refreshFavourite();
							$(this).attr('disabled','disabled');
					});
				$('#dayFavourite .formComment').live('submit',function()
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
					var nowMonth=month;
					$.ajax(
							{
								type:'POST',
								dataType:'json',
								data:{content:textContent,id:itemId,month:nowMonth},
								url:'http://www.days366.com/favourite/comment',
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
								beforeSend:function()
								{

									addLoading(item);
								},
								error:function()
								{
									Remove();
									Error();
								},
								complete:function(){$('.formComment').empty();}
							});


				});
				$('#dayTwitter .dayLike button').live('click',function()
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
				$('#dayTwitter .dayFavourite button').live('click',function()
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
				$('#dayFavourite .dayLike button').live('click',function()
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
					url:'http://www.days366.com/favourite/like?id='+itemId+'&month='+month,
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

								});
				$('#dayFavourite .dayFavourite button').live('click',function()
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
					url:'http://www.days366.com/favourite/favourite?id='+itemId+'&month='+month,
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
				});
		 });

 function getDaywordComment(id,item)
	{
		$.ajax(
				{
					dataType:'json',
					url:'http://www.days366.com/dayword/getcomment?id='+id,
					success:function(data)
					{
						var result=data;
						for (var i=0;i<result.result.length;i++)
						{

						var imgData=$('<div class="commentImgData">').append('<a href="#">'+'<img src="http://www.days366.com/userImg/userimg/small/'+result.result[i].userImg+'" alt="这是用户的头像" />'+'</a>');
						var textData=$('<div class="commentTextData">').append('<span><a href="#">'+result.result[i].userName+'</a></span>&nbsp;&nbsp;<h6>评论于'+result.result[i].userTime+'</h6>')
																					.append('<p>'+result.result[i].userContent+'</p>');

						var daywordComment=$('<div class="daywordComment">').append(imgData)
															.append(textData);
						var hiddenComment=item.children('.hiddenComment');
						hiddenComment.append('<hr />')
								.append(daywordComment);
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
 function getTwitterComment(id,item)
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



function getFavouriteComment(id,item,month)
{
	$.ajax(
			{
				dataType:'json',
				url:'http://www.days366.com/favourite/getcomment?id='+id+'&month='+month,
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
function refreshTwitter()
{
	$('.result').masonry({
	      itemSelector: '.twitterItem',
	      isAnimated:true
		 });
	
}
function refreshFavourite()
{
	$('.fresult').masonry({
	      itemSelector: '.favouriteItem',
	      isAnimated:true
		 });

	
}
$('#interestTwitter').live('click',function(){refreshTwitter();});
$('.refreshTwitter').live('click',function(){refreshTwitter();});
$('.refreshFavourite').live('click',function(){refreshFavourite();});
$('#interestFavourite').live('click',function(){refreshFavourite();});
 </script>
 
 {/literal}
</body>
</html>