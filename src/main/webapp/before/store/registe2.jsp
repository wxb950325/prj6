<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

</head>
<body>
<img alt="123" src="/image/logo.png">
	<br>
		<div class="col-md-12 col-md-offset-1" style="margin-bottom: 70px;">
			
			<div class="col-md-10">
			<form action="/before/store/save" method="post" enctype="multipart/form-data">
				<table  cellspacing="0" align="center" style="background-color:green;border-style:solid;border-color:black;width: 1200px; height:350px;">
					<tr>
						<td colspan="2" style=" display: table-cell; vertical-align: middle;font-family: 楷体; font-size: 30px; font-weight: 1200; text-align: center;">商户注册</td>
					</tr>
<%-- 					<tr>
						<td style="text-align: center; width: 200px;font-family: 楷体; font-size: 25px; font-weight: 1000; display: table-cell; vertical-align: middle;">商户类型：</td>
						<td style="text-align: center;font-family: 楷体; font-size: 25px; font-weight: 500; display: table-cell; vertical-align: middle;">
							<c:forEach items="${storetypes }" var="storetype">
								<input type="checkbox" value="${storetype.tname }" name="tname"/>${storetype.tname }
							</c:forEach>
						</td>
					</tr> --%>
					<tr>
						<td style="text-align: center; width: 200px;font-family: 楷体; font-size: 25px; font-weight: 1000; display: table-cell; vertical-align: middle;">店铺名：</td>
						<td style="text-align: center; font-weight: 500; display: table-cell; vertical-align: middle;">
							<input type="text" name="sname" />
						</td>
					</tr>
					<tr>
						<td style="text-align: center; width: 200px;font-family: 楷体; font-size: 25px; font-weight: 1000; display: table-cell; vertical-align: middle;">法人名：</td>
						<td style="text-align: center; font-weight: 500; display: table-cell; vertical-align: middle;">
							<input type="text" name="legalName" />
						</td>
					</tr>
					<tr>
						<td style="text-align: center; width: 200px;font-family: 楷体; font-size: 25px; font-weight: 1000; display: table-cell; vertical-align: middle;">法人照片：</td>
						<td style="text-align: center; width: 200px; font-weight: 700; display: table-cell; vertical-align: middle;">
							<input type="file" name="fileName"/>
						</td>
					</tr>
					<tr>
						<td style="text-align: center; width: 200px;font-family: 楷体; font-size: 25px; font-weight: 1000; display: table-cell; vertical-align: middle;">店铺地址：</td>
						<td style="text-align: center; width: 200px; font-weight: 700; display: table-cell; vertical-align: middle;">
							
							
							<SELECT id="p" NAME="provinceName" onchange="fillC(this.value)">
							</SELECT>
							<span style="font-family: 楷体">省</span>
							
							<SELECT id="c" NAME="cityName" onchange="fillZ(this.value)">
							</SELECT>
							<span style="font-family: 楷体">市</span>
							
							<SELECT id="z" NAME="zoneName">
							</SELECT>
							<span style="font-family: 楷体">区</span>
							
							
							<!-- <div id="app">
								
								<SELECT id="p" NAME="provinceName" v-on:change="fillC($event.target.selectedIndex)" >
									<option v-for="p in json">{{p.pname}}</option>
								</SELECT>
								<span style="font-family: 楷体">省</span>
								<SELECT id="c" NAME="cityName" @change="fillZ($event.target.selectedIndex)">
									<option v-for="c in citys">{{c.cname}}</option>
								</SELECT><span style="font-family: 楷体">市</span>
								<SELECT id="z" NAME="zoneName">
									<option v-for="z in zones" >{{z.zname}}</option>
								</SELECT>
								<span style="font-family: 楷体">区</span><br/>
							</div> -->
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: right;" >
							<button class="btn-danger" value="" name="">
							提交申请
							</button>
						</td>
					</tr>
				</table>
				</form>
			</div>
		</div>
		<!-- 版权 -->
	<div class="bottom_margin"></div>
	<div class="allcopy"
		style="color: #4a4a49 !important; font-size: 13px;" align="center">
		Copyright &copy; 2018-2019 辽宁禾丰牧业股份有限公司版权所有 <a href="javascript:;"
			onClick="goToMinistry();return false;">辽ICP备14005490号-5</a>
	</div>
<script>
	$.ajaxSetup({
	  global: true,
	  type: "POST",
	  async: false,
	  cache:false
	});
	
	var ps;
	var cs;
	
	$(function(){
		$.ajax({
			   url: "/before/province/findAll",
			   dataType:"json",
			   success: function(msg){
			     ps = msg;
			     fillP();
			   }
		});
	});
	
	function fillP(){
		$.each(ps,function(i,item){
			$("#p").append("<option value="+i+">"+item.pname+"</option>");
		});
		fillC(0);
	}
	function fillC(index){
		$("#c").empty();
		cs = ps[index].citys;
		$.each(cs,function(i,item){
			$("#c").append("<option value="+i+">"+item.cname+"</option>");
		});
		fillZ(0);
	}
	function fillZ(index){
		$("#z").empty();
		var zs = cs[index].zones;
		$.each(zs,function(i,item){
			$("#z").append("<option value="+i+">"+item.zname+"</option>");
		});
	}
	
</script>
</body>
</html>
