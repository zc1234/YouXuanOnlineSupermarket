<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>搜索页面</title>
		<link href="${pageContext.request.contextPath}/one/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/one/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/one/basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/one/css/seastyle.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/one/basic/js/jquery-1.7.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/one/js/script.js"></script>
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
			<b class="line"></b>
           <div class="search">
			<div class="search-list">
			<div class="nav-table">
					   <div class="long-title"><span class="all-goods">全部分类</span></div>
			</div>
			
				
					<div class="am-g am-g-fixed">
						<div class="am-u-sm-12 am-u-md-12">
	                  	<div class="theme-popover">
							<ul class="select">
								<p class="title font-normal">
									<span class="fl"><font color="orange">${requestScope.goodsname}</font></span>
									<span class="total fl">搜索到<strong class="num">${requestScope.count}</strong>件相关商品</span>
								</p>
								<div class="clear"></div>
								<!-- 
								<li class="select-result">
									<dl>
										<dt>已选</dt>
										<dd class="select-no"></dd>
										<p class="eliminateCriteria">清除</p>
									</dl>
								</li>
								<div class="clear"></div>
								<li class="select-list">
									<dl id="select1">
										<dt class="am-badge am-round">品牌</dt>	
									
										 <div class="dd-conent">										
											<dd class="select-all selected"><a href="#">全部</a></dd>
											<dd><a href="#">百草味</a></dd>
											<dd><a href="#">良品铺子</a></dd>
											<dd><a href="#">新农哥</a></dd>
											<dd><a href="#">楼兰蜜语</a></dd>
											<dd><a href="#">口水娃</a></dd>
											<dd><a href="#">考拉兄弟</a></dd>
										 </div>
						
									</dl>
								</li>
								<li class="select-list">
									<dl id="select2">
										<dt class="am-badge am-round">种类</dt>
										<div class="dd-conent">
											<dd class="select-all selected"><a href="#">全部</a></dd>
											<dd><a href="#">东北松子</a></dd>
											<dd><a href="#">巴西松子</a></dd>
											<dd><a href="#">夏威夷果</a></dd>
											<dd><a href="#">松子</a></dd>
										</div>
									</dl>
								</li>
								<li class="select-list">
									<dl id="select3">
										<dt class="am-badge am-round">选购热点</dt>
										<div class="dd-conent">
											<dd class="select-all selected"><a href="#">全部</a></dd>
											<dd><a href="#">手剥松子</a></dd>
											<dd><a href="#">薄壳松子</a></dd>
											<dd><a href="#">进口零食</a></dd>
											<dd><a href="#">有机零食</a></dd>
										</div>
									</dl>
								</li>
					        	-->
							</ul>
							 
							<div class="clear"></div>
                        </div>
							<div class="search-content">
								<div class="sort">
									<li class="first"><a title="综合"></a></li>
									<!-- <li><a title="销量">销量排序</a></li>-->
									 <li><a title="价格"></a></li>
									<li class="big"><a title="评价" href="#"></a></li>
								</div>
								<div class="clear"></div>

								<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
									<c:forEach items="${goodsPagingList}" var="items">
									<li>
										<div class="i-pic limit">
											<img src="${pageContext.request.contextPath}/${items.goodsImg}" />											
											<p class="title fl"><a href="/Test/detail?goodsID=${items.goodsID} ">${items.goodsName}</a></p>
											<p class="price fl">
												<b>¥</b>
												<strong><fmt:formatNumber minFractionDigits="2" value="${items.goodsPrice}"/></strong>
											</p>
											<!-- 
											<p class="number fl">
												销量<span>1110</span>
											</p>
											 -->
										</div>
									</li>
									</c:forEach>
								</ul>
							</div>
							<div class="search-side">
								<div class="side-title">
									相关推荐
								</div>
								<li>
									<div class="i-pic check">
										<img src="/Test/GoodsImg/baiselianren.jpg" />
										<p class="title fl">日本进口白色恋人白巧克力夹心饼干12枚</p>
										<p class="price fl">
											<b>¥89.00</b>
											<strong></strong>
										</p>
										<p class="number fl">
											<span></span>
										</p>
									</div>
								</li>
							</div>
							<div class="clear"></div>
							<!--分页 -->
							<ul class="am-pagination am-pagination-right">
								<c:forEach var="i" begin="1" end="${number}">
									<c:if test="${i==param.CurrentPage}">
										<li class="am-active">
											<a href="search?goodsname=${goodsname}&CurrentPage=${i}">
													<c:out value="${i}"/>
											</a>
										</li>
									</c:if>
									<c:if test="${i!=param.CurrentPage}">
										<li>
											<a href="search?goodsname=${goodsname}&CurrentPage=${i}">
													<c:out value="${i}"/>
											</a>
										</li>
									</c:if>
								</c:forEach>
							</ul>

						</div>
					</div>
					<div class="footer">
					</div>
				</div>
			</div>
		<!--引导 -->
		<div class="navCir">
			<li><a href="home.html"><i class="am-icon-home "></i>首页</a></li>
			<li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
			<li><a href="shopcart.html"><i class="am-icon-shopping-basket"></i>购物车</a></li>	
			<li><a href="${pageContext.request.contextPath}/one/person/index.html"><i class="am-icon-user"></i>我的</a></li>					
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
											<li>积&nbsp;分：暂无</li>
										</ul>
									</c:if>
									<c:if test="${sessionScope.user!=null }">
										<p class="avatar_imgbox ">
											<img src="${sessionScope.user.userImg }">
										</p>
										<ul class="user_info ">
											<li>用户名:${sessionScope.user.userLoginName }</li>
											<li>积&nbsp;分：${sessionScope.user.userScore }</li>
										</ul>		
									</c:if>
								
								
							</div>
							<div class="login_btnbox ">
								<a href="# " class="login_order ">我的订单</a>
								<a href="# " class="login_favorite ">我的收藏</a>
							</div>
							<i class="icon_arrow_white "></i>
						</div>
					</div>
					<div id="shopCart " class="item ">
						<a href="# ">
							<span class="message "></span>
						</a>
						<p>
							购物车
						</p>
						<p class="cart_num ">0</p>
					</div>
					<div id="asset " class="item ">
						<a href="# ">
							<span class="view "></span>
						</a>
						<div class="mp_tooltip ">
							我的资产
							<i class="icon_arrow_right_black "></i>
						</div>
					</div>
					<div id="foot " class="item ">
						<a href="# ">
							<span class="zuji "></span>
						</a>
						<div class="mp_tooltip ">
							我的足迹
							<i class="icon_arrow_right_black "></i>
						</div>
					</div>
					<div id="brand " class="item ">
						<a href="#">
							<span class="wdsc "><img src="one/images/wdsc.png " /></span>
						</a>
						<div class="mp_tooltip ">
							我的收藏
							<i class="icon_arrow_right_black "></i>
						</div>
					</div>
					<div class="quick_toggle ">
						<li class="qtitem ">
							<a href="#top " class="return_top "><span class="top "></span></a>
						</li>
					</div>
					<!--回到顶部 -->
					<div id="quick_links_pop " class="quick_links_pop hide "></div>
				</div>

			</div>
			<div id="prof-content" class="nav-content">
				<div class="nav-con-close">
					<i class="am-icon-angle-right am-icon-fw"></i>
				</div>
				<div>
					我
				</div>
			</div>
			<div id="shopCart-content" class="nav-content">
				<div class="nav-con-close">
					<i class="am-icon-angle-right am-icon-fw"></i>
				</div>
				<div>
					购物车
				</div>
			</div>
			<div id="asset-content" class="nav-content">
				<div class="nav-con-close">
					<i class="am-icon-angle-right am-icon-fw"></i>
				</div>
				<div>
					资产
				</div>

				<div class="ia-head-list">
					<a href="#" target="_blank" class="pl">
						<div class="num">0</div>
						<div class="text">优惠券</div>
					</a>
					<a href="#" target="_blank" class="pl">
						<div class="num">0</div>
						<div class="text">红包</div>
					</a>
					<a href="#" target="_blank" class="pl money">
						<div class="num">￥0</div>
						<div class="text">余额</div>
					</a>
				</div>

			</div>
			<div id="foot-content" class="nav-content">
				<div class="nav-con-close">
					<i class="am-icon-angle-right am-icon-fw"></i>
				</div>
				<div>
					足迹
				</div>
			</div>
			<div id="brand-content" class="nav-content">
				<div class="nav-con-close">
					<i class="am-icon-angle-right am-icon-fw"></i>
				</div>
				<div>
					收藏
				</div>
			</div>
			<div id="broadcast-content" class="nav-content">
				<div class="nav-con-close">
					<i class="am-icon-angle-right am-icon-fw"></i>
				</div>
				<div>
					充值
				</div>
			</div>
		</div>
		<script>
			window.jQuery || document.write('<script src="basic/js/jquery-1.9.min.js"><\/script>');
		</script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/one/basic/js/quick_links.js"></script>

<div class="theme-popover-mask"></div>

	</body>

</html>