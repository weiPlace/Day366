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


	<h3 >搜索你的好友</h3>
	<hr />
	<form method="POST" class="form-inline"  action="{#public#}search/name">
		<input type="search"  class="input-medium search-query span3"  id="search"  name="search"  placeholder="举例：北京大学  董敏"/>
		<button type="submit" class="btn"  id="search" ><i class="icon-search"></i>&nbsp;搜索</button>
		<span id="searchInline">
			<input type="radio" name="type"  value="day"  id="day">日期
			<input type="radio" name="type" value="people"  checked id="people">人名
		</span>

	</form>
	{if $error|my_count}
   	<label class="error">{$error.0}</label>
   	{/if} 

   	<div id="searchFriendResult" >
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
		<h4><a href="#deleteFriend" data-toggle="modal"  class="delete" data="{$item.user_id}"><button class="btn" >禁止</button></a></h4>
   	</div>
   	{/foreach}
   	</div>
   	<div class="modal fade" id="deleteFriend" >
   
	    <div class="modal-header">
	    <a class="close" data-dismiss="modal">×</a>
	    <h3>禁止</h3>
	    </div>
	    <div class="modal-body">
	    <p>你确定不让此人收藏?</p>
	    <p>如若你按了确认键，你将会从此人的收藏列表中踢出，他将不会收到你以后的任何信息！
	    </div>
	    <div class="modal-footer">
	    <button class="btn" id="deleteFriendButton" >确定</button>
	    </div>
	</div>
   	{*已设定好分页导航的样式,id=page*}
   	{$pageNumber|my_forpage}
</div>
</div>
{include file="footer.tpl"}
</div>
{literal}
<script type="text/javascript">


	var userId;
	$(function()
			{

				$('#page ul li a').click(function()
						{
							var number=$(this).attr('value');
							$.getJSON('http://www.days366.com/befriend/choosepage?pageNumber='+number,function(data)
									{
										var result=data;
										$('#searchFriendResult').empty();
										for (var i=0;i<result.result.length;i++)
											{
		
											var imgData=$('<div class="imgData">').append('<a href="http://www.days366.com/friend/friendmainpage?id='+result.result[i].friendId+'"'+' >'+'<img src="http://www.days366.com/userImg/userimg/small/'+result.result[i].userImg+'" alt="这是用户的头像" />'+'</a>');
											var textData=$('<div class="textData">').append('<h4><span><a href="http://www.days366.com/friend/friendmainpage?id='+result.result[i].friendId+'"'+' >'+result.result[i].userName+'</a></span>&nbsp;&nbsp;'+result.result[i].userBirthday+'</hr>')
																										.append('<h4><span>'+result.result[i].userUs+'</span></h4>');
											var button=$('<h4>').append('<a href="#deleteFriend" data-toggle="modal" class="delete"  data="'+result.result[i].friendId+'"  ><button class="btn ">禁止</button></a>');
											var friendInfo=$('<div class="friendInfo thumbnail">').append('<div class="blue"></div>')
																				.append(imgData)
																				.append(textData)
																				.append(button)

										
											$('#searchFriendResult').append(friendInfo);
										}
								
								});
							});
				$('#search').popover(
						{
							title:'注意!',
							trigger:'focus',
							placement:'bottom',
							content:"<p>如果你想寻找好友，选择人名单选按钮:</p><p>&nbsp;&nbsp;并输入\"北京大学 董敏\"的形式</p><p>如果你想寻找同一天出生的人，选择日期单选按钮</p><p>&nbsp;&nbsp;请输入1992-01-01或01-01的形式</p><p>如果你想知道特定日期发生的大事记</p><p>&nbsp;&nbsp;请在导航条上选择对应的日期</p>",						
						});
				$('.friendInfo a.delete').live('click',function(){userId=$(this).attr('data');});
				$('#deleteFriendButton').live('click',function()
					{
						$.ajax({
							url:'http://www.days366.com/befriend/delete?id='+userId,
							dataType:'json',
							success:function(data)
							{
									$('#deleteFriend').modal('hide');
									var result=data;
									if (result.result.state=='fail')
									{
										var modalheader=$('<div class="modal-header">').append('<a class="close" data-dismiss="modal">&times;</a><h3>取消收藏</h3>');
										var modalbody=$('<div class="modal-body">').append('<p>数据操作失败');
										var modal=$('<div class="modal fade" id="ajaxError">').append(modalheader)
																														.append(modalbody);
										$('body').append(modal);
										$('#ajaxError').modal('show');
									}
								else
									{
									var modalheader=$('<div class="modal-header">').append('<a class="close" data-dismiss="modal">&times;</a><h3>成功</h3>');
									var modalbody=$('<div class="modal-body">').append('<p><span class="label label-success" style="font-size:14px">你已成功从此人的收藏列表中移除</span>');
									var modal=$('<div class="modal fade" id="ajaxError">').append(modalheader)
																													.append(modalbody);
									$('body').append(modal);
									$('#ajaxError').modal('show');

									}									
							},
							error:function()
							{
								
								var modalheader=$('<div class="modal-header">').append('<a class="close" data-dismiss="modal">&times;</a><h3>取消收藏</h3>');
								var modalbody=$('<div class="modal-body">').append('<p>数据操作失败');
								var modal=$('<div class="modal fade" id="ajaxError">').append(modalheader)
																												.append(modalbody);
								$('body').append(modal);
								$('#ajaxError').modal('show');

							}
				
							});
					});
					

		});


</script>
{/literal}
</body>
</html>