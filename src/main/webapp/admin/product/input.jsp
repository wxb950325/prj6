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
<script type="text/javascript" src="<%=basePath%>js/jquery-1.4.4.min.js"></script>
</head>

<body>
<h3>商品编辑</h3>
<div class="container">
<FORM role="form" method="post" ACTION="${product==null?'save':'update' }">
<input type="hidden" name="pid" value="${product.pid }">

<div class="form-group">
		<label class="col-xs-2">商品名称：</label>
		<INPUT TYPE="text" NAME="pName" value="${product.pName }"><br>
</div>

<div class="form-group">
		<label class="col-xs-2">商品类型：</label>
		<INPUT TYPE="text" NAME="tid" value="${product.tid }"><br>
</div>

<div class="form-group">
		<label class="col-xs-2">商户名称：</label>
		<INPUT TYPE="text" NAME="sid" value="${product.sid }"><br>
</div>

<div class="form-group">
		<label class="col-xs-2">商品库存：</label>
		<INPUT TYPE="text" NAME="stock" value="${product.stock }"><br>
</div>

<div class="form-group">
		<label class="col-xs-2">商品品牌：</label>
		<INPUT TYPE="text" NAME="bid" value="${product.bid }"><br>
</div>

<div class="form-group">
		<label class="col-xs-2">商品描述：</label>
		<INPUT TYPE="text" NAME="pDescribe" value="${product.pDescribe }"><br>
</div>


<div class="form-group">
		<label class="col-xs-2">商品详情：</label>
		<INPUT TYPE="text" NAME="pDetails" value="${product.pDetails }"><br>
</div>

<div class="form-group">
		<label class="col-xs-2">商品规格：</label>
		<INPUT TYPE="text" NAME="pSize" value="${product.pSize }"><br>
</div>

<div class="form-group">
		<label class="col-xs-2">商品总量：</label>
		<INPUT TYPE="text" NAME="totalSales" value="${product.totalSales }"><br>
</div>

<div class="form-group">
		<label class="col-xs-2">商品产地：</label>
		<INPUT TYPE="text" NAME="pOrigin" value="${product.pOrigin }"><br>
</div>

<div class="form-group">
		<label class="col-xs-2">商品重量：</label>
		<INPUT TYPE="text" NAME="pWeight" value="${product.pWeight }"><br>
</div>

<div class="form-group">
		<label class="col-xs-2">商品进价：</label>
		<INPUT TYPE="text" NAME="openingPrice" value="${product.openingPrice }"><br>
</div>

<div class="form-group">
		<label class="col-xs-2">商品售价：</label>
		<INPUT TYPE="text" NAME="sellingPrice" value="${product.sellingPrice }"><br>
</div>


<INPUT TYPE="submit" value="${product==null?'save':'update' }">
</FORM>
</div>
</body>

</html>
