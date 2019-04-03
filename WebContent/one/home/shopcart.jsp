<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>购物车页面</title>
		<link href="${pageContext.request.contextPath}/one/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/one/basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/one/css/cartstyle.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/one/css/optstyle.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/one/js/jquery.js"></script>									
	</head>
	<body>
		<!--顶部导航条 -->
		<div class="am-container header">
				<ul class="message-l">
					<div class="topMessage">
						<div class="menu-hd">
							<c:if test="${sessionScope.user==null }">
								亲，请<a href="one/home/login.jsp" target="_top" class="h"><font color="orangered">登录</font>&nbsp;&nbsp;</a>
								免费<a href="one/home/register.jsp" target="_top"><font color="orangered">注册</font></a>
							</c:if>
							<c:if test="${sessionScope.user!=null }">
								Hi&nbsp;!&nbsp;<font color="orangered">${sessionScope.user.userLoginName }</font>&nbsp;&nbsp;
								积分&nbsp;:&nbsp;${sessionScope.user.userScore }
							</c:if>
						</div>
					</div>
				</ul>
				<ul class="message-r">
					<div class="topMessage home">
						<div class="menu-hd"><a href="/Test/index" target="_top" class="h">商城首页</a></div>
					</div>
					<div class="topMessage my-shangcheng">
						<div class="menu-hd MyShangcheng">
							<c:if test="${sessionScope.user==null }">
								<a href="/Test/one/home/login.jsp" target="_top">
							</c:if>
							<c:if test="${sessionScope.user!=null }">
								<a href="/Test/PersonalCenter?userID=${sessionScope.user.getUserID() }" target="_top">
							</c:if>
								<i class="am-icon-user am-icon-fw"></i>个人中心
							</a>
						</div>
					</div>
					<div class="topMessage mini-cart">
						<div class="menu-hd">
							<c:if test="${sessionScope.user==null }">
								<a id="mc-menu-hd" href="one/home/login.jsp" target="_top">
									<i class="am-icon-shopping-cart  am-icon-fw"></i>
									<span>购物车</span>
								</a>
							</c:if>
							<c:if test="${sessionScope.user!=null }">
								<a id="mc-menu-hd" href="/Test/showCart?userID=${sessionScope.user.getUserID() }" target="_top">
									<i class="am-icon-shopping-cart  am-icon-fw"></i>
									<span>购物车</span>
									<strong id="J_MiniCartNum" class="h">
										<font color="red">${sessionScope.cartSum}</font>
									</strong>
								</a>
							</c:if>
						</div>
					</div>
					<div class="topMessage favorite">
						<div class="menu-hd">
							<c:if test="${sessionScope.user==null }">
								<a href="/Test/one/home/login.jsp" target="_top">
									<i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span>
								</a>
							</c:if>
							<c:if test="${sessionScope.user!=null }">
								<a href="/Test/favoritePage?userID=${sessionScope.user.userID }" target="_top">
									<i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span>
								</a>
							</c:if>
						</div>
					</div>
				</ul>
				</div>
				<!--悬浮搜索框-->
				<div class="nav white">
					<div class="logo"><img src="one/images/logo.png" /></div>
					<div class="logoBig">
						<li><img src="one/images/logobig.png" /></li>
					</div>
					<div class="search-bar pr">
						<a name="index_none_header_sysc" href="#"></a>
						<form action="/Test/search" method="post">
							<input type="hidden" name="CurrentPage" value="1"></input>
							<input id="searchInput" name="goodsname" type="text" placeholder="搜索" autocomplete="off">
							<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
						</form>
					</div>
				</div>
			<div class="clear"></div>
			<!--购物车 -->
			<div class="concent">
				<div id="cartTable">
					<div class="cart-table-th">
						<div class="wp">
							<div class="th th-chk">
								<div id="J_SelectAll1" class="select-all J_SelectAll">
								</div>
							</div>
							<div class="th th-item">
								<div class="td-inner">商品信息</div>
							</div>
							<div class="th th-price">
								<div class="td-inner">单价</div>
							</div>
							<div class="th th-amount">
								<div class="td-inner">数量</div>
							</div>
							<div class="th th-sum">
								<div class="td-inner">金额</div>
							</div>
							<div class="th th-op">
								<div class="td-inner">操作</div>
							</div>
						</div>
					</div>
					<div class="clear"></div>
					<tr class="item-list">
						<div class="bundle  bundle-last ">
							<div class="clear"></div>
							<div class="bundle-main">
									<c:forEach items="${cartitems }" var="i">	
									<ul class="item-content clearfix">
										<li class="td td-chk">
										</li>
										<li class="td td-item">
											<div class="item-pic">
												<a href="#" target="_blank" data-title="${i.goods.getGoodsImg() }" class="J_MakePoint" data-point="tbcart.8.12">
												<img src="${i.goods.getGoodsImg() }" class="itempic J_ItemImg" height="80" width="80"></a>
											</div>
											<div class="item-info">
												<div class="item-basic-info">
													<a href="#" target="_blank" title="${i.goods.getGoodsName() }" class="item-title J_MakePoint" data-point="tbcart.8.11">${i.goods.getGoodsName() }</a>
												</div>
											</div>
										</li>
										<li class="td td-info">
											<div class="item-props item-props-can">
												<span class="sku-line"></span>
												<span class="sku-line"></span>
												<span tabindex="0" class="btn-edit-sku theme-login"></span>
												<i class="theme-login am-icon-sort-desc"></i>
											</div>
										</li>
										<li class="td td-price">
											<div class="item-price price-promo-promo">
												<div class="price-content">
													<div class="price-line">
														<em class="price-original"></em>
													</div>
													<div class="price-line">
														<em class="J_Price price-now" tabindex="0">
														<fmt:formatNumber minFractionDigits="2" value="${i.goods.getGoodsPrice() }"/>
														</em>
													</div>
												</div>
											</div>
										</li>
										<li class="td td-amount">
											<div class="amount-wrapper ">
												<div class="item-amount ">
													<div class="sl">
														<input class="min am-btn" name="" type="button" value="-" onclick="window.location.href='/Test/cartItemMinus1?cartID=${i.cartID}&userID=${i.user.userID }'"/>
														<input class="text_box" name="" type="text" value="${i.number }" style="width:30px;" />
														<input class="add am-btn" name="" type="button" value="+" onclick="window.location.href='/Test/cartItemPlus1?cartID=${i.cartID}&userID=${i.user.userID }'"/>
													</div>
												</div>
											</div>
										</li>
										<li class="td td-sum">
											<div class="td-inner">
												<em tabindex="0" class="J_ItemSum number">
												<fmt:formatNumber minFractionDigits="2" value="${i.priceSum }"/>
												</em>
											</div>
										</li>
									<li class="td td-op">
										<div class="td-inner">
											<a title="移入收藏夹" class="btn-fav" href="#">移入收藏夹</a>
											<a href="/Test/deleteGoods?cartID=${i.cartID}&userID=${i.user.userID }" data-point-url="#" class="delete">删除</a>
										</div>
									</li>
									</ul>
									</c:forEach>								
							</div>
						</div>
					</tr>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
				<div class="float-bar-wrapper">
					<div class="float-bar-right">
						<div class="amount-sum">
							<c:set var="numSum" value="0" scope="page"/>
							<c:set var="priceSum" value="0" scope="page"/>
							<c:forEach items="${cartitems}" var="i">
								<c:if test="${status.count==1}">
									<c:set var="numSum" value="${i.number}"/>
									<c:set var="priceSum" value="${i.priceSum }"></c:set>
								</c:if>
								<c:if test="${status.count!=1}">
									<c:set var="numSum" value="${i.number+numSum}"/>
									<c:set var="priceSum" value="${i.priceSum+priceSum }"></c:set>
								</c:if>
							</c:forEach>
							<span class="txt">已选商品</span>
							<em id="J_SelectedItemsCount"></em><c:out value="${numSum }"/><span class="txt">件</span>
							<div class="arrow-box">
								<span class="selected-items-arrow"></span>
								<span class="arrow"></span>
							</div>
						</div>
						<div class="price-sum">
							<span class="txt">合计:</span>
							<strong class="price">¥<em id="J_Total">
							<fmt:formatNumber minFractionDigits="2" value="${priceSum }"/>
							</em></strong>
						</div>
						<div class="btn-area">
							<a href="balancePage?userID=${sessionScope.user.getUserID() }" id="J_Go" class="submit-btn submit-btn-disabled" aria-label="请注意如果没有选择宝贝，将无法结算">
								<span>结&nbsp;算</span></a>
						</div>
					</div>
				</div>
				<div class="footer">
				</div>
			</div>
			<!--操作页面-->
			<div class="theme-popover-mask"></div>
			<div class="theme-popover">
				<div class="theme-span"></div>
				<div class="theme-poptit h-title">
					<a href="javascript:;" title="关闭" class="close">×</a>
				</div>
				<div class="theme-popbod dform">
					<form class="theme-signin" name="loginform" action="" method="post">
						<div class="theme-signin-left">
							<li class="theme-options">
								<div class="cart-title">颜色：</div>
								<ul>
									<li class="sku-line selected">12#川南玛瑙<i></i></li>
									<li class="sku-line">10#蜜橘色+17#樱花粉<i></i></li>
								</ul>
							</li>
							<li class="theme-options">
								<div class="cart-title">包装：</div>
								<ul>
									<li class="sku-line selected">包装：裸装<i></i></li>
									<li class="sku-line">两支手袋装（送彩带）<i></i></li>
								</ul>
							</li>
							<div class="theme-options">
								<div class="cart-title number">数量</div>
								<dd>
									<input class="min am-btn am-btn-default" name="" type="button" value="-" />
									<input class="text_box" name="" type="text" value="1" style="width:30px;" />
									<input class="add am-btn am-btn-default" name="" type="button" value="+" />
									<span  class="tb-hidden">库存<span class="stock">1000</span>件</span>
								</dd>
							</div>
							<div class="clear"></div>
							<div class="btn-op">
								<div class="btn am-btn am-btn-warning">确认</div>
								<div class="btn close am-btn am-btn-warning">取消</div>
							</div>
						</div>
						<div class="theme-signin-right">
							<div class="img-info">
								<img src="${pageContext.request.contextPath}/one/images/kouhong.jpg_80x80.jpg" />
							</div>
							<div class="text-info">
								<span class="J_Price price-now">¥39.00</span>
								<span id="Stock" class="tb-hidden">库存<span class="stock">1000</span>件</span>
							</div>
						</div>
					</form>
				</div>
			</div>
		<!--引导 -->
		<div class="navCir">
			<li><a href="home.html"><i class="am-icon-home "></i>首页</a></li>
			<li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
			<li class="active"><a href="shopcart.html"><i class="am-icon-shopping-basket"></i>购物车</a></li>	
			<li><a href="${pageContext.request.contextPath}/one/person/index.html"><i class="am-icon-user"></i>我的</a></li>					
		</div>
	</body>
</html>