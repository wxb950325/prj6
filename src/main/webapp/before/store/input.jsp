<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品添加</title>
</head>
<body>
	<h3>添加页面</h3>
	<form action="save" method="post">
		<input type="hidden" name="sid" /><br>
		<h3>sname</h3>
		<div>
			<input type="text" name="sname" />
		</div>
		<h3>uid</h3>
		<div>
		<input type="text" name="uid" />
		</div>
		<h3>legal_name</h3>
		<div>
		<input type="text" name="legalName" />
		</div>
		<h3>legal_photo</h3>
		<div>
		<input type="file" name="legalPhoto" />
		</div>
		省<select id="prov">
			<c:forEach items="${prov}" var="p">
			<option value="${p.pid}">
				${p.pname }
			</option>省
			</c:forEach>
		</select>
		市<select id="city">
			<c:forEach items="${city}" var="city">
			<option value="${city.cid}">
				${city.cname }
			</option>市
			</c:forEach>
		</select>
		区<select id="zone">
			<c:forEach items="${zone}" var="zone">
			<option value="${zone.zid}">
				${zone.zname }
			</option>
			</c:forEach>
		</select>
		<br>
		<h3>assessor_id</h3>
		<div>
			<input type="text" name="assessorId" />
		</div>
		<h3>audittime</h3>
		<div>
			<input type="datetime" name="audittime">
		</div>
		<INPUT TYPE="submit" value="${store==null?'save':'update' }">
	</form>
</body>
</html>