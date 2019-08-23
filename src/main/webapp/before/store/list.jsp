<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Store</title>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css" />
</head>
<body>
	<h3>商户管理</h3>
	<table class="table table-bordered table-hover table-striped" border="1">
		<tr>
			<td>sid</td>
			<td>sname</td>
			<td>uid</td>
			<td>legal_name</td>
			<td>legal_photo</td>
			<td>province_id</td>
			<td>province_name</td>
			<td>city_id</td>
			<td>city_name</td>
			<td>zone_id</td>
			<td>zone_name</td>
			<td>assessor_id</td>
			<td>isAudit</td>
			<td>audittime</td>
			<td>isdelete</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${list }" var="store">
			<tr>
				<td>${store.sid }</td>
				<td>${store.sname }</td>
				<td>${store.uid }</td>
				<td>${store.legalName }</td>
				<td>${store.legalPhoto }</td>
				<td>${store.provinceId }</td>
				<td>${store.provinceName }</td>
				<td>${store.cityId }</td>
				<td>${store.cityName }</td>
				<td>${store.zoneId }</td>
				<td>${store.zoneName }</td>
				<td>${store.assessorId }</td>
				<td>${store.isaudit }</td>
				<td>${store.audittime }</td>
				<td>${store.isdelete==0?'已删除':'正常' }</td>
				<td>
					<a href="">
						${store.isdelete?'恢复':'删除' }
					</a>
					|
					<a href="findById?sid=${store.sid}">
						edit
					</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	<a href="/before/store/goInput">添加商户</a>
	<button class="btn btn-info" class="btn"><a href="/before/store/goInput">添加商户</a></button>
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