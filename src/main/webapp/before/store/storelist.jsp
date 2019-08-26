<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商户管理</title>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>js/easyui/themes/icon.css">
<script type="text/javascript" src="<%=basePath%>js/jquery-2.0.3.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/easyui/locale/easyui-lang-zh_CN.js"></script>

</head>
<body>
<script>
	$(function() {
		$('#dg')
				.datagrid(
						{
							url : 'findAllStore',
							fitColumns : true,
							striped : true,
							pagination : true,
							toolbar : '#tb',
							title : '商户管理',
							 columns:[[   
						        {field:'sid',checkbox:'checkbox',title:'商户id',width:100},   
						        {field:'sname',title:'商户名称',width:100}, 
						        {field:'uid',title:'用户id',width:100},  
						        {field:'legalName',title:'法人名称',width:100},  
						        {field:'legalPhoto',title:'法人照片',width:100},  
						        {field:'provinceId',title:'省id',width:100},  
						        {field:'provinceName',title:'省名称',width:100}, 
						        {field:'cityId',title:'市id',width:100},
						        {field:'cityName',title:'市名称',width:100},
						        {field:'zoneId',title:'区id',width:100},
						        {field:'zoneName',title:'区名称',width:100},
						        {field:'assessorId',title:'审核员id',width:100},
						        {field:'isaudit',title:'审核状态',width:100},
						        {field:'audittime',title:'审核时间',width:100},		        
						        
						        {field:'isdelete',title:'软删除',width:100,formatter: function(value,row,index){
									if (value==0){
										return '已保留';
									} else {
										return '已删除';
									}
								}
								},
						  
						        {field:'operate',title:'操作',width:100,formatter: function(value,row,index){
						        	var btns = "<a id=\"btn\" href=\"javascript:deleteItem("+row.tid+")\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-remove'\">删除</a>";
						        	btns += "<a id=\"btn\" href=\"javascript:findById("+row.tid+")\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-edit'\">修改</a>"; 
									return btns;
								}
								}
							    ]],
							onLoadSuccess : function(index, field, value) {
								$('.easyui-linkbutton').linkbutton({});
							}
						});
	})
	function deleteItem(sid) {
		// 		alert(storeOid);
		$.messager.confirm('Confirm',
				'Are you sure you want to delete record?', function(r) {
					if (r) {
						$.getJSON("deleteStore", {
							sid : sid
						}, function(json) {
							$.messager.show({
								title : 'My Title',
								msg : json.msg,
								timeout : 4000,
								showType : 'slide'
							});
							$('#dg').datagrid('reload'); // reload the current page data  
						});
					}
				});
	}
	function openForm() {
		$('#win').window('open'); // 打开窗口  
	}
</script>
	<table id="dg"></table>
	<div id="tb">
		<a href="#" class="easyui-linkbutton"
			data-options="iconCls:'icon-remove',plain:true">批量删除</a> <a
			href="javascript:openForm()" class="easyui-linkbutton"
			data-options="iconCls:'icon-save',plain:true">增加</a>
	</div>
	<div id="win" class="easyui-window" title="My Window"
		style="width: 600px; height: 400px"
		data-options="iconCls:'icon-save',modal:true,closed:true">
		新增订单
		<form id="ff" method="post">
			<div>
				<label for="name">Name:</label> <input class="easyui-validatebox"
					type="text" name="name" data-options="required:true" />
			</div>
			<div>
				<label for="email">Email:</label> <input class="easyui-validatebox"
					type="text" name="email" data-options="validType:'email'" />
			</div>
			...
		</form>
	</div>

</body>
</html>