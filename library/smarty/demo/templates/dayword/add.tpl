<div class="tabbable tabs-left">
<ul class="nav nav-tabs">
	<li class="active"><a href="#text" data-toggle="tab" ><i class="icon-pencil"></i>文字</a></li>
	<li><a href="#img" data-toggle="tab" ><i class="icon-picture"></i>添加图像</a></li>
</ul>

<div class="tab-content">
<div class="tab-pane active" id="text">
<form id="formDaywordAdd" action="#"  onSubmit="return false;" >
	
	<textarea id="textareaContent" name="textareaContent"  ></textarea>
	<div class="daywordType">
	<input type="radio" name="daywordType" class="daywordType" value="goal"/>一天目标
	<input type="radio" name="daywordType" class="daywordType" value="sum"/>一天总结
	<input type="radio" name="daywordType" class="daywordType" value="feel"  checked/>一天随感
	&nbsp;&nbsp;&nbsp;<a href="#daywordEx" data-toggle="modal">如果你第一次使用,这些你必须知道!</a>	
	</div>	
	<button class="btn" type="submit"  id="dayAddSubmit"><i class="icon-share"></i>提交</button>

	<span>字数不应该超过240字符</span>

<input type="hidden" name="hiddenExpression" class="hiddenExpression" value="happy" />
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
	<div class="daywordType">
	<input type="radio" name="daywordType" class="daywordType" value="goal"/>一天目标
	<input type="radio" name="daywordType" class="daywordType" value="sum"/>一天总结
	<input type="radio" name="daywordType" class="daywordType" value="feel"  checked/>一天随感
	&nbsp;&nbsp;&nbsp;<a href="#daywordEx" data-toggle="modal">如果你第一次使用,这些你必须知道!</a>	
	</div>	
	<button class="btn" type="submit"  id="dayAddSubmit"><i class="icon-share"></i>提交</button>
	<input type="hidden"  id="imgHidden" value="" />
	<span>字数不应该超过240字符</span>

</form>

</div>
</div>
</div>