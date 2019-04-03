<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
		<title>我的收藏</title>
		<link href="/Test/one/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="/Test/one/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
		<link href="/Test/one/css/personal.css" rel="stylesheet" type="text/css">
		<link href="/Test/one/css/colstyle.css" rel="stylesheet" type="text/css">
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
				<div class="main-wrap">

					<div class="user-collection">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">我的收藏</strong> / <small>My&nbsp;Collection</small></div>
						</div>
						<hr/>

						<div class="you-like">
							<div class="s-bar">
								我的收藏
							</div>
							<div class="s-content">
								<c:forEach items="${favoriteList }" var="items">
									<div class="s-item-wrap">
										<div class="s-item">
											<div class="s-pic">
												<a href="#" class="s-pic-link">
													<img src="/Test/${items.goods.goodsImg }" class="s-pic-img s-guess-item-img">
													<c:if test="${items.goods.goodsStatus eq 48 }">
														<span class="tip-title">已下架</span>
													</c:if>
												</a>
											</div>
											<div class="s-info">
												<div class="s-title"><a href="#">${items.goods.goodsName }</a></div>
												<div class="s-price-box">
													<c:if test="${items.goods.goodsStatus eq 49 }">
														<span class="s-price"><em class="s-price-sign">¥</em><em class="s-value"><fmt:formatNumber minFractionDigits="2" value="${items.goods.goodsPrice }"/></em></span>
														<c:if test="${items.goods.goodsOriginalPrice!=0 }">
															<span class="s-history-price"><em class="s-price-sign">¥</em><em class="s-value"><fmt:formatNumber minFractionDigits="2" value="${items.goods.goodsOriginalPrice }"/></em></span>
														</c:if>
													</c:if>
													<c:if test="${items.goods.goodsStatus eq 48 }">
															<span class="s-history-price"><em class="s-price-sign">¥</em><em class="s-value"><fmt:formatNumber minFractionDigits="2" value="${items.goods.goodsPrice }"/></em></span>
													</c:if>
												</div>
												<div class="s-extra-box">
													<span class="s-comment">综合评分: ${items.avgPoint }</span>
													<span class="s-sales">月销: ${items.monthSale }</span>
												</div>
											</div>
											<div class="s-tp">
											<c:if test="${items.goods.goodsStatus eq 49 }">
												<a href="/Test/DeleteFavorite?favoriteID=${items.favoriteID }&userID=${sessionScope.user.userID}" class="ui-btn-loading-before" style="color: #FFF">取消收藏</a>
												<i class="am-icon-shopping-cart"></i>								
												<a href="/Test/addToCart?goodsID=${items.goods.goodsID }&userID=${sessionScope.user.userID}"><span class="ui-btn-loading-before buy">加入购物车</span></a>
											</c:if>
											<c:if test="${items.goods.goodsStatus eq 48 }">
												<a href="/Test/DeleteFavorite?favoriteID=${items.favoriteID }&userID=${sessionScope.user.userID}" class="ui-btn-loading-before" style="color: #FFF;width: 100%">取消收藏</a>
											</c:if>
											</div>
										</div>
									</div>
								</c:forEach>
								</div>

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
							<li> <a href="/Test/GetSafeInfo?userID=${sessionScope.user.userID }">安全设置</a></li>
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
							<li class="active"> <a href="/Test/favoritePage?userID=${sessionScope.user.userID }">收藏</a></li>
							<li> <a href="/Test/GetAllComment?userID=${sessionScope.user.userID}">评价</a></li>
						</ul>
					</li>
				</ul>
			</aside>
		</div>

	</body>

</html>