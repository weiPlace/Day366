<div class="row" id="addItem">
	<div class="span302">
		<a href="{#public#}userinfo/changeimg" title="Change image">
			<img src="{#imgfinish#}{$userImg}" alt="这是用户的头像" style="width:80px;height:80px" />
		</a>
	</div>
	<div class="span7 thumbnail">
		<ol class="unstyled">
			<li>
				<a href="{#public#}twitter/add" >
					<img src="{#img#}pen.png" />
					<span>Record Something</span>		
				</a>
				<a href="{#public#}twitter/add" >
					<img src="{#img#}image.png" />
					<span>Upload image</span>		
				</a>
			</li>
		</ol>

	</div>
</div>
<div id="divFormText" class="modal hide fade">
	<div class="modal-header">
		<button class="close" data-dismiss="modal" type="button">×</button>
		<h3>Record something</h3>
	</div>
	<div class="modal-body">
		<form action="post" class="form-horizontal" id="formText" onSubmit="return false;">
			<div class="control-group">
				<label class="control-label">Title</label>
				<div class="controls">
					<input type="text" class="title" id="textTitle"/>
					<p class="help-block">Not needed.
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Content</label>
				<div class="controls">
					<textarea class="textarea" id="textTextarea"></textarea>
					
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" >Source URL</label>
				<div class="controls">
					<input type="text" value="http://" class="href" id="textHref" />
				</div>
			</div>
		</form>
		<div id="imageDiv"><img src="{#img#}loading.jpg"  id="formTextLoading" class="hide" alt="loading" /></div>	
		
	</div>
	<div class="modal-footer">
		<a class="btn" data-dismiss="modal" href="#">Cancel</a>
		<a class="btn submit"  href="#">Publish</a>
	</div>
</div>
<div id="divAllText" class="modal hide fade">
	<div class="modal-header">
		<button class="close" data-dismiss="modal" type="button">×</button>
		<h3>添加图像</h3>
	</div>
	<div class="modal-body">
		<form method="post" class="form-inline" onSubmit="return false;" id="formImage">

				<label class="control-label">Upload image</label>
				<input type="file" name="file" id="file"/>
				<button class="btn btn-primary" type="submit">Submit</button>				
				
		</form>
		<div id="imageDiv"><img src="{#img#}loading.jpg"  id="formImageLoading" class="hide" alt="loading" /></div>	
		<hr />		
		<form action="post" class="form-horizontal" id="formAll" onSubmit="return false;">
			<input type="hidden" id="imgHidden" name="imgHidden" value="" />
			<div class="control-group">
				<label class="control-label">Title</label>
				<div class="controls">
					<input type="text" class="title" id="textTitle"/>
					<p class="help-block">Not needed.
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Content</label>
				<div class="controls">
					<textarea class="textarea" id="textTextarea"></textarea>
					<p class="help-block">The label &lt;br&gt; help you line feed.
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" >Source URL</label>
				<div class="controls">
					<input type="text" value="http://" class="href" id="textHref" />
					<p class="help-block">Not needed.来源URL即为你想分享的照片,文章等的出处，它帮助你的朋友更容易阅读，分享它。
				</div>
			</div>
		</form>
	</div>
	<div class="modal-footer">
		<a class="btn" data-dismiss="modal" href="#">Close</a>
		<a class="btn" class="submit" href="#">Cancel</a>
	</div>
</div>