<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/tags/loushang-web" prefix="l"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户修改</title>
<!-- 引入css文件 -->
<l:link
	path="css/bootstrap.css,css/font-awesome.css,css/ui.css,css/form.css" />

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="<l:asset path='html5shiv.js'/>"></script>
  <script src="<l:asset path='respond.js'/>"></script>
<![endif]-->
<style type="text/css">
.Validform_input {
	width:100%;
	padding-left: 1px;
	padding-right: 1px;
}
.ue-btn-primary {
	width:100%
}

</style>
<!-- 引入js文件 -->
<l:script path="jquery.js,bootstrap.js,form.js,jquery.form.js,ui.js" />

<script type="text/javascript">
	//项目上下文
	var context="<%=request.getContextPath()%>";
	$(function() {
		$("#saveForm").uValidform({
			btnSubmit : "#saveBtn",
			datatype : {//传入自定义datatype类型;
				"email" : email,
				"password2" : function(a,b,c,d){
					return a == $("#password").val();
				}
			},
			callback : function(form) {
				$.dialog({
					type : 'confirm',
					content : '您确定要提交表单吗？',
					ok : function() {
						save();
					},
					cancel : function() {
					}
				});
			}
		});

		//返回user页面
		$("#returnBtn").click(function() {
			window.location = context + "/service/framework/demo/user";
		})

	});
	//保存实例
	function save() {
		var url = context + "/service/framework/demo/user/save";
		saveForm.action = url;
		saveForm.method = "POST";
		saveForm.submit();
		/* 		//表单的异步提交
		 $("#saveForm").ajaxSubmit({
		 type: "post",
		 url: requestUrl,
		 error:function(data){
		 alert("error："+data);  
		 },
		 success:function(data){
		 //跳转到列表展现页面,前导航实现
		 window.location = context + "/jsp/framework/demo/user/user.jsp";
		 }  
		 });
		 return false; //不刷新页面  */
	}
</script>
</head>
<body>
	<div class="container" id="sandbox-container">
		<div class="col-xs-7 col-md-7">
			<form class="form-horizontal" id="saveForm" name="saveForm"
				onsubmit="return false">
				<h2 class="text-left htext">欢迎注册</h2>
				<hr class="fenge" />
				<div class="form-group">
					<div class="col-xs-12 col-md-12">
						<input type="text" class="form-control ue-form Validform_input"
							id="userName" name="userName" value="${user.username}"
							placeholder="请输入用户名" datatype="s3-15" errormsg="用户名3~15个字符:)"
							nullmsg="请设置用户名" /> <span
							class="Validform_checktip Validform_span"></span>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12 col-md-12">
						<input type="password" class="form-control ue-form Validform_input"
							id="password" name="password" value="${user.password}"
							placeholder="请设置登录密码" datatype="s6-16" errormsg="密码6~16个字符:)"
							nullmsg="请设置登录密码" /> <span
							class="Validform_checktip Validform_span"></span>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12 col-md-12">
						<input type="password" class="form-control ue-form Validform_input"
							id="password2" name="password2" value="${user.password2}"
							placeholder="请确认密码" datatype="password2" errormsg="确认密码跟密码不一样了，请重新输入:("
							nullmsg="请确认密码" /> <span
							class="Validform_checktip Validform_span"></span>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12 col-md-12">
						<input type="text" class="form-control ue-form Validform_input"
							id="email" name="archive.email" value="${user.archive.email}"
							placeholder="可用于找回密码" datatype="email" ignore="ignore"
							errormsg="请输入格式正确的电子邮箱:)" /> <span
							class="Validform_checktip Validform_span"></span>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12 col-md-12">
						<button type="button" class="btn ue-btn-primary btn-block" id="saveBtn">
							注册</button>
						<span id="msgdemo"></span>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>