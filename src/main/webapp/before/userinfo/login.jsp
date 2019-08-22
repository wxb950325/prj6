<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>欢迎登录逛大集-老百姓的选择！</title>
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

<!--登录 注册样式-->
<link rel="stylesheet"
	href="https://member.godaji.com/godaji_member/resources/css/newPage/dlxin.css" />
<script type="text/javascript"
	src="https://member.godaji.com/godaji_member/resources/js/newPage/jquery.placeholder.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('input, textarea').placeholder();
	});
</script>
</head>
<body>

	<div class="dlyxz_head">
		<a href="https://member.godaji.com/business"><img
			src="https://member.godaji.com/godaji_member/resources/images/newPage/logo.png"></a>
		<div class="dlyxz_title">
			<p class="dlyxz_zw">欢迎登录逛大集</p>
		</div>
	</div>
	<div class="dlyxz_body">
		<div class="dlyxz_content">
			<a> <img
				src="http://qn.hefengren.com/advertisement/yt/533db4da-f728-418f-87a0-360c548a3c6d.png">
			</a>

			<div class="dlyxz_tjbg">
				<div class="dlyxz_tjt huise">登录</div>
				<div class="dlyxz_form">
					<form id="login_form" action="login" method="post"
						class="dlyxz_form01">
						<div>
							<p>手机号码:</p>
							<input type="text" name="username" id="username" value=""
								maxlength="11" placeholder="请输入手机号码" class="dlyxz_text01" />
						</div>
						<div>
							<p>密码:</p>
							<input type="password" name="password" id="password"
								placeholder="请输入密码" class="dlyxz_text01" />
						</div>
						<input type="button" value="登录" class="dlyxz_text03"
								id="js-login" />
						<a class="dlyxz_wj01" href="https://member.godaji.com/forgot.html">忘记密码？</a>
					</form>
				</div>
				<div class="dlyxz_footer">
					<p>还没有账号？立即去</p>
					<a href="https://member.godaji.com/register">注册>></a>
				</div>
			</div>

		</div>
	</div>
</body>
</html>



