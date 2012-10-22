<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://www.days366.com/css/bootstrap.min.css"/>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script type="text/javascript">
 !window.jQuery && document.write("<script type=\"text/javascript\" src=\"http://www.days366.com/js/jquery-1.7.1.min.js\"><\/script>");
</script>
<script type="text/javascript" src="http://www.days366.com/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://www.days366.com/js/ajaxfileupload.js"></script>
</head>
<body>
				<form method="post" action="#" onSubmit="return false;" id="formImage">
					<input type="file"  id="file" name="file" />
					<button  id="imageUpload"  class="btn" type="submit">click</button>
					<button class="btn" type="button" id="imgButton"><i class="icon-plus-sign"></i>&nbsp;添加图像</button>
					<p class="help-block">非必需。可是发布图片能使你发布的内容更加精彩。
					
				</form>

</body>
<script type="text/javascript">
$(function(){
	$('#imgButton').click(function(){
		$('#file').dblclick();
	});
	$('#file').change(function(){
		$('#formImage').submit();
	});
	$('#formImage').live('submit',function()
			{
							$.ajaxFileUpload
							({
	/*							url:'http://www.days366.com/twitter/imagesave',
								timeout:3000,
								async:false,
								secureuri:false,
								fileElementId:'file',
								dataType:'json',
								success:function(data,status){
									alert('success');
									var result=data;
									if(result.result.state=='fail'){
										$('#formImage').show();
										$('#formImage').append('<label class="error">'+result.result.message+'"</label>"');
										return 1;
										}
									$('#formAllAdd #imgHidden').val(result.result.id);
									$('.tab-pane label').removeClass('hidden');},
								error:function(data,status,e)
									{
									alert('fail');}
								}
							*/
								url:'http://www.days366.com/twitter/imagesave',
								async:false,
								secureuri:false,
								fileElementId:'file',
								dataType:'json',
								success:function(data,status){
									alert('hello');
									var result=data;
									alert(result.result.id);
									var result=data;
									if (result.result.state=='fail')
										{		
											$('#fileError').children('label').text(result.result.message);
											$('#fileError').show();
											$('#imageFile').val('');
								
										}
										$('#fileSuccess').show();
										$('#imageFile').val('');
										$('#hiddenImg').val(result.result.id);
										
									},

									error:function(data,status,e)
										{
											alert(e);
											$('#fileError').show();
											$('#imageFile').val('');
											
										}
			});
							return false;
							});	
});

</script>
</html>