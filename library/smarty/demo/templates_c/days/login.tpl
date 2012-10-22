{include file="header.tpl"}
<script type="text/javascript" src="{#js#}jquery.masonry.min.js"></script>
<script  type="text/javascript" src="{#js#}jquery.validate.min.js"></script>
<script type="text/javascript" src="{#js#}ajaxfileupload.js"></script>
</head>
<body>
<div class="container">
{include file="login/day.tpl"}
<div class="row">
{if $error|my_count|default:''}
   	<label class="error">{$error.0}</label>
 {/if}   
<div class="span12" >
{include file="login/rowNav.tpl"}
<div class="thumbnail publicDay" id="thumbnailDiv">
<div class="blue" ></div>
{include file="days/add.tpl"}
</div>

<h3>{$date}大事记</h3>
<div id="month" style="display:none">{$month}</div>
<div id="day" style="display:none">{$day}</div>
<hr />
<div id="daysResult" class="thumbnails">

{foreach from=$result item=item}
<div class="item thumbnail" data="{$item.id}" >
	<div class="blue"></div>
	<hr />
	<div class="content"><p>{$item.content}</p></div>
	<div class="action">
		<span class="dayLike"><button class="btn btn-mini " id="dayLike" ><i class="icon-thumbs-up"></i>喜欢(<span>{$item.like}</span>)</button></span>
		<span class="dayFavourite"><button class="btn btn-mini" id="dayFavourite"><i class="icon-share "></i>收藏(<span>{$item.favourite}</span>)</button></span>
	</div>

</div>	

{/foreach}
</div>
</div>
</div>

{include file="footer.tpl"}
</div>
{literal}
<script type="text/javascript" >

 $(function(){

		$('#formDayAdd').validate(
				{
					rules:{textareaContent:{required:true,maxlength:280}},
					messages:{textareaContent:{required:"输入不能为空",maxlength:"字符数不应超过140字符"}}

				});
		$('#formImage').validate(
				{
					rules:{
						file:{required:true}
							},
					messages:
						{
							file:{required:"你还未添加图片"}
						}
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
		$('.modal-footer button').live('click',function(){$('#ajaxWarning').modal('hide');});
		$('#formDayAdd').live('submit',function()
				{

						$.ajax(
									{
										dataType:'json',
										type:"POST",
										data:{content:$('textarea').val(),month:$('#month').text(),day:$('#day').text()},
										url:'http://www.days366.com/days/dayadd',
										success:function(data)
										{
			
											var result=data;
											remove();
											if (result.result.state=='fail')
											{
															days366Error();
															return 1;
											}
											addDaySuccess();

										},

										error:function()
										{
											remove();
											days366Error();
										}
										});
								return false;
					});

		
		$('.modal-footer button').click(function(){$('#knowadd').modal('hide');});
		$('#daysResult').masonry({
		      itemSelector: '.item'
			 });
		$('.dayLike button').live('click',function()
				{
					var item=$(this).parent().parent().parent();
					var itemId=item.attr('data');
					var itemMonth=$('#month').text();
					var number=$(this).children('span').text();
					number=parseInt(number);
					var button=$(this);	
					$.ajax(
							{
								async:false,
								dataType:'json',
								global:true,
								url:'http://www.days366.com/days/like?id='+itemId+"&month="+itemMonth,
								success:function(data)
								{
									var result=data;
									remove();
									if (result.result.state=='fail')
									{
													days366Error();
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
									remove();
									days366Error();
								}
								});
			});
		$('.dayFavourite button').live('click',function()
				{
					var item=$(this).parent().parent().parent();
					var itemId=item.attr('data');
					var itemMonth=$('#month').text();
					var number=$(this).children('span').text();
					number=parseInt(number);
					var button=$(this);	
					$.ajax(
							{
								async:false,
								dataType:'json',
								global:true,
								url:'http://www.days366.com/days/favourite?id='+itemId+"&month="+itemMonth,
								success:function(data)
								{
	
									var result=data;
									remove();
									if (result.result.state=='fail')
									{
													days366Error();
													return 1;
									}
									addFavouriteSuccess();
									button.children('span').text(number+1);
									button.attr('disabled','disabled');

								},
								beforeSend:function()
								{
									addLoading(item);
								},
								error:function()
								{
									remove();
									days366Error();
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
								url:'http://www.days366.com/days/imagesave',
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
										days366Error();
									}
							});
						return false;
				});
		$('#formAllAdd').live('submit',function()
				{
					var item=$(this).parent();
					var imgId=$('#imgHidden').val();
					if (!!imgId==""){$(this).append('<p><label class="error" >请先上传图片</label>');return false;}
					
					$.ajax(
							{
								dataType:'json',
								type:"POST",
								data:{content:$('#imageContent').val(),id:imgId,month:$('#month').text(),day:$('#day').text()},
								url:'http://www.days366.com/days/dayadd',
								success:function(data)
								{
	
									var result=data;
									remove();
									if (result.result.state=='fail')
									{
													days366Error();
													return 1;
									}
									addDaySuccess();

								},

								error:function()
								{
									remove();
									days366Error();
								}
							});
						return false;
				});
 });

function addLoading(selector)
 {
	selector.children('p').after('<div id="loading" ><img src="http://www.days366.com/img/loading.jpg" alt="loading" /></div>');
	return true;
}
function remove()
{
		$('#loading').remove();	

}
function days366Error()
{

	var modalheader=$('<div class="modal-header">').append('<a class="close" data-dismiss="modal">&times;</a><h3>发生错误</h3>');
	var modalbody=$('<div class="modal-body">').append('<p><span class="label label-warning" style="font-size:14px">数据保存失败</span>');
	var modal=$('<div class="modal fade" id="ajaxWarning">').append(modalheader)
																					.append(modalbody);
	$('body').append(modal);
	$('#ajaxWarning').modal('show');
	setTimeout(hide,3000);
	return 1;
}
function hide()
{
	$('#ajaxWarning').modal('hide');
	$('#ajaxWarning').remove();
}
function addFavouriteSuccess()
{
	var modalheader=$('<div class="modal-header">').append('<a class="close" data-dismiss="modal">&times;</a><h3>收藏成功</h3>');
	var modalbody=$('<div class="modal-body">').append('<p><span  style="font-size:14px">你已经成功收藏了此信息。</span>');
	var modalfooter=$('<div class="modal-footer" id="addFavouriteSuccess">').append('<button class="btn">确定</button>');
	var modal=$('<div class="modal fade" id="ajaxWarning">').append(modalheader)
																					.append(modalbody)
																					.append(modalfooter);
	$('body').append(modal);
	$('#ajaxWarning').modal('show');
	setTimeout(hide,2000);
	return 1;
}

function addDaySuccess()
{
	var modalheader=$('<div class="modal-header">').append('<a class="close" data-dismiss="modal">&times;</a><h3>发送成功</h3>');
	var modalbody=$('<div class="modal-body">').append('<p><span  style="font-size:14px">感谢你为我们的数据库贡献了一份力量，我们会尽快进行回复</span>');
	var modalfooter=$('<div class="modal-footer" id="addFavouriteSuccess">').append('<button class="btn">确定</button>');
	var modal=$('<div class="modal fade" id="ajaxWarning">').append(modalheader)
																					.append(modalbody)
																					.append(modalfooter);
	$('body').append(modal);
	$('#ajaxWarning').modal('show');
	return 1;
}

	


</script>
{/literal}
</body>
</html>