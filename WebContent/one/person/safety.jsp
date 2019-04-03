<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
		<title>安全设置</title>
		<link href="/Test/one/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="/Test/one/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
		<link href="/Test/one/css/personal.css" rel="stylesheet" type="text/css">
		<link href="/Test/one/css/infstyle.css" rel="stylesheet" type="text/css">
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
				<div class="main-wrap" style="min-height: 550px">

					<!--标题 -->
					<div class="user-safety">
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">账户安全</strong> / <small>Set&nbsp;up&nbsp;Safety</small></div>
						</div>
						<hr/>

						<!--头像 -->
						<div class="user-infoPic" style="height: 110px">

							<div class="filePic">
								<img class="am-circle am-img-thumbnail" src="/Test/${sessionScope.user.userImg }" alt="" />
							</div>

							<p class="am-form-help">头像</p>

							<div class="info-m">
								<div><b>用户名：<i>${sessionScope.user.userLoginName }</i></b></div>
								<div class="u-safety">
									真实姓名：${sessionScope.user.userName }
								</div>
								<div class="u-safety">
									实名认证：
									<c:if test="${requestScope.safe==null }">
										<a href="/Test/one/person/idcard.jsp">
											<div class="am-badge am-radius am-badge-danger am-text-xxs">未认证</div>
										</a>
									</c:if>
									<c:if test="${requestScope.safe!=null }">
										<c:if test="${requestScope.safe.identity==null }">
											<a href="/Test/one/person/idcard.jsp">
												<div class="am-badge am-radius am-badge-danger am-text-xxs">未认证</div>
											</a>
										</c:if>
										<c:if test="${requestScope.safe.identity!=null }">
											<div class="am-badge am-radius am-badge-secondary am-text-xxs">已认证</div>
										</c:if>
									</c:if>
								</div>
								<div class="u-safety">
									安全问题：
									<c:if test="${requestScope.safe==null }">
										<a href="/Test/one/person/question.jsp">
											<div class="am-badge am-radius am-badge-danger am-text-xxs">未设置</div>
										</a>
									</c:if>
									<c:if test="${requestScope.safe!=null }">
										<c:if test="${requestScope.safe.question1 == '' }">
											<a href="/Test/one/person/question.jsp">
												<div class="am-badge am-radius am-badge-danger am-text-xxs">未设置</div>
											</a>
										</c:if>
										<c:if test="${requestScope.safe.question1 != '' }">
											<div class="am-badge am-radius am-badge-secondary am-text-xxs">已设置</div>
										</c:if>
									</c:if>
								</div>
							</div>
						</div>

						<div class="check">
							<ul>
								<li>
									<i class="i-safety-lock"></i>
									<div class="m-left">
										<div class="fore1">登录密码</div>
										<div class="fore2"><small>为保证您购物安全，建议您定期更改密码以保护账户安全。</small></div>
									</div>
									<div class="fore3">
										<a href="/Test/one/person/password.jsp">
											<div class="am-btn am-btn-secondary">修改</div>
										</a>
									</div>
								</li>
								<li>
									<i class="i-safety-idcard"></i>
									<div class="m-left">
										<div class="fore1">实名认证</div>
										<div class="fore2"><small>用于提升账号的安全性和信任级别，认证后不能修改认证信息。</small></div>
									</div>
									<div class="fore3">
										<c:if test="${requestScope.safe==null }">
											<a href="/Test/one/person/idcard.jsp">
												<div class="am-btn am-btn-secondary">认证</div>
											</a>
										</c:if>
										<c:if test="${requestScope.safe!=null }">
											<c:if test="${requestScope.safe.identity==null }">
												<a href="/Test/one/person/idcard.jsp">
													<div class="am-btn am-btn-secondary">认证</div>
												</a>
											</c:if>
											<c:if test="${requestScope.safe.identity!=null }">
												<a href="/Test/GetQuestionsOrIdentity?userID=${sessionScope.user.userID }&status=2">
													<div class="am-btn am-btn-default">查看</div>
												</a>
											</c:if>
										</c:if>
									</div>
								</li>
								<li>
									<i class="i-safety-security"></i>
									<div class="m-left">
										<div class="fore1">安全问题</div>
										<div class="fore2"><small>保护账户安全，验证您身份的工具之一。</small></div>
									</div>
									<div class="fore3">
										<c:if test="${requestScope.safe==null }">
											<a href="/Test/one/person/question.jsp">
												<div class="am-btn am-btn-secondary">设置</div>
											</a>
										</c:if>
										<c:if test="${requestScope.safe!=null }">
											<c:if test="${requestScope.safe.question1 == '' }">
												<a href="/Test/one/person/question.jsp">
													<div class="am-btn am-btn-secondary">设置</div>
												</a>
											</c:if>
											<c:if test="${requestScope.safe.question1 != '' }">
												<a href="/Test/GetQuestionsOrIdentity?userID=${sessionScope.user.userID }&status=1">
													<div class="am-btn am-btn-default">查看</div>
												</a>
											</c:if>
										</c:if>
									</div>
								</li>
							</ul>
						</div>

					</div>
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