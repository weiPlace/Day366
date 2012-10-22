<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>{$userName|default:'days366'}</title>
<link rel="icon" type="image/ico" href="http://www.days366.com/favicon.ico">
{config_load file="smarty.config.ini" section="path" scope="global" }
<link rel="stylesheet" href="{#css#}bootstrap.min.css"/>
<link rel="stylesheet" href="{#css#}style.css" />
<link rel="stylesheet" href="{#css#}wall.css" />
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
<div class="container" >
	<div class="row" >
		<div class="span10 offset1">
			{include file="days/nav.tpl"}		
		</div>

	</div>
</div>
<div class="container">
	<div class="row">
	<h4>List</h4>
	<p>每一天都应该拥有自己的标签，你可以为你出生的一天添加各种各样的内容。我们会根据内容为这一天定义标签，如电影,艺术,城市，并且随着内容的发展，我们会增加小标签，如电影.爱情,电影.励志。方便大家查找
	<table class="table table-striped">
	              <thead>
	                <tr>
	                  <th>天数</th>
	                  <th>标签</th>
	                  <th>描述</th>
	                </tr>
	              </thead>
	              <tbody>
	                <tr>
	                  <td>9月12号</td>
	                  <td>文化</td>
	                  <td>近代西方思想史的三大发现</td>
	                </tr>
	                <tr>
	                  <td>9月13号</td>
	                  <td>电影</td>
	                  <td>肖申克的救赎</td>
	                </tr>
	                <tr>
	                  <td>9月14号</td>
	                  <td>城市</td>
	                  <td>南京</td>
	                </tr>
	                <tr>
	                  <td>9月15号</td>
	                  <td>电影</td>
	                  <td>电子情书</td>
	                </tr>
	                <tr>
	                  <td>9月16号</td>
	                  <td>动漫</td>
	                  <td>海贼王,七龙珠</td>
	                </tr>
	                <tr>
	                  <td>9月17号</td>
	                  <td>历史</td>
	                  <td>波兰战争</td>
	                </tr>
	                <tr>
	                  <td>9月19号</td>
	                  <td>人物</td>
	                  <td>朱光潜</td>
	                </tr>
	                <tr>
	                  <td>9月20号</td>
	                  <td>球队</td>
	                  <td>AC米兰,曼城</td>
	                </tr>
	                <tr>
	                  <td>9月21号</td>
	                  <td>国家</td>
	                  <td>瑞士</td>
	                </tr>
	                <tr>
	                  <td>9月22号</td>
	                  <td>书籍</td>
	                  <td>悲惨世界</td>
	                </tr>
	                <tr>
	                  <td>9月23号</td>
	                  <td>电影</td>
	                  <td>阿甘正传</td>
	                </tr>
	                <tr>
	                  <td>9月24号</td>
	                  <td>艺术</td>
	                  <td>蒙娜丽莎</td>
	                </tr>
	                <tr>
	                  <td>9月25号</td>
	                  <td>书籍</td>
	                  <td>活着</td>
	                </tr>
	              </tbody>
	</table>
	<p class="success">更新中...</p>	
	</div>
</div>
<div class="container">
	<div class="row">
		{include file="footer.tpl"}
	</div>
</div>
<script type="text/javascript" src="{#js#}days366.js"></script>
{literal}
<script type="text/javascript">
$(function(){
	$('#wallNav .add div').popover({
				title:"Tips",
				content:"You only can add something for your birthday",
				placement:'bottom',
				trigger:'hover'
			});
});
</script>
{/literal}
</body>
</html>