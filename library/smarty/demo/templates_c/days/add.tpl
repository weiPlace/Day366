<ul class="nav nav-tabs" id="dayAddTab">
	<li><a href="#text" data-toggle="tab"><i class="icon-pencil"></i>文字</a></li>
	<li><a href="#img" data-toggle="tab"><i class="icon-picture"></i>添加图像</a></li>
</ul>

<div class="tab-content">
<div class="tab-pane active" id="text">
<form id="formDayAdd" action=""  onSubmit="return false;" >
	
	<textarea id="textareaContent" name="textareaContent"  ></textarea>
	<button class="btn" type="submit"  id="dayAddSubmit"><i class="icon-share"></i>提交</button>
	<span>字数不应该超过280字符	&nbsp;&nbsp;&nbsp;<a href="#knowadd" data-toggle="modal">如若你第一次尝试这个,我想这个你必须了解！</a></span>

</form>
</div>
<div class="tab-pane" id="img">
<form id="formImage" action="#"  onSubmit="return false;" >
<input type="file" name="file" id="file"/>&nbsp;<button class="btn">提交</button>
</form>
<img src="{#img#}loading.jpg" class="hidden" id="loading"  alt="loading" />
<label class="success hidden">上传成功！请增加描述:</label>
<form id="formAllAdd" action="#"  onSubmit="return false;">
	<textarea id="imageContent" name="imageContent"  ></textarea>
	<input type="hidden"  id="imgHidden" value="" />
	<button class="btn" type="submit"  id="dayAddSubmit"><i class="icon-share"></i>提交</button>
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


