<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<title>欢迎注册-逛大集-老百姓的选择！</title>
<script type="text/javascript" src="<%=basePath %>js/jquery-1.4.4.min.js" ></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<link rel="icon" href="https://member.godaji.com/favicon.ico"
	type="image/x-icon" />
<link rel="shortcut icon"
	href="https://member.godaji.com/icon/favicon.ico" type="image/x-icon" />
<!-- css -->
<link
	href="https://member.godaji.com/godaji_member/resources/css/newPage/reset.css"
	rel="stylesheet" />
<!--个人中心 样式 -->
<link rel="stylesheet"
	href="https://member.godaji.com/godaji_member/resources/css/newPage/grzx.css" />
<link
	href="https://member.godaji.com/godaji_member/resources/css/newPage/all.css"
	rel="stylesheet" />
<link
	href="https://member.godaji.com/godaji_member/resources/css/newPage/index.css"
	rel="stylesheet" />
<script
	src="https://member.godaji.com/godaji_member/resources/js/jquery-min-1.11.1.js"
	type="text/javascript"></script>
<!-- seo -->
<link rel="canonical" href="https://member.godaji.com/business" />
<link rel="stylesheet"
	href="https://member.godaji.com/godaji_member/resources/css/newPage/zcxin.css" />
<script type="text/javascript"
	src="https://member.godaji.com/godaji_member/resources/js/newPage/jquery.placeholder.min.js"></script>
<script type="text/javascript">
			$(function(){ $('input, textarea').placeholder(); });
		</script>
</head>
<body>
	<div class="dlyxz_head">
		<img src="https://member.godaji.com/godaji_member/resources/images/newPage/logo.png">
		<div class="dlyxz_title">
			<p class="dlyxz_zw">欢迎注册逛大集</p>
		</div>
	</div>
	<div class="zcxin_body">
		<div class="zcxin_title huise">注册</div>
		<div class="zcxin_content">
			<div class="zcxin_content01">
				<form id="login_form" style="height: 285px" class="zcxin_form01"
					action="registe" method="post">
					<div>
						手机号码：
						<input type="text" name="phone" id="phone"
							placeholder="请输入手机号码" onchange="phoneCheck()" onkeydown="phoneCheck()" />
						<span id="phoneNote"></span>
					</div>
					<div>
						验证码：
						<input type="text" name="captchaCode" id="captchaCode"
							placeholder="请输入验证码"  /> 
							<img
							src="https://member.godaji.com/getKaptcha.png" width="80"
							height="20" id="kaptcha"> 
							<a href="javascript:void(0)"  id="js-refresh">
							看不清？换一个</a>
					</div>
					<div style="position: relative">
						短信验证码：
						<input type="text" name="verifyCode" id="verifyCode"
							placeholder="请输入短信验证码" /> <input
							type="button" value="获取验证码" id="js-send-sms">
					</div>
					<div>
						密码：
						<input type="password" name="upass" id="upass"
							placeholder="请输入密码" />
					</div>
					<div>
						确认密码：
						<input type="password" name="repeatPassword" id="repeatPassword"
							placeholder="请再次输入密码" />
					</div>
					<input type="submit" value="注册" class="zcxin_text03"
						id="js-register" />
				</form>
			</div>
			<div class="zcxin_gg">
				<img
					src="<%=basePath %>image/registe.png">
			</div>
			<div class="tsck"></div>
		</div>
		<div class="zcxin_footer">
			<p>已有账号？立即去</p>
			<a href="login.jsp">登录>></a>
		</div>
	</div>
</body>
</html>
<script>
function phoneCheck(){
	var phone = $("#phone").val();
	var flag = false;
      var message = "";
      var myreg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/;       
      if(phone == ''){
        message = "手机号码不能为空！";
      }else if(phone.length !=11){
        message = "请输入有效的手机号码！";
      }else if(!myreg.test(phone)){
        message = "请输入有效的手机号码！";
      }else if(checkPhoneIsExist()){
        message = "该手机号码已经被绑定！";
      }else{
          flag = true;
      }
      if(!flag){
     //提示错误效果
     	$("#phoneNote").html("");
        $("#phoneNote").html(message);
      }else{
           //提示正确效果
        $("#phoneNote").html("该手机号码可用");
      }
      return flag;
	
}
</script>

