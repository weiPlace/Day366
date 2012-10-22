<!doctype html>
<html lang="zh-CN">
<head>
{config_load file="smarty.config.ini" section="path" scope="global" }
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="Keywords" content="day,birthday,days366,大学,同学,朋友,交友,每一天" />
<meta name="Description" content="remember every day!,记住每一天" />
<title>{$title|default:'days366'}</title>
<link rel="stylesheet" href="{#css#}bootstrap.min.css"/>
<link rel="stylesheet" href="{#css#}style.css" />
<!--[if lt IE 10]>
<link rel="stylesheet" href="{#css#}fixie.css" />
<![endif]-->
{literal}
<!--[if lt IE 8]>

<script type="text/javascript">
	window.location.href="http://localhost/web/public/global/mainifesto#browser;
</script>
<![endif]-->


<style>
	.row .span4 form span{display:inline-block;margin-right:-10px;}
	.span4{margin-top:50px;}
	img {display:block;margin-bottom:20px;margin-left:10px;}
	form{margin-left:15px;margin-top:20px;}

</style>
{/literal}
<script type="text/javascript"  src="{#js#}jquery-1.7.1.min.js"></script>

<script type="text/javascript"  src="{#js#}bootstrap.min.js"></script>
<script type="text/javascript"  src="{#js#}jquery.validate.min.js"></script>
</head>
<body>
<div class="container">	
{include file="day.tpl"}

<div class="row">
	<div class="span4 offset4" style="background:#ffffff;"  id="login">
		<img src="{#img#}logo.png" alt="This is logo" />
		<div class="loginForm thumbnail">
		<div class="blue"></div>
		<form method="post" action="{#public#}validnoid/login" id="loginForm">
		<div class="control-group">
        	<label for="email"  class="control-label">你的账号</label>
			<div class="controls">
				<div class="input-prepend" >
					<span class="add-on"><i class="icon-envelope"></i></span>				
					<input type="text"   autofocus id="account" placeholder="请输入你的电子邮箱"  name='account'/>
				</div>
			</div>
		</div> 
        <div class="control-group">
        	<label for="password" class="control-label">你的密码</label>
			<div class="controls">
				<div class="input-prepend">
					<span class="add-on"><i class="icon-lock"></i></span>
					<input type="password"  id="password" name='password' placeholder="请输入你的密码"/>
				</div>
			</div>
        </div>
		<a href="{#public#}account/findpass">?忘记密码</a>
		&nbsp;&nbsp;&nbsp;
		<a href="{#public#}account/register">没有账号,立即注册!</a>
    	<div class="control-group">
			<label for="button" class="control-label">&nbsp;</label>
			<div class="controls">
				<button class="btn" >登陆</button>
			</div>
		</div>

   		</form>


   	{if $error|my_count}
   	<label class="error">{$error.0}</label>
   	{/if}   
</div>
	</div>

</div>
<div id="fixed">
{include file="footer.tpl"}
</div>
</div>
{literal}
<script type="text/javascript" >

$(function(){


	$('#loginForm').validate({
		rules:{
			account:{
				required:true,
				email:true
			},
			password:{
				required:true
			}
		},
		messages:{
			account:"请输入一个有效的email地址",
			password:{
				required:"请输入密码"
			}
		}});


});

</script>
{/literal}
</body>
</html>


