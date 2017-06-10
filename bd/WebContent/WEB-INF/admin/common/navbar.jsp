<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<header class="navbar navbar-static-top navbar-bg">
		<div class="container">
					<div class="navbar-header"><a href="" class="navbar-brand">BD</a></div>
					<nav class="collapse navbar-collapse">
						<ul id="menu" class="nav navbar-nav">
							<li><a href="<%=request.getContextPath()%>/service/admin/user" class="bd-menu">用户管理</a></li>
							<li><a href="<%=request.getContextPath()%>/service/admin/topic" >专题管理</a></li>
							<li><a href="<%=request.getContextPath()%>/service/admin/category" >分类管理</a></li>
							<li><a href="<%=request.getContextPath()%>/service/admin/notice" >系统通知</a></li>
							<li><a href="<%=request.getContextPath()%>/service/admin/news" >快讯管理</a></li>
							<li><a href="<%=request.getContextPath()%>/service/admin/ad" >广告管理</a></li>
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