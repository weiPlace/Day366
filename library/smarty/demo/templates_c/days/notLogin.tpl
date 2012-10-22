{include file="headerNoJs.tpl"}
{literal}
<style>
	#thumbnailDiv {margin-bottom:10px;}
	 h3{margin-left:10px;margin-top:10px;}
	#dayAdd {padding-left:15px;}
	 textarea{width:886px;height:109px}
	#dayAdd a{display:inline-block;}
	#dayAdd a#special{margin-left:400px;}
	div.blue{height:20px;background:#4B5CC4;border-top-left-radius:3px;border-top-right-radius:3px;}
	.item hr{margin-top:0;padding-top:0}
	.content{padding-left:10px;padding-right:10px;}
	.action{padding-left:10px;padding-bottom:10px;}
	.action button{display:inline-block;margin-bottom:5px;}
	#spanAdd{display:inline-block;margin-left:450px;margin-top:10px;font-size:16px;color:#9B7975}
	label{display:inline;}
	#file{display:inline-block;margin-left:200px;}
</style>
{/literal}
<script type="text/javascript" src="{#js#}jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="{#js#}bootstrap.min.js"></script>
<script type="text/javascript" src="{#js#}jquery.masonry.min.js"></script>
</head>
<body>
<div class="container">
{include file="day.tpl"}
<div class="row">
{if $error|my_count|default:''}
   	<label class="error">{$error.0}</label>
 {/if}   
<div class="span12" >
<div class="thumbnail" id="thumbnailDiv">
<div class="blue"></div>
{include file="days/addNotLogin.tpl"}
</div>

<a href="{#public#}">返回登陆首页</a>
<h3>{$date}大事记</h3>
<hr />
<div id="daysResult" class="thumbnails" >

{foreach from=$result item=item}
<div class="item thumbnail" data="{$item.id}">
	<div class="blue"></div>
	<hr />
	<div class="content"><p>{$item.content}</p></div>
	<div class="action">
		<a href="#action" data-toggle="modal"><span class="dayLike"><button class="btn btn-mini " id="dayLike" ><i class="icon-thumbs-up"></i>喜欢(<span>{$item.like}</span>)</button></span></a>
		<a href="#action" data-toggle="modal"><span class="dayFavourite"><button class="btn btn-mini" id="dayFavourite"><i class="icon-share "></i>收藏(<span>{$item.favourite}</span>)</button></span></a>

	</div>

</div>	

{/foreach}
</div>
</div>
</div>
<div id="action" class="modal fade">

		<div class="modal-header">
			<a class="close" data-dismiss="modal">×</a>
			<h3>你尚未登陆</h3>
		</div>
		<div class="modal-body">
			<p>因为你尚未登陆或者尚未注册，所以你无法添加喜欢或收藏。请先<a href="{#public#}">登陆</a>或者是<a href="{#public#}account/register">注册</a>。
		</div>
		<div class="modal-footer">
			<button class="btn">确定</button>
		</div>


</div>
{include file="footer.tpl"}
</div>
{literal}
<script type="text/javascript" >

 $(function(){
		$('.modal-footer button').click(function(){$('#knowadd').modal('hide');});
		$('#daysResult').masonry({
		      itemSelector: '.item'
			 });
			$('.modal-footer button').click(function(){$('#action').modal('hide');});
		   });
 		$('dayadd button').click(function(){return false;})

</script>
{/literal}
</body>
</html>