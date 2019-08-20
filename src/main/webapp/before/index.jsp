<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>逛大集</title>
<meta name="keywords" content="逛大集,预混料,浓缩料,全价料,种子,农药,化肥,养殖设备,动保产品" />
<meta name="description"
	content="逛大集农业电商平台，以服务三农，创中国农业电商第一品牌为公司使命。厂家在线直销饲料、动保、养殖用品、肥料、农用机械等，所有产品均为正规品牌商品，逛大集担保交易，质优价廉。老百姓的选择！" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<!-- css -->
<!--	<link rel="stylesheet" href="http://www.godaji.com/godaji_shoppingmall/resources/css/global.css" type="text/css" media="all" />
	<link href="http://www.godaji.com/godaji_shoppingmall/resources/css/shouye_same.css" rel="stylesheet"/> -->

<link
	href="http://www.godaji.com/godaji_shoppingmall/resources/css/newPage/reset.css"
	rel="stylesheet" />
<link
	href="http://www.godaji.com/godaji_shoppingmall/resources/css/newPage/all.css"
	rel="stylesheet" />
<script
	src="http://www.godaji.com/godaji_shoppingmall/resources/js/jquery-min-1.11.1.js"></script>
<!-- seo -->
<link rel="canonical" href="http://www.godaji.com" />
<script type="text/javascript">
	var godaji = godaji || {};
	godaji.domainUrl = {
		baseDomain : 'http://www.godaji.com',
		memberBaseDomain : 'https://member.godaji.com',
		searchDomain : 'http://search.godaji.com',
		cookieDomain : 'godaji.com',
		imageDomain : 'http://www.godaji.com/godaji_shoppingmall/resources/images',
		tplDomain : 'http://www.godaji.com/godaji_shoppingmall/resources/tpl',
		qiniuDomain : 'http://qn.godaji.com'
	}
	// 百度统计 add by PengQiaojun 2015-12-17
	var _hmt = _hmt || [];
	(function() {
		var hm = document.createElement("script");
		hm.src = "//hm.baidu.com/hm.js?37568d1c8b87eb60d31b26689fe56604";
		var s = document.getElementsByTagName("script")[0];
		s.parentNode.insertBefore(hm, s);
	})();
	// add end by PengQiaojun 2015-12-17
</script>
<link
	href="http://www.godaji.com/godaji_shoppingmall/resources/css/newPage/index.css"
	rel="stylesheet" />
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="360-site-verification"
	content="2f54682c81e99d403fe96a9d2da31875" />
