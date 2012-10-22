<div class="searchWall offset2">
	<form class="form-inline" methond="GET" action="{#public#}days/find">
		<label>Go To Public Wall:</label>
		<input type="text" id="colNavSearch" placeholder="choose date" id="wallDate" name="wallDate"/>
		<button class="btn btn-success">Go</button>
	</form>
	<p class="help-block">Tips:Input something like "1-1"
</div>
<table class="table table-bordered" id="wallNav">
<tr class="notLogin">
	<td class="userImgNotLogin">
		<a href="{#public#}account" class="btn span2">Login</a>
		<a href="{#public#}account/register" class="btn btn-info span2">Register</a>
	</td>
	<td>
		<a class="navItem add" href="#accountNotLogin" data-toggle="modal" >
			<img src="{#img#}nav/add.png" alt="record something"/>
			<div>Add something</div>
		</a>
	</td>
	<td>
		<a class="navItem" href="#accountNotLogin" data-toggle="modal">
			<img src="{#img#}nav/calender.png" alt="same day"/>
			<div>Who was born on this day?</div>
		</a>
	</td>
	<td>
		<a class="navItem" href="#accountNotLogin" data-toggle="modal">
			<img src="{#img#}nav/bookmark.png" alt="wall list"/>
			<div>Public Wall List</div>
		</a>
	</td>
</tr>		
</table>
<div id="accountNotLogin" class="modal fade in hide" aria-hidden="false">
		<div class="modal-header">
			<a data-dismiss="modal" class="close">×</a>
			<h4>Tips</h4>
		</div>
		<div class="modal-body">
			<p>You havn't Login in，Please <a href="{#public#}account">login</a>or <a href="{#public#}account/register">register</a> first
		</div>
		<div class="modal-footer">
			<a data-dismiss="modal" class="btn btn-primary" href="#">Sure</a>
		</div>
</div>