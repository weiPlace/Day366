<head>
{config_load file="smarty.config.ini" section="path" scope="global" }
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="Keywords" content="day,birthday,days366,大学,同学,朋友,交友,每一天" />
<meta name="Description" content="remember every day!,记住每一天" />
<title>{$userName}</title>
<link rel="stylesheet" href="{#css#}bootstrap.min.css"/>
<link rel="stylesheet" href="{#css#}style.css" />
<link rel="stylesheet" href="{#css#}styleLogin.css" />
<link rel="stylesheet" href="{#css#}friend.css" />
<!--[if lt IE 10]>
	<link rel="stylesheet" href="{#css#}fixie.css" />
<![endif]-->	
<script type="text/javascript" src="{#js#}jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="{#js#}bootstrap.min.js"></script>
<script type="text/javascript" src="{#js#}json2.js" ></script>
</head>
<body>
<div class="container">
	
	{include file="login/day.tpl"}
<div class="row">
	{include file="login/colNav.tpl"}
	<div class="span9" id="friendIndex">
   	{if $error|my_count|default:''}
   	<label class="error">{$error}</label>
   	{/if}   
	<h3 >搜索你的好友</h3>
	<hr />
	<form method="POST" class="form-inline"  action="{#public#}search/name">
		<input type="search"  class="input-medium search-query span3" id="search"  name="search" placeholder="举例：北京大学  董敏"/>
		<button type="submit" class="btn "  ><i class="icon-search"></i>&nbsp;搜索</button>
		<span id="searchInline">
			<input type="radio" name="type"  value="day"   id="day">日期
			<input type="radio" name="type" value="people" checked="checked" id="people">人名
		</span>
		<input type="hidden"  value="{$userInput|default:''}"  id="userInput"/>
		<input type="hidden"  value="{$type|default:''}"  id="userInputType" />
	</form>
	

	<div  id="searchFriendResult">
	{$message|default:'我们为你找到的结果如下:'}
	{foreach from=$result item=item}
	<div class="friendInfo thumbnail" >
		<div class="blue"></div>
   		<div class="imgData">
   		{*通过此Action,然后重定向到用户的主页*}
   			<a href="{#public#}friend/findfriendmainpage?id={$item.user_id}">
   				<img src="{#imgsmall#}{$item.user_img}" alt="这是用户的头像" >
   			</a>
   		</div>
   		<div class="textData">
   			<h4><span><a href="{#public#}friend/findfriendmainpage?id={$item.user_id}">{$item.user_name}</a></span>&nbsp;&nbsp;{$item.user_birthday}</h4>
   			<h4><span>{$item.user_us}</span></h4>
 
   		</div>
  			<h4><a href="#collectFriend" class="collect"  data-toggle="modal" data="{$item.user_id}"><button class="btn">收藏此人</button></a></h4>
   	</div>
	{/foreach}
	</div>
	{$pageNumber|my_forpage|default:''}
	</div>
	</div>
   	<div class="modal fade" id="collectFriend" >
   
	    <div class="modal-header">
	    <a class="close" data-dismiss="modal">×</a>
	    <h3>收藏此人</h3>
	    </div>
	    <div class="modal-body">
	    <p>你真的想收藏此人吗?</p>
	    </div>
	    <div class="modal-footer">
	    <button class="btn" id="saveFriendButton" >确定</button>
	    </div>
	</div>
{include file="footer.tpl"}
</div>

{literal}
<script type="text/javascript">


var userId;
$(function()
		{
			$('.friendInfo h4 a.collect').live('click',function(){ userId=$(this).attr('data');})
			$('#saveFriendButton').live('click',function()
					{
						var id=$('.user').val();
						$.ajax({
								url:'http://www.days366.com/friend/save?id='+userId,
								dataType:'json',
								success:function(data)
								{
										$('#collectFriend').modal('hide');
										var result=data;
										if (result.result.state=='fail')
										{
											if (result.result.type=="exist")
												{
												var modalheader=$('<div class="modal-header">').append('<a class="close" data-dismiss="modal">&times;</a><h3>警告！</h3>');
												var modalbody=$('<div class="modal-body">').append('<p><span  style="font-size:14px">你已收藏此人！</span>');
												var modal=$('<div class="modal fade" id="ajaxWarning">').append(modalheader)
																																.append(modalbody);
												$('body').append(modal);
												$('#ajaxWarning').modal('show');
												return 1;
												}
											var modalheader=$('<div class="modal-header">').append('<a class="close" data-dismiss="modal">&times;</a><h3>取消收藏</h3>');
											var modalbody=$('<div class="modal-body">').append('<p>数据操作失败');
											var modal=$('<div class="modal fade" id="ajaxSuccess">').append(modalheader)
																															.append(modalbody);
											$('body').append(modal);
											$('#ajaxSuccess').modal('show');
										}
									else
										{
										var modalheader=$('<div class="modal-header">').append('<a class="close" data-dismiss="modal">&times;</a><h3>收藏</h3>');
										var modalbody=$('<div class="modal-body">').append('<p><span class="label" style="font-size:14px">收藏成功！</span>');
										var modal=$('<div class="modal fade" id="ajaxError">').append(modalheader)
																														.append(modalbody);
										$('body').append(modal);
										$('#ajaxError').modal('show');

										}									
								},
								error:function()
								{
									$('#collectFriend').modal('hide');
									var modalheader=$('<div class="modal-header">').append('<a class="close" data-dismiss="modal">&times;</a><h3>取消收藏</h3>');
									var modalbody=$('<div class="modal-body">').append('<p>数据操作失败');
									var modal=$('<div class="modal fade" id="ajaxError">').append(modalheader)
																													.append(modalbody);
									$('body').append(modal);
									$('#ajaxError').modal('show');

								}
						});
					return false;
						}
			);
			$('#search').popover(
					{
						title:'注意!',
						trigger:'focus',
						placement:'bottom',
						content:"<p>如果你想寻找好友，选择人名单选按钮:</p><p>&nbsp;&nbsp;并输入\"北京大学 董敏\"的形式</p><p>如果你想寻找同一天出生的人，选择日期单选按钮</p><p>&nbsp;&nbsp;请输入1992-01-01或01-01的形式</p><p>如果你想知道特定日期发生的大事记</p><p>&nbsp;&nbsp;请在导航条上选择对应的日期</p>",					
					});
			$('#page ul li a').live('click',function()
					{
						var userInput=$('form #userInput').val();
						userInput=encodeURI(userInput);
						var type=$('form #userInputType').val();
						var number=$(this).attr('value');
						$.ajax(
								{
									dataType:'json',
									url:'http://www.days366.com/search/choosepage?search='+userInput+'&'+'page='+number+'&'+'type='+type,
									success:function(data)
									{
											
											var result=data;
											if (result.result.state=='fail')
												{
													var modalheader=$('<div class="modal-header">').append('<a class="close" data-dismiss="modal">&times;</a><h3>注意！</h3>');
													var modalbody=$('<div class="modal-body">').append('<p>数据加载失败');
													var modal=$('<div class="modal fade" id="ajaxError">').append(modalheader)
																																	.append(modalbody);
													$('body').append(modal);
													$('#ajaxError').modal('show');
												}
											else
											{
												$('#searchFriendResult').empty();
						
												
												for (var i=0;i<(result.result.length-1);i++)
												{
												
												var imgData=$('<div class="imgData">').append('<a href="http://www.days366.com/friend/friendmainpage?id='+result.result[i].friendId+'"'+' >'+'<img src="http://www.days366.com/userImg/userimg/small/'+result.result[i].userImg+'" alt="这是用户的头像" />'+'</a>');

												var textData=$('<div class="textData">').append('<h4><span><a href="http://www.days366.com/friend/friendmainpage?id='+result.result[i].friendId+'"'+' >'+result.result[i].userName+'</a></span>&nbsp;&nbsp;'+result.result[i].userBirthday+'</hr>')
																											.append('<h4><span>'+result.result[i].userUs+'</span></h4>');
												var button=$('<h4>').append('<a class="collect" data-toggle="modal" data="'+result.result[i].friendId+'" href="#collectFriend" ><button class="btn">收藏此人</button></a></h4>');
												var friendInfo=$('<div class="friendInfo thumbnail">').append('<div class="blue" ></div>')
																					.append(imgData)
																					.append(textData)
																					.append(button);
											
												$('#searchFriendResult').append(friendInfo);
											}
												

											}
									},
									error:function()
									{
										var modalheader=$('<div class="modal-header">').append('<a class="close" data-dismiss="modal">&times;</a><h3>注意</h3>');
										var modalbody=$('<div class="modal-body">').append('<p>数据加载失败');
										var modal=$('<div class="modal fade" id="ajaxError">').append(modalheader)
																														.append(modalbody);
										$('body').append(modal);
										$('#ajaxError').modal('show');
									}
								}

								);

				});	


		});




</script>
{/literal}
</body>