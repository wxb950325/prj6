<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品审核</title>
</head>
<body>
 <TABLE border="1" width="100%">
<TR>
	<TD>pid</TD>
	<TD>p_name</TD>
	<TD>tid</TD>
	<TD>sid</TD>
	<TD>stock</TD>
	<TD>bid</TD>
	<TD>p_describe</TD>
	<TD>p_details</TD>
	<TD>total_sales</TD>
	<TD>isAudit</TD>
	<TD>审核</TD>
	
	
</TR>
<c:forEach items="${list}" var="product">
	<TR>
		<TD>${product.pid}</TD>
		<TD>${product.pName}</TD>
		<TD>${product.tid}</TD>
		<TD>${product.sid}</TD>
		<TD>${product.stock}</TD>
		<TD>${product.bid}</TD>
		<TD>${product.pDescribe}</TD>
		<TD>${product.pDetails}</TD>
		<TD>${product.totalSales}</TD>
		<TD>${product.isaudit}</TD>
		<TD><a href="${audit}?pid=${product.pid}">审核</a></TD>
	</TR>
</c:forEach>
</TABLE>
</body>
</html>