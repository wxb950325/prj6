<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
		<style type="text/css">
			.pro_ul li img{
				widht:380px;
				height:200px;
			}
			.pro_ul {
				list-style-type: none;
				text-align: center;
				line-height: 20px;
			}
			.pro_ul li{
				float: left;
				margin-left:60px;
			}
		
		</style>
		<script>
			function go(pid){
				location.href="/admin/product/gogoodsinfo?pid="+pid;
			}
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
		
		<div class="col-md-8 col-md-offset-2" style="margin-bottom: 10px;">
			<strong><span style=" color: #000; font-size: 26px;margin-right: 5px;" >猜你想要</span></strong> <span style="color: #ff7800;">用心创造快乐</span>
		</div>
		
		<div class="col-md-8 col-md-offset-2" style="margin-bottom: 5px;">
			<hr align="center" width="100%" size="10">
		</div>
		
		<div class="col-md-8 col-md-offset-2" style="margin-bottom: 10px;">
			<ul class='pro_ul'>
				<c:forEach items="${products}" var="p">
                      <li>
                           <p><a href="javascript:go(${p.pid });"><img src="${p.photo}"></a></p>
                           <p><a href="javascript:go(${p.pid });" class="name">${p.pName}</a></p>
                           <p class="price"><em>¥</em>
                                     ${p.sellingPrice}
                           </p>
                      </li>
                </c:forEach>   
			</ul>
		</div>
		
		<hr align="center" width="100%" size="10">
		<div class="bottom_margin"></div>
		<div class="allcopy"
		style="color: #4a4a49 !important; font-size: 13px;" align="center">
		Copyright &copy; 2018-2019 辽宁禾丰牧业股份有限公司版权所有 <a href="javascript:;"
			onClick="goToMinistry();return false;">辽ICP备14005490号-5</a>
		</div>
		
	</body>
</html>