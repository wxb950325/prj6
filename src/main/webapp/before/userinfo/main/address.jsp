<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=basePath %>easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>easyui/themes/icon.css">
<script type="text/javascript" src="<%=basePath %>easyui/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath %>easyui/jquery.easyui.min.js"></script>


</head>
<body>
<script type="text/javascript" src="<%=basePath %>easyui/locale/easyui-lang-zh_CN.js"></script>
<script>
	$(function(){
		$('#dg').datagrid({   
		    url:'/before/address/main/findByUid',
		    queryParams: {
				uid: '8'
			},
			fitColumns:true,
			striped:true,
			pagination:true,
			toolbar: '#tb',
		    columns:[[   
		        {field:'uname',title:'用户登录名',width:100},   
		        {field:'consignee',title:'收货人',width:100},   
		        {field:'phonenum',title:'手机号',width:100},   
		        {field:'address',title:'收货地址',width:100}, 
		        {field:'isdefault',title:'是否默认',width:100}, 
		        {field:'opeator',title:'操作',width:100,
					formatter: function(value,row,index){
						return "<a id=\"btn\" href=\"javascript:deleteItem("+row.aid+")\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-remove'\">删除</a>";
					}
				 }
		    ]],
		    onLoadSuccess: function(index,field,value){
				$('.easyui-linkbutton').linkbutton({   
				});  
			}    
		});  
	})
	
	function deleteItem(aid){
		$.getJSON("/before/address/main/delete",{aid:aid},function(json){
			$('#dg').datagrid('reload');
		});
	}
</script>
<table id="dg"></table>
<div id="tb">
<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">批量删除</a>
<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">增加</a>
</div>
</body>
</html>