<div class="span3 pull-right">
	<div id="colNav">
		<div class="imgInfo">
			<div id="userId" class="hide">{$userId}</div>
			<div id="userImage" class="hide">{$userImg}</div>
			<div id="userName" class="hide">{$userName}</div>
		</div>
		<form class="form-search">
			<input type="text" class="search-query span2" placeholder="Search the main page" id="colNavSearch"/>
			<button class="btn"><i class="icon-search"></i></button>
			<p class="help-block">Search the mainpage（*.*）.
		</form>


		{if $specialImg|my_count}	
		<hr />

		<div id="todayUserImg" class="thumbnail">
			<h5>Who was born on this day:</h5>		
			<ol class="unstyled">
				{foreach from=$specialImg item=item}
				<li>
					<a href="{#public#}friend/findfriendmainpage?id={$item.user_id}">
						<img src="{#imgsmall#}{$item.user_img}" alt="This is userImg who was born today" />
					</a>
				</li>
				{/foreach}
			</ol>
			<p><a href="{#public#}search/sameday?day=today">Show more</a>
			</div>
		{/if}
		

	</div>
</div>