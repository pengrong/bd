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
<l:link path="css/bootstrap.css,css/font-awesome.css,css/ui.css,css/form.css,framework/demo/user/user.css"/>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="<l:asset path='html5shiv.js'/>"></script>
  <script src="<l:asset path='respond.js'/>"></script>
<![endif]-->

<!-- 引入js文件 -->
<l:script path="jquery.js,bootstrap.js,form.js,jquery.form.js,ui.js"/>

<script type="text/javascript">
	//项目上下文
	var context="<%=request.getContextPath()%>";
	$(function() {
		$("#saveForm").uValidform({
			btnSubmit:"#saveBtn",			
			datatype:{//传入自定义datatype类型;
			      "email":email
			},
			callback:function(form){
				$.dialog({
					type: 'confirm',
					content: '您确定要提交表单吗？',
					ok: function(){save();},
					cancel: function(){}
				});
			}
		});
		//日期插件
		$('.input-group.date').datetimepicker({
			language: "zh-CN",
			autoclose: true,
			minView: 2,
			format: "yyyymmdd"
		}).on("changeDate",function(){
			$(this).find("input").blur();
		}); 
		 
		//返回user页面
		$("#returnBtn").click(function() {
			window.location = context + "/service/framework/demo/user";
		})
		
		
	});
	//保存实例
	function save(){
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
	  <h2 class="text-left htext">编辑用户</h2>
	  <hr class="fenge"/>
	  <br/>
	  <div class="col-xs-10 col-md-10">	  
		<form class="form-horizontal" id="saveForm" name="saveForm" onsubmit="return false">
			<input type="hidden" value="${user.id}" name="id"/>
			<div class="form-group">
				<label class="col-xs-3 col-md-3 control-label">账号<span class="required">*</span></label>
				<div class="col-xs-8 col-md-8">
					<input type="text" class="form-control ue-form Validform_input" id="userId"
						name="userId" value="${user.userId}" 
						placeholder="账号" datatype="s3-16" errormsg="姓名3~16个字符！" nullmsg="请设置账号" />						
					<span class="Validform_checktip Validform_span"></span>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-xs-3 col-md-3 control-label">名称<span class="required">*</span></label>
				<div class="col-xs-8 col-md-8">
					<input type="text" class="form-control ue-form Validform_input" id="userName"
						name="userName" value="${user.userName}" placeholder="名称" datatype="s2-16" errormsg="姓名2~16个字符！" nullmsg="请填写名称"/>						
					<span class="Validform_checktip Validform_span"></span>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-xs-3 col-md-3 control-label">昵称</label>
				<div class="col-xs-8 col-md-8">
					<input type="text" class="form-control ue-form Validform_input" id="nickname"
						name="nickname" value="${user.nickname}"
						placeholder="昵称" datatype="s2-16" errormsg="昵称2~16个字符！" ignore="ignore">
					<div class="Validform_checktip Validform_span"></div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-xs-3 col-md-3 control-label">密码<span class="required">*</span></label>
				<div class="col-xs-8 col-md-8">
					<input type="text" class="form-control ue-form Validform_input" id="password"
						name="password" value="${user.password}" 
						placeholder="密码" datatype="s6-16" errormsg="密码6~16个字符！" nullmsg="请设置密码" />						
					<span class="Validform_checktip Validform_span"></span>
				</div>
			</div>

			<div class="form-group">
				<label class="col-xs-3 col-md-3 control-label">账号状态<span class="required">*</span></label>
				<div class="col-xs-8 col-md-8">
					<select class="form-control input-sm ue-form Validform_input" name="status" datatype="s" nullmsg="请设置账号状态">
						<option value="" <c:if test="${user.status eq ''}" >selected='selected'</c:if>>请选择</option>
						<option value="N" <c:if test="${user.status eq 'N'}" >selected='selected'</c:if>>启用</option>
						<option value="X" <c:if test="${user.status eq 'X'}" >selected='selected'</c:if>>停用</option>
					</select>
					<span class="Validform_checktip Validform_span"></span>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-xs-3 col-md-3 control-label">性别<span class="required">*</span></label>
				<div class="col-xs-8 col-md-8 text-left radio">					
					<label><input type="radio" name="archive.gender" value="M" datatype="*" nullmsg="请选择性别" <c:if test="${user.archive.gender=='M'}">checked="checked"</c:if>/>男 </label>
					<label><input type="radio" name="archive.gender" value="F" <c:if test="${user.archive.gender=='F'}">checked="checked"</c:if>/>女 </label>
					<label><input type="radio" name="archive.gender" value="N" <c:if test="${user.archive.gender=='N'}">checked="checked"</c:if>/>未知 </label>
					<span class="Validform_checktip ue-form-wrap-span"></span>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-xs-3 col-md-3 control-label">生日</label>
				<div class="col-xs-8 col-md-8">
					<div class="input-group date Validform_input">
						<input type="text" class="form-control ue-form" id="birthday" name="archive.birthday" 
							value="${user.archive.birthday}" placeholder="生日" datatype="*" ignore="ignore"/><span class="input-group-addon ue-form-btn date-input-btn"><i
							class="fa fa-calendar"></i></span>										   
					</div>
					<span class="Validform_checktip Validform_span" ></span>	
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-xs-3 col-md-3 control-label">学历</label>
				<div class="col-xs-8 col-md-8 text-left radio">
					<label><input type="radio"  name="archive.education" value="0" datatype="*" ignore="ignore" <c:if test="${user.archive.education=='0'}">checked="checked"</c:if>/>本科	</label>				 						
					<label><input type="radio"  name="archive.education" value="1" <c:if test="${user.archive.education=='1'}">checked="checked"</c:if>/>硕士</label>
					<label><input type="radio"  name="archive.education" value="2" <c:if test="${user.archive.education=='2'}">checked="checked"</c:if>/>博士</label>
					<span class="Validform_checktip"></span>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-xs-3 col-md-3 control-label">学校</label>
				<div class="col-xs-8 col-md-8">
					<input type="text" class="form-control ue-form Validform_input" id="school"
						name="archive.school" value="${user.archive.school}"
						placeholder="学校" datatype="s" ignore="ignore"/>
					<span class="Validform_checktip Validform_span"></span>					
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-xs-3 col-md-3 control-label">电子邮件</label>
				<div class="col-xs-8 col-md-8">
					<input type="text" class="form-control ue-form Validform_input" id="email"
						name="archive.email" value="${user.archive.email}"
						placeholder="邮件地址" datatype="email" ignore="ignore" errormsg="请填写正确的邮箱地址"/>				    
					<span class="Validform_checktip Validform_span" ></span>
				</div>			
			</div>
			
			<div class="form-group" >
			  <label class="col-xs-3 col-md-3 control-label"></label>
			  <div class="col-xs-8 col-md-8">
					<button type="button" class="btn ue-btn-primary" id="saveBtn" >
						保存
					</button>
					<button type="button" class="btn ue-btn" id="returnBtn">
						 返回
					</button>
					<span id="msgdemo"></span>
			</div>
		  </div>
		</form>
		</div>
	</div>
</body>
</html>