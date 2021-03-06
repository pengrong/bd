<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" language="java"%>
<%@ taglib uri="/tags/loushang-web" prefix="l"%>
<html >
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>用户登录</title>

    <!-- 需要引用的CSS -->
    <link rel="shortcut icon" href="<l:asset path='platform/img/favicon.ico'/>" />
	<link rel="stylesheet" type="text/css" href="<l:asset path='css/bootstrap.css'/>" />
    <link rel="stylesheet" type="text/css" href="<l:asset path='css/font-awesome.css'/>" />
    <link rel="stylesheet" type="text/css" href="<l:asset path='css/ui.css'/>" />
	<link rel="stylesheet" type="text/css" href="<l:asset path='css/form.css'/>" />
    <link rel="stylesheet" type="text/css" href="<l:asset path='platform/css/login.css'/>" />
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
  <div class="container"><div class="row" >
  <div class="col-xs-6 col-md-offset-3" >
	<!-- 页面结构 -->
	<form class="form-login"  id="loginForm" method="post">
		<div class="error">
		</div>
		<div class="login-content">
			<div class="form-group">
				<input type="text" class="form-control ue-form" id="username" value="" placeholder="请输入用户名"/>
			</div>
			<div class="form-group">
				<input type="password" class="form-control ue-form" id="password" value="" placeholder="请输入密码"/>
			</div>
			<div class="checkbox">
				<label class="form-checkbox">
					<input type="checkbox"> 下次自动登录
				</label>
				<label class="form-forget">
					<a>忘记密码？</a>
				</label>
			</div>
			<div class="form-group">
			<button class="btn btn-primary btn-login btn-block" id="submit">登录</button>
			</div>
		</div>
	</form>
	</div>
	</div>
	</div>
    <!-- 需要引用的JS -->
	<script type="text/javascript" src="<l:asset path='jquery.js'/>"></script>
	<script type="text/javascript" src="<l:asset path='bootstrap.js'/>"></script>
	<script type="text/javascript" src="<l:asset path='jquery-ui.js'/>"></script>
	<script type="text/javascript" src="<l:asset path='form.js'/>"></script>
   	<script type="text/javascript">
	var context="<%=request.getContextPath()%>";
   	var dialog = parent.dialog.get(window);
    $(document).ready(function(){
    	$("#submit").bind("click", function(){
    		$("#loginForm").attr("action",context + "/service/admin/login");
    		$("#loginForm").submit();
    	})
    	
    });
   	</script>
  </body>
</html>