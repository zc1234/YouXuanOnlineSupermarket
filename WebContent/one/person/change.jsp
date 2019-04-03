<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
		<title>退换货管理</title>
		<link href="/Test/one/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="/Test/one/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
		<link href="/Test/one/css/personal.css" rel="stylesheet" type="text/css">
		<link href="/Test/one/css/orstyle.css" rel="stylesheet" type="text/css">
		<script src="/Test/one/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
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
				<div class="main-wrap">

					<div class="user-order">

						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">退换货管理</strong> / <small>Change</small></div>
						</div>
						<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>
							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active" id="tab1">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-orderprice th-price">
											<td class="td-inner">交易金额</td>
										</div>
										<div class="th th-changeprice th-price">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-status th-moneystatus">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change th-changebuttom">
											<td class="td-inner">交易操作</td>
										</div>
									</div>
									
									
									<div class="order-main">
										<div class="order-list">
											<c:forEach items="${orders }" var="items">
												<div class="order-title">
													<div class="dd-num">订单编号：${items.orderID}</div>
												</div>
													<div class="order-content">
													<div class="order-left">
													<c:forEach items="${items.orderitems }" var="items1">
														<c:if test="${items1.orderitemsStatus eq 48 || items1.orderitemsStatus eq 51 }">

																	<ul class="item-list">
																		<li class="td td-item">
																			<div class="item-pic">
																				<a href="#" class="J_MakePoint">
																					<img src="${items1.goods.goodsImg }" class="itempic J_ItemImg">
																				</a>
																			</div>
																			<div class="item-info">
																				<div class="item-basic-info">
																					<a href="#">
																						<p>${items1.goods.goodsName }</p>
																					</a>
																				</div>
																			</div>
																		</li>
																		<ul class="td-changeorder">
																			<li class="td td-orderprice">
																				<div class="item-orderprice">
																					<fmt:formatNumber minFractionDigits="2" value="${items1.priceSum }"/>
																				</div>
																			</li>
																			<li class="td td-changeprice">
																				<div class="item-changeprice">
																					${items1.goodsNumber }
																				</div>
																			</li>
																		</ul>
																		<div class="clear"></div>
																		<div class="change move-right">
																			<li class="td td-moneystatus td-status">
																				<div class="item-status">
																					<c:if test="${items1.orderitemsStatus eq 48}"><p class="Mystatus" style="margin-top: 17px">待审核</p></c:if>
																					<c:if test="${items1.orderitemsStatus eq 51}"><p class="Mystatus" style="margin-top: 17px">已审核</p></c:if>
																				</div>
																			</li>
																		</div>
																		<li class="td td-change td-changebutton">
																			<a href="/Test/Refund?orderitemsID=${items1.orderitemsID }">
																			<div class="am-btn am-btn-danger anniu">
																				查看</div>
																			</a>
																		</li>
																	</ul>	
														</c:if>
													</c:forEach>
													</div>
												</div>
											</c:forEach>
										</div>
									</div>

								</div>
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
							<li class="active"><a href="/Test/UserRefund?userID=${sessionScope.user.userID }">退款售后</a></li>
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