<meta name="sogou_site_verification" content="vM9MrhehnT" />
</head>
<body>
	<!--头部-->
	<div class="topmenu">
		<div class="topmenu_box">
			<!--未登录状态-->
			<div class="topform" style="display: block;">
				<form id="header_login_form">
					<input type="text" name="username" id="username" class="btn01"
						placeholder="请输入手机号" /> <input type="password" name="password"
						id="password" class="btn02" placeholder="请输入密码"> <input
						type="button" value="登录" class="btn03 loginButton" /> <input
						type="button" value="注册" class="btn03 registerButton" />
				</form>
			</div>
			<!--登录状态-->
			<div class="topmylist" style="display: none;">
				<a id="userNameHeader" style="color: #9e9e9e;" target="_blank"
					href="https://member.godaji.com"></a> <img
					src="http://www.godaji.com/godaji_shoppingmall/resources/images/newPage/03.png">
				<div class="mylists" style="display: none;">
					<a href="https://member.godaji.com" target="_blank">会员中心</a> <a
						href="https://member.godaji.com/orderMgmt" target="_blank">我的订单</a>
					<a href="https://member.godaji.com/favorites.html" target="_blank">我的收藏</a>
					<a href="https://member.godaji.com/logout">退出</a>
				</div>
			</div>
			<!--搜索-->
			<div id="searchBarDiv">
				<div class="topseach" id="js-search-all">
					<a class="sy_ssxl"><p class="left">商品</p>
						<img
						src="http://www.godaji.com/godaji_shoppingmall/resources/images/newPage/online01.png"
						class="right">
					<div class="sy_ssxl01" style="display: none;">地区</div></a>
					<script>
						$(".sy_ssxl .left")
								.mouseenter(
										function() {
											if ($(".sy_ssxl .sy_ssxl01").css(
													"display") == "none") {
												$(".sy_ssxl .sy_ssxl01").show();
											}
										})
						$(".sy_ssxl .sy_ssxl01").click(
								function() {
									$(".sy_ssxl .sy_ssxl01").hide();
									if ($(".sy_ssxl .left").text() == "商品") {
										$(".sy_ssxl .left").text("地区");
										$(".sy_ssxl .sy_ssxl01").text("商品");
										$("#js-search-input").attr(
												"placeholder", "商品销售地区");
									} else {
										$(".sy_ssxl .left").text("商品");
										$(".sy_ssxl .sy_ssxl01").text("地区");
										$("#js-search-input").attr(
												"placeholder", "来点啥");
									}
								})
						$(".sy_ssxl").mouseleave(function() {
							$(".sy_ssxl01").hide();
						})
					</script>
					<!-- select id="keywordType" class="sy_ssxl">
            	<option value="ware" >商品</option>
                <option value="area" >地区</option>
            </select -->
					<input type="text" id='js-search-input' class="btn04" value=""
						placeholder="来点啥" /> <input id="countyCenterIdHidden"
						type="hidden" value="0" /> <input type="button"
						class="btn05 w_sousuo" />
				</div>

				<div class="headtopewm">
					<a href="javascript:void(0)" id="wxewm"><img
						src="http://www.godaji.com/godaji_shoppingmall/resources/images/newPage/wxewm.png">
					<p>
							&nbsp;&nbsp;<span style="color: #CCC">|</span>&nbsp;&nbsp;
						</p></a> <a href="javascript:void(0)" id="azewm"><img
						src="http://www.godaji.com/godaji_shoppingmall/resources/images/newPage/azewm.png">
					<p>
							&nbsp;&nbsp;<span style="color: #CCC">|</span>&nbsp;&nbsp;
						</p></a> <a href="javascript:void(0)" id="pgewm"><img
						src="http://www.godaji.com/godaji_shoppingmall/resources/images/newPage/pgewm.png">
					<p></p></a>
					<div class="headewmimgk">
						<img
							src="http://www.godaji.com/godaji_shoppingmall/resources/images/newPage/wximg.jpg">
					</div>
					<div class="headazimgk">
						<img
							src="http://www.godaji.com/godaji_shoppingmall/resources/images/newPage/azewmimg.png">
					</div>
					<div class="headipimgk">
						<img
							src="http://www.godaji.com/godaji_shoppingmall/resources/images/newPage/pgimg.jpg">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--头部 end-->
	<!--焦点图-->
	<div id="main">
		<div id="index_b_hero">
			<div class="hero-wrap">
				<ul class="heros clearfix">
					<li class="hero"><a> <img
							src="/image/1.jpg"
							class="thumb" />
					</a></li>
					<li class="hero"><a> <img
							src="/image/2.jpg"
							class="thumb" />
					</a></li>
					<li class="hero"><a> <img
							src="/image/3.jpg"
							class="thumb" />
					</a></li>
				</ul>
			</div>
			<div class="helper">
				<div class="mask-left"></div>
				<div class="mask-right"></div>
				<a href="#" class="prev icon-arrow-a-left"></a> <a href="#"
					class="next icon-arrow-a-right"></a>
			</div>
		</div>
	</div>
	<!--焦点图 end-->
	<input type="hidden" id="channelId" value="1001" />
	<!--产品展示 01 -->
	<div class="channelTehui">
		<div class="index_head">
			<strong>最实惠</strong> <span>实惠尽享在指尖</span>
		</div>
<!-- 		<ul class="cplist_four" id="salabilityGoods"> -->
			
<!-- 		</ul> -->
<div class="col-md-10 col-md-offset-1" style="margin-bottom: 70px;">
			<c:forEach items="<!-- 查询出所有商品集合 -->" var="good">
				<div class="col-md-3">
					<img src="<!-- 商品图片位置 -->" class="col-md-12" width="200" height="200" />
					<span class="col-md-4" style="font-family: 楷体; color: red; font-weight: 900;">￥商品价格</span>
					<span class="col-md-8" style="font-weight: 900;" ><a href="goodsinfo.jsp">商品名称</a></span>
					<button class="btn-warning" id="buy">立即购买</button>
				</div>
			</c:forEach>
		</div>
	</div>
	<!--产品展示 02 -->
	<div class="NotAgriculturalMaterialsId">
		<div class="index_head">
			<strong>最新品</strong> <span>第一时间体验</span>
		</div>

		<ul class="cplist_four" id="newGoodsWare">

		</ul>
	</div>
	<!--产品end-->
	<!-- 版权 -->
	<div class="bottom_margin"></div>
	<div class="allcopy"
		style="color: #4a4a49 !important; font-size: 13px;">
		Copyright &copy; 2018-2019 王品茹禾丰牧业股份有限公司版权所有 <a href="javascript:;"
			onClick="goToMinistry();return false;">陕ICP备14005490号-5</a>
	</div>
	<div class="allcopyimg" style="width: 340px">
		<img
			src="http://www.godaji.com/godaji_shoppingmall/resources/images/newPage/bqtp01.jpg">
		<img
			src="http://www.godaji.com/godaji_shoppingmall/resources/images/newPage/bqtp02.jpg">
		<img
			src="http://www.godaji.com/godaji_shoppingmall/resources/images/newPage/bqtp03.jpg">
	</div>
	<!--县域
