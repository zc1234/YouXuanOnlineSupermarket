<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
		<title>订单详情</title>
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

					<div class="user-orderinfo">

						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单详情</strong> / <small>Order&nbsp;details</small></div>
						</div>
						<hr/>
						<!--进度条-->
						<div class="m-progress">
							<div class="m-progress-list">
								<c:if test="${order.orderStatus eq 48 }">
                                   <span class="step-0 step">
	                                   <em class="u-progress-stage-bg"></em>
	                                   <i class="u-stage-icon-inner">1<em class="bg"></em></i>
	                                   <p class="stage-name">拍下商品</p>
                                   </span>
                                   <span class="step-0 step">
	                                   <em class="u-progress-stage-bg"></em>
	                                   <i class="u-stage-icon-inner">2<em class="bg"></em></i>
	                                   <p class="stage-name">卖家发货</p>
                               	   </span>
                               	   <span class="step-0 step">
	                                   <em class="u-progress-stage-bg"></em>
	                                   <i class="u-stage-icon-inner">3<em class="bg"></em></i>
	                                   <p class="stage-name">确认收货</p>
	                               </span>
	                               <span class="step-0 step">
	                                   <em class="u-progress-stage-bg"></em>
	                                   <i class="u-stage-icon-inner">4<em class="bg"></em></i>
	                                   <p class="stage-name">交易完成</p>
	                               </span>
                                </c:if>
                                <c:if test="${order.orderStatus eq 49 }">
                                   <span class="step-1 step">
	                                   <em class="u-progress-stage-bg"></em>
	                                   <i class="u-stage-icon-inner">1<em class="bg"></em></i>
	                                   <p class="stage-name">拍下商品</p>
                                   </span>
                                   <span class="step-0 step">
	                                   <em class="u-progress-stage-bg"></em>
	                                   <i class="u-stage-icon-inner">2<em class="bg"></em></i>
	                                   <p class="stage-name">卖家发货</p>
                               	   </span>
                               	   <span class="step-0 step">
	                                   <em class="u-progress-stage-bg"></em>
	                                   <i class="u-stage-icon-inner">3<em class="bg"></em></i>
	                                   <p class="stage-name">确认收货</p>
	                               </span>
	                               <span class="step-0 step">
	                                   <em class="u-progress-stage-bg"></em>
	                                   <i class="u-stage-icon-inner">4<em class="bg"></em></i>
	                                   <p class="stage-name">交易完成</p>
	                               </span>
                                </c:if>
								<c:if test="${order.orderStatus eq 50 }">
                                   <span class="step-1 step">
	                                   <em class="u-progress-stage-bg"></em>
	                                   <i class="u-stage-icon-inner">1<em class="bg"></em></i>
	                                   <p class="stage-name">拍下商品</p>
                                   </span>
                                   <span class="step-2 step">
	                                   <em class="u-progress-stage-bg"></em>
	                                   <i class="u-stage-icon-inner">2<em class="bg"></em></i>
	                                   <p class="stage-name">卖家发货</p>
                               	   </span>
                               	   <span class="step-0 step">
	                                   <em class="u-progress-stage-bg"></em>
	                                   <i class="u-stage-icon-inner">3<em class="bg"></em></i>
	                                   <p class="stage-name">确认收货</p>
	                               </span>
	                               <span class="step-0 step">
	                                   <em class="u-progress-stage-bg"></em>
	                                   <i class="u-stage-icon-inner">4<em class="bg"></em></i>
	                                   <p class="stage-name">交易完成</p>
	                               </span>
                                </c:if>
                                <c:if test="${order.orderStatus eq 51 }">
                                   <span class="step-1 step">
	                                   <em class="u-progress-stage-bg"></em>
	                                   <i class="u-stage-icon-inner">1<em class="bg"></em></i>
	                                   <p class="stage-name">拍下商品</p>
                                   </span>
                                   <span class="step-2 step">
	                                   <em class="u-progress-stage-bg"></em>
	                                   <i class="u-stage-icon-inner">2<em class="bg"></em></i>
	                                   <p class="stage-name">卖家发货</p>
                               	   </span>
                               	   <span class="step-3 step">
	                                   <em class="u-progress-stage-bg"></em>
	                                   <i class="u-stage-icon-inner">3<em class="bg"></em></i>
	                                   <p class="stage-name">确认收货</p>
	                               </span>
	                               <span class="step-0 step">
	                                   <em class="u-progress-stage-bg"></em>
	                                   <i class="u-stage-icon-inner">4<em class="bg"></em></i>
	                                   <p class="stage-name">交易完成</p>
	                               </span>
                                </c:if>
								<c:if test="${order.orderStatus eq 52 }">
                                   <span class="step-1 step">
	                                   <em class="u-progress-stage-bg"></em>
	                                   <i class="u-stage-icon-inner">1<em class="bg"></em></i>
	                                   <p class="stage-name">拍下商品</p>
                                   </span>
                                   <span class="step-2 step">
	                                   <em class="u-progress-stage-bg"></em>
	                                   <i class="u-stage-icon-inner">2<em class="bg"></em></i>
	                                   <p class="stage-name">卖家发货</p>
                               	   </span>
                               	   <span class="step-3 step">
	                                   <em class="u-progress-stage-bg"></em>
	                                   <i class="u-stage-icon-inner">3<em class="bg"></em></i>
	                                   <p class="stage-name">确认收货</p>
	                               </span>
	                               <span class="step-4 step">
	                                   <em class="u-progress-stage-bg"></em>
	                                   <i class="u-stage-icon-inner">4<em class="bg"></em></i>
	                                   <p class="stage-name">交易完成</p>
	                               </span>
                                </c:if>
								
								<span class="u-progress-placeholder"></span>
							</div>
							<div class="u-progress-bar total-steps-2">
								<div class="u-progress-bar-inner"></div>
							</div>
						</div>
						<div class="order-infoaside">
							<div class="order-logistics">
								<a href="logistics.html">
									<div class="latest-logistics">
										<p class="text" style="margin-top: -10px;">订单详情：</p><br>
										<p class="text" style="margin-top: -10px;">创建时间：<fmt:formatDate value="${order.orderCreatetime }" type="both"/></p><br>
										<p class="text" style="margin-top: -10px;">商品总件数：${order.orderNumber }</p><br>
										<p class="text" style="margin-top: -10px;">支付方式：
										<c:if test="${order.delivery eq 48 }">
											在线支付
										</c:if>
										<c:if test="${order.delivery eq 49 }">
											货到付款
										</c:if>
										</p><br>
										<p class="text" style="margin-top: -10px;">配送时间：<fmt:formatDate value="${order.startTime }" type="both"/>至<fmt:formatDate value="${order.endTime }" type="both"/></p><br>
										<p class="text" style="margin-top: -10px;">备注：${order.orderNote }</p>
									</div>
									<span class="am-icon-angle-right icon"></span>
								</a>
								<div class="clear"></div>
							</div>
							<div class="order-addresslist">
								<div class="order-address">
									<div class="icon-add">
									</div>
									<p class="new-tit new-p-re">
										<span class="new-txt">${order.address.addressUserName }</span>
										<span class="new-txt-rd2">${order.address.phoneNumber }</span>
									</p>
									<div class="new-mu_l2a new-p-re">
										<p class="new-mu_l2cw">
											<span class="title">收货地址：</span>
											<span class="province">${order.address.address }</span>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="order-infomain">

							<div class="order-top">
								<div class="th th-item">
									<td class="td-inner">商品</td>
								</div>
								<div class="th th-price">
									<td class="td-inner">单价</td>
								</div>
								<div class="th th-number">
									<td class="td-inner">数量</td>
								</div>
								<div class="th th-operation">
									<td class="td-inner">商品操作</td>
								</div>
								<div class="th th-amount">
									<td class="td-inner">合计</td>
								</div>
								<div class="th th-status">
									<td class="td-inner">交易状态</td>
								</div>
								<div class="th th-change">
									<td class="td-inner">交易操作</td>
								</div>
							</div>
							<div class="order-main">
								<div class="order-status3">
									<div class="order-title">
										<div class="dd-num">订单编号：${order.orderID }</div>
										<span>成交时间：<fmt:formatDate value="${order.orderCreatetime }" type="date"/></span>
										<!--    <em>店铺：小桔灯</em>-->
									</div>
									<div class="order-content">
										<div class="order-left">
											<c:forEach items="${orderItems }" var="items">
												<ul class="item-list">
													<li class="td td-item">
														<div class="item-pic">
															<a href="#" class="J_MakePoint">
																<img src="${items.goods.goodsImg }" class="itempic J_ItemImg"/>
															</a>
														</div>
														<div class="item-info">
															<div class="item-basic-info">
																<a href="/Test/detail?goodsID=${items.goods.goodsID }">
																	<p>${items.goods.goodsName }</p>
																</a>
															</div>
														</div>
													</li>
													<li class="td td-price">
														<div class="item-price"><fmt:formatNumber minFractionDigits="2" value="${items.goods.goodsPrice }"/></div>
													</li>
													<li class="td td-number">
														<div class="item-number"><span>×</span>${items.goodsNumber }</div>
													</li>
													<li class="td td-operation">
														<c:if test="${order.orderStatus eq 50}">
															<c:if test="${items.orderitemsStatus != 48 }">
																<a href="/Test/Refund?orderitemsID=${items.orderitemsID }"><div class="item-operation">退款/退货</div></a>
															</c:if>
															<c:if test="${items.orderitemsStatus eq 48 }"><div class="item-operation">已申请退款</div></c:if>
														</c:if>
														<c:if test="${order.orderStatus eq 51}">
															<c:if test="${items.orderitemsStatus != 48 }">
																<a href="/Test/Refund?orderitemsID=${items.orderitemsID }">退款/退货</a>
															</c:if>
															<c:if test="${items.orderitemsStatus eq 48 }">已申请退款</c:if><br>
															<c:if test="${items.orderitemsStatus eq 49}">
																<a href="/Test/addCommentPage?orderitemsID=${items.orderitemsID}">评价商品</a>
															</c:if>
															<c:if test="${items.orderitemsStatus eq 50}">
																已评价
															</c:if>
														</c:if>
													</li>
												</ul>
											</c:forEach>
										</div>
										<div class="order-right">
											<li class="td td-amount">
												<div class="item-amount">
													合计：<fmt:formatNumber minFractionDigits="2" value="${order.priceSum }"/>
												</div>
											</li>
											<div class="move-right">
												<c:if test="${order.orderStatus eq 48}">
													<li class="td td-status">
														<div class="item-status">
															<p class="Mystatus">等待买家付款</p>
															<p class="order-info"><a href="/Test/DeleteOrder?orderID=${order.orderID }&userID=${sessionScope.user.userID}" style="color: lightskyblue">取消订单</a></p>
														</div>
													</li>
													<li class="td td-change">
														<a href="/Test/SubmitOrder?userID=${sessionScope.user.userID }&orderID=${order.orderID}">
															<div class="am-btn am-btn-danger anniu">一键支付</div>
														</a>
													</li>
												</c:if>
												<c:if test="${order.orderStatus eq 49}">
													<li class="td td-status">
														<div class="item-status">
															<p class="Mystatus" style="margin-top: 8px">买家已付款</p>
														</div>
													</li>
													<li class="td td-change">
														<a href="/Test/DeleteOrder?orderID=${order.orderID }&userID=${sessionScope.user.userID}">
															<div class="am-btn am-btn-danger anniu">
																取消订单</div>
														</a>
													</li>
												</c:if>
												<c:if test="${order.orderStatus eq 50}">
													<li class="td td-status">
														<div class="item-status">
															<p class="Mystatus" style="margin-top: 8px">卖家已发货</p>
														</div>
													</li>
													<li class="td td-change">
														<a href="/Test/ReceiveGoods?orderID=${order.orderID }&userID=${sessionScope.user.userID }" class="am-btn am-btn-danger anniu">
															确认收货</a>
													</li>
												</c:if>
												<c:if test="${order.orderStatus eq 51}">
													<li class="td td-status">
														<div class="item-status">
															<p class="Mystatus" style="margin-top: 8px">交易成功</p>
														</div>
													</li>
													<li class="td td-change">
														<button type="button" class="am-btn am-btn-default" disabled="disabled">无</button>
													</li>
												</c:if>
												<c:if test="${order.orderStatus eq 53}">
													<li class="td td-status">
														<div class="item-status">
															<p class="Mystatus" style="margin-top: 8px">已删除</p>
														</div>
													</li>
													<li class="td td-change">
														<button type="button" class="am-btn am-btn-default" disabled="disabled">无</button>
													</li>
												</c:if>
												<!-- 
													<li class="td td-status">
														<div class="item-status">
															<p class="Mystatus">卖家已发货</p>
															<p class="order-info"><a href="logistics.html">查看物流</a></p>
															<p class="order-info"><a href="#">延长收货</a></p>
														</div>
													</li>
												 -->
											</div>
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
							<li class="active"><a href="/Test/showOrder?userID=${sessionScope.user.userID }">订单管理</a></li>
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