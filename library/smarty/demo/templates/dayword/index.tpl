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
					<li id="userTwi"><a href="{#public#}twitter/index"  >点滴</a></li>
					<li id="userFav"><a href="{#public#}favourite/index" >用户收藏</a></li>
					<li id="userDel" class="active"><a href="#" >每日心情</a></li>
				</ul>
			</div>

{if $day eq $pageDay}
{if $messageNumber neq 0}
<div ><a href="http://www.days366.com/message/index" ><label class="success">你有新追随消息,赶快去查看!</label></a></div>
{/if}
<div id="displayExpression" >
{if !$exist}
{include file="dayword/add.tpl"}
<div class="span1" id="expressionLabel"><h3>为自己的一天刻上色彩!</h3></div>
<div class="span7">
<form id="expression">
	<table>
		<tr>
			<td><img src="{#img#}expression/happy.png" alt="happy" /><div><input type="radio" name="expression"  checked  value="happy" />开心</div></td>
			<td><img src="{#img#}expression/normal.png" alt="normal" /><div><input type="radio" name="expression"  value="normal"/>正常</div></td>
			<td><img src="{#img#}expression/sad.png" alt="sad" /><div><input type="radio" name="expression" value="sad"/>难过</div></td>
			<td><img src="{#img#}expression/fight.png" alt="fight" /><div><input type="radio" name="expression" value="sad"/>奋斗</div></td>
		</tr>
		<tr>
			<td><img src="{#img#}expression/angry.png" alt="angry" /><div><input type="radio" name="expression" value="angry"/>生气</div></td>
			<td><img src="{#img#}expression/sleepy.png" alt="sleepy" /><div><input type="radio" name="expression" value="sleepy"/>毫无干劲</div></td>
			<td><img src="{#img#}expression/amazing.png" alt="amazing" /><div><input type="radio" name="expression" value="amazing" />充满期待</div></td>
			<td><img src="{#img#}expression/award.png" alt="award" /><div><input type="radio" name="expression"  value="award"/>得意</div></td>
		</tr>
	</table>
</form>

</div>

{/if}
</div>
{/if}
<div id="result" class=" thumbnails span8">
{if $result|my_count}
{foreach from=$result item=item}
<div class="result thumbnail" >
	<div class="blue"></div>
	{if $item.dayword_image}
		<div class="displayImage displayImageDayword"><img class="thumbnail" src="{#dayword#}/{$item.dayword_image}" alt="this is a picture" /></div>
	{/if}
	<div class="row">
		<div class="span2">
			<h3>今天心情</h3>
			<img src="{#img#}expression/{$item.dayword_state}.png" alt="expression" />
		</div>
		<div class="span5">
			<div class="resultImgData">
		   			<a href="{#public#}friend/findfriendmainpage?id={$item.dayword_user_id}">
		   				<img src="{#imgsmall#}{$item.action_user_image}" alt="这是用户的头像" >
		   			</a>
			</div>
	
			<div class="resultTextData" data="{$item.dayword_id}">
		   		<div class="textData">
		   			<h6><span><a href="{#public#}friend/findfriendmainpage?id={$item.dayword_user_id}">{$item.action_user_name}</a></span>&nbsp;&nbsp;发表于{$item.dayword_time}</h6>
		   			<p>{$item.dayword_content}
		   			<div class="daywordLabel"><h5>标签:{$item.dayword_type|my_choosetype}</h5></div>
		   			<div>
						<span class="dayLike"><button class="btn btn-mini "><i class="icon-thumbs-up"></i>喜欢(<span>{$item.dayword_like}</span>)</button></span>

						<span class="dayComment"><button class="btn btn-mini "  ><i class="icon-comment"></i>评论(<span>{$item.dayword_comment}</span>)</button></span>
		   			</div>
		   		</div>
		   		<div class="hiddenComment"></div>	
			</div>
		</div>
	</div>



</div>

{/foreach}
{else}
<h3 class="noRecord">你没有记录</h3>
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
		<li><a href="http://www.days366.com/dayword/findday?day={$day-2}">{$month}月{$day-2}日</a></li>
		<li><a href="http://www.days366.com/dayword/findday?day={$day-1}">{$month}月{$day-1}日</a></li>
		<li><a href="http://www.days366.com/dayword/findday?day={$day}">{$month}月{$day}日</a></li>
	</ul>
</div>
</div>	

	<div class="modal fade" id='daywordEx' >
		<div class="modal-header">
			<a class="close" data-dismiss="modal">×</a>
			<h3>为你的一天增加色彩</h3>
		</div>
		<div class="modal-body">
			<p>当你第一次发表一天心情时，你必须要了解:</p>
			<p>你一天只可以发表一次心情,不可更改,不可删除,他将为你的这一天打上深深的烙印</p>
			<p>没有人可以收藏你的心情，因为在我看来(相信你也是如此认为),他是独一无二的.</p>
			<p>当你选择了一天的心情为高兴或者奋斗时,不要忘记他,而应该开心的,或者是充满激情的过完这一天，如果你选择了难过或者是毫无干劲，我觉得你应该改变点什么</p>
			<p>希望大家享受每一天。</p>
		</div>
		<div class="modal-footer">
			<button class="btn">关闭</button>
		</div>
	</div>
