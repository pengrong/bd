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
							<li><a href="ui-compatibility.html" >实时预测</a></li>
							<li><a href="ui-codenorm.html" >行情日历</a></li>
							<li><a href="">交流论坛</a></li>
						</ul>
						<div class="nav-bar navbar-nav navbar-right">
								<div class="btn-group login-group" role="group" aria-label="...">
								  <button type="button" class="btn btn-default login">登录</button>
								  <button type="button" class="btn btn-default regist">注册</button>
								</div>
								<div class="user-group">
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
			<div class="col-md-6">
				<div class="embed-responsive embed-responsive-16by9">
				  <iframe class="embed-responsive-item" src="http://image.sinajs.cn/newchart/daily/n/sh000001.gif"></iframe>
				</div>
			</div>
			<div class="col-md-6">
				<div class="embed-responsive embed-responsive-16by9">
				  <iframe class="embed-responsive-item" src="..."></iframe>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row" style="position: relative;">
			<div class="list-types" style="display: none;">
				<ul>
				</ul>
			</div>
			<div class="col-md-10">
				<div class="row" id="comc">
					<div class="embed-responsive embed-responsive-16by9">
					  <iframe class="embed-responsive-item" src="..."></iframe>
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
	<script type="text/javascript" src="<l:asset path='home.js'/>"></script>
	<script type="text/html" id="component">
{{ each components as component i }}
	<div class="col-md-3 col-sm-4 component-item">
        <div class="component">
            <div class="link">
               <a href="ui.jsp?comId={{component.id}}" target="_blank"><img src="demo/{{component.id}}/thumbnail.jpg"></a>
            </div>
            <article>
            	<a href="ui.jsp?comId={{component.id}}" target="_blank">
                	{{component.name}}
                </a>
                <small>{{component.description}}</small>
            </article>
        </div>
    </div>
{{/each}}
</script>

<!-- 一级分类菜单模板 -->
<script type="text/html" id="comtype">
{{each comtypes as comtype i }}
	<li id={{comtype.id}} class="sign"><a>{{comtype.name}}<i class="fa fa-angle-down"></i></a>
	</li>
{{/each}}
</script>

<!-- 二级分类菜单模板 -->
<script type="text/html" id="typesub">
  <ul>
  {{each typesubs as typesub i }}
     <li id={{typesub.id}}><a><i class="fa fa-th-large"></i>{{typesub.name}}</li></a>
  {{/each}}
 </ul>
</script>
	<script type="text/javascript">
		var context="<%=request.getContextPath()%>";
		var tId="";
	    $(document).ready(function() {
	    	//初始所有组件，判断是否有从ui.jsp接收typeId
		    var typeId = 'null';
		    if(typeId == "null"){
		    	//初始所有组件 
			 	//getAllComs();
		    }
		    else {
		    	//根据组件类别分类查询
		    	 getComsByTypeId(typeId);
		    }	
		    
		    //根据组件类别分类查询
			$(".list-types").on("click","li",function() {
				var typeId = $(this).attr("id");
				tId = typeId;
				getComsByTypeId(typeId);
			});
	    	 		
		    //根据组件名称模糊查询，按钮
	 		$("#namesearch").on("click",function() {
	 			 getComsByName();
			});
				    	
			//根据组件名称模糊查询，搜索框回车事件
			$("#comName").keydown(function(event) {
				if(event.keyCode == 13)
				{
					getComsByName();
			   	}
			});
	    });
	</script>
</body>
</html>