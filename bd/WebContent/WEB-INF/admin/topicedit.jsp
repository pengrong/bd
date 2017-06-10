<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/tags/loushang-web" prefix="l"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>专题</title>
<!-- 引入css文件 -->
<l:link
	path="css/bootstrap.css,css/font-awesome.css,css/ui.css,css/form.css,css/fileinput.min.css" />
<!-- 引入js文件 -->
<l:script
		path="jquery.js,bootstrap.js,form.js,jquery.form.js,datatables.js,loushang-framework.js,ui.js,purify.js,fileinput.min.js,fileinput.min_zh.js" />

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="<l:asset path='html5shiv.js'/>"></script>
  <script src="<l:asset path='respond.js'/>"></script>
<![endif]-->
<style type="text/css">
.Validform_input {
	width: 100%;
	padding-left: 1px;
	padding-right: 1px;
}

.ue-btn-primary {
	width: 100%
}
.file-preview-image{
	width: 100px;
	height: 100px;
}
</style>

<script type="text/javascript">
	//项目上下文
	var context="<%=request.getContextPath()%>";
	var editDialog;
	$(function() {
		var projectfileoptions = {
	        showUpload : false,
	        //showRemove : false,
	        language : 'zh',
	        allowedPreviewTypes : [ 'image' ],
	        allowedFileExtensions : [ 'jpg', 'png', 'gif' ]
	    };
	    var imageurl = $('#coverFile').attr("value");
	    if (imageurl) {
	        var op = $.extend({
	            initialPreview : [ // 预览图片的设置
	            "<img src='" + imageurl + "' class='file-preview-image'>" ]
	        }, projectfileoptions);
	        $('#coverFile').fileinput(op);
	    } else {
	        $('#coverFile').fileinput(projectfileoptions);
	    }
		try {
			editDialog = parent.dialog.get(window);
		} catch (e) {
			$('body').append(
				'<p><strong>Error:</strong> 跨域无法无法操作 iframe 对象</p>'
				+'<p>chrome 浏览器本地会认为跨域，请使用 http 方式访问当前页面</p>'
			);
			return;
		}	
		$("#saveForm").uValidform({
			btnSubmit : "#saveBtn",
			callback : function(form) {
				save();
			}
		});
	});
	//保存实例
	function save() {
		//表单的异步提交
		$("#saveForm").ajaxSubmit({
			type : "post",
			url : context + "/service/admin/topic/save",
			error : function(data) {
				$("#msgdemo").html("错误：" + data);
			},
			success : function(data) {
				if (data && data.success == false) {
					$("#msgdemo").html("对不起，出错了：" + data.message);
				} else {
					$.dialog({
						   type: 'alert',
						   content: '保存成功！',
						   ok : function(){
								editDialog.close();
								editDialog.remove();
						   }
						 });
				}
			}
		});
	}
</script>
</head>
<body>
	<form class="form-horizontal" role="form" id="saveForm" name="saveForm"
		onsubmit="return false" ectype="multipart/form-data" method="post">
		<input type="hidden" name="id" value="${topic.id}">
		<div class="form-group">
			<label for="name" class="col-sm-2 control-label">标题</label>
			<div class="col-sm-10">
				<input type="text" class="form-control ue-form Validform_input"
					id="title" name="title" value="${topic.title}"
					placeholder="请输入标题" datatype="s1-100" errormsg="标题1~100个字符:)"
					nullmsg="请设置标题" /> <span
					class="Validform_checktip Validform_span"></span>
			</div>
		</div>
		<div class="form-group">
			<label for="name" class="col-sm-2 control-label">内容</label>
			<div class="col-sm-10">
				<input type="text" class="form-control ue-form Validform_input"
					id="content" name="content" value="${topic.content}"
					placeholder="请输入专题名称" datatype="s1-16" ignore="ignore"
					errormsg="请输入专题名称" /> <span
					class="Validform_checktip Validform_span"></span>
			</div>
		</div>
		<div class="form-group">
			<label for="name" class="col-sm-2 control-label">阅读量</label>
			<div class="col-sm-10">
				<input type="text" class="form-control ue-form Validform_input"
					id="treads" name="treads" value="${topic.treads}"
					placeholder="请输入阅读量" datatype="n" ignore="ignore"
					errormsg="请输入阅读量" /> <span
					class="Validform_checktip Validform_span"></span>
			</div>
		</div>
		<div class="form-group">
			<label for="name" class="col-sm-2 control-label">收藏量</label>
			<div class="col-sm-10">
				<input type="text" class="form-control ue-form Validform_input"
					id="collections" name="collections" value="${topic.collections}" placeholder="请输入收藏量"
					datatype="n" ignore="ignore" errormsg="请输入收藏量" /> <span
					class="Validform_checktip Validform_span"></span>
			</div>
		</div>
		<div class="form-group">
			<label for="name" class="col-sm-2 control-label">封面</label>
			<div class="col-sm-10">
				<input type="file" id="coverFile" class="form-control" name="coverFile" value="${topic.cover}" 
					placeholder="请上传头像" />
			</div>
		</div>
		<div class="form-group">
			<div class="col-xs-12 col-md-12">
				<button type="button" class="btn ue-btn-primary btn-block"
					id="saveBtn">保存</button>
				<span id="msgdemo" class="text-danger"></span>
			</div>
		</div>
	</form>
</body>
</html>