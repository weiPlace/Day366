<!doctype html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="Keywords" content="day,birthday,days366,大学,同学,朋友,交友,每一天" />
<meta name="Description" content="remember every day!,记住每一天" />
<title>{$userName|default:'days366'}</title>
<link rel="icon" type="image/ico" href="http://www.days366.com/favicon.ico">
{config_load file="smarty.config.ini" section="path" scope="global" }
<link rel="stylesheet" href="{#css#}bootstrap.min.css"/>
<link rel="stylesheet" href="{#css#}twitter.css" />
<link rel="stylesheet" href="{#css#}style.css" />
<link rel="stylesheet" href="{#css#}jquery.Jcrop.css" />
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
<script type="text/javascript" src="{#js#}bootstrap.min.js"></script>
<script type="text/javascript" src="{#js#}jquery.Jcrop.min.js"></script>
</head>
<body>
{include file="login/day.tpl"}
<div class="container">
	<div class="row">
		
		<div class="row">
			<div class="span9">
				<div class="span8 thumbnail" id="primaryPic">
						<div id="formImage">
						<h4>&nbsp;&nbsp;Please tailor your picture:</h4>
						<hr />
						<div id="imgArea">
							<img src="{#userimg#}{$img}"  id="target" alt="这是你的头像" class="thumbnail"/>
						</div>
						
						<form action="{#public#}valid/imgfinish" method="post" >
							<input type="hidden" id="x" name="x" />
							<input type="hidden" id="y" name="y" />
							<input type="hidden" id="w" name="w" />
							<input type="hidden" id="h" name="h" />
							<input type="hidden" id="img" name="img" value="{$img}" />
							<input type="submit"  class="btn btn-samll btn-info" value="Submit"  />
						</form>
			 	 	</div>
				</div>
			</div>
		</div>
	{include file="footer.tpl"}
	</div>
</div>
<script type="text/javascript" src="{#js#}days366.js"></script>
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

$('form').submit(function()
	{	
	if (parseInt($('#w').val())) {return  true;}
	$('.span9 form .btn').popover(
			{
				title:"提醒",
				content:'你必须选择一个有效的图像区域(必须进行裁剪)'
				}
			);
	$('form .btn').popover('show');
	return false;
	});



</script>
{/literal}
	</body>
</html>