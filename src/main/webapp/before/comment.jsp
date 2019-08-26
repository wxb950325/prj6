<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title></title>
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<script src="../js/jquery-1.10.2.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		$(".li").hide();
		$("#ul").hover(
			function(){
				$(".li").show()
			},
			function(){
				$(".li").hide()
			}
		);		
		$("#buy").click(function() {
			location.href = "goodsinfo.jsp";
		});
		$("#registe").click(function(){
			location.href = "/before/userinfo/registe.jsp";
		})
	});
</script>
</head>
<body>
	<img alt="123" src="/image/logo.png">
	<br>
	<nav class="navbar navbar-default">
		<div class="col-md-1"></div>
		<div class="col-md-5" style="height: 50px; margin: auto">

			<form action="/before/userinfo/login" method="post">
				<input type="text" name="phone" id="phone"
					placeholder="请输入手机号" /> <input type="password" name="upass"
					id="password" placeholder="请输入密码"> <input type="submit"
					value="登录" /> <input type="button" id="registe" value="注册" />
			</form>
		</div>
		<div class="col-md-2">
			<form id="">
				<input type="text" style="width:120px;" name="username" id="username" placeholder="来点啥" />
				<input type="button" value="搜索" />
			</form>
		</div>
		<div class="col-md-2">
			<span class="glyphicon glyphicon-bed"
				style="height: 50px; line-height: 50px;"> <a href="/before/userinfo/main/mainInfo.jsp">${sessionScope.loginInfo==null?'我的':sessionScope.loginInfo.phone }</a>
			</span> 
			<span class="glyphicon glyphicon-arrow-right"
				style="height: 50px; line-height: 50px;"> <a id="reg" href="/before/gwc.jsp">购物车</a>
			</span>
		</div>
		<div class="col-md-2">
			
				<ul id="ul" style="list-style-type:none">
					<span class="glyphicon glyphicon-home" 	style="height: 50px; line-height: 50px;">
						卖家中心
					</span>
						<li class="li"><a href="/before/storeType/storeRegiste">注册开店</a></li>
						<li class="li"><a href="/before/store/list.jsp">查看所有商户</a></li>
						<li class="li"><a>已卖出商品</a></li>
						<li class="li"><a>出售中商品</a></li>
				</ul>
			
		</div>
	</nav>

	<table style="width: 600px; height: 100px;" align="center" frame=void>
		<tr>
			<th>商品分类</th>
			<th>类型分类</th>
			<th>品种分类</th>
		</tr>
		<tr valign="top">
			<td><a href="/before/ergou.jsp">王二狗</a> <a href="">李飞</a> <a
				href="">赵雷</a></td>
			<td><a href="">王二狗</a> <a href="">李飞</a> <a href="">赵雷</a></td>
			<td><a href="">王二狗</a> <a href="">李飞</a> <a href="">赵雷</a></td>
		</tr>

	</table>
	<!--产品展示 01 -->
	<div class="col-md-10 col-md-offset-1" style="margin-bottom: 10px;">
		<strong>最实惠</strong> <span>实惠尽享在指尖</span>
	</div>
	<hr align="center" width="90%" size="10">
	<div class="col-md-10 col-md-offset-1" style="margin-bottom: 70px;">

		<div class="col-md-3">
			<a href="/before/goodsinfo.jsp"><img src="/image/goods.png"
				class="col-md-12" width="200" height="200" /></a> <span
				class="col-md-4"
				style="font-family: 微软雅黑; color: red; font-weight: 900;">￥商品价格</span>
			<span class="col-md-8" style="font-weight: 900;"><a
				href="goodsinfo.jsp">商品名称</a></span>
			<button class="btn-warning" id="buy">立即购买</button>
		</div>
		<div class="col-md-3">
			<img src="/image/goods.png" class="col-md-12" width="200"
				height="200" /> <span class="col-md-4"
				style="font-family: 微软雅黑; color: red; font-weight: 900;">￥商品价格</span>
			<span class="col-md-8" style="font-weight: 900;"><a
				href="goodsinfo.jsp">商品名称</a></span>
			<button class="btn-warning" id="buy">立即购买</button>
		</div>
		<div class="col-md-3">
			<img src="/image/goods.png" class="col-md-12" width="200"
				height="200" /> <span class="col-md-4"
				style="font-family: 微软雅黑; color: red; font-weight: 900;">￥商品价格</span>
			<span class="col-md-8" style="font-weight: 900;"><a
				href="goodsinfo.jsp">商品名称</a></span>
			<button class="btn-warning" id="buy">立即购买</button>
		</div>
		<div class="col-md-3">
			<img src="/image/goods.png" class="col-md-12" width="200"
				height="200" /> <span class="col-md-4"
				style="font-family: 微软雅黑; color: red; font-weight: 900;">￥商品价格</span>
			<span class="col-md-8" style="font-weight: 900;"><a
				href="goodsinfo.jsp">商品名称</a></span>
			<button class="btn-warning" id="buy">立即购买</button>
		</div>
	</div>
	<hr align="center" width="90%" size="10">
	<!--产品展示 02 -->
	<div class="col-md-10 col-md-offset-1" style="margin-bottom: 10px;">
		<strong>最新品</strong> <span>第一时间体验</span>
	</div>
	<hr align="center" width="90%" size="10">
	<div class="col-md-10 col-md-offset-1" style="margin-bottom: 70px;">

		<div class="col-md-3">
			<img src="/image/goods2.jpg" class="col-md-12" width="200"
				height="200" /> <span class="col-md-4"
				style="font-family: 微软雅黑; color: red; font-weight: 900;">￥商品价格</span>
			<span class="col-md-8" style="font-weight: 900;"><a
				href="goodsinfo.jsp">商品名称</a></span>
			<button class="btn-warning" id="buy">立即购买</button>
		</div>
		<div class="col-md-3">
			<img src="/image/goods2.jpg" class="col-md-12" width="200"
				height="200" /> <span class="col-md-4"
				style="font-family: 微软雅黑; color: red; font-weight: 900;">￥商品价格</span>
			<span class="col-md-8" style="font-weight: 900;"><a
				href="goodsinfo.jsp">商品名称</a></span>
			<button class="btn-warning" id="buy">立即购买</button>
		</div>
		<div class="col-md-3">
			<img src="/image/goods2.jpg" class="col-md-12" width="200"
				height="200" /> <span class="col-md-4"
				style="font-family: 微软雅黑; color: red; font-weight: 900;">￥商品价格</span>
			<span class="col-md-8" style="font-weight: 900;"><a
				href="goodsinfo.jsp">商品名称</a></span>
			<button class="btn-warning" id="buy">立即购买</button>
		</div>
		<div class="col-md-3">
			<img src="/image/goods2.jpg" class="col-md-12" width="200"
				height="200" /> <span class="col-md-4"
				style="font-family: 微软雅黑; color: red; font-weight: 900;">￥商品价格</span>
			<span class="col-md-8" style="font-weight: 900;"><a
				href="goodsinfo.jsp">商品名称</a></span>
			<button class="btn-warning" id="buy">立即购买</button>
		</div>
	</div>
	<hr align="center" width="90%" size="10">
	<!-- 版权 -->
	<div class="bottom_margin"></div>
	<div class="allcopy"
		style="color: #4a4a49 !important; font-size: 13px;" align="center">
		Copyright &copy; 2018-2019 辽宁禾丰牧业股份有限公司版权所有 <a href="javascript:;"
			onClick="goToMinistry();return false;">辽ICP备14005490号-5</a>
	</div>
</body>
</html>