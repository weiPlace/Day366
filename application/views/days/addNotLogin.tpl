
<ul class="nav nav-tabs" id="dayAddTab">
	<li><a href="#text" data-toggle="tab"><i class="icon-pencil"></i>Words</a></li>
	<li><a href="#img" data-toggle="tab"><i class="icon-picture"></i>Add Image</a></li>

</ul>

<div class="tab-content">
<div class="tab-pane active" id="text">
<form id="formDayAdd" action=""  onSubmit="return false;" >
	
	<textarea class="textareaContent" name="textareaContent"  ></textarea>
	<a href="#action" data-toggle="modal"><button class="btn btn-mini btn-primary" ><i class="icon-share icon-white"></i>提交</button></a>
	<span>字数不应该超过280字符	&nbsp;&nbsp;&nbsp;<a href="#knowadd" data-toggle="modal">如若你第一次尝试这个,我想这个你必须了解！</a></span>

</form>
</div>
<div class="tab-pane" id="img">
<form id="formImage" action=""  onSubmit="return false;" >
	<label>为照片添加描述</label><input type="file" name="file" id="file"/>
	<textarea class="textareaContent" name="textareaContent"  ></textarea>
	<a href="#action" data-toggle="modal"><button class="btn btn-mini btn-primary"><i class="icon-share icon-white"></i>提交</button></a>
	
	<span>字数不应该超过280字符	&nbsp;&nbsp;&nbsp;<a href="#knowadd" data-toggle="modal">如若你第一次尝试这个,我想这个你必须了解！</a></span>
</form>

</div>
</div>
<div class="modal fade" id='knowadd' >
		<div class="modal-header">
			<a class="close" data-dismiss="modal">×</a>
			<h3>为我们的网站增添内容</h3>
		</div>
		<div class="modal-body">
			<p>在你为我们网站增添内容之前，我想你必须要知道:</p>
			<p>1,你提交的内容必须具有意义。</p>
			<p>2,如果符合我们网站的要求,我们将在网站正式版的公共主页上展出,并且会根据你的隐私设置决定是否展出你的姓名.</p>
			<p>3,如果符合我们的要求，你在1月4号界面提交的内容将会被展示在1月4号的公共主页，依此类推.</p>
		</div>
		<div class="modal-footer">
			<button class="btn">关闭</button>
		</div>
	</div>


