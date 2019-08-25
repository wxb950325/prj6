<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StoreOrder</title>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css" />
</head>
<body>
	<h3>商户订单查所有</h3>
	<table class="table table-bordered table-hover table-striped">
		<tr>
			<td>商户订单id</td>
			<td>订单名</td>
			<td>pwid</td>
			<td>商户名</td>
			<td>用户名</td>
			<td>用户订单id</td>
			<td>evalStatus</td>
			<td>订单状态</td>
			<td>p_num</td>
			<td>order_money</td>
			<td>支付时间</td>
			<td>图片名</td>
			<td>receiptor</td>
			<td>地址</td>
			<td>目前状态</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${orderList }" var="o">
			<tr>
				<td>${o.storeOid }</td>
				<td>${o.orderNum }</td>
				<td>${o.pwid }</td>
				<td>${o.sname }</td>
				<td>${o.uid }</td>
				<td>${o.userOid }</td>
				<td>${o.evalstatus }</td>
				<td>${o.orderstatus }</td>
				<td>${o.pNum }</td>
				<td>${o.orderMoney }</td>
				<td>${o.payTime }</td>
				<td>${o.phonenum }</td>
				<td>${o.receiptor }</td>
				<td>${o.address }</td>
				<td>${o.isdelete }</td>
				<td><a
					href="${o.isdelete?'revokeOrder':'deleteOrder'}?storeOid=${o.storeOid}">
						${o.isdelete?'恢复':'删除' } </a></td>
			</tr>
		</c:forEach>
	</table>
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