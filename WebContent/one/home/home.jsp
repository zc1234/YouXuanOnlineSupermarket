<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
		<title>优选网上超市</title>
		<link href="one/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="one/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
		<link href="one/basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="one/css/hmstyle.css" rel="stylesheet" type="text/css"/>
		<link href="one/css/skin.css" rel="stylesheet" type="text/css" />
		<script src="one/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="one/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
	</head>
	<body>
		<div class="hmtop">
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
			</div>
			<div class="banner" style="margin-left: 55px;width: 1200px">
                      <!--轮播 -->
						<div class="am-slider am-slider-default scoll" data-am-flexslider id="demo-slider-0">
							<ul class="am-slides">
								<li class="banner1"><a><img src="one/images/ad1.jpg" /></a></li>
								<li class="banner2"><a><img src="one/images/ad2.jpg" /></a></li>
								<li class="banner3"><a><img src="one/images/ad3.jpg" /></a></li>
								<li class="banner4"><a><img src="one/images/ad4.jpg" /></a></li>
							</ul>
						</div>
						<div class="clear"></div>	
			</div>
			<div class="shopNav">
				<div class="slideall">
					   <div class="long-title"><span class="all-goods">全部分类</span></div>		
						<!--侧边导航 -->
						<div id="nav" class="navfull">
							<div class="area clearfix">
								<div class="category-content" id="guide_2">
									<div class="category">
										<ul class="category-list" id="js_climit_li">
											<c:forEach items="${fatherTypes }" var="i" begin="${firstparam}" end="${countFatherTypes }" varStatus="status">
												<c:choose>
													<c:when test="${status.count==firstparam+1 }">
														<li class="appliance js_toggle relative first">
															<div class="category-info">
																<h3 class="category-name b-category-name"><i><img src="one/images/cookies.png"/></i><a href="/Test/searchByType?typeID=${i.typeID }&CurrentPage=1" class="ml-22" title="${i.typeName }">${i.typeName }</a></h3>
																<em>&gt;</em></div>
															<div class="menu-item menu-in top">
																<div class="area-in">
																	<div class="area-bg">
																		<div class="menu-srot">
																			<div class="sort-side">
																					<c:forEach items="${i.childTypes }" var="j">
																						<dl class="dl-sort">
																						<dt><a title="${j.typeName }" href="/Test/searchByType?typeID=${j.typeID }&CurrentPage=1"><span title="${j.typeName}">${j.typeName}</span></a></dt>
																						<c:forEach items="${j.childTypes}" var="k">
																							<dd><a title="${k.typeName }" href="/Test/searchByType?typeID=${k.typeID }&CurrentPage=1"><span>${k.typeName }</span></a></dd>
																						</c:forEach>
																						</dl>
																					</c:forEach>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														<b class="arrow"></b>	
														</li>	
													</c:when>
													<c:when test="${status.count==countFatherTypes }">
														<li class="appliance js_toggle relative last">
															<div class="category-info">
																<h3 class="category-name b-category-name"><i><img src="one/images/cookies.png"></i><a href="/Test/searchByType?typeID=${i.typeID }&CurrentPage=1" class="ml-22" title="${i.typeName }">${i.typeName }</a></h3>
																<em>&gt;</em></div>
															<div class="menu-item menu-in top">
																<div class="area-in">
																	<div class="area-bg">
																		<div class="menu-srot">
																			<div class="sort-side">
																				<c:forEach items="${i.childTypes }" var="j">
																					<dl class="dl-sort">
																					<dt><a title="${j.typeName }" href="/Test/searchByType?typeID=${j.typeID }&CurrentPage=1"><span title="${j.typeName}">${j.typeName}</span></a></dt>
																					<c:forEach items="${j.childTypes}" var="k">
																						<dd><a title="${k.typeName }" href="/Test/searchByType?typeID=${k.typeID }&CurrentPage=1"><span>${k.typeName }</span></a></dd>
																					</c:forEach>
																					</dl>
																				</c:forEach>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</li>
													</c:when>
													<c:otherwise>
														<li class="appliance js_toggle relative">
															<div class="category-info">
																<h3 class="category-name b-category-name"><i><img src="one/images/cookies.png"></i><a href="/Test/searchByType?typeID=${i.typeID }&CurrentPage=1" class="ml-22" title="${i.typeName }">${i.typeName }</a></h3>
																<em>&gt;</em></div>
															<div class="menu-item menu-in top">
																<div class="area-in">
																	<div class="area-bg">
																		<div class="menu-srot">
																			<div class="sort-side">
																				<c:forEach items="${i.childTypes }" var="j">
																					<dl class="dl-sort">
																					<dt><a title="${j.typeName }" href="/Test/searchByType?typeID=${j.typeID }&CurrentPage=1"><span title="${j.typeName}">${j.typeName}</span></a></dt>
																					<c:forEach items="${j.childTypes}" var="k">
																						<dd><a title="${k.typeName }" href="/Test/searchByType?typeID=${k.typeID }&CurrentPage=1"><span>${k.typeName }</span></a></dd>
																					</c:forEach>
																					</dl>
																				</c:forEach>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
			                                             <b class="arrow"></b>
														</li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<!--轮播-->
						<script type="text/javascript">
							(function() {
								$('.am-slider').flexslider();
							});
							$(document).ready(function() {
								$("li").hover(function() {
									$(".category-content .category-list li.first .menu-in").css("display", "none");
									$(".category-content .category-list li.first").removeClass("hover");
									$(this).addClass("hover");
									$(this).children("div.menu-in").css("display", "block")
								}, function() {
									$(this).removeClass("hover")
									$(this).children("div.menu-in").css("display", "none")
								});
							})
						</script>
					<!--小导航 -->
					<div class="am-g am-g-fixed smallnav">
						<div class="am-u-sm-3">
							<a href="sort.html"><img src="one/images/navsmall.jpg" />
								<div class="title">商品分类</div>
							</a>
						</div>
						<div class="am-u-sm-3">
							<a href="#"><img src="one/images/huismall.jpg" />
								<div class="title">大聚惠</div>
							</a>
						</div>
						<div class="am-u-sm-3">
							<a href="#"><img src="one/images/mansmall.jpg" />
								<div class="title">个人中心</div>
							</a>
						</div>
						<div class="am-u-sm-3">
							<a href="#"><img src="one/images/moneysmall.jpg" />
								<div class="title">投资理财</div>
							</a>
						</div>
					</div>
					<!--
					<div class="marqueen">
						<span class="marqueen-title">商城头条</span>
						<div class="demo">
							<ul>
								<li class="title-first"><a target="_blank" href="#">
									<img src="one/images/TJ2.jpg"></img>
									<span>[特惠]</span>商城爆品1分秒								
								</a></li>
								<li class="title-first"><a target="_blank" href="#">
									<span>[公告]</span>商城与广州市签署战略合作协议
								     <img src="one/images/TJ.jpg"></img>
								     <p>XXXXXXXXXXXXXXXXXX</p>
							    </a></li>
						<div class="mod-vip">
							<div class="m-baseinfo">
								<a href="one/person/index.html">
									<c:if test="${sessionScope.user==null }">
										<img src="/Test/UserImg/default.jpg">
									</c:if>
									<c:if test="${sessionScope.user!=null }">
										<img src="${sessionScope.user.userImg }">
									</c:if>
								</a>
								<em>
									<c:if test="${sessionScope.user==null }">
										请先登录
									</c:if>
									<c:if test="${sessionScope.user!=null }">
										Hi,<span class="s-name">${sessionScope.user.userLoginName }</span>
									</c:if>								
								</em>
							<div class="member-logout">
								<a class="am-btn-warning btn" href="/Test/one/home/login.jsp">登录</a>
								<a class="am-btn-warning btn" href="/Test/one/home/register.jsp">注册</a>
							</div>
							<div class="member-login">
								<a href="#"><strong>0</strong>待收货</a>
								<a href="#"><strong>0</strong>待发货</a>
								<a href="#"><strong>0</strong>待付款</a>
								<a href="#"><strong>0</strong>待评价</a>
							</div>
							</div>
							<div class="clear"></div>	
						</div>																	    
								<li><a target="_blank" href="#"><span>[特惠]</span>洋河年末大促，低至两件五折</a></li>
								<li><a target="_blank" href="#"><span>[公告]</span>华北、华中部分地区配送延迟</a></li>
								<li><a target="_blank" href="#"><span>[特惠]</span>家电狂欢千亿礼券 买1送1！</a></li>
							</ul>
						</div>
					</div>
					-->
					<div class="clear"></div>
				</div>
				<script type="text/javascript">
					if ($(window).width() < 640) {
						function autoScroll(obj) {
							$(obj).find("ul").animate({
								marginTop: "-39px"
							}, 500, function() {
								$(this).css({
									marginTop: "0px"
								}).find("li:first").appendTo(this);
							})
						}
						$(function() {
							setInterval('autoScroll(".demo")', 3000);
						})
					}
				</script>
			</div>
			<div class="shopMainbg" style="margin-left: -25px"> 
					
			</div>
		</div>
		</div>
		<!--引导 -->
		<div class="navCir">
			<li class="active"><a href="home.html"><i class="am-icon-home "></i>首页</a></li>
			<li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
			<li><a href="shopcart.html"><i class="am-icon-shopping-basket"></i>购物车</a></li>	
			<li><a href="one/person/index.html"><i class="am-icon-user"></i>我的</a></li>					
		</div>
		<!--菜单 -->
		<div class=tip>
			<div id="sidebar">
				<div id="wrap">
					<div id="prof" class="item ">
						<a href="# ">
							<span class="setting "></span>
						</a>
						<div class="ibar_login_box status_login ">
							<div class="avatar_box ">
									<c:if test="${sessionScope.user==null }">
										<p class="avatar_imgbox ">
											<img src="/Test/UserImg/default.jpg">
										</p>
										<ul class="user_info ">
											<li>请先登录</li>
											<li>积分：暂无</li>
										</ul>
									</c:if>
									<c:if test="${sessionScope.user!=null }">
										<p class="avatar_imgbox ">
											<img src="${sessionScope.user.userImg }">
										</p>
										<ul class="user_info ">
											<li>用户名:${sessionScope.user.userLoginName }</li>
											<li>积分：${sessionScope.user.userScore }</li>
										</ul>		
									</c:if>
							</div>
							<div class="login_btnbox ">
								<c:if test="${sessionScope.user==null }">
									<a href="/Test/one/home/login.jsp" class="login_order ">我的订单</a>
									<a href="/Test/one/home/login.jsp" class="login_favorite ">我的收藏</a>
								</c:if>
								<c:if test="${sessionScope.user!=null }">
									<a href="/Test/showOrder?userID=${sessionScope.user.userID }" class="login_order ">我的订单</a>
									<a href="/Test/favoritePage?userID=${sessionScope.user.userID }" class="login_favorite ">我的收藏</a>
								</c:if>
							</div>
							<i class="icon_arrow_white "></i>
						</div>
					</div>
					<div id="shopCart " class="item ">
						<c:if test="${sessionScope.user==null }">
							<a href="/Test/one/home/login.jsp">
								<span class="message "></span>
							</a>
						</c:if>
						<c:if test="${sessionScope.user!=null }">
							<a href="/Test/showCart?userID=${sessionScope.user.userID }">
								<span class="message "></span>
							</a>
						</c:if>
						<p>
							购物车
						</p>
					</div>
					<div id="brand " class="item ">
						<c:if test="${sessionScope.user==null }">
							<a href="/Test/one/home/login.jsp">
								<span class="wdsc "><img src="/Test/one/images/wdsc.png " /></span>
							</a>
						</c:if>
						<c:if test="${sessionScope.user!=null }">
							<a href="/Test/favoritePage?userID=${sessionScope.user.userID }">
								<span class="wdsc "><img src="/Test/one/images/wdsc.png " /></span>
							</a>
						</c:if>
						<div class="mp_tooltip ">
							我的收藏
							<i class="icon_arrow_right_black "></i>
						</div>
					</div>
					<!--回到顶部 -->
					<div id="quick_links_pop " class="quick_links_pop hide "></div>
				</div>
			</div>
			<div id="prof-content " class="nav-content ">
				<div class="nav-con-close ">
					<i class="am-icon-angle-right am-icon-fw "></i>
				</div>
				<div>
					我
				</div>
			</div>
			<div id="shopCart-content " class="nav-content ">
				<div class="nav-con-close ">
					<i class="am-icon-angle-right am-icon-fw "></i>
				</div>
				<div>
					购物车
				</div>
			</div>
			<div id="asset-content " class="nav-content ">
				<div class="nav-con-close ">
					<i class="am-icon-angle-right am-icon-fw "></i>
				</div>
				<div>
					资产
				</div>
				<div class="ia-head-list ">
					<a href="# " target="_blank " class="pl ">
						<div class="num ">0</div>
						<div class="text ">优惠券</div>
					</a>
					<a href="# " target="_blank " class="pl ">
						<div class="num ">0</div>
						<div class="text ">红包</div>
					</a>
					<a href="# " target="_blank " class="pl money ">
						<div class="num ">￥0</div>
						<div class="text ">余额</div>
					</a>
				</div>
			</div>
			<div id="brand-content " class="nav-content ">
				<div class="nav-con-close ">
					<i class="am-icon-angle-right am-icon-fw "></i>
				</div>
				<div>
					收藏
				</div>
			</div>
			<div id="broadcast-content " class="nav-content ">
				<div class="nav-con-close ">
					<i class="am-icon-angle-right am-icon-fw "></i>
				</div>
				<div>
					充值
				</div>
			</div>
		</div>
		<script>
			window.jQuery || document.write('<script src="basic/js/jquery.min.js "><\/script>');
		</script>
		<script type="text/javascript " src="one/basic/js/quick_links.js "></script>
	</body>
</html>