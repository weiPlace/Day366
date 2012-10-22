<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>{$userName|default:'days366'}</title>
<link rel="icon" type="image/ico" href="http://www.days366.com/favicon.ico">
{config_load file="smarty.config.ini" section="path" scope="global" }
<link rel="stylesheet" href="{#css#}bootstrap.min.css"/>
<link rel="stylesheet" href="{#css#}style.css" />
<link rel="stylesheet" href="{#css#}add.css" />


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
<script type="text/javascript" src="{#js#}ajaxfileupload.js"></script>
<script type="text/javascript" src="{#js#}jquery.validate.min.js"></script>
<!--[if lt IE 10]>
<link rel="stylesheet" href="{#css#}fixie.css" />
<script type="text/javascript" src="{#js#}ieImageUpload.js"></script>
<![endif]-->
</head>
<body>
{include file="login/day.tpl"}
<div class="container" >
		
		<div class="row" >
			<h4><img src="{#img#}pen.png">&nbsp;Add something for your birthday</h4>
			<hr />
			<div class="span3 thumbnail well" id="addImg">
			<h5 class="hide" id="imageUpload" >Upload image</h5>
				<form method="post" action="#" onSubmit="return false;" id="formImage">
					<input type="file" class="hide" id="file" name="file"/>

					<button class="btn" type="button" id="imgButton"><i class="icon-plus-sign"></i>&nbsp;Add image</button>
					<p class="help-block">Not needed。可是发布图片能使你发布的内容更加精彩。
					
				</form>
				<div class="hide loading"><img src="{#img#}loading.jpg"  /></div>
				<div id="fileSuccess" class="hide">
					<label class="success">Upload Successfully.</label>
				</div>
				<div id="fileError" class="hide"><label class="error">Upload Failed</label></div>
			</div>
			<div class="span8 thumbnail well" id="main">
				{if $error|my_count}
				   	<label class="error">{$error.0}</label>
				{/if}
				<form method="post" class="form-horizontal" id="formMain" action="{#public#}days/save">
						<input type="hidden" value="none" name="hiddenImg" id="hiddenImg"/>
						<div id="title" class="control-group">
							<label class="control-label">Title</label>
							<div class="controls">
							<input type="text" class="span7" id="title" name="title"/>
							<p class="help-block">Not needed.	
							</div>			
						</div>
					
						<div id="content" class="control-group">
							<label class="control-label">Content</label>
							<div class="controls">
								<textarea class="span7" id="content" name="content"></textarea>
								<p class="help-block">The label&lt;br&gt; help you line feed.							
							</div>

						</div>
					
						<div id="link" class="control-group">
							<label class="control-label">Hyperlink</label>
							<div class="controls">
								<input type="text" class="span7" value="http://" name="href" id="href">
								<p class="help-block">Not needed,来源URL即为你想分享的照片,文章等的出处，它帮助你的朋友更容易阅读，分享它。							
							</div>
						</div>
						<div class="control-group">
							<div class="controls">
								<button class="btn btn-info">Publish</button>								
							</div>
					
						</div>
						
				</form>
			</div>
		{include file="footer.tpl"}
	</div>
</div>
<script type="text/javascript" src="{#js#}microBlog/display.js"></script>

</body>
</html>
