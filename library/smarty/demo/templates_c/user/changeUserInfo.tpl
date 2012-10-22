		<form action="{#public#}valid/userinfo" class="form-horizontal" method="post" id="userinfo">
			<div id="formMain">
						<div class="control-group">
							<label for="firstname" class="control-label">你的姓</label>
							<div class="controls">
								<input type="text" class="name" placeholder="你的姓" required id="firstname" name="firstname"/>
							</div>	
						</div>
						<div class="control-group">
							<label for="lastname" class="control-label">你的名字</label>
							<div class="controls">
								<input type="text" required class="name"  placeholder="你的名字" name="lastname" id="lastname"/>
							</div>
						</div>
						<div class="control-group">
							<label for="genderGirl" class="control-label">你的性别</label>
							<div class="controls">
								<input type='radio' value="boy" name="gender" id="genderBoy"/>男
								<input type='radio' value="girl"  checked="true" name="gender" id="genderGirl" />女
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
						<div class="control-group">
								<label for="provinceCities" class="control-label">请选择你的家乡</label>
								<div class="controls">
									<select required id="provinceCities" autocomplete name="provinceCities" class="input-small">
											<option value="">选择一个省市</option>
											<option value="安徽省">安徽省</option>
											<option value="澳门">澳门</option>
											<option value="北京市">北京市</option>
											<option value="重庆市">重庆市</option>
											<option value="福建省">福建省</option>
											<option value="甘肃省">甘肃省</option>
											<option value="广东省">广东省</option>
											<option value="广西">广西</option>
											<option value="贵州省">贵州省</option>
											<option value="海南省">海南省</option>
											<option value="河北省">河北省</option>
											<option value="河南省">河南省</option>
											<option value="黑龙江省">黑龙江省</option>
											<option value="湖北省">湖北省</option>
											<option value="湖南省">湖南省</option>
											<option value="吉林省">吉林省</option>
											<option value="江苏省" selected>江苏省</option>
											<option value="江西省">江西省</option>
											<option value="辽宁省">辽宁省</option>
											<option value="内蒙古">内蒙古</option>
											<option value="宁夏">宁夏</option>
											<option value="青海省">青海省</option>
											<option value="山东省">山东省</option>
											<option value="山西省">山西省</option>
											<option value="陕西省">陕西省</option>
											<option value="上海市">上海市</option>
											<option value="四川省">四川省</option>
											<option value="台湾省">台湾省</option>
											<option value="天津市">天津市</option>
											<option value="西藏">西藏</option>
											<option value="香港">香港</option>
											<option value="新疆">新疆</option>
											<option value="云南省">云南省</option>
											<option value="浙江省">浙江省</option>
									</select>
									<select required id="city" name="city" class="input-small">
										<option value="南京">南京</option>
										<option value="镇江">镇江</option>
										<option value="常州">常州</option>
										<option value="无锡">无锡</option>
										<option value="苏州">苏州</option>
										<option value="徐州">徐州</option>
										<option value="连云港">连云港</option>
										<option value="淮安">淮安</option>
										<option value="盐城" selected>盐城</option>
										<option value="扬州">扬州</option>
										<option value="泰州">泰州</option>
										<option value="南通">南通</option>
										<option value="宿迁">宿迁</option>
									</select>
								</div>
						</div>
						<div class="control-group">
							<label for="zip" class="control-label">邮政编码</label>
							<div class="controls">
								<input type="number" placeholder="请填写你故乡的邮政编码" name="zip" id="zip"/>
							</div>
						</div>
						<div class="control-group">
							<label for="usProvince" class="control-label">请选择你的大学</label>
							<div class="controls">
								<select required name="usProvince" id="usProvince" class="input-small">
									<option value="安徽省">安徽省</option>
									<option value="澳门">澳门</option>
									<option value="北京市">北京市</option>
									<option value="重庆市">重庆市</option>
									<option value="福建省">福建省</option>
									<option value="甘肃省">甘肃省</option>
									<option value="广东省">广东省</option>
									<option value="广西">广西</option>
									<option value="贵州省">贵州省</option>
									<option value="海南省">海南省</option>
									<option value="河北省">河北省</option>
									<option value="河南省">河南省</option>
									<option value="黑龙江省">黑龙江省</option>
									<option value="湖北省">湖北省</option>
									<option value="湖南省">湖南省</option>
									<option value="吉林省">吉林省</option>
									<option value="江苏省" selected>江苏省</option>
									<option value="江西省">江西省</option>
									<option value="辽宁省">辽宁省</option>
									<option value="内蒙古">内蒙古</option>
									<option value="宁夏">宁夏</option>
									<option value="青海省">青海省</option>
									<option value="山东省">山东省</option>
									<option value="山西省">山西省</option>
									<option value="陕西省">陕西省</option>
									<option value="上海市">上海市</option>
									<option value="四川省">四川省</option>
									<option value="台湾省">台湾省</option>
									<option value="天津市">天津市</option>
									<option value="西藏">西藏</option>
									<option value="香港">香港</option>
									<option value="新疆">新疆</option>
									<option value="云南省">云南省</option>
									<option value="浙江省">浙江省</option>
								</select>
								<select name="us" id="us" >
									<option value="南京大学">南京大学</option>
									<option value="东南大学">东南大学</option>
									<option value="中国矿业大学">中国矿业大学</option>
									<option value="河海大学">河海大学</option>
									<option value="江南大学">江南大学</option>
									<option value="南京农业大学">南京农业大学</option>
									<option value="中国药科大学">中国药科大学</option>
									<option value="南京理工大学">南京理工大学</option>
									<option value="南京航空航天大学">南京航空航天大学</option>
									<option value="苏州大学">苏州大学</option>
									<option value="扬州大学">扬州大学</option>
									<option value="江苏大学">江苏大学</option>
									<option value="南京邮电大学">南京邮电大学</option>
									<option value="江苏科技大学">江苏科技大学</option>
									<option value="南京工业大学">南京工业大学</option>
									<option value="南京林业大学">南京林业大学</option>
									<option value="南京医科大学">南京医科大学</option>
									<option value="南京中医药大学">南京中医药大学</option>
									<option value="南京师范大学">南京师范大学</option>
									<option value="徐州师范大学">徐州师范大学</option>
									<option value="南京财经大学">南京财经大学</option>
									<option value="南通大学">南通大学</option>
									<option value="西交利物浦大学">西交利物浦大学</option>
									<option value="南京信息工程大学">南京信息工程大学</option>
									<option value="淮阴工学院">淮阴工学院</option>
									<option value="徐州工程学院">徐州工程学院</option>
									<option value="淮海工学院">淮海工学院</option>
									<option value="常州工学院">常州工学院</option>
									<option value="盐城工学院">盐城工学院</option>
									<option value="江苏工业学院">江苏工业学院</option>
									<option value="金陵科技学院">金陵科技学院</option>
									<option value="南京工程学院" selected>南京工程学院</option>
									<option value="徐州医学院">徐州医学院</option>
									<option value="江苏技术师范学院">江苏技术师范学院</option>
									<option value="淮阴师范学院">淮阴师范学院</option>
									<option value="南京晓庄学院">南京晓庄学院</option>
									<option value="盐城师范学院">盐城师范学院</option>
									<option value="苏州科技学院">苏州科技学院</option>
									<option value="南京审计学院">南京审计学院</option>
									<option value="江苏警官学院">江苏警官学院</option>
									<option value="南京体育学院">南京体育学院</option>
									<option value="南京艺术学院">南京艺术学院</option>
									<option value="常熟理工学院">常熟理工学院</option>
									<option value="三江学院">三江学院</option>
									<option value="南京森林公安高等专科学校">南京森林公安高等专科学校</option>
									<option value="连云港师范高等专科学校">连云港师范高等专科学校</option>
									<option value="泰州师范高等专科学校">泰州师范高等专科学校</option>
									<option value="镇江市高等专科学校">镇江市高等专科学校</option>
									<option value="江苏畜牧兽医职业技术学院">江苏畜牧兽医职业技术学院</option>
									<option value="南通纺织职业技术学院">南通纺织职业技术学院</option>
									<option value="南京工业职业技术学院">南京工业职业技术学院</option>
									<option value="无锡商业职业技术学院">无锡商业职业技术学院</option>
									<option value="泰州职业技术学院">泰州职业技术学院</option>
									<option value="南通航运职业技术学院">南通航运职业技术学院</option>
									<option value="徐州建筑职业技术学院">徐州建筑职业技术学院</option>
									<option value="无锡职业技术学院">无锡职业技术学院</option>
									<option value="民办明达职业技术学院">民办明达职业技术学院</option>
									<option value="南通职业大学">南通职业大学</option>
									<option value="沙洲职业工学院">沙洲职业工学院</option>
									<option value="苏州工艺美术职业技术学院">苏州工艺美术职业技术学院</option>
									<option value="扬州市职业大学">扬州市职业大学</option>
									<option value="苏州职业大学">苏州职业大学</option>
									<option value="连云港职业技术学院">连云港职业技术学院</option>
									<option value="江苏城市职业学院">江苏城市职业学院</option>
									<option value="苏州高博软件技术职业学院">苏州高博软件技术职业学院</option>
									<option value="江阴职业技术学院">江阴职业技术学院</option>
									<option value="钟山职业技术学院">钟山职业技术学院</option>
									<option value="淮安信息职业技术学院">淮安信息职业技术学院</option>
									<option value="南京交通职业技术学院">南京交通职业技术学院</option>
									<option value="江苏建康职业学院">江苏建康职业学院</option>
									<option value="宿迁职业技术学院">宿迁职业技术学院</option>
									<option value="苏州信息职业技术学院">苏州信息职业技术学院</option>
									<option value="江苏食品职业技术学院">江苏食品职业技术学院</option>
									<option value="太湖创意职业技术学院">太湖创意职业技术学院</option>
									<option value="江苏海事职业技术学院">江苏海事职业技术学院</option>
									<option value="江苏经贸职业技术学院">江苏经贸职业技术学院</option>
									<option value="南京信息职业技术学院">南京信息职业技术学院</option>
									<option value="常州工程职业技术学院">常州工程职业技术学院</option>
									<option value="常州轻工职业技术学院">常州轻工职业技术学院</option>
									<option value="徐州工业职业技术学院">徐州工业职业技术学院</option>
									<option value="江苏农林职业技术学院">江苏农林职业技术学院</option>
									<option value="江苏信息职业技术学院">江苏信息职业技术学院</option>
									<option value="苏州港大思培科技职业学院">苏州港大思培科技职业学院</option>
									<option value="昆山登云科技职业学院">昆山登云科技职业学院</option>
									<option value="南京旅游职业学院">南京旅游职业学院</option>
									<option value="苏州工业园区职业技术学院">苏州工业园区职业技术学院</option>
									<option value="苏州经贸职业技术学院">苏州经贸职业技术学院</option>
									<option value="常州机电职业技术学院">常州机电职业技术学院</option>
									<option value="江海职业技术学院">江海职业技术学院</option>
									<option value="南京化工职业技术学院">南京化工职业技术学院</option>
									<option value="盐城卫生职业技术学院">盐城卫生职业技术学院</option>
									<option value="常州信息职业技术学院">常州信息职业技术学院</option>
									<option value="正德职业技术学院">正德职业技术学院</option>
									<option value="炎黄职业技术学院">炎黄职业技术学院</option>
									<option value="九州职业技术学院">九州职业技术学院</option>
									<option value="无锡城市职业技术学院">无锡城市职业技术学院</option>
									<option value="无锡工艺职业技术学院">无锡工艺职业技术学院</option>
									<option value="健雄职业技术学院">健雄职业技术学院</option>
									<option value="江苏财经职业技术学院">江苏财经职业技术学院</option>
									<option value="盐城纺织职业技术学院">盐城纺织职业技术学院</option>
									<option value="常州纺织服装职业技术学院">常州纺织服装职业技术学院</option>
									<option value="南京铁道职业技术学院">南京铁道职业技术学院</option>
									<option value="苏州工业职业技术学院">苏州工业职业技术学院</option>
									<option value="金山职业技术学院">金山职业技术学院</option>
									<option value="紫琅职业技术学院">紫琅职业技术学院</option>
									<option value="金肯职业技术学院">金肯职业技术学院</option>
									<option value="江苏联合职业技术学院">江苏联合职业技术学院</option>
									<option value="江南影视艺术职业学院">江南影视艺术职业学院</option>
									<option value="建东职业技术学院">建东职业技术学院</option>
									<option value="苏州托普信息职业技术学院">苏州托普信息职业技术学院</option>
									<option value="应天职业技术学院">应天职业技术学院</option>
									<option value="无锡科技职业学院">无锡科技职业学院</option>
									<option value="南通农业职业技术学院">南通农业职业技术学院</option>
									<option value="扬州环境资源职业技术学院">扬州环境资源职业技术学院</option>
									<option value="扬州工业职业技术学院">扬州工业职业技术学院</option>
									<option value="南京机电职业技术学院">南京机电职业技术学院</option>
									<option value="苏州农业职业技术学院">苏州农业职业技术学院</option>
									<option value="南京视觉艺术职业学院">南京视觉艺术职业学院</option>
									<option value="苏州卫生职业技术学院">苏州卫生职业技术学院</option>
									<option value="南京特殊教育职业技术学院">南京特殊教育职业技术学院</option>
									<option value="无锡南洋职业技术学院">无锡南洋职业技术学院</option>
									<option value="硅湖职业技术学院">硅湖职业技术学院</option>
								</select>
								<a id="add"  data-toggle='modal' href="#pop">没有你的大学？</a>
							</div>
						</div>
						<div class="control-group">
							<label for="perimt" class="control-label">设置权限</label>
							<div class="controls">
								<select id="permit"	name="permit">
									<option value="2">好友可见</option>
									<option value="3">允许自己的资料出现在公共主页</option>
									<option value="4">仅自己可见</option>
								</select>
							</div>
						</div>
						<div class="control-group">
							<label for="button" class="control-label"></label>
							<div class="controls">
								<button type="submit" class="btn">提交</button>
							</div>
						</div>
				</div>
			</form>