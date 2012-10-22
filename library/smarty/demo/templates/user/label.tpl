{include file="headerNoJs.tpl"}
{literal}
<style>
#info{margin-left:50px;margin-right:50px;}
#info h3{margin-top:10px;}
#imgData{margin-left:50px;margin-right:50px;}
#imgData h3{margin-top:10px;}
.thumbnail{margin-bottom:20px;}
</style>
{/literal}
<script type="text/javascript" src="{#js#}jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="{#js#}bootstrap.min.js"></script>

</head>
<body>
<div class="container">


{include file="login/day.tpl"}
<div class="row">

{include file="login/colNav.tpl"}
<div class="span9">
{if $error|my_count}
   	<label class="error">{$error.0}</label>
{/if}
<div class="thumbnail">
<div class="blue"></div>
<form class="form-horizontal" id="info">
			
			<h3>你的个人资料</h3>
			<hr />

			<a href="{#public#}userinfo/index">更改资料</a>
			<div class="control-group">
				<label class="control-label">姓名：</label>
				<div class="controls">
					<label class="control-label">{$people}</label>
				</div>
			</div>
						
			<div class="control-group">
				<label class="control-label">性别：</label>
				<div class="controls">
					<label class="control-label">{$gender}</label>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">生日：</label>
				<div class="controls">
					<label class="control-label">{$birthday}</label>
				</div>
			</div>			
			<div class="control-group">
				<label class="control-label">故乡：</label>
				<div class="controls">
					<label class="control-label">{$hometown}</label>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">故乡邮编：</label>
				<div class="controls">
					<label class="control-label">{$zip}</label>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">大学：</label>
				<div class="controls">
					<label class="control-label">{$us}</label>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">设置的权限：</label>
				<div class="controls">
					<label class="control-label">{$permit}</label>
				</div>
			</div>

				
</form>	
</div>
<div class="thumbnail">
<div class="blue"></div>	
<div id="imgData">
		<h3>你的头像</h3>
		<hr />
		<a href="{#public#}userinfo/changeimg" >修改你的头像</a>
	
		<img src="{#imgfinish#}{$img}" alt="这是你的头像" />	

	</div>
</div>
</div>
{include file="footer.tpl"}

</div>
</body>