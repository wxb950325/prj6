<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" 	href="<%=basePath%>js/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" 	href="<%=basePath%>js/easyui/themes/icon.css">
	<script type="text/javascript" src="<%=basePath%>js/jquery-2.0.3.min.js"></script>
	<script type="text/javascript" 	src="<%=basePath%>js/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" 	src="<%=basePath%>js/easyui/locale/easyui-lang-zh_CN.js"></script>

<script>
		
		
		
		function edit(sid) {
			$('#ff').form('clear');
			$('#win').window('open'); // 打开窗口  
			//alert(sid);
			/* $("#sname").val(store.sname); */		
			if(sid!=undefined){
				//查询一个
				$.getJSON("/before/store/storelist/findById",{
					sid:sid
					},function(json){
						//alert(json.sname);
						$('#img').attr("src",json.legalPhoto);
		
				$('#ff').form('load','/before/store/storelist/findById?sid='+sid);	// 从URL加载 
//	 			$("input[name='evalstatus'][value=0]").attr('checked','true');
				});
			}
			
			
		}
        
		function openForm() {
			$('#win').window('open'); // 打开窗口  
		}
		function dosave(){
			var sid = $("#sid").val;
			if(sid!=null&&sid!=""&&sid!=undefined){
				path = "/before/store/update";
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
						timeout : 2000,
						showType : 'slide'
					});
			       $('#win').window('close'); // 关闭窗口 
					$('#dg').datagrid('reload');
			    }   
			});  
		}
</script>
</head>
<body>
	

		<div class="col-md-12 col-md-offset-1" style="margin-bottom: 200px;">
			
			<div class="col-md-10">
			
				<table  cellspacing="0" align="center" style="background-color:pink;border-style:solid;border-color:black;width: 1200px; height:350px;">
					<tr>
						<td colspan="6" style="text-align: center; width: 200px;font-family: 微软雅黑; font-size: 25px; font-weight: 1000; display: table-cell; vertical-align: middle;">商铺信息</td>
					</tr>
					<tr>
						<td style="text-align: center; width: 200px;font-family: 微软雅黑; font-size: 25px; font-weight: 1000; display: table-cell; vertical-align: middle;">店铺名</td>
						<td style="text-align: center; width: 200px;font-family: 微软雅黑; font-size: 25px; font-weight: 1000; display: table-cell; vertical-align: middle;">法人名称</td>
						<td style="text-align: center; width: 200px;font-family: 微软雅黑; font-size: 25px; font-weight: 1000; display: table-cell; vertical-align: middle;">法人照片</td>
						<td style="text-align: center; width: 200px;font-family: 微软雅黑; font-size: 25px; font-weight: 1000; display: table-cell; vertical-align: middle;">地址</td>
						<td style="text-align: center; width: 200px;font-family: 微软雅黑; font-size: 25px; font-weight: 1000; display: table-cell; vertical-align: middle;">审核状态</td>
						<td style="text-align: center; width: 200px;font-family: 微软雅黑; font-size: 25px; font-weight: 1000; display: table-cell; vertical-align: middle;">操作</td>
					</tr>
					<c:forEach items="${stores }" var="store">
						<tr>
							
							<td style="text-align: center; width: 200px;font-family: 楷体; font-size: 25px; font-weight: 1000; display: table-cell; vertical-align: middle;">
								<a href="/admin/product/list3.jsp?sid=${store.sid }">${store.sname }</a>
							</td>
							<td style="text-align: center; width: 200px;font-family: 楷体; font-size: 25px; font-weight: 1000; display: table-cell; vertical-align: middle;">
								${store.legalName }
							</td>
							<td style="text-align: center; width: 200px; font-weight: 700; display: table-cell; vertical-align: middle;">
								<img src="${store.legalPhoto }" width="100px"/>
							</td>
							<td style="text-align: center; width: 200px;font-family: 楷体; font-size: 25px; font-weight: 1000; display: table-cell; vertical-align: middle;">
								${store.provinceName }${store.cityName }${store.zoneName }
							</td>
							<td style="text-align: center; width: 200px;font-family: 楷体; font-size: 25px; font-weight: 1000; display: table-cell; vertical-align: middle;">
								
								<c:choose>
									<c:when test="${store.isaudit==0 }">审核中</c:when>
									<c:when test="${store.isaudit==1 }">审核通过</c:when>
									<c:when test="${store.isaudit==2 }">审核未通过</c:when>
								</c:choose>
							</td>
							<td style="text-align: center; width: 200px;font-family: 楷体; font-size: 25px; font-weight: 1000; display: table-cell; vertical-align: middle;">
								<button onclick="edit(${store.sid })">修改</button>
							</td>	
						</tr>
						
						
						
						
					</c:forEach>
					
					
				</table>
				
			</div>
		</div>
	
		<div id="win" class="easyui-window" title="My Window" style="width: 600px; height: 400px" data-options="iconCls:'icon-save',modal:true,closed:true">
							<form id="ff" method="post" enctype="multipart/form-data">
								<input type="hidden" name="sid" id="sid" />
								<div>
									<label for="sname">店铺名:</label>
									<input class="easyui-validatebox" type="text" name="sname" data-options="required:true"  id="sname"/>
										
								</div>
									<input type="hidden" name="uid" id="uid" />
								<div>
									<label for="legalName">法人名:</label> 
									<input class="easyui-validatebox" type="text" name="legalName" data-options="required:true" id="legalName"/>
									
								</div>
								<tr height="110px">
									<td style="text-align: center">
										<label for="legalPhoto" >法人图片:</label>
									</td>
									<td>
										<img id="img" width="110px">
									</td>
									<td>
										<input class="easyui-validatebox" type="hidden" name="legalPhoto" data-options="required:true" />
									</td>
									<td>
										<input class="easyui-validatebox" type="file" name="fileName" data-options="required:true" />
									</td>
								</tr> 
								
							<!-- 	<div>
									<label for="legalName">地址:</label> 
									<input class="easyui-validatebox" type="text" name="provincelName" data-options="required:true" />
								</div> -->
									
									
								
								<div>
									<label for="assessorId">审核人Id:</label> 
									<input class="easyui-validatebox" type="text" name="assessorId" data-options="required:true" />
								</div>
								<div>
									<label for="isaudit">审核状态:</label>
									 <input type="radio" name="isaudit" value="0" checked="checked">审核中
									 <input type="radio" name="isaudit" value="1">已审核
									 <input type="radio" name="isaudit" value="2">审核未通过
								</div>
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
		
		
		<!-- 版权 -->
	<div class="bottom_margin"></div>
	<div class="allcopy"
		style="color: #4a4a49 !important; font-size: 13px;" align="center">
		Copyright &copy; 2018-2019 辽宁禾丰牧业股份有限公司版权所有 <a href="javascript:;"
			onClick="goToMinistry();return false;">辽ICP备14005490号-5</a>
	</div>
</body>
</html>