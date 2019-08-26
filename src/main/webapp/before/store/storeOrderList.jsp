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
		$('#ff').form('clear');
		$('#win').window('open'); // 打开窗口  
	}

	function dosave(){
		$('#ff').form('submit', {   
		    url:"saveOrder",   
		    onSubmit: function(){   
		        // do some check   
		        // return false to prevent submit;   
		    },   
		    success:function(data){   
		       var json = eval("("+data+")");
		       $.messager.show({
					title : 'My Title',
					msg : json.msg,
					timeout : 4000,
					showType : 'slide'
				});
		       $('#win').window('close'); // 关闭窗口 
				$('#dg').datagrid('reload');
		    }   
		});  
	}
</script>
	<table id="dg"></table>
	<div id="tb">
		<a href="#" class="easyui-linkbutton"
			data-options="iconCls:'icon-help',plain:true">帮助</a> 
			<a href="javascript:openForm()" class="easyui-linkbutton"
			data-options="iconCls:'icon-save',plain:true">增加</a>
	</div>
	<div id="win" class="easyui-window" title="My Window"
		style="width: 600px; height: 400px"
		data-options="iconCls:'icon-save',modal:true,closed:true">
		新增订单
		<form id="ff" method="post">
			<div>
				<label for="orderNum">订单名:</label> <input class="easyui-validatebox"
					type="text" name="orderNum" data-options="required:true" />
			</div>
			<div>
				<label for="pwid">pwid:</label> <input class="easyui-numberbox"
					type="text" name="pwid" data-options="required:true" />
			</div>
			<div>
				<label for="sname">商户名:</label> <input class="easyui-validatebox"
					type="text" name="sname" data-options="required:true" />
			</div>
			<div>
				<label for="uid">用户编号:</label> <input class="easyui-numberbox"
					type="number" name="uid" data-options="required:true" />
			</div>
			<div>
				<label for="userOid">用户订单编号:</label> 
				<input type="text" class="easyui-numberbox" data-options="min:0,precision:2"></input>
			</div>
			<div>
				<label for="evalstatus">evalstatus:</label>  
	        <input type="radio" name="evalstatus" value="0">不可用<input type="radio" name="evalstatus" value="1">可用
			</div>
			<div>
				<label for="orderstatus">订单状态:</label>  
	        <input type="radio" name="orderstatus" value="0">已受理<input type="radio" name="orderstatus" value="1">未受理
			</div>
			<div>
				<label for="pNum">pNum:</label> <input class="easyui-validatebox"
					type="text" name="pNum" data-options="required:true" />
			</div>
			<div>
				<label for="orderMoney">订单价格:</label> <input class="easyui-numberbox"
					type="text" name="orderMoney" data-options="min:0,precision:2" />
			</div>
			<div>
				<label for="payTime">支付时间:</label>
				<input type="datetime" min="1970-01-01" max="2099-12-31" name="payTime">
<!-- 				<input class="easyui-datetimebox" name="birthday"     -->
<!--         data-options="required:true,showSeconds:false" value="2010/1/1 2:3" style="width:150px"> -->
			</div>
			<div>
				<label for="phonenum">联系方式:</label> <input class="easyui-validatebox"
					type="text" name="phonenum" data-options="required:true" />
			</div>
			<div>
				<label for="receiptor">收件人:</label> <input class="easyui-validatebox"
					type="text" name="receiptor" data-options="required:true" />
			</div>
			<div>
				<label for="address">地址:</label> <input class="easyui-validatebox"
					type="text" name="address" data-options="required:true" />
			</div>
			<label for="isdelete">是否删除:</label>  
	        <input type="radio" name="isdelete" value="0">已删除<input type="radio" name="isdelete" value="1">已保留
			<div>  
		    		<input type="button" onclick="dosave()" value="保存" />  
		    </div>
		</form>
	</div>

</body>
</html>