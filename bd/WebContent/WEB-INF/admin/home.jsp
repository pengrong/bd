<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/tags/loushang-web" prefix="l"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	<title>Loushang UI库</title>
<%@include file="/WEB-INF/admin/common/head.jsp" %>
</head>
<body>
	<!-- 页面结构 -->
	<%@include file="/WEB-INF/admin/common/navbar.jsp" %>
	<div class="container">
		<div class="row" style="position: relative;">
			<div class="list-types" style="display: none;">
				<ul>
				</ul>
			</div>
			<div class="col-md-10">
				<div class="row" id="comc">
					<div class="embed-responsive embed-responsive-16by9">
					  <iframe id="contentFrame" class="embed-responsive-item" src="home"></iframe>
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
	    });
	</script>
</body>
</html>