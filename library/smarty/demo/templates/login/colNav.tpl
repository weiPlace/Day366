<div class="span3">
<div id="colNav" >
<div id="colNavUserInfo">
	<div class="imgInfo">
		<div id="userId" class="hidden">{$userId}</div>
		<div id="userImage" class="hidden">{$userImg}</div>
		<a href="{#public#}twitter/index" >
			<img src="{#imgfinish#}{$userImg}" alt="这是用户的头像" class="thumbnail"/>
		</a>
	</div>
	<div class="textInfo">
		<a href="{#public#}twitter/index">{$userName}</a>
		<h4>{$userBirthday}</h4>
		<h4>{$userUs}</h4>
	</div>
</div>
<hr />
<ul class="nav nav-pills nav-stacked">

<li >
<a href="{#public#}twitter/index"><i class="icon-refresh"></i>&nbsp;每天动态</a>
</li>

<li >
<a href="{#public#}userinfo/label"><i class="icon-cog "></i>&nbsp;个人资料</a>
</li>
<li  >
<a href="{#public#}wall/index"><i class="icon-time "></i>&nbsp;366天墙</a>
</li>

<li >
<a href="{#public#}friend/index"><i class="icon-fire "></i>&nbsp;收藏的人</a>
</li>
<li >
<a href="{#public#}befriend/index"><i class="icon-shopping-cart "></i>&nbsp;被谁收藏</a>
</li>
<li>
<a href="{#public#}message/index"><i class="icon-comment"></i>&nbsp;追随消息</a>
</li>
</ul>
</div>
</div>