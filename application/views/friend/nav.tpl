<div class="searchWall offset2">
	<form class="form-inline" methond="GET" action="{#public#}friend/chooseday">
		<label>Go this people's wall:&nbsp;</label>
		<input type="text" id="colNavSearch" placeholder="choose date" id="wallDate" name="wallDate"/>
		<input type="hidden" name="friendId" id="friendId" value="{$friendId}" />
		<button class="btn btn-success">Go</button>
	</form>
	<p class="help-block" id="ownWall">Tip:Please Enter date like"1.1"
</div>