<div class="menu_xy" id="menu_xybox" style="display: none;">
	<ul>
		<a href="javascript:void(0)" class="closecp" id="menu_xyclose">关闭</a>
		<a href="http://www.godaji.com" class="hongse">返回逛大集首页 >></a>
		  <li>
		     <span>吉林省</span>
		          <a target="_blank"  href="http://www.godaji.com/countyCenter/gotoCountyCenter/9.html">
		          公主岭
		          </a>
		  </li>
		  <li>
		     <span>辽宁省</span>
		          <a target="_blank"  href="http://www.godaji.com/countyCenter/gotoCountyCenter/1.html">
		          请勿选择
		          </a>
		          <a target="_blank"  href="http://www.godaji.com/countyCenter/gotoCountyCenter/5.html">
		          昌图县
		          </a>
		          <a target="_blank"  href="http://www.godaji.com/countyCenter/gotoCountyCenter/7.html">
		          新民市
		          </a>
		          <a target="_blank"  href="http://www.godaji.com/countyCenter/gotoCountyCenter/13.html">
		          彰武县
		          </a>
		  </li>
	</ul>
</div> -->
	<!--县域end-->

	<!--分类-->
	<div class="menu_fl" id="menu_flbox" style="display: none;">
		<div class="menu_fl_box">
			<a href="javascript:void(0)" class="closecp" id="menu_flclose">关闭</a>
			<ul>
				<li><a target="_blank"
					href="http://www.godaji.com/category/control/1025/?countyCenterId=0"
					class="huangse"> <strong>饲料</strong>
				</a>
					<div class="m_f_b_flbox">
						<span> <a target="_blank"
							href="http://www.godaji.com/category/control/1025?subClassID=1157&countyCenterId=0"
							title="预混料"> 预混料 </a>
						</span> <span> | <a target="_blank"
							href="http://www.godaji.com/category/control/1025?subClassID=1159&countyCenterId=0"
							title="浓缩料"> 浓缩料 </a>
						</span> <span> | <a target="_blank"
							href="http://www.godaji.com/category/control/1025?subClassID=1161&countyCenterId=0"
							title="全价料"> 全价料 </a>
						</span> <span> | <a target="_blank"
							href="http://www.godaji.com/category/control/1025?subClassID=1063&countyCenterId=0"
							title="饲料添加剂"> 饲料添加剂 </a>
						</span> <span> | <a target="_blank"
							href="http://www.godaji.com/category/control/1025?subClassID=1105&countyCenterId=0"
							title="原料"> 原料 </a>
						</span> <span> | <a target="_blank"
							href="http://www.godaji.com/category/control/1025?subClassID=1165&countyCenterId=0"
							title="精料补充料"> 精料补充料 </a>
						</span>
					</div>

					<div class="m_f_b_flboxdi">
						<span class="shenhui">品种 ： </span> <span> <a
							target="_blank"
							href="http://www.godaji.com/category/control/1025?breedID=3&countyCenterId=0"
							title="猪">猪</a>
						</span> <span> | <a target="_blank"
							href="http://www.godaji.com/category/control/1025?breedID=9&countyCenterId=0"
							title="牛">牛</a>
						</span> <span> | <a target="_blank"
							href="http://www.godaji.com/category/control/1025?breedID=11&countyCenterId=0"
							title="羊">羊</a>
						</span> <span> | <a target="_blank"
							href="http://www.godaji.com/category/control/1025?breedID=5&countyCenterId=0"
							title="家禽">家禽</a>
						</span> <span> | <a target="_blank"
							href="http://www.godaji.com/category/control/1025?breedID=21&countyCenterId=0"
							title="水产">水产</a>
						</span>
					</div></li>
			</ul>
		</div>
	</div>
	<!--分类end-->

	<!--底部固定导航-->
	<div class="bottom_margin"></div>
	<div class="bottommenu">
		<div class="bottommenu_box">
			<a href="http://www.godaji.com" target="_blank"><img
				src="http://www.godaji.com/godaji_shoppingmall/resources/images/newPage/logo.png"
				class="bottom_logo menu_a6"></a> <a href="javascript:void(0)"
				class="menu_a2" id="menu_fl">分类</a> <a
				href="https://member.godaji.com/cart/special/weierhao.html#showBegin"
				target="_blank" class="menu_a3">专场</a>
			<!--20181119 提交工信部审核认证 屏蔽不需要功能
		<a href="http://www.godaji.com/info/listNew?columnType=1" target="_blank" class="menu_a4">帮助</a>
	-->
			<img
				src="http://www.godaji.com/godaji_shoppingmall/resources/images/newPage/tel.png"
				class="tel menu_a5">
		</div>
	</div>

	<!--浮动导航-->
	<div class="floatmenu">
		<a href="http://www.godaji.com" target="_blank" class="fmblock fm01"></a>
		<a href="javascript:void(0)" class="fmblock fm02" id="mycard"></a> <a
			href="https://member.godaji.com/cart/myCart.html" target="_blank"
			class="fmblock fm03"></a> <a
			href="https://member.godaji.com/favorites.html" target="_blank"
			class="fmblock fm04"></a> <a href="javascript:void(0)"
			target="_blank" id="returnTop" class="fmblock fm05"></a>
	</div>

	<!-- 我的 弹出 个人信息 -->
	<div class="vipcard" style="display: none;">
		<img
			src="http://www.godaji.com/godaji_shoppingmall/resources/images/newPage/close.png"
			id="vipclose" class="vipclose">
		<div class="vboxtop">
			<img
				src="http://www.godaji.com/godaji_shoppingmall/resources/images/newPage/tx.jpg"
				class="userPhoteo">
			<!--未登录状态-->
			<span id="notLoggedInFooter" style="display: block;">您好！ 请<a
				href="https://member.godaji.com/login" target="_blank"
				class="huangse">登录</a> | <a
				href="https://member.godaji.com/register" target="_blank"
				class="huangse">注册</a></span>
			<!--已登录状态-->
			<span id="loggedInFooter" style="display: none;">欢迎您 ！ <a
				href="https://member.godaji.com" target="_blank" class="huangse"
				id="userNameFooter">胡小月</a></span>
		</div>
		<div class="vbotbot">
			<a href="https://member.godaji.com/orderMgmt" target="_blank"
				class="border_r"><img
				src="http://www.godaji.com/godaji_shoppingmall/resources/images/newPage/01.png"><span>订单</span></a>
			<a href="https://member.godaji.com/cart/myCart.html" target="_blank"><img
				src="http://www.godaji.com/godaji_shoppingmall/resources/images/newPage/02.png"><span>购物车</span></a>
		</div>
	</div>


	<script
		src="http://www.godaji.com/godaji_shoppingmall/resources/js/newPage/jquery.foucs.js"></script>
	<script
		src="http://www.godaji.com/godaji_shoppingmall/resources/js/newPage/common.js"></script>
	<script
		src="http://www.godaji.com/godaji_shoppingmall/resources/js/newPage/footerBase.js"></script>
	<script
		src="http://www.godaji.com/godaji_shoppingmall/resources/js/handlebars.min.js"></script>
	<script
		src="http://www.godaji.com/godaji_shoppingmall/resources/js/layer/layer.js"></script>
	<script
		src="http://www.godaji.com/godaji_shoppingmall/resources/js/layer/extend/layer.ext.js"></script>
	<script
		src="http://www.godaji.com/godaji_shoppingmall/resources/js/newPage/jquery.placeholder.min.js"></script>
	<script>
		$(function() {
			//改变焦点图自动滚动的方向
			$.foucs({
				direction : 'right'
			});
			$('input, textarea').placeholder();
			//提示信息3
			$("#wxewm").mouseenter(function() {
				$(".headewmimgk").stop().slideDown("fast");
			});
			$("#wxewm").mouseleave(function() {
				$(".headewmimgk").stop().slideUp("fast");
			});
			$("#azewm").mouseenter(function() {
				$(".headazimgk").stop().slideDown("fast");
			});
			$("#azewm").mouseleave(function() {
				$(".headazimgk").stop().slideUp("fast");
			});
			$("#pgewm").mouseenter(function() {
				$(".headipimgk").stop().slideDown("fast");
			});
			$("#pgewm").mouseleave(function() {
				$(".headipimgk").stop().slideUp("fast");
			});
			godaji.base.init();
		});
	</script>
	<script
		src="http://www.godaji.com/godaji_shoppingmall/resources/js/newPage/channel.js"></script>
	<script>
		$(function() {
			godaji.channel.init();
		});
		function goToMinistry() {
			window.open("http://www.beian.miit.gov.cn"); //在另外新建窗口中打开窗口
		}
	</script>
</body>