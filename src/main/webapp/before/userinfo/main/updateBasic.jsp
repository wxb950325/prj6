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
<script type="text/javascript" src="<%=basePath %>js/jquery-1.4.4.min.js" ></script>
</head>
<body>
<script>
	$.ajaxSetup({
		global:true,
		async:false,
		cache:false,
		type:"POST"
	});

	var ps;
	var cs;
	
	$(function(){
		$.ajax({
			url:"/before/province/findAll",
			dataType:"json",
			success:function(json){
				alert(1);
				ps = json;
				fillP();
			}
		});
	});

	function fillP(){
		$.each(ps,function(i,item){
			$("#p").append("<option value="+i+" >"+item.pname+"</option>");
		});
		fillC(0);
	}
	function fillC(index){
		$("#c").empty();
		cs=ps[index].citys;
		$.each(cs,function(i,item){
			$("#c").append("<option value="+i+" >"+item.cname+"</option>");
		});
		fillZ(0);
	}

	function fillZ(index){
		$("#z").empty();
		var zs=cs[index].zones;
		$.each(zs,function(i,item){
			$("#z").append("<option value="+i+" >"+item.zname+"</option>");
		});
	}
</script>
<form action="">
	用户名：<input type="text" name="uname" /><br>
	密码：<input type="text" name="upass"  /><br>
	性别：<input type="text"  name="usex" /><br>
	年龄：<input type="text" name="uage"  /><br>
	手机号：<input type="text"  name="phone"/><br>
	省：
	<select id="p" onchange="fillC(this.value)">
	</select>
	市：
	<select id="c" onchange="fillZ(this.value)">
	</select>
	区：
	<select id="z" >
	</select>
</form>
</body>
</html>