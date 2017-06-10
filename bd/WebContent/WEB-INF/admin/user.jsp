<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/tags/loushang-web" prefix="l"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>用户列表</title>
<%@include file="/WEB-INF/admin/common/head.jsp"%>
</head>
<body>
	<!-- 页面结构 -->
	<%@include file="/WEB-INF/admin/common/navbar.jsp"%>
	<div class="container">
		<div class="col-xs-12 col-md-12"> 
		<div class="row">
			<form class="form-inline" onsubmit="return false;">
				<div class="input-group">
					<input class="form-control ue-form" type="text" id="username"
						placeholder="平台名称" />
					<div class="input-group-addon ue-form-btn" id="query">
						<span class="fa fa-search"></span>
					</div>
				</div>
				<div class="btn-group pull-right">
					<button id="add" type="button" class="btn ue-btn">
						<span class="fa fa-plus"></span> 增加
					</button>
				</div>
			</form>
		</div>
		</div>
	</div>
		<div class="container">
			<table id="userList" class="table table-bordered table-hover">
				<thead>
					<tr>
						<th width="10%" data-field="id" data-sortable="false"
							data-render="rendercheckbox"><input type="checkbox"
							id="selectAll" onchange="selectAll(this,'checkList')" /></th>
						<th width="18%" data-field="username">账号</th>
						<th width="18%" data-field="showname">平台名称</th>
						<th width="18%" data-field="nickname">昵称</th>
						<th width="18%" data-field="id" data-render="renderoptions">操作</th>
					</tr>
				</thead>
			</table>
		</div>
	<!-- 需要引用的JS -->
	<%-- <script type="text/javascript" src="<l:asset path='arttemplate.js'/>"></script> --%>
	<l:script
		path="jquery.js,bootstrap.js,form.js,datatables.js,loushang-framework.js,ui.js" />
	<script type="text/javascript">
		var context="<%=request.getContextPath()%>";
		$(document).ready(
				function() {
					var options = {};
					var url = context + "/service/admin/user/query";
					grid = new L.FlexGrid("userList", url);
					grid.init(options); //初始化datatable
					//搜索
					$("#query").bind("click", query);
					//增加
					$("#add").on("click", modify);
					// 删除
					$(document).on(
							"click",
							".del",
							function() {
								var recordIds = grid.oTable.row(
										$(this).parents("tr")).data().id;
								$.dialog({
									type : 'confirm',
									content : '确认删除该记录?',
									autofocus : true,
									ok : function() {
										$.ajax({
											url : context + "/service/admin/user/delete/" + recordIds,
											success : function(){
												$.dialog({
													   type: 'alert',
													   content: '保存成功！'
													 });
												grid.reload();
											},
											error : function(){
												$.dialog({
													   type: 'alert',
													   content: '删除失败！'
													 });
											}
										});
									},
									cancel : function() {
									}
								});
							});
					// 编辑
					$(document).on("click", ".modify",
							function() {
								var data = grid.oTable.row($(this).parents("tr")).data();
								modify(data);
							});
				});

		// 查询
		function query() {
			grid.setParameter("username@like", $("#username").val());
			grid.reload();
		}
		function modify(data) {
			var url = context + "/service/admin/user/edit";
			if (data.id) {
				url += "?id=" + data.id;
			}
			$.dialog({
				type : 'iframe',
				url : url,
				title : '平台信息',
				width : 700,
				height : 400,
				onshow : function() {
				},
				onclose : function() {
					if (this.returnValue != "") {
						eval("var str='" + JSON.stringify(this.returnValue)
								+ "';");
						$('#rtnValue').val(str);
					}
				},
				oniframeload : function() {
				}
			});

		}

		function rendercheckbox(data, type, full) {
			return '<input type="checkbox" value="' + data + '" title="' + data + '" id="checkbox" name="checkboxlist"/>';
		};

		function renderoptions(data, type, full) {
			var delBtn = "<a class=\"del\" >删除</a>";
			var editBtn = "<a class=\"modify\">编辑</a>";

			return delBtn + "&nbsp;&nbsp;&nbsp;" + editBtn;
		}
	</script>
</body>
</html>