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
<title>商户订单页</title>
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
							url : 'findAllOrder',
							fitColumns : true,
							striped : true,
							pagination : true,
							toolbar : '#tb',
							title : '商户订单管理',
							columns : [ [
									{
										field : 'storeOid',
										title : '商户订单id',
										width : 100
									},
									{
										field : 'orderNum',
										title : '订单名',
										width : 100
									},
									{
										field : 'pwid',
										title : 'pwid',
										width : 100
									},
									{
										field : 'sname',
										title : '商户名',
										width : 100
									},
									{
										field : 'uid',
										title : '用户名',
										width : 100
									},
									{
										field : 'userOid',
										title : '用户订单id',
										width : 100
									},
									{
										field : 'evalstatus',
										title : 'evalstatus',
										width : 100
									},
									{
										field : 'orderstatus',
										title : '订单状态',
										width : 100
									},
									{
										field : 'pNum',
										title : 'p_num',
										width : 100
									},
									{
										field : 'orderMoney',
										title : 'order_money',
										width : 100
									},
									{
										field : 'payTime',
										title : '支付时间',
										width : 100
									},
									{
										field : 'phonenum',
										title : 'phonenum',
										width : 100
									},
									{
										field : 'receiptor',
										title : 'receiptor',
										width : 100
									},
									{
										field : 'address',
										title : '地址',
										width : 100
									},
									{
										field : 'isdelete',
										title : '目前状态',
										width : 100,
										formatter : function(value, row, index) {
											if (value == 1) {
												return '已保留';
											} else {
												return '已删除';
											}
										}
									},
									{
										field : 'operate',
										title : '操作',
										width : 100,
										formatter : function(value, row, index) {
											// 											var btns = "<a id=\"btn\" href=\"javascript:deleteItem("+row.tid+")\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-remove'\">删除</a>";
											// 								        	btns += "<a id=\"btn\" href=\"javascript:findById("+row.tid+")\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-edit'\">修改</a>"; 
											return "<a id=\"btn\" href=\"javascript:deleteItem("
													+ row.storeOid
													+ ")\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-remove'\">删除</a> ";
										}
									}

							] ],
							onLoadSuccess : function(index, field, value) {
								$('.easyui-linkbutton').linkbutton({});
							}
						});
	})
	function deleteItem(storeOid) {
		// 		alert(storeOid);
		$.messager.confirm('Confirm',
				'Are you sure you want to delete record?', function(r) {
					if (r) {
						$.getJSON("deleteOrder", {
							storeOid : storeOid
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