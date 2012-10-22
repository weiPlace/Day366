<div class="searchWall offset2">
	<form class="form-inline" methond="GET" action="{#public#}days/find">
		<label>Go To Public Wall:&nbsp;</label>
		<input type="text" id="colNavSearch" placeholder="choose date" id="wallDate" name="wallDate"/>
		<button class="btn btn-success">Go</button>
	</form>
	<p class="help-block">Tips:Input something like "1-1"
</div>
<table class="table table-bordered">
<tr class="twitterNav">
	<td class="userImg">
		<a class="navItem" href="{#public#}userinfo/changeimg">
			<img src="{#imgsmall#}{$userImg}" alt="user picture" />
			<div>Change image</div>
		</a>
	</td>
	<td>
		<a class="navItem" href="{#public#}twitter/add">
			<img src="{#img#}nav/add.png" alt="record something"/>
			<div>Record today</div>
		</a>
	</td>
	<td>
		<a class="navItem" href="{#public#}wall/index">
			<img src="{#img#}nav/calender.png" alt="wall"/>
			<div>Your own wall</div>
		</a>
	</td>
	<td>
		<a class="navItem" href="{#public#}userinfo/label">
			<img src="{#img#}nav/info.png" alt="user information"/>
			<div>Personal</div>
		</a>
	</td>
	<td>
		<a class="navItem" href="{#public#}friend/index">
			<img src="{#img#}nav/user.png" alt="user favouite friend"/>
			<div>Collect</div>
		</a>
	</td>
	<td>
		<a class="navItem" href="{#public#}befriend/index">
			<img src="{#img#}nav/id.png" alt="收藏自己的人"/>
			<div>Followed</div>
		</a>
	</td>
</tr>		
</table>