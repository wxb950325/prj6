<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" />
	<script src="../js/jquery-1.10.2.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script src="https://cdn.staticfile.org/vue-resource/1.5.1/vue-resource.min.js"></script>
</head>
<body>
	${store.sname }店铺
	
	<button><a href="/admin/product/input.jsp">商品添加</a></button>
	<button><a href="/admin/product/list.jsp">商品显示</a></button>
</body>
</html>