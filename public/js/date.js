$(function()
	{
		$('#chooseDate #monthUp').click(function()
		{
			var text=parseInt($('#dateMonth span').text());
			if (text<12)
			{
				$('#dateMonth span').text(text+1);
			}else
			{
				$('#dateMonth span').text(1);
			}
		});
		$('#chooseDate #monthDown').click(function()
		{
			var text=parseInt($('#dateMonth span').text());
			if (text>1)
			{
				$('#dateMonth span').text(text-1);
			}else
			{
				$('#dateMonth span').text(12);
			}			
		});
		$('#chooseDate #dayUp').click(function()
		{
			var text=parseInt($('#dateMonth span').text());
			var dayText=parseInt($('#dateDay span').text());
			if (text==1 || text==3 || text==5 || text==7 || text== 8 || text==10 || text==12)
			{
				if (dayText<31)
				{
					$('#dateDay span').text(dayText+1);
				}else
				{
					$('#dateDay span').text(1);
				}
			}
			else if(text==2)
			{
				if (dayText<29)
				{
					$('#dateDay span').text(dayText+1);
				}else
				{
					$('#dateDay span').text(1);
				}
			}
			else
			{
				if (dayText<30)
				{
					$('#dateDay span').text(dayText+1);
				}else
				{
					$('#dateDay span').text(1);
				}				
			}
		});
		$('#chooseDate #dayDown').click(function()
		{
			var text=parseInt($('#dateMonth span').text());
			var dayText=parseInt($('#dateDay span').text());
			if (text==1 || text==3 || text==5 || text==7 || text== 8 || text==10 || text==12)
			{
				if (dayText>1)
				{
					$('#dateDay span').text(dayText-1);
				}else
				{
					$('#dateDay span').text(31);
				}
			}
			else if(text==2)
			{
				if (dayText>1)
				{
					$('#dateDay span').text(dayText-1);
				}else
				{
					$('#dateDay span').text(29);
				}
			}
			else
			{
				if (dayText>1)
				{
					$('#dateDay span').text(dayText-1);
				}else
				{
					$('#dateDay span').text(30);
				}				
			}
		});
	});
