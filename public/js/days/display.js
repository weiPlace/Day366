$(function()
		{
	var d=new Date();
	$('#imgButton').click(function(){
		$('#file').click();
	});
	$('#file').change(function(){
		$('#formImage').submit();
	});
	$('textarea').keydown(function(e)
					{
						if (e.which == 13)
						{
							$(this).val($(this).val()+'<br>');
						}
					});
			
	$('#formImage').submit(function(){
		$(".loading").ajaxStart(function(){

            $(this).show();
        })
        .ajaxComplete(function(){
            $(this).hide();
        });

	$.ajaxFileUpload(
	{
		url:'http://www.days366.com/days/imagesave',
		timeout:3000,
		secureuri:false,
		fileElementId:'file',
		dataType:'json',
		success:function(data,status){
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
		}
	);
return false;		
	});
	$('#formMain').validate({
		rules:{
			title:{
				maxlength:100
			},
			content:{
				required:true,
				maxlength:1400
			},
			href:{
				maxlength:400
			}
		},
		messages:{
			title:
			{
				maxlength:"标题超过最大长度"
			},
			content:
				{
				required:"内容不能为空",
				maxlength:"内容超过1400字符限制"
			},
			href:{
				maxlength:"链接超过最大长度"
			}
		}		
	});
});
	
