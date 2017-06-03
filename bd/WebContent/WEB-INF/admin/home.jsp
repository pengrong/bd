<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" language="java"%>
<%@ taglib uri="/tags/loushang-web" prefix="l"%>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	<title>Loushang UI库</title>
	
	<!-- 需要引用的CSS -->
    <link rel="shortcut icon" href="<l:asset path='platform/img/favicon.ico'/>" />
	<link rel="stylesheet" type="text/css" href="<l:asset path='css/bootstrap.css'/>" />
    <link rel="stylesheet" type="text/css" href="<l:asset path='css/font-awesome.css'/>" />
    <link rel="stylesheet" type="text/css" href="<l:asset path='css/ui.css'/>" />
	<link rel="stylesheet" type="text/css" href="<l:asset path='css/form.css'/>" />
	<link rel="stylesheet" type="text/css" href="<l:asset path='cportal/css/cportal.css'/>" />
	<link rel="stylesheet" type="text/css" href="<l:asset path='cportal/css/jsPanel.css'/>" />
    <link rel="stylesheet" type="text/css" href="<l:asset path='platform/css/home.css'/>" />

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
</head>
<body>
	<!-- 页面结构 -->
	<header class="navbar navbar-static-top navbar-bg">
		<div class="container">
					<div class="navbar-header"><a href="" class="navbar-brand">BD</a></div>
					<nav class="collapse navbar-collapse">
						<ul id="menu" class="nav navbar-nav">
							<li><a href="home.jsp" class="bd-menu">用户管理</a></li>
							<li><a href="ui-codenorm.html" >专题管理</a></li>
							<li><a href="ui-codenorm.html" >分类管理</a></li>
							<li><a href="ui-codenorm.html" >系统通知</a></li>
							<li><a href="ui-codenorm.html" >快讯管理</a></li>
							<li><a href="ui-codenorm.html" >广告管理</a></li>
						</ul>
						<div class="nav-bar navbar-nav navbar-right">
								<div class="btn-group" role="group" aria-label="...">
								  <div class="btn-group" role="group">
								    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								      <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
								      <span class="loginuser center"></span>
								    </button>
								    <ul class="dropdown-menu">
								      <li><a href="#">Dropdown link</a></li>
								      <li><a href="#">Dropdown link</a></li>
										<li><a class="center" id="quit">退出登录</a></li>
								    </ul>
								  </div>
								  <button type="button" class="btn btn-default"><span class="glyphicon glyphicon-comment" aria-hidden="true"></span></button>
								</div>
							</div>
						</div>
						</nav>
		</div>
	</header>
	<div class="container">
		<div class="row" style="position: relative;">
			<div class="list-types" style="display: none;">
				<ul>
				</ul>
			</div>
			<div class="col-md-10">
				<div class="row" id="comc">
					<div class="embed-responsive embed-responsive-16by9">
					  <iframe id="contentFrame" class="embed-responsive-item" src="..."></iframe>
					</div>
				</div>
			</div>
			<div class="col-md-2">
				<div class="input-group">
           			<input id="comName" class="form-control ue-form" type="text" placeholder="请输入组件名称"/>
           			<div id="namesearch" class="input-group-addon ue-form-btn">
           				<span class="fa fa-search"></span>
          			</div>
        		</div>
        		<div id="rc">
					<ul class="list-group">
						<li class="recommend" onClick="getComsOrderByCreateTime()"><i class="fa fa-flag"></i> <span>最新发布</span></li>
						<li class="recommend" onClick="getComsOrderByViewCounts()"><i class="fa fa-eye"></i> <span>最多浏览</span></li>
						<li class="recommend" onClick="getComsOrderByCommentCounts()"><i class="fa fa-comments-o"></i> <span>最多评价</span></li>
						<li class="recommend" onClick="getComsOrderByDownloadCounts()"><i class="fa fa-arrow-circle-o-down"></i> <span>最多下载</span></li>
					</ul>
				</div>
			</div> 
		</div>
	</div>
	<!-- 需要引用的JS -->
	<script type="text/javascript" src="<l:asset path='jquery.js'/>"></script>
	<script type="text/javascript" src="<l:asset path='bootstrap.js'/>"></script>
	<script type="text/javascript" src="<l:asset path='jquery-ui.js'/>"></script>
	<script type="text/javascript" src="<l:asset path='form.js'/>"></script>
	<script type="text/javascript" src="<l:asset path='arttemplate.js'/>"></script>
	<script type="text/javascript">
		var context="<%=request.getContextPath()%>";
		var tId="";
	    $(document).ready(function() {
		    //根据组件类别分类查询
			$(".bd-menu").on("click",function() {
				$("#contentFrame").src = this.href;
				return false;
			});
	    });
	</script>
</body>
</html>