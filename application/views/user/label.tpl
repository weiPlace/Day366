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
<script type="text/javascript" src="{#js#}jquery.masonry.min.js"></script>
<script type="text/javascript" src="{#js#}jquery.imagesloaded.min.js"></script>
</head>
<body>
{include file="login/day.tpl"}
<div class="container">

	<div class="row">
		
		<div class="row">
			<div class="span9">
				{if $error|my_count}
				   	<label class="days366Success">{$error.0}</label>
				{/if}
				<div class="row" id="addItem">
					<div class="span302">
						<a href="{#public#}userinfo/changeimg" title="修改头像">
							<img src="{#imgfinish#}{$userImg}" alt="这是用户的头像" style="width:80px;height:80px" />
						</a>
						<p><a href="{#public#}userinfo/changeimg">Change </a>
					</div>
					<div class="span7 thumbnail">
						<form class="form-horizontal" id="info">
									
									<h4>&nbsp;&nbsp;Personal Settings<a href="{#public#}userinfo/index" style="font-size:13px">(Change )</a></h4>
									<hr />
									<div class="control-group">
										<label class="control-label">Name</label>
										<div class="controls">
											<label class="control-label">{$people}</label>
										</div>
									</div>
												
									<div class="control-group">
										<label class="control-label">Gender</label>
										<div class="controls">
											<label class="control-label">{$gender}</label>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Birthday</label>
										<div class="controls">
											<label class="control-label">{$birthday}</label>
										</div>
									</div>			
									<div class="control-group">
										<label class="control-label">Hometown </label>
										<div class="controls">
											<label class="control-label">{$hometown}</label>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">University</label>
										<div class="controls">
											<label class="control-label">{$us}</label>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Purview</label>
										<div class="controls">
											<label class="control-label">{$permit}</label>
										</div>
									</div>
									
							</form>
					</div>
				</div>

		
		
		</div>	
		</div>
	{include file="footer.tpl"}
	</div>
</div>
<script type="text/javascript" src="{#js#}days366.js"></script>
</body>
</html>