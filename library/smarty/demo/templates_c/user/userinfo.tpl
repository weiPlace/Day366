<head>
{config_load file="smarty.config.ini" section="path" scope="global" }
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="Keywords" content="day,birthday,days366,大学,同学,朋友,交友,每一天" />
<meta name="Description" content="remember every day!,记住每一天" />
<title>{$userName}</title>
<link rel="stylesheet" href="{#css#}bootstrap.min.css"/>
<link rel="stylesheet" href="{#css#}style.css" />
<link rel="stylesheet" href="{#css#}styleLogin.css" />
<!--[if lt IE 10]>
	<link rel="stylesheet" href="{#css#}fixie.css" />
<![endif]-->	
<script type="text/javascript" src="{#js#}jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="{#js#}bootstrap.min.js"></script>
<script type="text/javascript" src="{#js#}jquery.validate.min.js"></script>
</head>
<body>
<div class="container">

{include file="login/day.tpl"}
<div class="row">
{include file="login/colNav.tpl"}

<div class="span9 ">
<div class="thumbnail"  id="formInfo" >
<div class="blue"></div>
<fieldset id="inputUserInfo">
{if $error|my_count}
   	<label class="error">{$error.0}</label>
{/if}

		<legend >
			我们并不需要你填太多资料，仅此而已！
		</legend>
		{include file="user/changeUserInfo.tpl"}

		</fieldset>
</div>
	<div class="modal fade" id='birthdayImportant' >
		<div class="modal-header">
			<a class="close" data-dismiss="modal">×</a>
			<h3>为什么生日如此重要</h3>
		</div>
		<div class="modal-body">
			<p>等你填完你的生日之后:</p>
			<p>你的朋友就可以清楚地知道你的生日</p>
			<p>你可以知道谁和你一起出生,结交同年同月同日出生的好友</p>
			<p>你可以还知道你出生那天世界到底发生了什么重大事件</p>
			<p>所以填完你的生日之后,你可以做的事情真是太多了.....</p>
		</div>
	</div>
	</div>
	<div class="modal fade " id="pop">
		<div class="modal-header">
			<a class="close" data-dismiss="modal">×</a>
			<h3>添加你的大学</h3>
		</div>
		
		<div class="modal-body">
			<p>我们非常抱歉未将你的大学地址收入数据库中，我们希望你能帮助我们了解你的大学。请将你的大学名称填入下文的文本框中。</p>
			<form method="post" action="{#public#}valid/addus" id="formUs">
			<input type="text" class="span6" id="addUs" name="addUs" />
			
			<div class="control-group"><label class="control-label">&nbsp;</label><div class="controls"><button type="submit" class="btn ">提交</button></div></div>
			</form>
		</div>
		
	</div>

	</div>
{include file="footer.tpl"}
	</div>
	<script type="text/javascript" src="http://www.days366.com/js/chooseday.js"></script>
		{literal}
		<script type="text/javascript" >
	
		function chooseProvince(province){
			switch (province){
					case "安徽省":
						universites='AH';
						break;
					case "澳门":
						universites='AM';
						break;
					case "北京市":
						universites='BJ';
						break;
					case "重庆市":
						universites='CQ';
						break;
					case "福建省":
						universites='FJ';
						break;
					case "甘肃省":
						universites='GS';
						break;
					case "广东省":
						universites='GD';
						break;
					case "广西":
						universites='GX';
						break;
					case "贵州省":
						universites='GZ';
						break;
					case "海南省":
						universites='HN';
						break;
					case "河北省":
						universites='HB';
						break;
					case "河南省":
						universites='HeN';
						break;
					case "黑龙江省":
						universites='HLJ';
						break;
					case "湖北省":
						universites='HuB';
						break;
					case "湖南省":
						universites='HuN';
						break;
					case "吉林省":
						universites='JL';
						break;
					case "江苏省":
						universites='JS';
						break;
					case "江西省":
						universites='JX';
						break;
					case "辽宁省":
						universites='LN';
						break;
					case "内蒙古":
						universites='NMG';
						break;
					case "宁夏":
						universites='NX';
						break;
					case "青海省":
						universites='QH';
						break;
					case "山东省":
						universites='SD';
						break;
					case "山西省":
						universites='SX';
						break;
					case "陕西省":
						universites='SiX';
						break;
					case "上海市":
						universites='SH';
						break;
					case "四川省":
						universites='SC';
						break;
					case "台湾省":
						universites='TW';
						break;
					case "天津市":
						universites='TJ';
						break;
					case "西藏":
						universites='XZ';
						break;
					case "香港":
						universites='XG';
						break;
					case "新疆":
						universites='XJ';
						break;
					case "云南省":
						universites='YN';
						break;
					case "浙江省":
						universites='ZJ';
						break;
				}
			return province;
		}
		$(function(){
			$('#usProvince').change(function (){
				$('#us').empty();
				$('#usProvince').live('change',function(){
					$('#us').empty();
				});
				var usProvince=$('#usProvince').val();
				var universities=chooseProvince(usProvince);

			
				$.getScript('http://www.days366.com/js/universites/'+universites+'.js',function(){

					for (i=0;i<us.length;i++){
						$('#us').append("<option value='"+us[i]+"' >"+us[i]+"</option>");
					}
				});
			});
			$('#provinceCities').change(function(){
				$('#city').empty();
				
				$('#provinceCities').live('change',function(){
					$("#city").empty();
				});
				
				var provinceCities=$('#provinceCities').val();
				var city=chooseProvince(provinceCities);
				
				$.getScript('http://www.days366.com/js/cities.js',function(){
						for (i=0;i<cities[provinceCities].length;i++){
						
							
						$('#city').append("<option value='"+cities[provinceCities][i]+"' >"+cities[provinceCities][i]+"</option>");
							}
						
				});
				
			});
			$('#zip').popover(
				{
					title:'注意!',
					trigger:'focus',
					content:"填写邮政编码并不是必须的，但它可以更容易找到你以前的朋友",
				
				}
			);
			$('.name').popover({trigger:'focus',content:"请填写你的真实姓名,从而方便别人找到你"});
			$('#addUs').popover({trigger:'focus',content:"你仅需要填写你的大学名称"});
			$('#userinfo').validate({
				rules:{
					firstname:{
						required:true,
						maxlength:4
					},
					lastname:{
						required:true,
						maxlength:4
					},
					zip:{
						minlength:6,
						maxlength:6
					},
				},
				messages:{
					firstname:
					{
						required:"姓氏不能为空",
						maxlength:"我相信中国没有一个姓氏是超过三个字的，所以请重新输入"
					},
					lastname:
						{
						required:"名字不能为空",
						maxlength:"你所输入的名字位数大于三位，请重新输入"
					},
					zip:"你所输入的邮政编码格式错误！"
				}
			});
			$('#formUs').validate({rules:{addUs:{maxlength:30,required:true}},messages:{addUs:{maxlength:'你输入的大学名称过长,请重新输入.',required:"大学名称不能为空！"}}});	
			
		});
		


		</script>
		{/literal}
	</body>
</html>