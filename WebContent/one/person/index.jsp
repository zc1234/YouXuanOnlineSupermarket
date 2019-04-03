<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>个人中心</title>

		<link href="/Test/one/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="/Test/one/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
		<link href="/Test/one/css/personal.css" rel="stylesheet" type="text/css">
		<link href="/Test/one/css/systyle.css" rel="stylesheet" type="text/css">

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
					<div class="wrap-left">
						<div class="wrap-list">
							<div class="m-user">
								<!--个人信息 -->
								<div class="m-bg"></div>
								<div class="m-userinfo">
									<div class="m-baseinfo">
										<a href="information.html" style="margin-top: -4px">
											<img src="${requestScope.user.getUserImg() }">
										</a>
										<em class="s-name" style="margin-top: -9px">${requestScope.user.getUserLoginName() }</em>
										<div class="s-prestige am-btn am-round">积分:${requestScope.user.getUserScore() }</div><br>
										<div class="s-prestige am-btn am-round">余额:<fmt:formatNumber minFractionDigits="2" value="${requestScope.user.getUserBalance() }"/>元</div>
										<div class="s-prestige am-btn am-round">${requestScope.exchangemessage }</div>
									</div>
								</div>
							</div>

							<!--订单 -->
							<div class="m-order">
								<div class="s-bar">
									<i class="s-icon"></i>我的订单
									<a class="i-load-more-item-shadow" href="order.html">全部订单</a>
								</div>
								<ul>
									<li><a href="order.html"><i><img src="/Test/one/images/pay.png"/></i><span>待付款<em class="m-num">${requestScope.status_0 }</em></span></a></li>
									<li><a href="order.html"><i><img src="/Test/one/images/send.png"/></i><span>待发货<em class="m-num">${requestScope.status_1 }</em></span></a></li>
									<li><a href="order.html"><i><img src="/Test/one/images/receive.png"/></i><span>待收货<em class="m-num">${requestScope.status_2 }</em></span></a></li>
									<li><a href="order.html"><i><img src="/Test/one/images/comment.png"/></i><span>待评价<em class="m-num">${requestScope.status_3 }</em></span></a></li>
									<li><a href="change.html"><i><img src="/Test/one/images/refund.png"/></i><span>退换货<em class="m-num">${requestScope.status_4 }</em></span></a></li>
								</ul>
							</div>
							<!--九宫格-->
							<div class="user-patternIcon">
								<div class="s-bar">
									<i class="s-icon"></i>我的常用
								</div>
								<ul>

									<a href="../home/shopcart.html"><li class="am-u-sm-4"><i class="am-icon-shopping-basket am-icon-md"></i><img src="../images/iconbig.png"/><p>购物车</p></li></a>
									<a href="collection.html"><li class="am-u-sm-4"><i class="am-icon-heart am-icon-md"></i><img src="../images/iconsmall1.png"/><p>我的收藏</p></li></a>
									<a href="../home/home.html"><li class="am-u-sm-4"><i class="am-icon-gift am-icon-md"></i><img src="../images/iconsmall0.png"/><p>为你推荐</p></li></a>
									<a href="comment.html"><li class="am-u-sm-4"><i class="am-icon-pencil am-icon-md"></i><img src="../images/iconsmall3.png"/><p>好评宝贝</p></li></a>
									<a href="foot.html"><li class="am-u-sm-4"><i class="am-icon-clock-o am-icon-md"></i><img src="../images/iconsmall2.png"/><p>我的足迹</p></li></a>                                                                        
								</ul>
							</div>
							<!--收藏夹 -->
							<div class="you-like">
								<div class="s-bar">我的收藏
								</div>
								<div class="s-content">
											<c:forEach items="${requestScope.favoritelist }" var="items">
												<div class="s-item-wrap">
												<div class="s-item">
												<div class="s-pic">
													<a href="#" class="s-pic-link">
														<img src="${items.goods.goodsImg }" class="s-pic-img s-guess-item-img">
													</a>
												</div>
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
												<div class="s-title"><a href="#">${items.goods.goodsName }</a></div>
												<c:if test="${items.goods.goodsStatus eq 49 }">
													<div class="s-title" style="margin-top: 3px">
														<c:if test="${items.goods.goodsPrice-items.price<0 }">
															较收藏时减少<font color="red"><fmt:formatNumber minFractionDigits="2" value="${items.price-items.goods.goodsPrice }"/></font>元
														</c:if>
														<c:if test="${items.goods.goodsPrice-items.price>0 }">
															较收藏时增加<font color="blue"><fmt:formatNumber minFractionDigits="2" value="${items.goods.goodsPrice-items.price }"/></font>元
														</c:if>
														<c:if test="${items.goods.goodsPrice-items.price==0 }">
															与收藏时价格相同
														</c:if>
													</div>
												</c:if>
												<c:if test="${items.goods.goodsStatus eq 48 }">
													<div class="s-title" style="margin-top: 3px">
														<font color="red">商品已下架</font>
													</div>
												</c:if>
												</div>
												</div>
											</c:forEach>
								</div>
								<c:if test="${requestScope.favoritenum<=8 }">
									<div class="s-more-btn i-load-more-item" data-screen="0"><i class="am-icon-refresh am-icon-fw"></i><a href="/Test/favoritePage?userID=${sessionScope.user.userID }">查看详细信息</a></div>
								</c:if>
								<c:if test="${requestScope.favoritenum>8 }">
									<div class="s-more-btn i-load-more-item" data-screen="0"><i class="am-icon-refresh am-icon-fw"></i><a href="/Test/favoritePage?userID=${sessionScope.user.userID }">更多</a></div>
								</c:if>
							</div>
						</div>
					</div>
					<div class="wrap-right">

						<!-- 日历-->
						<div class="day-list">
							<div class="s-bar">
								我的日历
							</div>
							<div class="s-care s-care-noweather">
								<div class="s-date">
									<c:set var="datetime" value="${datetime }" />
									<c:set var="year" value="${fn:substring(datetime, 0, 4)}"></c:set>
									<c:set var="month" value="${fn:substring(datetime, 5, 7)}"></c:set>
									<c:set var="day" value="${fn:substring(datetime, 8, 10)}"></c:set>
									<c:set var="week" value="${fn:substring(datetime, 11, 15)}"></c:set>
									<c:if test="${week=='Sun' }">
										<c:set var="week1" value="日"></c:set>
									</c:if>
									<c:if test="${week=='Mon' }">
										<c:set var="week1" value="一"></c:set>
									</c:if>
									<c:if test="${week=='Tue' }">
										<c:set var="week1" value="二"></c:set>
									</c:if>
									<c:if test="${week=='Wed' }">
										<c:set var="week1" value="三"></c:set>
									</c:if>
									<c:if test="${week=='Thu' }">
										<c:set var="week1" value="四"></c:set>
									</c:if>
									<c:if test="${week=='Fri' }">
										<c:set var="week1" value="五"></c:set>
									</c:if>
									<c:if test="${week=='Sat' }">
										<c:set var="week1" value="六"></c:set>
									</c:if>
									<em>${day }</em>
									<span>星期${week1 }</span>
									<span>${year }.${month } </span>
								</div>
							</div>
						</div>
						<!--新品 -->
						<div class="new-goods">
							<div class="s-bar">
								<i class="s-icon"></i>积分兑换
								<a class="i-load-more-item-shadow">共${requestScope.scoregoodsnum }款商品</a>
							</div>
							<c:forEach items="${scoregoodslist }" var="items">
								<div class="new-goods-info">
									<a class="shop-info" href="#" target="_blank">
										<div class="face-img-panel">
											<img src="${items.goodsImg }" alt="">
										</div>
										<span class="shop-title">${items.goodsName }</span>
									</a>
									<a href="/Test/CreditsExchange?userID=${sessionScope.user.userID }&goodsID=${items.goodsID}" class="follow " target="_blank" style="width: 70px">${items.goodsScore }积分</a>
								</div>
							</c:forEach>
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
							<li> <a href="/Test/favoritePage?userID=${sessionScope.user.userID }">收藏</a></li>
							<li> <a href="/Test/GetAllComment?userID=${sessionScope.user.userID}">评价</a></li>
						</ul>
					</li>
				</ul>
			</aside>
		</div>
		<!--引导 -->
		<div class="navCir">
			<li><a href="../home/home.html"><i class="am-icon-home "></i>首页</a></li>
			<li><a href="../home/sort.html"><i class="am-icon-list"></i>分类</a></li>
			<li><a href="../home/shopcart.html"><i class="am-icon-shopping-basket"></i>购物车</a></li>	
			<li class="active"><a href="index.html"><i class="am-icon-user"></i>我的</a></li>					
		</div>
	</body>

</html>