</div>

<div class="hidden" id="month">{$month}</div>
<div class="hidden" id="day">{$day}</div>
<div class="hidden" id="pageDay">{$pageDay}</div>

	</div>
	<div id="footer">		{include file="footer.tpl"}</div>
<script type="text/javascript" src="{#js#}allAjax.js"></script>
{literal}
<script type="text/javascript" >

$(function(){
	var userImg=$('#userImage').text();
	var userName=$('#userName').text();
	var d=new Date();

	$('.modal-footer button').click(function(){$('#daywordEx').modal('hide');});
	
	$('.dayComment button').live('click',function()
			{
				var item=$(this).parent().parent().parent().parent()
				var id=item.attr('data');
				getComment(id,item);
				var formComment=$('<form>').append('<textarea name="textareaComment" class="textareaComment" id="textareaComment"/><button class="btn btn-mini">提交</button>&nbsp;&nbsp;<span>字数不能超过140字节</span>');
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


	$('#formDaywordAdd').live('submit',function()
			{
				var textareaContent=$('#formDaywordAdd textarea').val();
				var userExpression=$('.hiddenExpression').val();
				var daywordType=$('#formDaywordAdd  .daywordType input').val();
				if (daywordType="goal"){var typeString="一天目标";}
				else if(daywordType="sum"){var typeString="一天总结";}
				else if (daywordType="feel"){var typeString="一天随感";}
				$.ajax(
						{
							type:'POST',
							dataType:'json',
							data:{content:textareaContent,expression:userExpression,type:daywordType},
							url:'http://www.days366.com/dayword/save',
							success:function(data)
							{
								var result=data;
								if (result.result.state=='fail')
								{
												Error();
												return 1;
								}
								if ($('h3').hasClass('noRecord'))
								{
										$('h3.noRecord').css('display','none');
								}
								daywordId=result.result.id;
								var d=new Date();

								var imgData=$('<div class="resultImgData">').append('<a href="#" >'+'<img src="http://www.days366.com/userImg/userimg/small/'+userImg+'" alt="这是用户的头像" />'+'</a>');
								var h6=$('<h6>').append('<span><a href="#">'+userName+'</a></span>&nbsp;&nbsp;发表于'+d.toLocaleTimeString());
								var buttons=$('<div>').append('<span class="dayLike"><button class="btn btn-mini " ><i class="icon-thumbs-up"></i>喜欢(<span>0</span>)</button></span>&nbsp;<span class="dayComment"><button class="btn btn-mini " id="dayComment" ><i class="icon-comment"></i>评论(<span>0</span>)</button></span>');
								var daywordLable=$('<div class="daywordLable">').append('<h5>标签:'+typeString+'</h5>');
								var textData=$('<div class="textData">').append(h6)
																										.append('<p>'+textareaContent)
																										.append(daywordLable)
																										.append(buttons);

								var 	resultTextData=$('<div class="resultTextData" data='+daywordId+'>').append(textData);
								var mainContent=$('<div class="span5">').append(imgData)
																											.append(resultTextData);
								var todayExpression=$('<div class="span2">').append('<h3>今日心情</h3><img src="http://www.days366.com/img/expression/'+userExpression+'.png" alt="expression" />');
								var row=$('<div class="row">').append(todayExpression)
																							.append(mainContent);
								var selfDayword=$('<div class="result thumbnail">').append('<div class="blue"></div>')
																														.append(row);
																													
								$('#result').prepend(selfDayword);
								$('#displayExpression').remove();
							}
						});

			});

	$('#formDaywordAdd').validate(
			{
				rules:{textareaContent:{required:true,maxlength:240}},
				messages:{textareaContent:{required:"输入不能为空",maxlength:"字符数不应超过240字符"}}

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
							url:'http://www.days366.com/dayword/imagesave',
						
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
	$('#formAllAdd').validate(
			{
				rules:{
					imageContent:
						{required:true,maxlength:240},
					file:{required:true}
						},
				messages:
					{
					imageContent:
						{required:"输入不能为空",maxlength:"字符数不应超过240字符"},
						file:{required:"你还未添加图片"}
					}
			});	

	$('#expression input').click(function()
			{
					$('.hiddenExpression').val($(this).val());


		});
	$('#formAllAdd').live('submit',function()
			{
		var textContent=$('#formAllAdd textarea').val();
		var userExpression=$('.hiddenExpression').val();
		var daywordType=$('#formAllAdd .daywordType input').val();
		if (daywordType="goal"){var typeString="一天目标";}
		else if(daywordType="sum"){var typeString="一天总结";}
		else if (daywordType="feel"){var typeString="一天随感";}
				var imgId=$('#imgHidden').val();
				if (!!imgId==""){$(this).append('<p><label class="error" >请先上传图片</label>');return false;}
				$.ajax(
						{
							type:'POST',
							dataType:'json',
							data:{content:textContent,expression:userExpression,type:daywordType,id:imgId},
							url:'http://www.days366.com/dayword/save',
							success:function(data)
							{
								var result=data;
								if (result.result.state=='fail')
								{
												Error();
												return 1;
								}
								if ($('h3').hasClass('noRecord'))
									{
											$('h3.noRecord').css('display','none');
									}
								var result=data;

								daywordId=result.result.id;
								var d=new Date();
								var uploadImg=$('<div class="displayImage  displayImageDayword">').append('<img class="thumbnail" src="http://www.days366.com/userImg/dayword/'+imgId+'" alt="this is a picture" />');
								var imgData=$('<div class="resultImgData">').append('<a href="#" >'+'<img src="http://www.days366.com/userImg/userimg/small/'+userImg+'" alt="这是用户的头像" />'+'</a>');
								var h6=$('<h6>').append('<span><a href="#">'+userName+'</a></span>&nbsp;&nbsp;发表于'+d.toLocaleTimeString());
								var buttons=$('<div>').append('<span class="dayLike"><button class="btn btn-mini " ><i class="icon-thumbs-up"></i>喜欢(<span>0</span>)</button></span>&nbsp;<span class="dayComment"><button class="btn btn-mini " id="dayComment" ><i class="icon-comment"></i>评论(<span>0</span>)</button></span>');
								var daywordLable=$('<div class="daywordLable">').append('<h5>标签:'+typeString+'</h5>');
								var textData=$('<div class="textData">').append(h6)
																										.append('<p>'+textContent)
																										.append(daywordLable)
																										.append(buttons);

								var resultTextData=$('<div class="resultTextData" data='+daywordId+'>').append(textData);
								var mainContent=$('<div class="span5">').append(imgData)
																		.append(resultTextData);
								var todayExpression=$('<div class="span2">').append('<h3>今日心情</h3><img src="http://www.days366.com/img/expression/'+userExpression+'.png" alt="expression" />');
								var row=$('<div class="row">').append(todayExpression)
																.append(mainContent);
								var selfDayword=$('<div class="result thumbnail">').append('<div class="blue"></div>')
																					.append(uploadImg)
																					.append(row);
																													
								$('#result').prepend(selfDayword);
								$('#displayExpression').remove();

								},

								error:function()
								{
									Error();
								}
						});

			});
	$('#formTwitterAdd button').click(function()
			{
				$.ajax(
						{
							type:'POST',
							dataType:'json',
							data:{content:$('textarea').val()},
							url:'http://www.days366.com/twitter/save',
							success:function(data)
							{
								var result=data;
								if (result.result.state=='fail')
								{
												Error();
												return 1;
								}
								addTwitterSuccess();
								twitterId=result.result.id;
							}
						});

			});
	$('#formTwitterAdd').validate(
			{
				rules:{textareaUserTwitter:{required:true,maxlength:140}},
				messages:{textareaUserTwitter:{required:"输入不能为空",maxlength:"字符数不应超过140字符"}}

			});
	$('#formImage').validate(
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
							url:'http://www.days366.com/dayword/more',
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
							
										var h6=$('<h6>').append('<span><a href="http://www.days366.com/friend/friendmainpage?id='+result.result[i].userId+'">'+result.result[i].userName+'</a></span>&nbsp;&nbsp;发表于'+result.result[i].daywordTime);
										var buttons=$('<div class="buttons">').append('<span class="dayLike"><button class="btn btn-mini " ><i class="icon-thumbs-up"></i>喜欢(<span>'+result.result[i].daywordLike+'</span>)</button></span>&nbsp;<span class="dayComment"><button class="btn btn-mini "  ><i class="icon-comment"></i>评论(<span>'+result.result[i].daywordComment+'</span>)</button></span>');
										var textData=$('<div class="textData">').append(h6)
																												.append('<p>'+result.result[i].daywordContent)
																												.append(buttons);
										var 	resultTextData=$('<div class="resultTextData" data="'+result.result[i].daywordId+'" >').append(textData)
																																														.append('<div class="hiddenComment"></div>');



										var selfdayword=$('<div class="result thumbnail">').append('<div class="blue"></div>');

										if (result.result[i].daywordImg!="")
										{
										var daywordImg=$('<div class="displayImage displayImageDayword">').append('<img class="thumbnail" src="http://www.days366.com/userImg/favourite/'+result.result[i].daywordImg+'" alt="this is a picture" />');
										selfdayword.append(daywordImg);
										}
										var span2=$('<div class="span2">').append('<h3>今日心情</h3><img src="http://www.days366.com/img/expression/'+result.result[i].daywordState+'.png" alt="this is expression" >');
										var span5=$('<div class="span5">').append(imgData)
																										.append(resultTextData);
										var row=$('<div class="row">').append(span2)
																								.append(span5);
										selfdayword.append(row);									
										$('#result').append(selfdayword);
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
</script>
{/literal}
</body>
</html>