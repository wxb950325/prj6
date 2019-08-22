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
			$(document).ready(function(){
				$("#num+").click(function(){
					var n = $("#num").val();
					var m = parseInt(n)+1;
					$("#num").val(m);
				});
				$("#num-").click(function(){
					var n = $("#num").val();
					if(n>1){
						var m = parseInt(n)-1;
						$("#num").val(m);
					}
				});
			});
		</script>
	</head>
	<body >
		<nav class="navbar navbar-default">
			<div class="col-md-2">
			</div>
			<div class="col-md-6" style="height: 50px; margin: auto" >
				<form id="">
					<input type="text" name="username" id="username"  placeholder="请输入手机号" />
					<input type="password" name="password" id="password" placeholder="请输入密码">
					<input type="button" value="登录" />
					<input type="button" value="注册" />
				</form>
			</div>
			<div class="col-md-4">
				<form id="">
					<input type="text" name="username" id="username" placeholder="来点啥" />
					<input type="button" value="搜索" />
				</form>
			</div>
		</nav>
		<div class="col-md-10 col-md-offset-1" style="margin-bottom: 70px;">
				<img src="/image/goods.png" class="col-md-4" />
				<div class="col-md-8">
				<form action="cart.action?method=add" method="post">
					<table class="table table-bordered table-hover table-striped" style="width: 600px; height:350px;">
						<tr>
							<td colspan="2" style=" display: table-cell; vertical-align: middle;font-family: 宋体; font-size: 30px; font-weight: 800; text-align: center;">商品名称</td>
						</tr>
						<tr>
							<td style="text-align: right; width: 200px; font-weight: 700; display: table-cell; vertical-align: middle;">现价：</td>
							<td style="text-align: center; font-weight: 500; display: table-cell; vertical-align: middle;">￥${goods.gprice }</td>
						</tr>
						<tr>
							<td style="text-align: right; width: 200px; font-weight: 700; display: table-cell; vertical-align: middle;">描述：</td>
							<td style="text-align: center; font-weight: 500; display: table-cell; vertical-align: middle;">${goods.gdescribe }</td>
						</tr>
						<tr>
							<td style="text-align: right; width: 200px; font-weight: 700; display: table-cell; vertical-align: middle;">库存：</td>
							<td style="text-align: center; font-weight: 500; display: table-cell; vertical-align: middle;">${goods.ginventory }</td>
						</tr>
						<tr>
							<td style="text-align: right; width: 200px; font-weight: 700; display: table-cell; vertical-align: middle;">起购数量：</td>
							<td style="text-align: center;">
								<button type="button" id="num-">-</button>
								<input type="text" value="1" readonly="readonly" id="num" name="num" style="text-align: center; width: 50px" />
								<button type="button" id="num+">+</button>
							</td>
						</tr>
						
						<tr>
							<td colspan="2" style="text-align: right;" >
								<button class="btn-danger" value="" name="">
								加入购物车
								</button>
								<button class="btn-danger" value="" name="">收藏商品</button>
							</td>
						</tr>
					</table>
					</form>
				</div>
		</div>
	</body>
</html>