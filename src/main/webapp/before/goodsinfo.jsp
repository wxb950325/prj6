<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css" />
		<script src="<%=basePath%>js/jquery-1.10.2.js"></script>
		<script src="<%=basePath%>js/bootstrap.min.js"></script>
		<script>
			$(document).ready(function(){
				$("#btnr").click(function(){
					var n = $("#num").val();
					if(n>1){
						n--;
					}
					$("#num").val(n);
				});
				
				$("#btnp").click(function(){
					var n = $("#num").val();
					n++;
					$("#num").val(n);
				});

				$("#buy").click(function(){
					var pid = $("#pid").val();
					var pNum = $("#num").val();
					$.ajax({
					 url:"/before/cart/save",
				        dataType: 'json',
				        data:{"pid":pid,"pNum":pNum},
				        success:function(data) {
				        	alert(data.msg);
				        },
				        error:function(data) {
				        	alert(data.msg);
				        }
					}); 
					
				});
			});
		</script>
	</head>
	<body >
		<nav class="navbar navbar-default">
		<div class="col-md-1"></div>
		<div class="col-md-5" style="height: 50px; margin: auto">

			<form action="/before/userinfo/login" method="post">
				<input type="text" name="phone" id="phone"
					placeholder="请输入手机号" />
					<input type="password" name="upass"id="password" placeholder="请输入密码">
					<input type="submit"value="登录" />
					<input type="button" id="registe" value="注册" />
			</form>
		
		</div>
		<div class="col-md-2">
			<form action="/admin/product/findByName" method="post" >
				<input type="text" style="width:120px;" name="pName" id="pName" placeholder="来点啥" />
				<input type="submit" value="搜索" />
			</form>
		</div>
		
		<div class="col-md-2">
			<span class="glyphicon glyphicon-bed"
				style="height: 50px; line-height: 50px;"> <a href="/before/userinfo/main/mainInfo.jsp">${sessionScope.loginInfo==null?'我的':sessionScope.loginInfo.phone }</a>
			</span> 
			<span class="glyphicon glyphicon-arrow-right"
				style="height: 50px; line-height: 50px;"> <a id="reg" href="/before/cart/findAll">购物车</a>
			</span>
		</div>
	</nav>
	
		<div class="col-md-10 col-md-offset-1" style="margin-bottom: 70px;">
				
				<img src="${pageContext.request.contextPath }${goods.photo }" style="height:360px" class="col-md-4" />
				<div class="col-md-8">
				<form action="/before/cart/save" method="post">
					<table class="table table-bordered table-hover table-striped" style="width: 600px; height:350px;">
						<tr>
							<td colspan="2" style=" display: table-cell; vertical-align: middle;font-family: 宋体; font-size: 30px; font-weight: 800; text-align: center;">${goods.pName }</td>
						</tr>
						<tr>
							<td style="text-align: right; width: 200px; font-weight: 700; display: table-cell; vertical-align: middle;">现价：</td>
							<td style="text-align: center; font-weight: 500; display: table-cell; vertical-align: middle;">￥${goods.sellingPrice }</td>
						</tr>
						<tr>
							<td style="text-align: right; width: 200px; font-weight: 700; display: table-cell; vertical-align: middle;">描述：</td>
							<td style="text-align: center; font-weight: 500; display: table-cell; vertical-align: middle;">${goods.pDescribe }</td>
						</tr>
						<tr>
							<td style="text-align: right; width: 200px; font-weight: 700; display: table-cell; vertical-align: middle;">库存：</td>
							<td style="text-align: center; font-weight: 500; display: table-cell; vertical-align: middle;">${goods.stock }</td>
						</tr>
						<tr>
							<input type="hidden" name="pid" id="pid" value="${goods.pid }"/>
							<td style="text-align: right; width: 200px; font-weight: 700; display: table-cell; vertical-align: middle;">起购数量：</td>
							<td style="text-align: center;">
								<button type="button" id="btnr">-</button>
								<input type="text" value="1" readonly="readonly" id="num" name="pNum" style="text-align: center; width: 50px" />
								<button type="button" id="btnp">+</button>
							</td>
						</tr>
						
						<tr>
							<td colspan="2" style="text-align: right;" >
								<button type="button" class="btn-danger" id="buy" name="buy">
								加入购物车
								</button>
							</td>
						</tr>
						
					</table>
					</form>
				</div>
		</div>
	</body>
</html>