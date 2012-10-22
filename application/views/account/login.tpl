<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>{$userName|default:'days366'}</title>
<link rel="icon" type="image/ico" href="http://www.days366.com/favicon.ico">
{config_load file="smarty.config.ini" section="path" scope="global" }
<link rel="stylesheet" href="{#css#}bootstrap.min.css"/>
<link rel="stylesheet" href="{#css#}login.css" />
<!--[if lt IE 10]>
<link rel="stylesheet" href="{#css#}fixie.css" />
<![endif]-->
<!--[if lt IE 8]>
<script type="text/javascript">
	window.location.href="http://www.days366.com/global/mainifesto#browser"
</script>
<![endif]-->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script type="text/javascript">
 !window.jQuery && document.write("<script type=\"text/javascript\" src=\"http://www.days366.com/js/jquery-1.7.1.min.js\"><\/script>");
</script>
<script type="text/javascript"  src="{#js#}jquery.validate.min.js"></script>
</head>
<body class="days366">
<div class="header row">
				<div class="span10 offset1">
					<div class="pull-left">
						<img src="{#img#}logo.png" alt="this is logo" />
					</div>

				</div>
</div>
	<div class="container">	
		<div class="row">

			<div class="row" id="mainpage">
				<div class="span10"  id="login">
						<form method="post" action="{#public#}validnoid/login" id="loginForm" class="form-horizontal">
						<h4>Login</h4>
						<hr />
							<div class="control-group">
					        	<label for="email"  class="control-label">Email</label>
								<div class="controls">
									<input type="email"  autofocus id="account" placeholder="Email"  name='account'  />
								</div>
							</div> 
					        <div class="control-group">
					        	<label for="password" class="control-label">Password</label>
								<div class="controls">
										<input type="password"  id="password" name='password' placeholder="Password"  />
								</div>
					        </div>
					    	<div class="control-group" id="btn-login">
								<label for="button" class="control-label">&nbsp;</label>
								<div class="controls">
									<button class="btn btn-small">Login</button>
									<a class="btn btn-info btn-small" href="{#public#}account/register" id="register">Register</a>
								</div>
							</div>
							<div class="control-group">
								<label for="foget" class="control-label">&nbsp;</label>
								<div class="controls">
									<a href="{#public#}account/findpass">?Forget your password</a>&nbsp;&nbsp;&nbsp;<a href="{#public#}days">Return to public page</a>
								</div>
							</div>							
						</form>
						{if $error|my_count}
						   	<label class="error" id="loginError">{$error.0}</label>
						 {/if}  
				</div>
			</div>
			{include file="footer.tpl"}
		</div>
	</div>
{literal}
<script type="text/javascript" >
$(function(){$('#loginForm').validate({rules:{account:{required:true,email:true},password:{required:true}},messages:{account:"&nbsp;&nbsp;请输入一个有效的email地址",password:{required:"&nbsp;&nbsp;请输入密码"}}});});
</script>
{/literal}
<script type="text/javascript" src="{#js#}gg.js"></script>
</body>
</html>


