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
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.staticfile.org/vue-resource/1.5.1/vue-resource.min.js"></script>
	<div id="app">
		<table border="1" style="width: 600px; height:400px; margin:0 auto">
			<tr>
				<td style="text-align: right; width: 100px; font-weight: 700; display: table-cell; vertical-align: middle;"><h3>用户名：</h3></td>
				<td style="text-align: left; width: 200px; font-weight: 600; display: table-cell; vertical-align: middle;">{{json.uname}}</td>
			</tr>
			<tr>
				<td style="text-align: right; width: 100px; font-weight: 700; display: table-cell; vertical-align: middle;"><h3>密码：</h3></td>
				<td style="text-align: left; width: 200px; font-weight: 600; display: table-cell; vertical-align: middle;">{{json.upass}}</td>
			</tr>
			<tr>
				<td style="text-align: right; width: 100px; font-weight: 700; display: table-cell; vertical-align: middle;"><h3>性别：</h3></td>
				<td style="text-align: left; width: 200px; font-weight: 600; display: table-cell; vertical-align: middle;">{{json.usex?'女':'男'}}</td>
			</tr>
			<tr>
				<td style="text-align: right; width: 100px; font-weight: 700; display: table-cell; vertical-align: middle;"><h3>年龄：</h3></td>
				<td style="text-align: left; width: 200px; font-weight: 600; display: table-cell; vertical-align: middle;">{{json.uage}}</td>
			</tr>
			<tr>
				<td style="text-align: right; width: 100px; font-weight: 700; display: table-cell; vertical-align: middle;"><h3>手机号：</h3></td>
				<td style="text-align: left; width: 200px; font-weight: 600; display: table-cell; vertical-align: middle;">{{json.phone}}</td>
			</tr>
			<tr>
				<td style="text-align: right; width: 100px; font-weight: 700; display: table-cell; vertical-align: middle;"><h3>地址：</h3></td>
				<td style="text-align: left; width: 200px; font-weight: 600; display: table-cell; vertical-align: middle;">
					省：{{json.provinceName}}
					市：{{json.cityName}}
					区：{{json.zoneName}}
				</td>
			</tr>
			<tr><td colspan="2" style="text-align: center;">
				<button onclick="update()">修改信息</button>
			</td></tr>
		</table>
	</div>
<script>
	window.onload = function() {
		uid='';
		var vm = new Vue({
			el : '#app',
			data : {
				json : ''
			},
			mounted : function() {  //mounted是服务器启动后直接执行的方法
				this.get();
			},
			
			methods : {
				get : function() {
					//发送post请求
					this.$http({
						method : 'post',
						url : 'myinfo',
						params : {
						},
						emulateJSON : true//转中文
					}).then(function(res) {
						vm.json = res.body;
						uid=res.body.uid;
					}, function() {
						console.log('请求失败处理');
					});
				},
			}
		});
	}

	function update(){
		location.href='/before/userinfo/main/findById?uid='+uid;
	}
	
</script>
</body>
</html>
