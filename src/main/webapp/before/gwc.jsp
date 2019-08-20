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
		<style>
			td{
				text-align: center;
				font-weight: 900;
			}
		</style>
		<script>
		$(document).ready(function(){
			$("#del").click(function(){
				location.href="cart.action?method=del&gid="+$("#del").val();
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
			<table align="center" class="table table-bordered table-hover table-striped" style="width: 600px;">
				<tr height="30px">
					<td style="line-height: 30px;">图片</td>
					<td style="line-height: 30px;">商品名称</td>
					<td style="line-height: 30px;">单价</td>
					<td style="line-height: 30px;">数量</td>
					<td style="line-height: 30px;">操作</td>
				</tr>
				<c:forEach items="" var="obj" varStatus="i">
					<tr>
						<td><img src="/image/goods.png" width="50px" height="50px"></td>
						<td style="line-height: 50px;">${obj.key.gname }</td>
						<td style="line-height: 50px;">${obj.key.gprice }元</td>
						<td style="line-height: 50px;">${obj.value }</td>
						<td style="line-height: 50px;"><button class="btn btn-warning" id="del" value="${obj.key.gid }" >移除</button></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="5" style="text-align: right;">总价为 
						<span style="color: red;">￥1024</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button class="btn-danger">结账</button>
					</td>
				</tr>
			</table>
		</div>
	</body>
</html>