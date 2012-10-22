{include file="headerNoJs.tpl"}

<script type="text/javascript" src="{#js#}jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="{#js#}bootstrap.min.js"></script>
<script type="text/javascript" src="{#js#}jquery.validate.min.js"></script>
</head>
<body >
<div class="container" >

{include file="day.tpl"}	
<div class="row"> 
<div id="register"> 
   	<a href="{#public#}account">返回登陆界面</a>
	{if $error|my_count}
   	<label class="error">{$error.0}</label>
   	{/if}     

    	<h3>注册</h3>
		<hr />
        <form id="registerForm" method="POST" class="form-horizontal" action="{#public#}validnoid" >
    	

    	<div id="formMain">
		<div class="control-group">
        	<label for="email"  class="control-label">你的邮箱</label>
			<div class="controls">
				<input type="email"  id="email" placeholder="请输入你的电子邮箱"  name='email'/>
			</div>
		</div> 
        <div class="control-group">
        	<label for="password" class="control-label">你的密码</label>
			<div class="controls">
				<input type="password" id="password" name='password' placeholder="请输入你的密码"/>
			</div>
        </div>
		<div class="control-group">
        	<label for="repeatPassword" class="control-label">重复密码</label>
			<div class="controls">
				<input type="password"  id="repeatPassword" name='repeatPassword' placeholder="请重复你的密码"/>
			</div>
		</div>
       <div class="control-group">
        	<label for="birthday" class="control-label">生日</label>
			<div class="controls">
        		<select id="year" name="year" class="input-small">
					<option value="1910">1910年</option>
					<option value="1911">1911年</option>
					<option value="1912">1912年</option>
					<option value="1913">1913年</option>
					<option value="1914">1914年</option>
					<option value="1915">1915年</option>
					<option value="1916">1916年</option>
					<option value="1917">1917年</option>
					<option value="1918">1918年</option>
					<option value="1919">1919年</option>
					<option value="1920">1920年</option>
					<option value="1921">1921年</option>
					<option value="1922">1922年</option>
					<option value="1923">1923年</option>
					<option value="1924">1924年</option>
					<option value="1925">1925年</option>
					<option value="1926">1926年</option>
					<option value="1927">1927年</option>
					<option value="1928">1928年</option>
					<option value="1929">1929年</option>
					<option value="1930">1930年</option>
					<option value="1931">1931年</option>
					<option value="1932">1932年</option>
					<option value="1933">1933年</option>
					<option value="1934">1934年</option>
					<option value="1935">1935年</option>
					<option value="1936">1936年</option>
					<option value="1937">1937年</option>
					<option value="1938">1938年</option>
					<option value="1939">1939年</option>
					<option value="1940">1940年</option>
					<option value="1941">1941年</option>
					<option value="1942">1942年</option>
					<option value="1943">1943年</option>
					<option value="1944">1944年</option>
					<option value="1945">1945年</option>
					<option value="1946">1946年</option>
					<option value="1947">1947年</option>
					<option value="1948">1948年</option>
					<option value="1949">1949年</option>
					<option value="1950">1950年</option>
					<option value="1951">1951年</option>
					<option value="1952">1952年</option>
					<option value="1953">1953年</option>
					<option value="1954">1954年</option>
					<option value="1955">1955年</option>
					<option value="1956">1956年</option>
					<option value="1957">1957年</option>
					<option value="1958">1958年</option>
					<option value="1959">1959年</option>
					<option value="1960">1960年</option>
					<option value="1961">1961年</option>
					<option value="1962">1962年</option>
					<option value="1963">1963年</option>
					<option value="1964">1964年</option>
					<option value="1965">1965年</option>
					<option value="1966">1966年</option>
					<option value="1967">1967年</option>
					<option value="1968">1968年</option>
					<option value="1969">1969年</option>
					<option value="1970">1970年</option>
					<option value="1971">1971年</option>
					<option value="1972">1972年</option>
					<option value="1973">1973年</option>
					<option value="1974">1974年</option>
					<option value="1975">1975年</option>
					<option value="1976">1976年</option>
					<option value="1977">1977年</option>
					<option value="1978">1978年</option>
					<option value="1979">1979年</option>
					<option value="1980">1980年</option>
					<option value="1981">1981年</option>
					<option value="1982">1982年</option>
					<option value="1983">1983年</option>
					<option value="1984">1984年</option>
					<option value="1985">1985年</option>
					<option value="1986">1986年</option>
					<option value="1987">1987年</option>
					<option value="1988">1988年</option>
					<option value="1989">1989年</option>
					<option value="1990">1990年</option>
					<option value="1991">1991年</option>
					<option value="1992" selected>1992年</option>
					<option value="1993">1993年</option>
					<option value="1994">1994年</option>
					<option value="1995">1995年</option>
					<option value="1996">1996年</option>
					<option value="1997">1997年</option>
					<option value="1998">1998年</option>
					<option value="1999">1999年</option>
					<option value="2000">2000年</option>
					<option value="2001">2001年</option>
					<option value="2002">2002年</option>
					<option value="2003">2003年</option>
					<option value="2004">2004年</option>
					<option value="2005">2005年</option>
					<option value="2006">2006年</option>
					<option value="2007">2007年</option>
					<option value="2008">2008年</option>
					<option value="2009">2009年</option>
					<option value="2010">2010年</option>
					<option value="2011">2011年</option>
			
				</select>
				<select id="month" name="month" class="input-small">
					<option value="01">1月</option>
					<option value="02">2月</option>
					<option value="03">3月</option>
					<option value="04">4月</option>
					<option value="05">5月</option>
					<option value="06">6月</option>
					<option value="07" selected>7月</option>
					<option value="08">8月</option>
					<option value="09">9月</option>
					<option value="10">10月</option>
					<option value="11">11月</option>
					<option value="12">12月</option>				
				</select>
				<select id="day" name="day" class="input-small">
						
				</select>
				<a id="add"  data-toggle='modal' href="#birthdayImportant">为什么它如此重要？</a>
			</div>
		</div>
       <div class="control-group" >
       		<label class="control-label" for="inviteNumber">请输入你的邀请码</label>
			<div class="controls">
       			<input  type="text" id="inviteNumber" name="inviteNumber" placeholder="请输入你的邀请码" />
       		</div>	
       </div>
	<div class="control-group">
			<label for="button" class="control-label">&nbsp;</label>
			<div class="controls">
				<button type="submit" class="btn" id="registerButton">注册</button>
			</div>
	</div>
		</div>
	
	</form>

	<div class="modal fade" id='birthdayImportant' >
		<div class="modal-header">
			<a class="close" data-dismiss="modal">×</a>
			<h3>为什么生日如此重要</h3>
		</div>
		<div class="modal-body">
			<p>等你填完你的生日之后:</p>
			<p>你的朋友就可以清楚地知道你的生日</p>
			<p>你可以知道谁和你一起出生,结交同年同月同日出生的好友</p>
			<p>你可以还知道你出生那天世界到底发生了什么重大事件</p>
			<p>所以填完你的生日之后,你可以做的事情真是太多了.....</p>
		</div>
	</div>
</div>
<div id="fixed">
{include file="footer.tpl"}
</div>
</div>
<script type="text/javascript" src="{#js#}chooseday.js"></script>
{literal}
<script type="text/javascript">

$(function(){
	$('#registerForm').validate({
		rules:{
			email:{
				required:true,
				email:true
			},
			password:{
				required:true,
				minlength:6,
				maxlength:15
			},
			repeatPassword:{
				required:true,
				equalTo:"#password"
			},
			inviteNumber:
			{
				required:true,
				minlength:11,
				maxlength:11
			}
		},
		messages:{
			email:"请输入一个有效的email地址",
			password:{
				required:"请输入密码",
				minlength:"请至少输入一个长度为6的密码",
				maxlength:"密码的长度不应该大于15."	
			},
			repeatPassword:{
				required:"请重复密码",
				equalTo:"两次输入的密码不相符，请重新输入"
			},
			inviteNumber:
			{
				required:"请输入邀请码",
				minlength:"请输入正确的邀请码格式",
				maxlength:"请输入正确的邀请码格式"
			}
			
}
			
	});
});

</script>
{/literal}
</body>

</html>		