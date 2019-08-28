<%@ page language="java"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css" />
		<script src="<%=basePath%>js/jquery-1.10.2.js"></script>
		<script src="<%=basePath%>js/bootstrap.min.js"></script>
		<title>woNiuShop</title>
		<script >
			$(document).ready(function(){
				
				$(".removeBtn").click(function(){
					 location.href="/before/cart/delete?cid="+ $(this).val(); 
					 
					/* var cid = $(this).val(); */
					alert(cid);
					/* $.ajax({
					 url:"/before/cart/delete",
				        dataType: 'json',
				        data:{"cid":cid},
				        success:function(data) {
				        	alert(data.msg);
				        	
				        },
				        error:function(data) {
				        	alert(data.msg);
				        }
					}); */
					
				});
				
				$("#clearBtn").click(function(){
					location.href="carts.action?method=clear";
				});
				
				$("#payBtn").click(function(){
					location.href="orders.action?method=goInput";
				});
				
			});
		
		</script>
	</head>
	<body>
		
		<nav class="navbar navbar-default" >
			<div class="col-md-10">
				<span class="h3" style="height: 50px; line-height: 50px;">
					逛大集
				</span>
			</div>
			
		</nav>
		
		<div class="row" style="margin-top: 0px">
				
			<div class="col-md-8 col-md-offset-2 bg-info" style="margin-top: 0px" >
				<table class="col-md-10 table table-bordered table-hover table-striped"  >
					<tr >
						<th>商品名称</th>
						<th>商品价格</th>
						<th>购买数量</th>
						<th>商品图片</th>
						<th>小计</th>
						<th>移出购物车</th>
					</tr>	
					<c:set var="sum" value="0"></c:set>
						<c:forEach items="${carts}"  var="obj" varStatus="i">
							<tr  >
								<th>${obj.pname }</th>
								<th>${obj.price}</th>
								<th>${obj.pNum}</th>
								
								<th><img src="${obj.photo }" height="140px"></th>
								<th>${obj.price*obj.pNum }</th>
								<th><button class="removeBtn" value="${obj.cid }">移出购物车</button></th>
					     		<c:set var="sum" value="${sum+(obj.price)*(obj.pNum) }"></c:set>		
					     	</tr>	
						</c:forEach>		
					
				</table>
				<div  class="col-md-12  bg-info text-right" >
						<h3>总计:${sum }元</h3>	
				</div>
			
				<div class="col-md-12 text-right">
					<button id="clearBtn" class="btn btn-danger ">清空购物车</button>
					<button id="payBtn" class="btn btn-success ">去支付</button>
				</div>
				
			</div>	
				
		</div>
		
	</body>
</html>