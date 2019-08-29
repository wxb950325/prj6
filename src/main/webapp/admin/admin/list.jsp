<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>/easyui/themes/icon.css">
<script type="text/javascript" src="<%=basePath %>/easyui/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/easyui/locale/easyui-lang-zh_CN.js"></script>
<script>
$(function(){
	$('#dg').datagrid({   
	    url:'findAll', 
	    striped:true,
	    pagination:true,
	    fitColumns:true,
	    toolbar: '#tb',
	    title:'管理员管理',
	    loadMsg:'别着急',
	    columns:[[   
	        {field:'aid',title:'编号',width:100},   
	        {field:'aname',title:'用户名',width:100},   
	        {field:'apass',title:'密码',width:100,align:'right'}  
	    ]]   
	}); 
	
})
	 
	
</script>
</head>
<body>
<div id="tb">
<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">批量删除</a>
<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">增加</a>
</div>
<table id="dg"></table>
</body>
</html>