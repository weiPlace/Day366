 <!doctype html>
<html lang="zh-CN">
<head>
{config_load file="smarty.config.ini" section="path" scope="global" }
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="Keywords" content="day,birthday,days366,大学,同学,朋友,交友,每一天" />
<meta name="Description" content="remember every day!,记住每一天" />
<title>{$userName|default:'days366'}</title>
<link rel="stylesheet" href="{#css#}bootstrap.min.css"/>
<link rel="stylesheet" href="{#css#}style.css" />
<link rel="stylesheet" href="{#css#}global.css" />
<!--[if lt IE 10]>
	<link rel="stylesheet" href="{#css#}fixie.css" />
<![endif]-->
<script type="text/javascript"  src="{#js#}jquery-1.7.1.min.js"></script>
<script type="text/javascript"  src="{#js#}bootstrap.min.js"></script>
<script type="text/javascript"  src="{#js#}jquery.validate.min.js"></script>
</head>
<body>
<div class="container" id="findPassDiv">
{include file="day.tpl"}
<div class="row">
<div class="span10 offset1 thumbnail"><div class="blue"></div>
{if $error|my_count}

   	<label class="{$style|default:'error'}">{$error.0}</label>
{/if}

<div id="findPass">
		<h3>找回密码<a href="{#public#}account">点此返回</a></h3><hr />
	<form method="POST" action="{#public#}validnoid/findpass"  class="form-horizontal" id="findPassForm" onSubmit="return false;">


		
		<div class="control-group">
			<h2><label class="control-label" for="email">请输入你的邮箱账号</label></h2>
			<div class="controls">
				<input type="text" id='email' name="email" />
			</div>
		</div>
		<div class="controle-group">
			<label for="button" class="controle-label">&nbsp;</label>
			<div class="controls">
				<a href="#show" data-toggle="modal"><button type="submit" class="btn" >提交</button></a>
			</div>
		</div>
	</form>
</div>
</div>
</div>
<div id="fixed">

{include file="footer.tpl"}
</div>
	<div class="modal fade " id="show">
		<div class="modal-header">
			<a class="close" data-dismiss="modal">×</a>
			<h3>注意!</h3>
		</div>
		
		<div class="modal-body">
				<p>网站正处于内测阶段，你不可更改密码
		</div>
		
	</div>

</div>
{literal}
<script type="text/javascript">

$(function()
{
	$('#findPassForm').validate(
	{
		rules:{
			email:{
				required:true,
				email:true
			}
			},
		messages:{	
			email:"请输入一个有效的email地址"
		}
			
	});
});

</script>
{/literal}
</body>
</html>