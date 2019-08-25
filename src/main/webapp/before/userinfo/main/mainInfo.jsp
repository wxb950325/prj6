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
<script>
	$(function(){
		$('#pg').propertygrid({   
		    url: 'myinfo',   
		    showGroup: true,   
		    scrollbarSize: 0   
		});
		var row = {   
				  name:'AddName',   
				  value:'',   
				  editor:'text'  
				};   
		$('#pg').propertygrid('appendRow',row);  
	})


</script>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:false" style="text-align:center;height:60px;background:#B3DFDA;padding:10px" >
		<h3>个人中心</h3>
	</div>
	<div data-options="region:'west',split:true,title:'列表'" style="width:288px;padding:10px;">
		<ul type="circle">
			<li>基础信息</li> 
			<li>地址信息</li> 
			<li>地址信息</li> 
			<li>地址信息</li> 
		</ul>
	</div>
	<div data-options="region:'east',split:true,title:'East'" style="width:276px;padding:10px;">east region</div>
	<div data-options="region:'south',border:false" style="height:50px;background:#A9FACD;padding:10px;">south region</div>
	<div data-options="region:'center',title:''">
		<table id="pg" style="width:800px"></table>  
	</div>
</body>

</html>