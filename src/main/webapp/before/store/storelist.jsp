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
<script type="text/javascript" 	src="<%=basePath%>js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" 	src="<%=basePath%>js/easyui/locale/easyui-lang-zh_CN.js"></script>

</head>
<body>
<script>

	

	$(function() {
		$('#dg')
				.datagrid(
						{
							url : '/before/store/findAllStore',
							fitColumns : true,
							striped : true,
							pagination : true,
							toolbar : '#tb',
							title : '商户管理',
							 columns:[[   
						        {field:'sid',checkbox:'checkbox',title:'商户id',align:'center',width:50,height:300},   
						        {field:'sname',title:'商户名称',align:'center',width:50}, 
						        {field:'uid',title:'用户id',align:'center',width:50},  
						        {field:'legalName',title:'法人名称',align:'center',width:50},  
						        {title:'法人照片',field:'legalPhoto',width:50,align:'center',
									formatter:function(value,row,index){
										return '<img style="width:50px;height:50px;" border="1"  src="'+row.legalPhoto+'" />';
									}
								},
						        {field:'provinceId',title:'省id',align:'center',width:40},  
						        {field:'provinceName',title:'省名称',align:'center',width:50}, 
						        {field:'cityId',title:'市id',align:'center',width:40},
						        {field:'cityName',title:'市名称',align:'center',width:50},
						        {field:'zoneId',title:'区id',align:'center',width:40},
						        {field:'zoneName',title:'区名称',align:'center',width:50},
						        {field:'assessorId',title:'审核员id',align:'center',width:40},
						     
						        {field:'isaudit',title:'审核状态',align:'center',width:50,formatter: function(value,row,index){
									if (value==0){
										return '审核中';
									} else if (value==1){
										return '已审核';
									} else {
										return '审核未通过';
									}
								}
								},
						        {field:'audittime',title:'审核时间',align:'center',width:100},		        
						        
						        {field:'isdelete',title:'软删除',align:'center',width:50,formatter: function(value,row,index){
									if (value==0){
										return '已保留';
									} else {
										return '已删除';
									}
								}
								},
						  
						        {field:'operate',title:'操作',align:'center',width:100,formatter: function(value,row,index){
						        	var btns = "<a id=\"btn\" href=\"javascript:deleteItem("+row.sid+")\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-remove'\">删除</a>";
						        	btns += "<a id=\"btn\" href=\"javascript:findById("+row.sid+")\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-edit'\">修改</a>"; 
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
				
		$.messager.confirm('Confirm',
				'Are you sure you want to delete record?', function(r) {
					if (r) {
						$.getJSON("/before/store/deleteStore", {
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
	
	function findById(sid) {
		$('#ff').form('clear');
		$('#win').window('open'); // 打开窗口  
		
		if(sid!=undefined){
			//查询一个
			$.getJSON("/before/store/storelist/findById",{
				sid:sid
				},function(json){
					$("#sname").html(json.sname);
					$("#legalName").html(json.legalName);
					$('#img').attr("src",json.legalPhoto);
					$("#address").html(json.provinceName+json.cityName+json.zoneName);
					$("#assessorId").html(json.assessorId);
	
			$('#ff').form('load','/before/store/storelist/findById?sid='+sid);	// 从URL加载 
// 			$("input[name='evalstatus'][value=0]").attr('checked','true');
			});
		}
		
		
	}
	
	function openForm() {
		$('#win').window('open'); // 打开窗口  
	}
	function dosave(){
		var sid = $("#sid").val;
		if(sid!=null&&sid!=""&&sid!=undefined){
			path = "/before/store/update1";
			}
		$('#ff').form('submit', {   
		    url:path,
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
	<!-- <div id="tb">
		<a href="#" class="easyui-linkbutton"
			data-options="iconCls:'icon-help',plain:true">帮助</a> <a
			href="javascript:openForm()" class="easyui-linkbutton"
			data-options="iconCls:'icon-save',plain:true">增加</a>
	</div> -->
	<div id="win" class="easyui-window" title="My Window"
		style="width: 600px; height: 400px"
		data-options="iconCls:'icon-save',modal:true,closed:true">
		新增订单
		<form id="ff" method="post" enctype="multipart/form-data">
			<input type="hidden" name="sid" id="sid" />
			<div>
				<label for="sname">店铺名:</label>
				<label id="sname"></label>
					
			</div>
				<input type="hidden" name="uid" id="uid" />
			<div>
				<label for="legalName">法人名:</label> 
				<label id="legalName"></label>
			</div>
			<tr height="110px">
				<td style="text-align: center">
					<label for="legalPhoto" >法人图片:</label>
				</td>
				<td>
					<img id="img" width="110px">
				</td>
			</tr> 
			
			<div>
				<label for="address">地址:</label> 
				<label id="address"></label> 
				
			</div>			
			<div>
				<label for="assessorId">审核人Id:</label> 
				<label id="assessorId"></label> 
			</div>
			<div>
				<label for="isaudit">审核状态:</label>
				 <input type="radio" name="isaudit" value="0" checked="checked">审核中
				 <input type="radio" name="isaudit" value="1">已审核
				 <input type="radio" name="isaudit" value="2">审核未通过
			</div>
			<!-- <div>
				<label for="audittime">审核时间:</label> <input type="datetime"
					min="1970-01-01" max="2099-12-31" name="audittime">
								<input class="easyui-datetimebox" name="birthday"    
				        data-options="required:true,showSeconds:false" value="2010/1/1 2:3" style="width:150px">
			</div> -->
			<div>
			<label for="isdelete">是否删除:</label> 
			<input type="radio" name="isdelete" value="0">已保留
			<input type="radio" name="isdelete" value="1">已删除
			</div>
			<div>
				<input type="button" onclick="dosave()" value="保存" />
			</div>
		</form>
	</div>
	<!-- <a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">搜索</a>  -->
</body>
</html>