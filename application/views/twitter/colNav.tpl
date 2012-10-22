<div class="span3 pull-right">
	<div id="colNav">
		<div class="imgInfo">
			<div id="userId" class="hide">{$userId}</div>
			<div id="userImage" class="hide">{$userImg}</div>
			<div id="userName" class="hide">{$userName}</div>
		</div>
		<ul class="nav nav-tabs nav-stacked">
			<li><a href="{#public#}friend"><i class="icon-fire"></i>&nbsp;Collect {$friendNumber} People</a></li>
			<li><a href="{#public#}befriend"><i class="icon-shopping-cart "></i>&nbsp;followed by {$followerNumber} People</a></li>
			<li><a href="{#public#}search/sameday?day={$userBirthday}"><i class="icon-calendar"></i>&nbsp;{$birthdayNumber} person was born the same day with you</a></li>
			<li><a href="{#public#}"><i class="icon-time "></i>&nbsp;Own Wall</a></li>
		</ul>
	</div>
</div>