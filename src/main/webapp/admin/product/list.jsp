<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.bootcss.com/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<script src="<%=basePath%>js/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
	function goInput(){
		location.href="goInput";
	}

</script>
</head>
<body>
商品展示
<div class="container">
<TABLE border="1" width="900px" class="table table-bordered table-striped table-hover">
<thead>
<TR class="success">
	<TD>商品名称</TD>
	<TD>类型id</TD>
	<TD>商户id</TD>
	<TD>商品库存</TD>
	<TD>商品图片</TD>
	<TD>品牌id</TD>
	<TD>商品描述</TD>
	<TD>商品详情</TD>
	<TD>商品规格</TD>
	<TD>销售总量</TD>
	<TD>商品产地</TD>
	<TD>商品重量</TD>
	<TD>进价</TD>
	<TD>售价</TD>
	<!-- <TD>审核员id</TD> -->
	<TD>是否审核通过</TD>
	<!-- <TD>审核时间</TD> -->
	<TD>商品状态</TD>
	<TD>是否删除</TD>
	<TD>操作</TD>
</TR>
</thead>
<tbody>
<c:forEach items="${list}" var="product">
<TR>
	<TD>${product.pName}</TD>
	<TD>${product.tid}</TD>
	<TD>${product.sid}</TD>
	<TD>${product.stock}</TD>
	<TD>${product.photo}</TD>
	<TD>${product.bid}</TD>
	<TD>${product.pDescribe}</TD>
	<TD>${product.pDetails}</TD>
	<TD>${product.pSize}</TD>
	<TD>${product.totalSales}</TD>
	<TD>${product.pOrigin}</TD>
	<TD>${product.pWeight}</TD>
	<TD>${product.openingPrice}</TD>
	<TD>${product.sellingPrice}</TD>
	<%-- <TD>${product.assessorId}</TD> --%>
	<TD>${product.isaudit}</TD>
	<%-- <TD>${product.audittime}</TD> --%>
	<TD>${product.pStatus}</TD>
	<TD>${product.isdelete==0?'已删除':'已恢复'}</TD>
	<TD>
		<a href="${product.isdelete==1?'delete':'revoke'}?pid=${product.pid}">${product.isdelete==1?'删除':'恢复'}</a> 
		<a href="findById?pid=${product.pid}">修改</a>
	</TD>
</TR>
</c:forEach>   
</tbody>
</TABLE>
</div>
<button onclick="goInput()">增加商品</button>
</body>
</html>
