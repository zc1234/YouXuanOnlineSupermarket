<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
		<title>退换货</title>
		<link href="/Test/one/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="/Test/one/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
		<link href="/Test/one/css/personal.css" rel="stylesheet" type="text/css">
		<link href="/Test/one/css/refstyle.css" rel="stylesheet" type="text/css">
		<script src="/Test/one/AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
		<script src="/Test/one/AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>
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
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">退换货申请</strong> / <small>Apply&nbsp;for&nbsp;returns</small></div>
					</div>
					<hr/>
					<div class="comment-list">
					<!--进度条-->
					<div class="m-progress">
						<div class="m-progress-list">
							<c:if test="${requestScope.refund == null }">
								<span class="step-1 step">
	                                <em class="u-progress-stage-bg"></em>
	                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
	                                <p class="stage-name">买家申请退款</p>
	                            </span>
								<span class="step-3 step">
	                                <em class="u-progress-stage-bg"></em>
	                                <i class="u-stage-icon-inner">2<em class="bg"></em></i>
	                                <p class="stage-name">商家处理退款申请</p>
	                            </span>  
							</c:if>
							<c:if test="${requestScope.refund != null && requestScope.refund.refundStatus eq 48 }">
								<span class="step-2 step">
	                                <em class="u-progress-stage-bg"></em>
	                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
	                                <p class="stage-name">买家申请退款</p>
	                            </span>
								<span class="step-1 step">
	                                <em class="u-progress-stage-bg"></em>
	                                <i class="u-stage-icon-inner">2<em class="bg"></em></i>
	                                <p class="stage-name">商家处理退款申请</p>
	                            </span>  
							</c:if>
							<c:if test="${requestScope.refund != null && requestScope.refund.refundStatus != 48 }">
								<span class="step-2 step">
	                                <em class="u-progress-stage-bg"></em>
	                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
	                                <p class="stage-name">买家申请退款</p>
	                            </span>
								<span class="step-2 step">
	                                <em class="u-progress-stage-bg"></em>
	                                <i class="u-stage-icon-inner">2<em class="bg"></em></i>
	                                <p class="stage-name">商家处理退款申请</p>
	                            </span>  
							</c:if>                   
							<span class="u-progress-placeholder"></span>
						</div>
						<div class="u-progress-bar total-steps-2">
							<div class="u-progress-bar-inner"></div>
						</div>
					</div>
					
					
						<div class="refund-aside">
							<div class="item-pic">
								<a href="#" class="J_MakePoint">
									<img src="/Test/${requestScope.orderItem.goods.goodsImg }" class="itempic">
								</a>
							</div>

							<div class="item-title">

								<div class="item-name">
									<a href="#">
										<p class="item-basic-info">${requestScope.orderItem.goods.goodsName }</p>
									</a>
								</div>
							</div>
							<div class="item-info">
								<div class="item-ordernumber">
									<span class="info-title">订单编号：</span><a>${requestScope.orderItem.order.orderID }</a>
								</div>
								<div class="item-price">
									<span class="info-title">数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量：</span><span class="price">${requestScope.orderItem.goodsNumber }个</span>
								</div>
								<div class="item-amountall">
									<span class="info-title">总&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;计：</span><span class="amountall">${requestScope.orderItem.priceSum }元</span>
								</div>
								<div class="item-time">
									<span class="info-title">成交时间：</span><span class="time"><fmt:formatDate type="both" value="${requestScope.orderItem.order.orderCreatetime }"/></span>
								</div>

							</div>
							<div class="clear"></div>
						</div>

						<div class="refund-main">
							<c:if test="${requestScope.refund == null }">
								<form action="/Test/SubmitRefund?orderitemsID=${requestScope.orderItem.orderitemsID }" method="post">
									<div class="item-comment">
											<div class="am-form-group">
												<label for="refund-type" class="am-form-label">退款类型</label>
												<div class="am-form-content">
													<select name="refundType" data-am-selected="">
														<option value="a" selected>仅退款</option>
														<option value="b">退货</option>
														<option value="c">换货</option>
													</select>
												</div>
											</div>
											<div class="am-form-group">
												<label for="refund-reason" class="am-form-label">退款原因</label>
												<div class="am-form-content">
													<select name="refundReason" data-am-selected="">
														<option value="a" selected>请选择退款原因</option>
														<option value="b">不想要了</option>
														<option value="c">买错了</option>
														<option value="d">没收到货</option>																						
														<option value="e">配送时间不符合要求</option>
														<option value="f">商品与说明不符</option>
														<option value="g">商品质量问题</option>
														<option value="h">其他（请在下方退款说明填写）</option>
													</select>
												</div>
											</div>
											<div class="am-form-group">
												<label for="refund-info" class="am-form-label">退款说明<span>（可不填）</span></label>
												<div class="am-form-content">
													<textarea name="refundDetail" placeholder="请输入退款说明"></textarea>
												</div>
											</div>
									</div>
									<div class="info-btn">
										<input type="submit" class="am-btn am-btn-danger" value="提交申请">
									</div>
									</form>
							</c:if>
							<c:if test="${requestScope.refund != null }">
								<div class="item-comment">
											<div class="am-form-group">
												<label for="refund-type" class="am-form-label am-badge am-round am-badge-secondary" style="margin-top: 0px">用户申请</label>
												<div class="am-form-content">			
												</div>
											</div>
											<div class="am-form-group">
												<label for="refund-type" class="am-form-label" style="margin-top: 0px">退款类型：</label>
												<div class="am-form-content">
													<c:if test="${requestScope.refund.refundType eq 97 }">仅退款</c:if>
													<c:if test="${requestScope.refund.refundType eq 98 }">退货</c:if>
													<c:if test="${requestScope.refund.refundType eq 99 }">换货</c:if>
												</div>
											</div>
											<div class="am-form-group">
												<label for="refund-reason" class="am-form-label" style="margin-top: 0px">退款原因：</label>
												<div class="am-form-content">
													<c:if test="${requestScope.refund.refundReason eq 98 }">不想要了</c:if>
													<c:if test="${requestScope.refund.refundReason eq 99 }">买错了</c:if>
													<c:if test="${requestScope.refund.refundReason eq 100 }">没收到货</c:if>
													<c:if test="${requestScope.refund.refundReason eq 101 }">配送时间不符合要求</c:if>
													<c:if test="${requestScope.refund.refundReason eq 102 }">商品与说明不符</c:if>
													<c:if test="${requestScope.refund.refundReason eq 103 }">商品质量问题</c:if>
													<c:if test="${requestScope.refund.refundReason eq 104 }">其他（请在下方退款说明填写）</c:if>
												</div>
											</div>
											<div class="am-form-group">
												<label for="refund-info" class="am-form-label" style="margin-top: 0px">退款说明：</label>
												<div class="am-form-content">
													${requestScope.refund.refundDetail }
												</div>
											</div>
											<div class="am-form-group">
												<label for="refund-type" class="am-form-label" style="margin-top: 0px"></label>
												<div class="am-form-content">			
												</div>
											</div>
											<c:if test="${requestScope.refund.refundStatus != 48 }">
												<div class="am-form-group">
													<label for="refund-type" class="am-form-label am-badge am-round am-badge-danger" style="margin-top: 0px">商家回复</label>
													<div class="am-form-content">			
													</div>
												</div>
												<div class="am-form-group">
													<label for="refund-type" class="am-form-label" style="margin-top: 0px">审核结果</label>
													<div class="am-form-content">
														<c:if test="${requestScope.refund.refundStatus eq 49 }">通过</c:if>
														<c:if test="${requestScope.refund.refundStatus eq 50 }"><font color="red">未通过</font></c:if>		
													</div>
												</div>
												<div class="am-form-group">
													<label for="refund-type" class="am-form-label" style="margin-top: 0px">商家回复</label>
													<div class="am-form-content">
														${requestScope.refund.refundResponse }	
													</div>
												</div>
											</c:if>
									</div>
							</c:if>
						</div>
					</div>
					<div class="clear"></div>
				</div>

				<!--底部-->
				<div class="footer">
					<div class="footer-hd">
					</div>
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