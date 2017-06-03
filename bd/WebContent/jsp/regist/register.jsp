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
	width: 100%;
	padding-left: 1px;
	padding-right: 1px;
}

.ue-btn-primary {
	width: 100%
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
				"password2" : function(a, b, c, d) {
					return a == $("#password").val();
				}
			},
			callback : function(form) {
				save();
			}
		});
	});
	//保存实例
	function save() {
		var url = context + "/service/db/user/register";
		saveForm.action = url;
		saveForm.method = "POST";
		saveForm.submit(); 
		//表单的异步提交
		$("#saveForm").ajaxSubmit({
					type : "post",
					url : url,
					error : function(data) {
						$("#msgdemo").html("错误：" + data);
					},
					success : function(data) {
						if(data && data.success==false){
							$("#msgdemo").html("对不起，出错了：" + data.message);
						}else{
							window.location = context;
						}
					}
				});
		return false; //不刷新页面 
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
							id="username" name="username" value="${user.username}"
							placeholder="请输入用户名" datatype="s1-15" errormsg="用户名3~15个字符:)"
							nullmsg="请设置用户名" /> <span
							class="Validform_checktip Validform_span"></span>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12 col-md-12">
						<input type="password"
							class="form-control ue-form Validform_input" id="password"
							name="password" value="${user.password}" placeholder="请设置登录密码"
							datatype="s1-16" errormsg="密码6~16个字符:)" nullmsg="请设置登录密码" /> <span
							class="Validform_checktip Validform_span"></span>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12 col-md-12">
						<input type="password"
							class="form-control ue-form Validform_input" id="password2"
							name="password2" value="${user.password2}" placeholder="请确认密码"
							datatype="password2" errormsg="确认密码跟密码不一样了，请重新输入:("
							nullmsg="请确认密码" /> <span
							class="Validform_checktip Validform_span"></span>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12 col-md-12">
						<input type="text" class="form-control ue-form Validform_input"
							id="email" name="email" value="${user.email}"
							placeholder="可请输入电子邮箱，用于找回密码" datatype="email" ignore="ignore"
							errormsg="请输入格式正确的电子邮箱:)" /> <span
							class="Validform_checktip Validform_span"></span>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12 col-md-12">
						<button type="button" class="btn ue-btn-primary btn-block"
							id="saveBtn">注册</button>
						<span id="msgdemo" class="text-danger"></span>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>