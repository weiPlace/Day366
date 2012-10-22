{include file="header.tpl"}
</head>
<body>
<div class="container">

{include file="login/day.tpl"}
<div class="row">
{include file="login/colNav.tpl"}
<div class="span8 thumbnail" style="height: 400px;">
		<div class="blue"></div>
		<fieldset >
			<legend class="accordion-heading">个人头像设置</legend>
			<div id="formImage">
			<form method="post"  id="userimg" action="{#public#}valid/userimg"	 class="form-horizontal" enctype="multipart/form-data">
				<div >
					<label for="file" class="control-label">上传头像</label>
					<div class="controls">
						<input type="file" name="file" />
						<button type="submit"  class="btn " name="submit" id="submit" >提交</button>
					</div>
					<input type="hidden"  value="{$time}" id="photoId" name="photoId" />
			 </div>
		</form>
		{if $error|my_count}
   		<label class="error">{$error.0}</label>
   		{/if}   
		<div id="uploadImgAttention">
			<p><span class="label label-warning">图片大小不应该大于4M</span> 
			<p><span class="label label-warning">只支持png,jpg,gif格式</span>
			<p><span class="label label-warning">若图片过大，可以先进行裁剪再上传</span>
			<p><span class="label label-warning">你上传动画片将会被拒绝！</span>
			
		</div>
		</div>
	
		</fieldset>
</div>
</div>
{include file="footer.tpl"}
</div>
</body>
</html>