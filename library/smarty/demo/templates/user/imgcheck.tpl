<head>
{config_load file="smarty.config.ini" section="path" scope="global" }
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="Keywords" content="day,birthday,days366,大学,同学,朋友,交友,每一天" />
<meta name="Description" content="remember every day!,记住每一天" />
<title>{$title|default:'days366'}</title>
<link rel="stylesheet" href="{#css#}bootstrap.min.css"/>
<link rel="stylesheet" href="{#css#}style.css" />
<link rel="stylesheet" href="{#css#}styleLogin.css" />
<!--[if lt IE 10]>
<link rel="stylesheet" href="{#css#}fixie.css" />
<![endif]-->
<link rel="stylesheet"  href="{#css#}jquery.Jcrop.css" />
<style rel="stylesheet">
{literal}
#imgArea img{max-width:none;}
#imgArea {margin-bottom:10px;}
{/literal}
</style>
<script type="text/javascript" src="{#js#}jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="{#js#}bootstrap.min.js"></script>
<script type="text/javascript" src="{#js#}jquery.Jcrop.min.js"></script>
</head>
<body>
<div class="container">

{include file="login/day.tpl"}
<div class="row">

{include file="login/colNav.tpl"}

<div class="span8 thumbnail" >
		<div class="blue"></div>
		<fieldset>
			<legend ><a href="#formImage"  >修改你的头像</a></legend>
			<div id="formImage">
			<h4>请对你的头像进行裁剪:</h4>
			<div id="imgArea">
				<img src="{#userimg#}{$img}"  id="target" alt="这是你的头像" class="thumbnail"/>
			</div>
			
			<form action="{#public#}valid/imgfinish" method="post" >
				<input type="hidden" id="x" name="x" />
				<input type="hidden" id="y" name="y" />
				<input type="hidden" id="w" name="w" />
				<input type="hidden" id="h" name="h" />
				<input type="hidden" id="img" name="img" value="{$img}" />
				<input type="submit"  class="btn" value="提交"  />
			</form>
 	 	</div>
 	 	</fieldset>	
</div>

</div>
{include file="footer.tpl"}
</div>
{literal}
<script type="text/javascript">


$(function(){

	$('#target').Jcrop({
		onSelect: updateCoords
	});

});

function updateCoords(c)
{
	$('#x').val(c.x);
	$('#y').val(c.y);
	$('#w').val(c.w);
	$('#h').val(c.h);
};

function checkCoords()
{
	if (parseInt($('#w').val())) return true;
	alert('请选择一个有效的图像区域.');
	return false;
};


</script>
{/literal}
	</body>
</html>