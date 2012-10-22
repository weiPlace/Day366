function addLoading(A){
	A.children("p").after('<div id="loading" ><img src="http://www.days366.com/img/loading.jpg" alt="loading" /></div>');
	return true;
	}
function Remove(){
	$("#loading").remove();
	}
function Error(){
	var A=$('<div class="modal-header">').append('<a class="close" data-dismiss="modal">&times;</a><h4>发生错误</h4>');
	var C=$('<div class="modal-body">').append('<p><span >数据保存失败</span>');
	var B=$('<div class="modal fade" id="ajaxWarning">').append(A).append(C);
	$("body").append(B);
	$("#ajaxWarning").modal("show");
	setTimeout(Hide,3000);
	return 1;}
function Hide(){
	$("#ajaxWarning").modal("hide");
	$("#ajaxWarning").remove();
}
