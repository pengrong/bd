<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" language="java"%>
<%@ taglib uri="/tags/loushang-web" prefix="l"%>
<html>
	<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>楼上云应用支撑平台-门户</title>
	
	<link rel="stylesheet" type="text/css" href="<l:asset path='css/bootstrap.css'/>" />
    <link rel="stylesheet" type="text/css" href="<l:asset path='css/font-awesome.css'/>" />
    <link rel="stylesheet" type="text/css" href="<l:asset path='css/ui.css'/>" />
	<link rel="stylesheet" type="text/css" href="<l:asset path='css/form.css'/>" />
	<link rel="stylesheet" type="text/css" href="<l:asset path='cportal/css/cportal.css'/>" />
	<link rel="stylesheet" type="text/css" href="<l:asset path='cportal/css/jsPanel.css'/>" />
	<script type="text/javascript" src="<l:asset path='jquery.js'/>"></script>
	<script type="text/javascript" src="<l:asset path='bootstrap.js'/>"></script>
	<script type="text/javascript" src="<l:asset path='jquery-ui.js'/>"></script>
	<script type="text/javascript" src="<l:asset path='form.js'/>"></script>
	<script type="text/javascript" src="<l:asset path='arttemplate.js'/>"></script>
	<script type="text/javascript" src="<l:asset path='cportal/cportal.js'/>"></script>
	<script type="text/javascript" src="<l:asset path='cportal/jquery.jspanel.js'/>"></script>
	<script type="text/javascript" src="<l:asset path='cportal/jquery.resizeEnd.js'/>"></script>
	<script type="text/javascript" src="<l:asset path='cportal/panel.js'/>"></script>
	</head>
<body style="padding-bottom: 45px">
	<!-- 多页面显示区 -->
	<div class="pageColumn">
		<ul></ul>
	</div>
	<!-- 侧边栏 -->
	<div class="pageWidgetColumn">
		<div class="pageWidgetContainer">
		</div>	
	</div>
	<!-- 内容区 -->
	<div id="htmlContainer"></div>
</body>

<!-- 微件panel模板 -->
<script id="widgetTpl" type="text/html">
    <div class="panel ue-panel" data_widgetId="{{widgetId}}">
		<div class="panel-heading">{{widgetTitle}}
			<ul class="ue-panel-tools">
				<li><a><i class="fa fa-refresh" widget_id="{{widgetId}}"></i></a></li>
				<li><a><i class="fa fa-expand"></i></a></li>
				<li><a><i class="fa fa-times"></i></a></li>
			</ul>
		</div>
		<div class="panel-body" id="{{widgetId}}" style="height:{{height}}">
		</div>
	</div>
</script>

<!-- 添加微件按钮模板 -->
<script id="widgetAddTpl" type="text/html">
    <div align="center"; class="addWidget" >
		<button  class="addWidgetBtn" type="button">添加微件</button>
	</div>
</script>

<!-- 多页面切换模板 -->
<script id="pageTpl" type="text/html">
	<li id ={{pageId}}>	
		<a>{{pageName}}</a>
   	 	<input name="pageUrl" type="hidden" value="{{pageUrl}}">
   	 	<input name="pageId" type="hidden" value="{{pageId}}">
	</li>
</script>

<!-- 侧边栏微件容器模板 -->
<script id ="widgetDiv" type="text/html">
<li class="widgets">
	<span class="widgetType">{{widgetTypeName}}
    	<i class="fa fa-list-ul"></i>
    </span>
	<div class="isWidget">
		<ul id="{{widgetTypeId}}"></ul>
	</div>
</li>
</script>

<!-- 侧边栏微件模板 -->
<script id ="widgets" type="text/html">
<li class="widget" title="{{widgetDesc}}">
	<span style="background:url({{wLogoPath}}) no-repeat 50% 50%"></span>
    <i class="fa fa-check-square"></i>
	<input name="widgetId" type="hidden" value="{{widgetId}}">
	<input name="widgetHeight" type="hidden" value="{{widgetHeight}}">
	<input name="widgetName" type="hidden" value="{{widgetName}}">
	<label>{{widgetName}}</label>
</li>
</script>

<script type="text/javascript">
	var contextPath = '<%=request.getContextPath()%>';
</script>
</html>