{include file="header.tpl"}
<link rel="stylesheet" href="{#css#}twitter.css" />
<script  type="text/javascript" src="{#js#}jquery.validate.min.js"></script>
</head>
<body>
	<div class="container">
		{include file="login/day.tpl"}
		<div class="row">
			{include file="login/colNav.tpl"}

		<div class="span9">
			<div id="rowNav" >
				<ul class="nav nav-tabs">
					<li id="userTwi"><a href="{#public#}twitter/index"  target="_blank">点滴</a></li>
					<li id="userFav" class="active"><a href="#" >用户收藏</a></li>
					<li id="userDel"><a href="{#public#}dayword/index"  target="_blank">每日心情</a></li>
				</ul>
			</div>
<hr />
<div id="result" class=" thumbnails">
{if $result|my_count}
{foreach from=$result item=item}
<div class="result thumbnail">
	<div class="blue"></div>
	{if $item.favourite_image}
		<div class="displayImage"><img class="thumbnail" src="{#public#}userImg/favourite/{$item.favourite_image}" alt="this is a picture" /></div>
	{/if}
	<div class="resultImgData">
   			<a href="{#public#}friend/findfriendmainpage?id={$item.favourite_user_id}">
   				<img src="{#imgsmall#}{$item.action_user_image}" alt="这是用户的头像" >
   			</a>
	</div>
	<div class="resultTextData" data="{$item.favourite_id}">
   		<div class="textData">
   			<h6><span><a href="{#public#}friend/findfriendmainpage?id={$item.favourite_user_id}">{$item.action_user_name}</a></span>&nbsp;&nbsp;收藏于{$item.favourite_time}</h6>
   			<p>{$item.content}
   			{if $item.favourite_from_type eq 2}
   			<p><h5>标签:<a class="publicLabel"  >{$item.favourite_label}</a>&nbsp;&nbsp;来自于公共主页</h5>
   			{else}
   			<p><h5>标签:<a class="publicLabel"  >{$item.favourite_label}</a></h5>
   			{/if}
   			<div class="buttons">
				<span class="dayLike"><button class="btn btn-mini " ><i class="icon-thumbs-up"></i>喜欢(<span>{$item.like}</span>)</button></span>
				<span class="dayFavourite"><button class="btn btn-mini"><i class="icon-share "></i>收藏(<span>{$item.favourite}</span>)</button></span>
				<span class="dayComment"><button class="btn btn-mini "><i class="icon-comment"></i>评论(<span>{$item.comment}</span>)</button></span>
   			</div>
   		</div>	
   		<div class="hiddenComment"></div>
	</div>



</div>

{/foreach}
{else}
<h3>你没有记录</h3>
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
		<li><a href="http://www.days366.com/favourite/findday?day={$day-2}">{$month}月{$day-2}日</a></li>
		<li><a href="http://www.days366.com/favourite/findday?day={$day-1}">{$month}月{$day-1}日</a></li>
		<li><a href="http://www.days366.com/favourite/findday?day={$day}">{$month}月{$day}日</a></li>
	</ul>
</div>	

		</div> 
		</div>


	</div>
			<div id="footer">
			{include file="footer.tpl"}	
		</div>
<span class="hidden" id="month">{$month}</span>
<div class="hidden" id="pageDay">{$pageDay}</div>
<script type="text/javascript" src="{#js#}allAjax.js"></script>
{literal}
<script type="text/javascript" >

$(function(){
	var userImg=$('#userImage').text();
	var userName=$('#userName').text();
	var d=new Date();

	var month=$('#month').text();
	$('.dayComment button').live('click',function()
			{
				var item=$(this).parent().parent().parent().parent();
				var id=item.attr('data');
				getComment(id,item,month);
				var formComment=$('<form>').append('<textarea name="textareaComment" class="textareaComment" id="textareaComment"/><button class="btn btn-mini">提交</button>');
				formComment.attr('class','formComment');
				formComment.attr('onSubmit','return false');
				$(this).parent().parent().after(formComment);
				$(this).attr('disabled','disabled');
		});
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

	$('.publicLabel').each(function()
			{
				var publicLabel=$(this).text().split('-');
				$(this).attr('href','http://www.days366.com/days/index?month='+publicLabel[0]+'&day='+publicLabel[1]);
				

		})


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
	$('#moreRecord button').live('click',function()
			{

				var recordNumber=$(this).val();
				var month=$('#month').text();
				var day=$('#pageDay').text();
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
							url:'http://www.days366.com/favourite/more',
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
							
										var h6=$('<h6>').append('<span><a href="http://www.days366.com/friend/friendmainpage?id='+result.result[i].userId+'">'+result.result[i].userName+'</a></span>&nbsp;&nbsp;发表于'+result.result[i].favouriteTime);
										var buttons=$('<div class="buttons">').append('<span class="dayLike"><button class="btn btn-mini " ><i class="icon-thumbs-up"></i>喜欢(<span>'+result.result[i].favouriteLike+'</span>)</button></span>&nbsp;<span class="dayFavourite"><button class="btn btn-mini" ><i class="icon-share"></i>收藏(<span>'+result.result[i].favouriteFavourite+'</span>)</button></span>&nbsp;<span class="dayComment"><button class="btn btn-mini "  ><i class="icon-comment"></i>评论(<span>'+result.result[i].favouriteComment+'</span>)</button></span>');
										var textData=$('<div class="textData">').append(h6)
																												.append('<p>'+result.result[i].favouriteContent)
																												.append(buttons);
										var 	resultTextData=$('<div class="resultTextData" data="'+result.result[i].favouriteId+'" >').append(textData)
																																														.append('<div class="hiddenComment"></div>');



										var selffavourite=$('<div class="result thumbnail">').append('<div class="blue"></div>');

										if (result.result[i].favouriteImg!="")
										{
										var favouriteImg=$('<div class="displayImage">').append('<img class="thumbnail" src="http://www.days366.com/userImg/favourite/'+result.result[i].favouriteImg+'" alt="this is a picture" />');
										selffavourite.append(favouriteImg);
										}
										selffavourite.append(imgData)
															.append(resultTextData);										
										$('#result').append(selffavourite);
										$('#moreRecord button').val(result.number);
									}
							},
							error:function(){}
						}

						);
		});
});
function getComment(id,item,month)
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
</script>
{/literal}
</body>
</html>