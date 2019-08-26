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
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css" />
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
							url : 'findAll2Seller',
							fitColumns : true,
							striped : true,
							pagination : true,
							toolbar : '#tb',
							title : '商品管理',
							columns : [ [
									{
										field : 'pid',
										title : '商品id',
										width : 100,
										align : 'center'
									},
									{
										field : 'pName',
										title : '商品名称',
										width : 100,
										align : 'center'
									},
									{
										field : 'tid',
										title : '类型id',
										width : 100,
										align : 'center'
									},
									{
										field : 'stock',
										title : '商品库存',
										width : 100,
										align : 'center'
									},
									{
										field : 'photo',
										title : '商品图片',
										width : 100,
										formatter:function (value,row,index){
											 if('' != value && null != value){
													var strs = new Array(); //定义一数组 
													if(value.substr(value.length-1,1)==","){
														value=value.substr(0,value.length-1)
													}
														strs = value.split(","); //字符分割 
												  var rvalue ="";		   
													for (i=0;i<strs.length ;i++ ){ 
														rvalue += "<img οnclick=download(\""+strs[i]+"\") style='width:66px; height:60px;margin-left:3px;' src='<%=path%>" + strs[i] + "' title='点击查看图片'/>";
														} 
												    return  rvalue; 	 
													 }
													}
									},
									{
										field : 'bid',
										title : '品牌id',
										width : 100,
										align : 'center'
									},
									{
										field : 'pDescribe',
										title : '商品描述',
										width : 100,
										align : 'center'
									},
									{
										field : 'pDetails',
										title : '商品详情',
										width : 100,
										align : 'center'
									},
									{
										field : 'pSize',
										title : '商品规格',
										width : 100,
										align : 'center'
									},
									{ 
										field : 'totalSales',
										title : '销售总量',
										width : 100,
										align : 'center'
									},
									{
										field : 'pOrigin',
										title : '商品产地',
										width : 100,
										align : 'center'
									},
									{
										field : 'pWeight',
										title : '商品重量',
										width : 100,
										align : 'center'
									},
									{
										field : 'openingPrice',
										title : '进价',
										width : 100,
										align : 'center'
									},
									{
										field : 'sellingPrice',
										title : '售价',
										width : 100,
										align : 'center'
									},
									{
										field : 'isdelete',
										title : '是否删除',
										width : 100,
										align : 'center',
										formatter : function(value, row, index) {
											if (value == 1) {
												return '删除状态';
											}
											if (value == 0) {
												return '正常状态';
											}
										}
									},
									{
										field : 'isaudit',
										title : '是否审核',
										width : 100,
										align : 'center',
										formatter : function(value, row, index) {
											if (value == 0) {
												return '未审核';
											} else {
												return '已审核';
											}
										}
									},
									{
										field : 'operate',
										title : '删除',
										width : 100,
										align : 'center',
										formatter : function(value, row, index) {
											// 											var btns = "<a id=\"btn\" href=\"javascript:deleteItem("+row.tid+")\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-remove'\">删除</a>";
											// 								        	btns += "<a id=\"btn\" href=\"javascript:findById("+row.tid+")\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-edit'\">修改</a>"; 
											return "<a id=\"btn\" href=\"javascript:deleteItem("
													+ row.pid
													+ ")\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-remove'\">删除/恢复</a> ";
										}
									},
									
									{
										field : 'edit',
										title : '修改编辑',
										width : 100,
										align : 'center',
										formatter : function(value, row, index) {
											return "<a id=\"btn\" href=\"javascript:edit("
													+ row.pid
													+ ")\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-remove'\">修改</a> ";
										}
									},

							] ],
							onLoadSuccess : function(index, field, value) {
								$('.easyui-linkbutton').linkbutton({});
							}
						});
	})
	function edit(pid) {
		location.href="findById?pid="+pid;
	}
	function deleteItem(pid) {
		$.messager.confirm('提示', '你确定要删除这一项吗?', function(r) {
			if (r) {
				$.getJSON("delete", {
					pid : pid
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
	
	<table id="dg"></table>
	<div id="tb">          
		<!-- <a href="#" class="easyui-linkbutton"
			data-options="iconCls:'icon-remove',plain:true">批量删除</a>  -->
		<button onclick="goInput()">增加商品</button>
		<!-- <a href="javascript:openForm()" class="easyui-linkbutton"
			data-options="iconCls:'icon-save',plain:true">增加</a> -->
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
<script type="text/javascript">
	function goInput(){
		location.href="goInput";  
	}  
	function download(img){
		var simg =  "http://....com/"+ img;
		$('#dlg').dialog({
		    title: '预览',
		    width: 600,
		    height:750,
		    resizable:true,
		    closed: false,
		    cache: false,
		    modal: true
		});
		$("#simg").attr("src",simg);
	}	

</script>