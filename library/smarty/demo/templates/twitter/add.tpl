<div class="tabbable tabs-left">
<ul class="nav nav-tabs">
	<li class="active"><a href="#text" data-toggle="tab" ><i class="icon-pencil"></i>文字</a></li>
	<li><a href="#img" data-toggle="tab" ><i class="icon-picture"></i>添加图像</a></li>
</ul>

<div class="tab-content">
<div class="tab-pane active" id="text">
<form id="formTwitterAdd" action="#"  onSubmit="return false;" >
	
	<textarea id="textareaContent" name="textareaContent"  ></textarea>
	<button class="btn" type="submit"  id="dayAddSubmit"><i class="icon-share"></i>提交</button>
	<span>字数不应该超过140字符</span>

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
	<button class="btn" type="submit"  id="dayAddSubmit"><i class="icon-share"></i>提交</button>
	<input type="hidden"  id="imgHidden" value="" />
	<span>字数不应该超过140字符</span>

</form>

</div>
</div>
</div>