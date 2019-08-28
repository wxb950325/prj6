<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title></title>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css" />
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.staticfile.org/vue-resource/1.5.1/vue-resource.min.js"></script>
<script src="<%=basePath%>js/jquery-1.10.2.js"></script>
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<style type="text/css">
	div img{
		widht:300px;
		height:150px;
	}
	
	.content ul{
				list-style-type: none;
				
			}
	.content ul li{
				float: left;
				margin-right: 15px;
			}
	.content2 ul{
				list-style-type: none;
				
			}
	.content2 ul li{
				float: left;
				margin-right: 15px;
			}
</style>
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
		//===============================================
		var list ;
		$.ajaxSetup({
			  global: true,
			  type: "POST",
			  async: false,
			  cache:false
			});

		$.ajax({
	        url:"/admin/product/findAll2beforeByPrice",
	        dataType: 'json',
	        data:{},
	        success:function(dataa) {
	        	 var str = "<ul class='con_ul'>";
		            $.each(dataa, function(idx,val) {
		                str +="<li class=\"sec_li\"><a href='/admin/product/gogoodsinfo?pid="+val.pid+"' class='lp_li_a'><div class='lp_li_imgWrap'><img src='"+val.photo+"'/></div><p class='lp_li_name'>"
		                        +val.pName+"</p><p class='lp_li_price'>"
		                        +'￥'+val.sellingPrice+"</p></a><li>";
		            });
		            str += "</ul>";
		            $('.content').append(str);
	        },
	        error:function(dataa) { 
	          
	        }
	    });

		$.ajax({
	        url:"/admin/product/findAll2beforeByTime",
	        dataType: 'json',
	        data:{},
	        success:function(list) {
	        	 var str2 = "<ul class='con_ul'>";
		            $.each(list, function(idx,val) {
		                str2 +="<li class=\"sec_li\"><a href='/admin/product/gogoodsinfo?pid="+val.pid+"' class='lp_li_a'><div class='lp_li_imgWrap'><img src='"+val.photo+"'/></div><p class='lp_li_name'>"
		                        +val.pName+"</p><p class='lp_li_price'>"
		                        +'￥'+val.sellingPrice+"</p></a><li>";
		            });
		            str2 += "</ul>";
		            $('.content2').append(str2);
	        },
	        error:function(dataa) {
	          
	        }
	    });
	
	});

</script>
</head>
<body>
	<img alt="123" src="/image/logo.png" >
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
				style="height: 50px; line-height: 50px;"> <a id="reg" href="/before/cart/findAll">购物车</a>
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
		<div class="content"></div>
	</div>
	
		<!--产品展示 02 -->
	<div class="col-md-10 col-md-offset-1" style="margin-bottom: 10px;">
		<strong>最新品</strong> <span>第一时间体验</span>
	</div>
	<hr align="center" width="90%" size="10">
	<div class="col-md-10 col-md-offset-1" style="margin-bottom: 70px;">
		<div class="content2 " ></div>
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
