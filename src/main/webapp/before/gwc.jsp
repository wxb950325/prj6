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
		<style type="text/css">
			div img{
				widht:300px;
				height:60px;
			}
			
			.content ul{
						list-style-type: none;
					}
			.content ul li{
						/* float: left; */
						margin-right: 15px;
					}
		</style>
		<script>
		$(document).ready(function(){

			$.ajax({
		        url:"/before/cart/findAll",
		        dataType: 'json',
		        data:{},
		        success:function(list) {
		        	var str = ""; 
		        	for(var i=0;i<list.length;i++){    
		        		  str = "<tr><td>" +'商品：'+ list[i].pname + "</td><td>" + '数量：'+list[i].pNum + "</td><td>" + '单价：'+list[i].price + 
		        		  "</td><td><img src='"+list[i].photo+"'/></td><td>" + '小计￥：'+list[i].price*list[i].pNum + "</td><td><button onclick=\'rem("+list[i].pid+")\' >移出购物车</button></td></tr>";
		        		  $('#tab').append(str);
					 }
		        },
		        error:function(dataa) { 
		          
		        }
		    });

			function rem(pid){ 
				　alert(pid);
			}

			
			/*$(".removeBtn").click(function(){
				 $.ajax({
			        url:"/before/cart/remove",
			        dataType: 'json',
			        data:{},
			        success:function(list) {
			        	
			        },
			        error:function(dataa) { 
			          
			        } 
			}); */

			
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
			
			<hr align="center" width="90%" size="10">
			<div class="col-md-10 col-md-offset-1" style="margin-bottom: 70px;">
				
				<table id="tab"  align="center" class="table table-bordered table-hover table-striped" style="width: 1000px;">
				
				</table>
				
				<div  class="col-md-12  bg-info text-right"  >
						<h3>总计: ${sum }元</h3>	
				</div>
				
				<div class="col-md-12 text-right">
					<button id="clearBtn" class="btn btn-danger ">清空购物车</button>
					<button id="payBtn" class="btn btn-success ">去下单</button>
				</div>
				
			</div>
		</div>
		
		
	</body>
</html>