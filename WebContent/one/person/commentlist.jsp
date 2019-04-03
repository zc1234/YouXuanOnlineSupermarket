<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
		<title>发表评论</title>
		<link href="/Test/one/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="/Test/one/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
		<link href="/Test/one/css/personal.css" rel="stylesheet" type="text/css">
		<link href="/Test/one/css/appstyle.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="/Test/one/js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="/Test/background/js/amazeui.min.js"></script>
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

					<div class="user-comment">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">发表评论</strong> / <small>Make&nbsp;Comments</small></div>
						</div>
						<hr/>
						<div class="comment-main">
						<form action="/Test/addComment?orderitemsID=${orderItem.orderitemsID}&userID=${sessionScope.user.userID}" method="post">
							<div class="comment-list">
								<div class="item-pic">
									<a href="#" class="J_MakePoint">
										<img src="${orderItem.goods.getGoodsImg() }" class="itempic" alt="${orderItem.goods.getGoodsName() }">
									</a>
								</div>
								<div class="item-title">
									<div class="item-name">
										<a href="#">
											<p class="item-basic-info">${orderItem.goods.getGoodsName() }</p>
										</a>
									</div>
									<div class="item-info">
										<div class="item-price">
											价格：<strong><fmt:formatNumber minFractionDigits="2" value="${orderItem.goods.getGoodsPrice() }"/>元</strong>
										</div>										
									</div>
									<div class="item-info">
										<div class="item-price">
											<strong>数量：${orderItem.getGoodsNumber() }</strong>
										</div>										
									</div>
								</div>
								<div class="clear"></div>
								<div class="item-comment">
									<textarea name="text" placeholder="请写下对宝贝的感受吧，对他人帮助很大哦！"></textarea>
								</div>
								<!--
								<div class="filePic">
									<input type="file" class="inputPic" allowexts="gif,jpeg,jpg,png,bmp" accept="image/*" >
									<span>晒照片(0/5)</span>  
									<img src="/Test/one/images/image.jpg" alt="">
								</div>
								-->
								<div class="item-opinion">
									<label class="am-radio-inline am-success" style="margin-left: 60px">
									<input type="radio" name="score" value="5" data-am-ucheck>好评
									</label>
									<label class="am-radio-inline am-warning" style="margin-left: 120px">
									<input type="radio" name="score" value="3" data-am-ucheck>中评
									</label>
									<label class="am-radio-inline am-danger" style="margin-left: 120px">
									<input type="radio" name="score" value="1" data-am-ucheck>差评
									</label>
								</div>
							</div>
							<div class="info-btn">
								<div class="am-btn am-btn-danger">
									<input type="submit" class="am-btn am-btn-danger" value="提交">
								</div>
							</div>
							</form>
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
							<li class="active"> <a href="/Test/GetAllComment?userID=${sessionScope.user.userID}">评价</a></li>
						</ul>
					</li>
				</ul>
			</aside>
			</div>
			
		</div>
	</body>
</html>