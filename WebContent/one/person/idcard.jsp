<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
		<title>实名认证</title>
		<link href="/Test/one/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="/Test/one/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
		<link href="/Test/one/css/personal.css" rel="stylesheet" type="text/css">
		<link href="/Test/one/css/stepstyle.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="/Test/one/js/jquery-1.7.2.min.js"></script>
		<script src="/Test/one/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
	</head>
	<body>
		<!--头 -->
		<header>
			<article>
				<div class="mt-logo">
					<!--顶部导航条 -->
					<div class="am-container header">
						<ul class="message-l">
							<div class="topMessage">
								<div class="menu-hd">
									<a href="#" target="_top" class="h">亲，请登录</a>
									<a href="#" target="_top">免费注册</a>
								</div>
							</div>
						</ul>
						<ul class="message-r">
							<div class="topMessage home">
								<div class="menu-hd"><a href="#" target="_top" class="h">商城首页</a></div>
							</div>
							<div class="topMessage my-shangcheng">
								<div class="menu-hd MyShangcheng"><a href="#" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
							</div>
							<div class="topMessage mini-cart">
								<div class="menu-hd"><a id="mc-menu-hd" href="#" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
							</div>
							<div class="topMessage favorite">
								<div class="menu-hd"><a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div>
						</ul>
						</div>

						<!--悬浮搜索框-->

						<div class="nav white">
							<div class="logoBig">
								<li><img src="/Test/one/images/logobig.png" /></li>
							</div>

							<div class="search-bar pr">
								<a name="index_none_header_sysc" href="#"></a>
								<form>
									<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
									<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
								</form>
							</div>
						</div>
						<div class="clear"></div>
					</div>
				</div>
			</article>
		</header>
			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap" style="min-height: 586px">
					<div class="am-cf am-padding">
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">实名认证</strong> / <small>Real&nbsp;authentication</small></div>
					</div>
					<hr/>
					<!--进度条-->
					<div class="m-progress">
						<div class="m-progress-list">
							<c:if test="${requestScope.safe == null }">
								<span class="step-1 step">
	                                <em class="u-progress-stage-bg"></em>
	                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
	                                <p class="stage-name">实名认证</p>
	                            </span>
								<span class="step-2 step">
	                                <em class="u-progress-stage-bg"></em>
	                                <i class="u-stage-icon-inner">2<em class="bg"></em></i>
	                                <p class="stage-name">完成</p>
	                            </span>
                            </c:if>
                            <c:if test="${requestScope.safe != null }">
								<span class="step-3 step">
	                                <em class="u-progress-stage-bg"></em>
	                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
	                                <p class="stage-name">实名认证</p>
	                            </span>
								<span class="step-3 step">
	                                <em class="u-progress-stage-bg"></em>
	                                <i class="u-stage-icon-inner">2<em class="bg"></em></i>
	                                <p class="stage-name">完成</p>
	                            </span>
                            </c:if>
							<span class="u-progress-placeholder"></span>
						</div>
						<div class="u-progress-bar total-steps-2">
							<div class="u-progress-bar-inner"></div>
						</div>
					</div>
					<form action="/Test/SetIdentity?userID=${sessionScope.user.userID }" method="post" class="am-form am-form-horizontal">
						<div class="am-form-group bind">
							<label for="user-info" class="am-form-label">账户名：</label>
							<div class="am-form-content" style="margin-top: 2.5px">
								<span id="user-info">${sessionScope.user.userLoginName }</span>
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-name" class="am-form-label">真实姓名：</label>
							<div class="am-form-content" style="margin-top: 7.5px">
								<span id="user-info">${sessionScope.user.userName }</span>
							</div>
						</div>
						<c:if test="${requestScope.safe == null }">
							<div class="am-form-group">
								<label for="user-IDcard" class="am-form-label">身份证号：</label>
								<div class="am-form-content" style="margin-top: 2.5px">
									<input type="tel" id="identity" name="identity" placeholder="请输入您的身份证信息">
								</div>
							</div>
							<div class="info-btn">
								<input type="submit" class="am-btn am-btn-danger" value="保存修改">
							</div>
						</c:if>
						<c:if test="${requestScope.safe != null }">
							<div class="am-form-group">
								<label for="user-IDcard" class="am-form-label">身份证号：</label>
								<div class="am-form-content" style="margin-top: 10px">
									<span id="user-info">${requestScope.safe.identity }</span>
								</div>
							</div>
						</c:if>
					</form>

				</div>
				<!--底部-->
				<div class="footer">
				</div>
			</div>

			<aside class="menu">
				<ul>
					<li class="person active">
						<a href="/Test/PersonalCenter?userID=${sessionScope.user.userID }">个人中心</a>
					</li>
					<li class="person">
						<a href="#">个人资料</a>
						<ul>
							<li> <a href="/Test/GetUserInfo?userID=${sessionScope.user.userID }">个人信息</a></li>
							<li class="active"> <a href="/Test/GetSafeInfo?userID=${sessionScope.user.userID }">安全设置</a></li>
							<li> <a href="/Test/GetUserAddress?userID=${sessionScope.user.userID }">收货地址</a></li>
						</ul>
					</li>
					<li class="person">
						<a href="#">我的交易</a>
						<ul>
							<li><a href="/Test/showOrder?userID=${sessionScope.user.userID }">订单管理</a></li>
							<li><a href="/Test/UserRefund?userID=${sessionScope.user.userID }">退款售后</a></li>
						</ul>
					</li>

					<li class="person">
						<a href="#">我的小窝</a>
						<ul>
							<li> <a href="/Test/favoritePage?userID=${sessionScope.user.userID }">收藏</a></li>
							<li> <a href="/Test/GetAllComment?userID=${sessionScope.user.userID}">评价</a></li>
						</ul>
					</li>
				</ul>
			</aside>
		</div>

	</body>

</html>