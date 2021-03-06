<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="../css/bootstrap.min.css" />
	<script src="../js/jquery-1.10.2.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script src="https://cdn.staticfile.org/vue-resource/1.5.1/vue-resource.min.js"></script>

<script>
	window.onload = function(){
	    var vm = new Vue({
	        el:'#app',
	        data:{
	            json:'',
	            citys:'',
	            zones:''
	   	    },
	        mounted:function(){
	        	this.fillP();
	        },
	        methods:{
	        	fillP:function(){
	            	this.$http({
	                	method:'post',
	                	url:'/before/province/findAll',
	                	emulateJSON:true, 
	                	params:{
	                	},	
	                }).then(function(res){
	                	 this.json=res.body;
	                	 this.fillC(0);
	                },function(){
	                    console.log('请求失败处理');
	                });
	            },
	            fillC:function(obj){
	            	this.citys = this.json[obj].citys;
	            	this.fillZ(0);
	            },
	            fillZ:function(obj){
	            	this.zones = this.citys[obj].zones;
	            }
	            
	        }
	    });
	}
</script>
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
							
							<div id="app">
								
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
							</div>
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
</body>
</html>