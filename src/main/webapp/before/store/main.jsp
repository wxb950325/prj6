<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-1.10.2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.staticfile.org/vue-resource/1.5.1/vue-resource.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath %>easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>easyui/themes/icon.css">
<script type="text/javascript" src="<%=basePath %>easyui/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath %>easyui/jquery.easyui.min.js"></script>
<script>
	$(function(){
		//进到当前页面最上方显示的页面内容
	    $("#pageNorth").panel("refresh", "north.jsp");
// 	    $("#pageContent").panel("refresh", "basicInfo.jsp");
	    openURL("基本信息", "basicInfo.jsp");
	});
	 
	 
	function openURL(title, url) {
	    $("#pageContent").panel({
	        title: title,
	        href: url
	    });
	};
	
	/* $(document).ready(function() {
		$("#ul").hide();

		$("#li").click(function(){
			
			$("#ul").toggle();
		});	
		
	}); */
		
		
		

</script>
</head>
<body>
	<div class="easyui-layout" style="width: 100%; height: 100%;"
		data-options="fit:true">
		<!-- 上边 -->
		<div region="north"
			style="height: 100px; background-color: #2d8bef; overflow: hidden;">
			<div id="pageNorth" class="easyui-panel"
				style="width: 100%; background-color: #2d8bef;" border="ture">
			</div>
		</div>
		<!-- 左边 -->
		<div region="west" style="width: 150px; overflow: hidden;">
			<div id="pageWest" class="easyui-panel" style="width: 100%;"
				border="false">
				<ul type="square">
					<li><span><a href="/before/comment.jsp">返回首页</a></span></li>
					<li><span><a href="javascript:openURL('基本信息', '/admin/product/list.jsp'')">商铺信息</a></span></li>
					<li id="li"><span><a href="javascript:openURL('基本信息', '/admin/product/list.jsp')">商品管理</a></span>
						<!-- <ul id="ul" type="square">
							<li><span><a href="javascript:openURL('基本信息', '/admin/product/list.jsp')">商品展示</a></span></li>
							<li>商品上架</li>
							<li>商品下架</li>
							<li>商品修改</li>
						</ul> -->
					</li>
					<li>收藏管理</li>
					<li><span><a href="javascript:openURL('基本信息', '/before/store/storeOrderList.jsp')">订单管理</a></span></li>
				</ul>
			</div>
		</div>
		<!-- 中间区域 -->
		<div id="content" region="center" style="overflow: hidden;"
			border="false">
			<div id="pageContent" class="easyui-panel"
				style="width: 100%; height: 100%;" border="false">
				
				
				
				</div>
		</div>
		<!-- 下边版权区 -->
		<div region="south"
			style="height: 30px; background-color: #2d8bef; text-align: center; line-height: 30px; color: #fff;"
			border="false">逛大集</div>
	</div>
</body>
</html>
