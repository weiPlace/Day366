$(function()
		{
			var month;
			var day;
			$('#wallNav #ulChooseMonth li a').click(function()
					{
						month=$(this).text();
						$('#wallNav #chooseMonth').text(month+'月份');
						$('#wallNav #ulChooseDay').empty();
						chooseDay(month);
					});
			$('#wallNav #ulChooseDay li a').live('click',function(){
						day=$(this).text();
						$('#wallNav #chooseDay').text(day+'日');
						$('a#goToWall').attr('href','http://www.days366.com/wall/chooseday?month='+month+'&day='+day);
			});
	
		});
function chooseDay(month)
{
	switch(month){
	case'1': case'3': case'5': case'7': case'8': case'10': case'12':
	{
		for (var i=1;i<32;i++)
		{
			$('#wallNav #ulChooseDay').append('<li><a href="#'+i+'">'+i+'</a></li>');
		}
		break;
	}
	case '4':case '6':case '9':case '11':
		{
		for (var i=1;i<31;i++)
		{
			$('#wallNav #ulChooseDay').append('<li><a href="#'+i+'">'+i+'</a></li>');
		}
		break;			
		}
	
	case '2':{
		for (var i=1;i<30;i++)
		{
			$('#wallNav #ulChooseDay').append('<li><a href="#'+i+'">'+i+'</a></li>');
		}
		break;		
	}
		}
}
