<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>付款成功页面</title>
<link rel="stylesheet"  type="text/css" href="one/AmazeUI-2.4.2/assets/css/amazeui.css"/>
<link href="one/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
<link href="one/basic/css/demo.css" rel="stylesheet" type="text/css" />
<link href="one/css/sustyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="one/basic/js/jquery-1.7.min.js"></script>
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
<c:if test="${requestScope.status eq 48 && requestScope.delivery eq 48 }">
<div class="take-deliveryerror" style="margin-left: 200px">
 <div class="status">
   <h2>您未完成付款</h2>
   <div class="successInfo">
     <ul>
       <li>付款金额<em><fmt:formatNumber minFractionDigits="2" value="${priceSum }"/></em></li>
       <div class="user-info">
         <p>收货人：${address.addressUserName }</p>
         <p>联系电话：${address.phoneNumber }</p>
         <p>收货地址：${address.address }</p>
       </div>
             请认真核对您的收货信息，如有错误请联系客服                          
     </ul>
     <div class="option">
       <span class="info">您可以</span>
        <a href="../person/order.html" class="J_MakePoint">查看<span>已买到的宝贝</span></a>
        <a href="../person/orderinfo.html" class="J_MakePoint">查看<span>交易详情</span></a>
     </div>
    </div>
  </div>
</div>
</c:if>
<c:if test="${requestScope.status eq 49 && requestScope.delivery eq 48 }">
<div class="status">
   <h2>您已成功付款</h2>
   <div class="successInfo">
     <ul>
       <li>付款金额<em><fmt:formatNumber minFractionDigits="2" value="${priceSum }"/></em></li>
       <div class="user-info">
         <p>收货人：${address.addressUserName }</p>
         <p>联系电话：${address.phoneNumber }</p>
         <p>收货地址：${address.address }</p>
       </div>
             请认真核对您的收货信息，如有错误请联系客服                          
     </ul>
     <div class="option">
       <span class="info">您可以</span>
        <a href="../person/order.html" class="J_MakePoint">查看<span>已买到的宝贝</span></a>
        <a href="../person/orderinfo.html" class="J_MakePoint">查看<span>交易详情</span></a>
     </div>
    </div>
  </div>
</c:if>
<c:if test="${requestScope.delivery eq 49 && requestScope.delivery eq 49 }">
<div class="take-delivery">
 <div class="status">
   <h2>请在收货时缴纳货款</h2>
   <div class="successInfo">
     <ul>
       <li>付款金额<em><fmt:formatNumber minFractionDigits="2" value="${priceSum }"/></em></li>
       <div class="user-info">
         <p>收货人：${address.addressUserName }</p>
         <p>联系电话：${address.phoneNumber }</p>
         <p>收货地址：${address.address }</p>
       </div>
             请认真核对您的收货信息，如有错误请联系客服                          
     </ul>
     <div class="option">
       <span class="info">您可以</span>
        <a href="../person/order.html" class="J_MakePoint">查看<span>已买到的宝贝</span></a>
        <a href="../person/orderinfo.html" class="J_MakePoint">查看<span>交易详情</span></a>
     </div>
    </div>
  </div>
</div>
</c:if>
<div class="footer" >
</div>
</body>
</html>