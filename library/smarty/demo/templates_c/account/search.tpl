<div class="span8">
			<img src="{#img#}logo.png"  id="logo" alt="this is logo" />
			<div id="watchword"><img src="{#img#}sign.png" alt="这是口号"  /></div>
			<form action="{#public#}noidsearch"  method="post"  id="searchForm" >
				<div class="control-group" id="radioGroup">
					<div class="controls">
						<input type="radio" name="type"  value="day"  checked id="day">日期
						<input type="radio" name="type" value="people" id="people">人名
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<input type="text" id="search" name="search" class="span6" />
					</div>
				</div>
				<div class="control-group">
					<div class="controls" >
						<button class="btn"><i class="icon-search"></i>&nbsp;搜索</button>
					</div>
				</div>
			</form>
</div>