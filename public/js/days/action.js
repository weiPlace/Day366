var container = $('.result');
 $(function()
		 {
		container.imagesLoaded(function(){
			container.masonry({
			itemSelector : '.item'

			  });
			});
		var userImg=$('#userImage').text();
		var userName=$('#userName').text();
		var d=new Date();
		var month=$('#month').text();
	 	var id;
	 	var month=$('#month').text();
	 	var day=$('#day').text();
		var month=$('#month').text();
				$('.result .dayLike button').live('click',function()
						{
					var item=$(this).parent().parent().parent().parent();
					var itemId=item.attr('data');
					var number=$(this).children('span').text();
					
					number=parseInt(number);
					var button=$(this);	
					$.ajax(
							{
					async:false,
					dataType:'json',
					global:true,
					url:'http://www.days366.com/days/like?id='+itemId,
					success:function(data)
					{
						var result=data;
						Remove();
						if (result.result.state=='fail')
						{
										Error();
										return 1;
						}
					
						button.children('span').text(number+1);
						button.attr('disabled','disabled');							
						},

					error:function()
					{

						Error();
					}
					});

								});

				$('.result .dayFavourite button').live('click',function()
						{
					var item=$(this).parent().parent().parent().parent();
					var itemId=item.attr('data');
					var number=$(this).children('span').text();
					number=parseInt(number);
					var button=$(this);	
					$.ajax(
							{
					async:false,
					dataType:'json',
					global:false,
					url:'http://www.days366.com/days/favourite?id='+itemId,
					success:function(data)
					{
						var result=data;
						button.children('span').text(number+1);
						button.attr('disabled','disabled');							
						}
					});
			});

		 });