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
	.content ul li img{
		widht:380px;
		height:200px;
	}
	.content2 ul li img{
		widht:380px;
		height:200px;
	}
	.content ul{
				list-style-type: none;
				text-align: center;
				line-height: 20px;
			}
	.content ul li{
				float: left;
				margin-left:60px;
			}
	.content2 ul{
				list-style-type: none;
				text-align: center;
				line-height: 20px;
			}
	.content2 ul li{
				float: left;
				margin-left:60px;
			}
	#main {
		margin-top:10px;
	}
	#main ul{
		list-style-type: none;
	}
	
		* {padding: 0;margin: 0;font-family: "微软雅黑";font-size: 14px;}
	ul,li {list-style: none;}
	a {text-decoration: none;color: black;}
	.box{width: 1200px;height: 300px;margin: 20px auto;overflow: hidden;position: relative;}
	.box-1 ul{}
	.box-1 ul li{width: 1200px;height: 300px;position: relative;overflow: hidden;}
	.box-1 ul li img{display:block;width: 1200px; height: 300px;}
	.box-1 ul li h2{position: absolute;left: 0;bottom: 0;height: 40px;width:300px;background: rgba(125,125,120,.4);text-indent: 2em;
					padding-right:500px ;font-size: 15px;line-height: 40px;text-overflow: ellipsis;overflow: hidden;
					white-space: nowrap;font-weight: normal;color: ghostwhite}
	.box-2{position: absolute;right: 10px;bottom: 14px;}
	.box-2 ul li{float:left;width: 12px;height: 12px;overflow: hidden; margin: 0 5px; border-radius: 50%;
					background: rgba(0,0,0,0.5);text-indent: 100px;cursor: pointer;}
	.box-2 ul .on{background: rgba(255,255,255,0.6);}
	.box-3 span{position: absolute;color: white;background: rgba(125,125,120,.3);width: 50px;height: 80px;
					top:50%; font-family: "宋体";line-height: 80px;font-size:60px;margin-top: -40px;
					text-align: center;cursor: pointer;}
	.box-3 .prev{left: 10px;}
	.box-3 .next{right: 10px;}
	.box-3 span::selection{background: transparent;}
	.box-3 span:hover{background: rgba(125,125,120,.8);}
		
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
		//===============================以下为页面数据请求
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
		                str +="<li class=\"sec_li\"><a href='/admin/product/gogoodsinfo?pid="+val.pid+"' class='lp_li_a'><div class='lp_li_imgWrap'><img src='"+val.photo+"'/></div><p  class='lp_li_name'>"
		                        +val.pName+"</p><p style='color:red' class='lp_li_price'>"
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
		                        +val.pName+"</p><p style='color:red' class='lp_li_price'>"
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
	<!-- 头图 -->
	   <div class="box">
		<div class="box-1">
			<ul>
				<li>
				<img src="http://qn.godaji.com/advertisement/yt/57e06919-3bae-4b20-b1d1-38a1781b5b7e.jpg" class="thumb">
				</li>
				<li>
					<img src="http://qn.godaji.com/advertisement/yt/9445288a-2e51-43f9-96d4-c673288169ae.jpg" class="thumb">
				</li>
				<li>
					<img src="http://qn.godaji.com/advertisement/yt/faea96d8-ae3e-4874-9deb-5bbb3bdb538e.jpg" class="thumb">
				</li>
			</ul>
		</div>
		<div class="box-2">
			<ul>
			</ul>
		</div>
		<div class="box-3">
			<span class="prev"> < </span>
			<span class="next"> > </span>
		</div>
	</div>
	
		<!--产品展示 01 -->
	<div class="col-md-8 col-md-offset-2" style="margin-bottom: 10px;">
		<strong><span style=" color: #000; font-size: 26px;margin-right: 5px;" >最实惠</span></strong>
  		<span style="color: #ff7800;">实惠尽享在指尖</span>
	</div>
	
		<div class="col-md-8 col-md-offset-2" style="margin-bottom: 5px;">
			<hr align="center" width="100%" size="10">
		</div>
	
	<div class="col-md-8 col-md-offset-2" style="margin-bottom: 10px;">
		<div class="content"></div>
	</div>
	
		<!--产品展示 02 -->
	<div class="col-md-8 col-md-offset-2" style="margin-bottom: 10px;">
		<strong><span style=" color: #000; font-size: 26px;margin-right: 5px;" >最新品</span></strong> <span style="color: #ff7800;">第一时间体验</span>
	</div>
		<div class="col-md-8 col-md-offset-2" style="margin-bottom: 5px;">
			<hr align="center" width="100%" size="10">
		</div>
	<div class="col-md-8 col-md-offset-2" style="margin-bottom: 10px;">
		<div class="content2 " ></div>
	</div>
	<hr align="center" width="100%" size="10">
	
		<!-- 版权 -->
	<div class="bottom_margin"></div>
	<div class="allcopy"
		style="color: #4a4a49 !important; font-size: 13px;" align="center">
		Copyright &copy; 2018-2019 辽宁禾丰牧业股份有限公司版权所有 <a href="javascript:;"
			onClick="goToMinistry();return false;">辽ICP备14005490号-5</a>
	</div>
</body>
</html>
<script type="text/javascript">
window.onload = function(){
	function $(param){
		if(arguments[1] == true){
			return document.querySelectorAll(param);
		}else{
			return document.querySelector(param);
		}
	}
	var $box = $(".box");
	var $box1 = $(".box-1 ul li",true);
	var $box2 = $(".box-2 ul");
	var $box3 = $(".box-3");
	var $length = $box1.length;
	
	var str = "";
	for(var i =0;i<$length;i++){
		if(i==0){
			str +="<li class='on'>"+(i+1)+"</li>";
		}else{
			str += "<li>"+(i+1)+"</li>";
		}
	}
	$box2.innerHTML = str;
	
	var current = 0;
	
	var timer;
	timer = setInterval(go,1300);
	function go(){
		for(var j =0;j<$length;j++){
			$box1[j].style.display = "none";
			$box2.children[j].className = "";
		}
		if($length == current){
			current = 0;
		}
		$box1[current].style.display = "block";
		$box2.children[current].className = "on";
		current++;
	}
	
	for(var k=0;k<$length;k++){
		$box1[k].onmouseover = function(){
			clearInterval(timer);
		}
		$box1[k].onmouseout = function(){
			timer = setInterval(go,1300);
		}
	}
	for(var p=0;p<$box3.children.length;p++){
		$box3.children[p].onmouseover = function(){
			clearInterval(timer);
		};
		$box3.children[p].onmouseout = function(){
			timer = setInterval(go,1300);
		}
	}
	
	for(var u =0;u<$length;u++){
		$box2.children[u].index  = u;
		$box2.children[u].onmouseover = function(){
			clearInterval(timer);
			for(var j=0;j<$length;j++){
				$box1[j].style.display = "none";
				$box2.children[j].className = "";
			}
			this.className = "on";
			$box1[this.index].style.display = "block";
			current = this.index +1;
		}
		$box2.children[u].onmouseout = function(){
			timer = setInterval(go,1300);
		}
	}
	
	$box3.children[0].onclick = function(){
		back();
	}
	$box3.children[1].onclick = function(){
		go();
	}
	function back(){
		for(var j =0;j<$length;j++){
			$box1[j].style.display = "none";
			$box2.children[j].className = "";
		}
		if(current == 0){
			current = $length;
		}
		$box1[current-1].style.display = "block";
		$box2.children[current-1].className = "on";
		current--;
	}
}
</script>