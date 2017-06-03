<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="/tags/loushang-web" prefix="l"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>菜单信息</title>
	<link rel="stylesheet" type="text/css" href="<l:asset path='css/bootstrap.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<l:asset path='css/font-awesome.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<l:asset path='css/ui.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<l:asset path='css/form.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<l:asset path='css/slickgrid.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<l:asset path='framework/demo/product/product.css'/>"/>
	<style type="text/css">
	  .container {
	  	width: 100%;
	  };
	</style>
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="<l:asset path='html5shiv.js'/>"></script>
      <script src="<l:asset path='respond.js'/>"></script>
    <![endif]-->
	<script type="text/javascript" src="<l:asset path='jquery.js'/>"></script>
	<script type="text/javascript" src="<l:asset path='bootstrap.js'/>"></script>
	<script type="text/javascript" src="<l:asset path='form.js'/>"></script>
	<script type="text/javascript" src="<l:asset path='datatables.js'/>"></script>
	<script type="text/javascript" src="<l:asset path='slickgrid.js'/>"></script>
	<script type="text/javascript" src="<l:asset path='loushang-framework.js'/>"></script>
	<script type="text/javascript" src="<l:asset path='ui.js'/>"></script>
	
	<script id="searchpanel" type="text/html">
	  <div id="searchtemp">
		<div class="form-group">
			<label for="productId" class="text-name">商品ID:</label> 
			<input type="text" class="form-control ue-form" id="productId" placeholder="商品ID">
		</div>
        <div style="margin:10px 50px">
			<button id="search" class="btn ue-btn-primary">搜索</button>
		</div>
      <div>
	</script>
<script type="text/javascript">
//项目上下文
var context="<%=request.getContextPath()%>";
// 定义表格对象
var grid;
// 表格数据
var data = [];
var dataView;
$(document).ready(function() {
	// 初始化表格
	initTable();
	
	// 增加
	$("#add").bind("click",add);
	
	// 保存
	$("#save").bind("click",save);
	
	//搜索
	$("#query").bind("click",query);
	
	//更多搜索
	$("#moresearch").popover({
	    title: "",
	    content: $("#searchpanel").html(),
	    placement: "bottom",
	    html: true,
	    trigger: "click"
	});
	
	//批量删除
	$("#del").bind("click",del);
});

// 初始化表格
function initTable() {
	var options={
	};
	
	var url = context+"/service/framework/demo/product/query";
	grid = new L.EditGrid("productList", url);
	grid.init(options);		// 初始化editGrid
}

// 查询
function query() {
	grid.setParameter("productName@like", $("#productName").val());
	grid.reload();
}

// 增加一行
function add() {
	grid.addRow({});
}

// 保存数据
function save() {
  	var changedRows = grid.getChangedData();
  	if(changedRows.length == 0){
  		$.dialog({
  			type: "alert",
  			content: "没有需保存的数据"
  		});
  		return ;
  	}
	var url = context + "/service/framework/demo/product/save";
	var json = JSON.stringify(changedRows);
	$.ajax({
		url : url,
		type : "POST",
		async : false,
		contentType: "application/json",
		dataType: "json",
		data: json,
		success : function(data){
			if(data.success == true)
			  $.dialog({
				 type:"alert",
				 content:"保存成功",
				 autofocus: true
			});
		},
		error : function(data, textstatus){
			$.dialog({
				 type:"alert",
				 content:"错误",
				 autofocus: true
			 });
		}
	}); 
}

//删除
function del(){
	grid.deleteRow();
}


// 渲染列值
function renderstatus(row, cell, value, columnDef, dataContext){
	if(value == "0")
		return "食品";
	if(value == "1")
		return "水果";
	if(value == "2")
		return "器材";
	return value;
}

// 获取类别下拉框选项值
function getTypeSelectVal() {
	var arr = [];
	arr.push({
		key: 0,
		value: "食品"
	});
	arr.push({
		key: 1,
		value: "水果"
	});
	arr.push({
		key: 2,
		value: "器材"
	});
	return arr;
}

</script>
</head>
<body>
	<div class="topdist"></div>
	<div class="container">
	   <div class="row">
		<form class="form-inline" onsubmit="return false;">										
			<div class="input-group">
		        <input class="form-control ue-form" type="text" id="productName" placeholder="商品名称"/>
		        <div class="input-group-addon ue-form-btn" id="query">
		        	<span class="fa fa-search"></span>
		        </div>
	        </div>
		    <a class="btn ue-btn dbtn" id="moresearch">更多搜索<i class="fa fa-angle-down"></i></a>
		    <div class="btn-group pull-right">
				<button id="add" type="button"
					class="btn ue-btn">
					<span class="fa fa-plus"></span> 增加
				</button>
				<button id="del" type="button"
					class="btn ue-btn">
					<span class="fa fa-minus"></span> 删除
				</button>
				<button id="save" type="button"
					class="btn ue-btn">
					<span class="fa fa-save"></span> 保存
				</button>
			</div>
		</form>
	</div>
		<table id="productList">
			<thead>
				<tr>
					<th width="5%" data-field="id" data-render="checkbox"></th>
					<th width="20%" data-field="productCode" data-editor="text">商品编号</th>
					<th width="25%" data-field="productName" data-sortable="true" data-editor="text">商品名称</th>
					<th width="15%" data-field="productType" data-editor="select" data-source="getTypeSelectVal" data-render="renderstatus">商品类别</th>
                    <th width="15%" data-field="productNum" data-editor="text" data-validator="isNumber">商品数量</th>	
                    <th width="20%" data-field="productDate" data-editor="date">生产日期</th>
                </tr>
			</thead>
		</table>
	</div>
</body>
</html>