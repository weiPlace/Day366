<div class="searchWall offset2">
	<form class="form-inline" methond="GET" action="{#public#}days/find">
		<label>Go To Public Wall:&nbsp;</label>
		<input type="text" id="colNavSearch" placeholder="choose date" id="wallDate" name="wallDate"/>
		<button class="btn btn-success">Go</button>
	</form>
	<p class="help-block">Tips:Input something like "1-1"
</div>
<table class="table table-bordered" id="wallNav">
<tr>
	<td class="userImg">
		<a class="navItem" href="{#public#}userinfo/changeimg">
			<img src="{#imgsmall#}{$userImg}" alt="user picture" />
			<div>Change image</div>
		</a>
	</td>
	<td>
		<a class="navItem add" href="{#public#}days/add">
			<img src="{#img#}nav/add.png" alt="record something"/>
			<div>Add something for this day</div>
		</a>
	</td>
	<td>
		<a class="navItem" href="{#public#}search/sameday?day=today">
			<img src="{#img#}nav/calender.png" alt="same day"/>
			<div>Who was born on this day</div>
		</a>
	</td>
	<td>
		<a class="navItem" href="{#public#}days/list">
			<img src="{#img#}nav/bookmark.png" alt="wall list"/>
			<div>Wall List</div>
		</a>
	</td>
</tr>		
</table>