<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
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
</head>
<body>
		<div class="header row">
			<div class="span10 offset1">
				<div class="pull-left">
					<img src="{#img#}logo.png" alt="this is logo" />
				</div>
			</div>
		</div>
<div class="container" >
	<div class="row"> 

		<div class="row">
			<div class="span12">
    
				<h4>Register&nbsp;&nbsp;<a href="{#public#}twitter/index" style="font-size:13px;">Return to the login page</a></h4>
				<hr />
			    <form id="registerForm" method="POST" class="form-horizontal" action="{#public#}validnoid" >
			    	<div id="formMain">
						<div class="control-group">
				        	<label for="email"  class="control-label">Your Email</label>
							<div class="controls">
								<input type="email"  id="email" placeholder="Email"  name='email'/>
							</div>
						</div> 
				        <div class="control-group">
				        	<label for="password" class="control-label">Your Password</label>
							<div class="controls">
								<input type="password" id="password" name='password' placeholder="Password"/>
							</div>
				        </div>
						<div class="control-group">
				        	<label for="repeatPassword" class="control-label">Repeat Your Pass</label>
							<div class="controls">
								<input type="password"  id="repeatPassword" name='repeatPassword' placeholder="Repeat Password"/>
							</div>
						</div>

	
						<div class="control-group">
							<label for="button" class="control-label">&nbsp;</label>
							<div class="controls">
								<button type="submit" class="btn btn-small" id="registerButton">Register</button>
							</div>
						</div>
					</div>
				
				</form>
				{if $error|my_count}
				<div id="registerError">
			   	<label class="error">{$error.0}</label>
			   	</div>
			   	{/if} 
			</div>
		</div>
	{include file="footer.tpl"}
	</div>
</div>
<script type="text/javascript" src="{#js#}gg.js"></script>
{literal}
<script type="text/javascript">

$(function(){
	$('#registerForm').validate({
		rules:{
			email:{
				required:true,
				email:true
			},
			password:{
				required:true,
				minlength:6,
				maxlength:15
			},
			repeatPassword:{
				required:true,
				equalTo:"#password"
			}

		},
		messages:{
			email:"&nbsp;&nbsp;Please enter an valid email",
			password:{
				required:"&nbsp;&nbsp;Enter password",
				minlength:"&nbsp;&nbsp;Please enter password which is at least over 6 characters",
				maxlength:"&nbsp;&nbsp;The length of password should not be over 15 character."	
			},
			repeatPassword:{
				required:"&nbsp;&nbsp;Repeat Your Pass",
				equalTo:"&nbsp;&nbsp;Not the same pass,enter again"
			}
}
			
	});
});

</script>
{/literal}
</body>

</html>		