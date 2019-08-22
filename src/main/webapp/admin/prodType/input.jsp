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
<script type="text/javascript" src="<%=basePath%>js/jquery-1.4.4.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		<c:forEach items="${userinfo.roles}" var="r">
		$("input[name=chk][value=${r.rid}]").attr("checked","checked");
		</c:forEach>
	});
</script>
</head>
<body>
用户管理
<FORM METHOD=POST ACTION="${userinfo==null?'save':'update' }">
<input type="hidden" name="uid" value="${userinfo.uid }">
uname	<INPUT TYPE="text" NAME="uname" value="${userinfo.uname }"><br>
upass	<INPUT TYPE="text" NAME="upass" value="${userinfo.upass }"><br>
请选择您的角色：
<c:forEach items="${roles}" var="role">

<INPUT TYPE="checkbox" NAME="chk" value="${role.rid }">${role.rname }

</c:forEach>
<br>
<INPUT TYPE="submit" value="${userinfo==null?'save':'update' }">
</FORM>

</body>

</html>
