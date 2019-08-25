<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Store</title>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>js/easyui/themes/icon.css">
<script type="text/javascript" src="<%=basePath%>js/jquery-2.0.3.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script>
	$(function() {
		$('#dg')
				.datagrid(
						{
							url : 'findAll',
							fitColumns : true,
							striped : true,
							pagination : true,
							toolbar : '#tb',
							title : '商户管理',
							columns : [ [
									{
										field : 'sid',
										title : '商户id',
										width : 100
									},
									{
										field : 'sname',
										title : '商户名称',
										width : 100
									},
									{
										field : 'uid',
										title : '用户id',
										width : 100
									},
									{
										field : 'legalName',
										title : '法人姓名',
										width : 100
									},
									{
										field : 'legalPhoto',
										title : '法人照片',
										width : 100
									},
									{
										field : 'provinceId',
										title : '省份编号',
										width : 100
									},
									{
										field : 'provinceName',
										title : '省份名称',
										width : 100
									},
									{
										field : 'cityId',
										title : '城市编号',
										width : 100
									},
									{
										field : 'cityName',
										title : '城市名称',
										width : 100
									},
									{
										field : 'zoneId',
										title : '区县编号',
										width : 100
									},
									{
										field : 'zoneName',
										title : '区县名称',
										width : 100
									},
									{
										field : 'assessorId',
										title : 'assessorId',
										width : 100
									},
									{
										field : 'isaudit',
										title : '上架状态',
										width : 100
									},
									{
										field : 'audittime',
										title : '上架时间',
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
	function deleteItem(sid) {
		$.messager.confirm('提示', '你确定要删除这一项吗?', function(r) {
			if (r) {
				$.getJSON("delete", {
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
</head>
<body>
	<!-- 	<h3>商户管理</h3> -->
	<!-- 	<table class="table table-bordered table-hover table-striped" -->
	<!-- 		border="1"> -->
	<!-- 		<tr> -->
	<!-- 			<td>sid</td> -->
	<!-- 			<td>sname</td> -->
	<!-- 			<td>uid</td> -->
	<!-- 			<td>legal_name</td> -->
	<!-- 			<td>legal_photo</td> -->
	<!-- 			<td>province_id</td> -->
	<!-- 			<td>province_name</td> -->
	<!-- 			<td>city_id</td> -->
	<!-- 			<td>city_name</td> -->
	<!-- 			<td>zone_id</td> -->
	<!-- 			<td>zone_name</td> -->
	<!-- 			<td>assessor_id</td> -->
	<!-- 			<td>isAudit</td> -->
	<!-- 			<td>audittime</td> -->
	<!-- 			<td>isdelete</td> -->
	<!-- 			<td>操作</td> -->
	<!-- 		</tr> -->
	<%-- 		<c:forEach items="${list }" var="store"> --%>
	<!-- 			<tr> -->
	<%-- 				<td>${store.sid }</td> --%>
	<%-- 				<td>${store.sname }</td> --%>
	<%-- 				<td>${store.uid }</td> --%>
	<%-- 				<td>${store.legalName }</td> --%>
	<%-- 				<td>${store.legalPhoto }</td> --%>
	<%-- 				<td>${store.provinceId }</td> --%>
	<%-- 				<td>${store.provinceName }</td> --%>
	<%-- 				<td>${store.cityId }</td> --%>
	<%-- 				<td>${store.cityName }</td> --%>
	<%-- 				<td>${store.zoneId }</td> --%>
	<%-- 				<td>${store.zoneName }</td> --%>
	<%-- 				<td>${store.assessorId }</td> --%>
	<%-- 				<td>${store.isaudit }</td> --%>
	<%-- 				<td>${store.audittime }</td> --%>
	<%-- 				<td>${store.isdelete==0?'已删除':'正常' }</td> --%>
	<%-- 				<td><a href=""> ${store.isdelete?'恢复':'删除' } </a> | <a --%>
	<%-- 					href="findById?sid=${store.sid}"> edit </a></td> --%>
	<!-- 			</tr> -->
	<%-- 		</c:forEach> --%>
	<!-- 	</table> -->
	<!-- 	<a href="/before/store/goInput">添加商户</a> -->
	<!-- 	<button class="btn btn-info" class="btn"> -->
	<!-- 		<a href="/before/store/goInput">添加商户</a> -->
	<!-- 	</button> -->
	<table id="dg"></table>
	<div id="tb">
		<a href="#" class="easyui-linkbutton"
			data-options="iconCls:'icon-remove',plain:true">批量删除</a> <a
			href="javascript:openForm()" class="easyui-linkbutton"
			data-options="iconCls:'icon-save',plain:true">增加</a>
	</div>
	<hr align="center" width="90%" size="1">
	<!-- 版权 -->
	<div class="bottom_margin"></div>
	<div class="allcopy"
		style="color: #4a4a49 !important; font-size: 13px;" align="center">
		Copyright &copy; 2018-2019 辽宁禾丰牧业股份有限公司版权所有 <a href="javascript:;"
			onClick="goToMinistry();return false;">辽ICP备14005490号-5</a>
	</div>
</body>
</html>