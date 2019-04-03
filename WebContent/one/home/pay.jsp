<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
		<title>结算页面</title>
		<link href="one/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="one/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="/Test/one/css/amazeui-2.6.2.min.css"/>
		<link rel="stylesheet" href="/Test/one/css/amazeui.datetimepicker.css"/>
		<link rel="stylesheet" href="/Test/one/basic/css/demo.css"/>
		<link rel="stylesheet" href="/Test/one/css/cartstyle.css"/>
		<link rel="stylesheet" href="/Test/one/css/jsstyle.css"/>
		<script type="text/javascript" src="/Test/one/js/address.js"></script>
		<script type="text/javascript" src="/Test/one/js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="/Test/one/js/amazeui.datetimepicker.min.js"></script>
		<script type="text/javascript" src="/Test/one/js/selector.js"></script>
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
			<div class="concent">
				<!--地址 -->
				<div class="paycont">
					<div class="address">
						<h3>确认收货地址 </h3>
						<div class="control">
							<div class="tc-btn createAddr theme-login am-btn am-btn-danger">使用新地址</div>
						</div>
						<div class="clear"></div>
						<ul id="userAddressList">
							<c:forEach items="${addressList}" var="items">
								<div class="per-border"></div>
								<c:if test="${items.isDefault eq 49 }">
									<li class="user-addresslist defaultAddr">
										<div class="address-left">
											<div class="user DefaultAddr">
												<span class="buy-address-detail">
												<input id="useraddressID" type="hidden" value="${items.addressID }"/>
												<span id="username" class="buy-user">${items.addressUserName } </span>
												<span id="userphone" class="buy-phone">${items.phoneNumber }</span>
												</span>
											</div>
											<div class="default-address DefaultAddr">
												<span class="buy-line-title buy-line-title-type">收货地址：</span>
												<span id="useraddress" class="buy--address-detail">${items.address }</span>
											</div>
											<ins class="deftip">默认地址</ins>
										</div>
										<div class="address-right">
											<a href="/Test/one/person/address.html">
											<span class="am-icon-angle-right am-icon-lg"></span></a>
										</div>
										<div class="clear"></div>
											<div class="new-addr-btn">
											<a href="javascript:void(0);" onclick="delClick(this);">删除</a>
										</div>
									</li>
								</c:if>
								<c:if test="${items.isDefault eq 48 }">
									<div class="per-border"></div>
									<li class="user-addresslist">
										<div class="address-left">
											<div class="user DefaultAddr">
												<span class="buy-address-detail">
												<input id="useraddressID" type="hidden" value="${items.addressID }"/>
                   								<span id="username" class="buy-user">${items.addressUserName }</span>
												<span id="userphone" class="buy-phone">${items.phoneNumber }</span>
												</span>
											</div>
										<div class="default-address DefaultAddr">
											<span class="buy-line-title buy-line-title-type">收货地址：</span>
											<span id="useraddress" class="buy--address-detail">
												${items.address }
											</span>
									</div>
									<ins class="deftip hidden">默认地址</ins>
									</div>
									<div class="address-right">
										<span class="am-icon-angle-right am-icon-lg"></span>
									</div>
									<div class="clear"></div>
									<div class="new-addr-btn">
										<a href="#">设为默认</a>
										<span class="new-addr-bar">|</span>
										<a href="javascript:void(0);"  onclick="delClick(this);">删除</a>
									</div>
								</li>
								</c:if>
							</c:forEach>
						</ul>
						<div class="clear"></div>
					</div>
					<div class="clear"></div>
					<div class="datetime">
						<h3>选择配送时间</h3>
						<div class="am-g" style="width: 1000px">
						<div class="am-u-md-2">
							<label for="startTime" class="am-form-label" style="margin-top: 15px;margin-left: 60px; font-size: 16px">从:</label>
						</div>
						<div class="am-u-md-3 am-input-group startTime">
							<input id="startTime" size="16" type="text" value="" readonly class="am-form-field date form_starttime" style="margin-left:0px ;margin-top: 10px;width: 200px"/>
						</div>	
						<div class="am-u-md-2">
							<label for="endTime" class="am-form-label" style="margin-top: 15px;margin-left: 60px; font-size: 16px">至:</label>
						</div>
						<div class="am-u-md-3 am-input-group endTime">
							<input id="endTime" size="16" type="text" value="" readonly class="am-form-field date form_endtime" style="margin-left:0px ;margin-top: 10px;width: 200px"/>
						</div>
						<div class="am-u-md-5 am-u-end">
						</div>
						</div>
						<script type="text/javascript">
						  $(function() {
						    $('.form_starttime').datetimepicker({
						        format: 'yyyy-mm-dd hh:ii',
						        autoclose: true,
						        todayBtn: true,
						        startDate: new Date(),
						        minuteStep: 30
						    });
						  });
						</script>
						<script type="text/javascript">
						  $(function() {
						    $('.form_endtime').datetimepicker({
						        format: 'yyyy-mm-dd hh:ii',
						        autoclose: true,
						        todayBtn: true,
						        startDate: new Date(),
						        minuteStep: 30
						    });
						  });
						</script>
		 			 </div>
					</div>
					<div class="clear"></div>
					<!--支付方式-->
					<div class="logistics">
						<h3>选择支付方式</h3>
						<ul id="deliveryMethod" class="pay-list">
							<li class="pay card"><img src="/Test/one/images/refund.png"/>在线支付<span></span></li>
							<li class="pay qq"><img src="/Test/one/images/receive.png" />货到付款<span></span></li>
						</ul>
					</div>
					<div class="clear"></div>

					<!--订单 -->
					<div class="concent">
						<div id="payTable">
							<h3>确认订单信息</h3>
							<div class="cart-table-th">
								<div class="wp">

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
									<div class="th th-oplist">
										<div class="td-inner">配送方式</div>
									</div>

								</div>
							</div>
							<div class="clear"></div>
							<c:forEach items="${cartitemslist }" var="i">
								<tr class="item-list">
									<div class="bundle  bundle-last">
										<div class="bundle-main">
											<ul class="item-content clearfix">
												<div class="pay-phone">
													<li class="td td-item">
													<div class="item-pic">
														<a href="#" class="J_MakePoint">
															<img src="${i.goods.getGoodsImg() }" class="itempic J_ItemImg" height="80" width="80">
														</a>
													</div>
													<div class="item-info">
														<div class="item-basic-info">
															<a href="#" class="item-title J_MakePoint" data-point="tbcart.8.11">${i.goods.getGoodsName() }</a>
														</div>
													</div>
												</li>
												<li class="td td-price">
													<div class="item-price price-promo-promo">
														<div class="price-content">
															<em class="J_Price price-now">
															<fmt:formatNumber minFractionDigits="2" value="${i.goods.getGoodsPrice() }"/>
															</em>
														</div>
													</div>
												</li>
												</div>
												<li class="td td-amount">
													<div class="amount-wrapper ">
														<div class="item-amount ">
															<span class="phone-title">购买数量</span>
															<div class="sl" style="margin-top: 5px">
																${i.number }
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
												<li class="td td-oplist">
													<div class="td-inner">
														<span class="phone-title">运费</span>
														<div class="pay-logis">
															<b class="sys_item_freprice">无运费</b>
														</div>
													</div>
												</li>
											</ul>
										<div class="clear"></div>
									</div>
								</tr>
							</c:forEach>
							<div class="clear"></div>
						</div>
					</div>
							<div class="clear"></div>
							<div class="pay-total">
						<!--留言-->
							<div class="order-extra">
								<div class="order-user-info">
									<div class="memo">
										<label>买家留言：</label>
										<input id="userNote" type="text" title="选填,对本次交易的说明（建议填写已经和卖家达成一致的说明）" placeholder="选填,建议填写和卖家达成一致的说明" class="memo-input J_MakePoint c2c-text-default memo-close"/>
										<div class="msg hidden J-msg">
											<p class="error">最多输入500个字符</p>
										</div>
									</div>
								</div>
								
							</div>
							<div class="clear"></div>
							</div>
							<!--含运费小计 -->
							<c:set var="priceSum" value="0" scope="page"/>
							<c:forEach items="${cartitemslist}" var="i">
								<c:if test="${status.count==1}">
									<c:set var="priceSum" value="${i.priceSum }"></c:set>
								</c:if>
								<c:if test="${status.count!=1}">
									<c:set var="priceSum" value="${i.priceSum+priceSum }"></c:set>
								</c:if>
							</c:forEach>
							<div class="buy-point-discharge ">
								<p class="price g_price ">
									合计 <span>¥</span>
									<em class="pay-sum">
									<fmt:formatNumber minFractionDigits="2" value="${priceSum }"/>
									</em>
								</p>
							</div>

							<!--信息 -->
							<div class="order-go clearfix">
								<div class="pay-confirm clearfix">
									<div class="box">
										<div tabindex="0" id="holyshit267" class="realPay"><em class="t">实付款：</em>
											<span class="price g_price ">
                                    <span>¥</span> <em class="style-large-bold-red " id="J_ActualFee">
									<fmt:formatNumber minFractionDigits="2" value="${priceSum }"/></em>
											</span>
										</div>

										<div id="holyshit268" class="pay-address">
											
											<p class="buy-footer-address">
												<input id="hiddendata" type="hidden" value="" />
												<span class="buy-line-title buy-line-title-type">寄送至：</span>
												<span id="footaddress" class="buy--address-detail">
												</span>
											</p>
											<p class="buy-footer-address">
												<span class="buy-line-title">收货人：</span>
												<span class="buy-address-detail">   
                                         		<span id="footusername" class="buy-user"></span>
												<span id="footuserphone" class="buy-phone"></span>
												</span>
											</p>
											<p class="buy-footer-address">
												<span class="buy-line-title">支付方式：</span>
												<span id="footdeliverymethod"></span>
											</p>
										</div>
									</div>

									<div id="holyshit269" class="submitOrder">
										<div class="go-btn-wrap">
											<form action="/Test/balance?userID=${sessionScope.user.userID }&priceSum=${priceSum}" method="post">
												<input id="addressidsubmit" name="addressidsubmit" type="hidden" />
												<input id="deliverysubmit" name="deliverysubmit" type="hidden"/>
												<input id="footstarttime" name="footstarttime" type="hidden"/>
												<input id="footendtime" name="footendtime" type="hidden"/>
												<input id="footusernote" name="footusernote" type="hidden"/>
												<input type="submit" style="margin-left: 878px" id="J_Go" class="btn-go" tabindex="0" value="提交订单" title="点击此按钮，提交订单"/>
											</form>
										</div>
									</div>
									<div class="clear"></div>
								</div>
							</div>
						</div>

						<div class="clear"></div>
					</div>
				</div>
				<div class="footer">
				</div>
			</div>
			<div class="theme-popover-mask"></div>
			<div class="theme-popover">

				<!--标题 -->
				<div class="am-cf am-padding">
					<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add address</small></div>
				</div>
				<hr/>

				<div class="am-u-md-12">
					<form action="InsertAddress1?userID=${sessionScope.user.getUserID() }" method="post" class="am-form am-form-horizontal">

						<div class="am-form-group">
							<label for="user-name" class="am-form-label">收货人</label>
							<div class="am-form-content">
								<input type="text" id="addressUserName" name="addressUserName" placeholder="收货人" />
							</div>
						</div>

						<div class="am-form-group">
							<label for="user-phone" class="am-form-label">手机号码</label>
							<div class="am-form-content">
								<input type="text" id="phoneNumber" name="phoneNumber" placeholder="手机号必填"/>
							</div>
						</div>

						<div class="am-form-group">
							<label for="user-phone" class="am-form-label">所在地</label>
							<div class="am-form-content address">
								<select id="province" name="province" data-am-selected="{maxHeight: 100}">
									<option value="a" selected>请选择</option>
								</select>
								<select id="city" name="city"  data-am-selected="{maxHeight: 100}">
									<option value="a" selected>请选择</option>
								</select>
								<select id="area" name="area"  data-am-selected="{maxHeight: 100}">
									<option value="a" selected>请选择</option>
								</select>
							</div>
						</div>

						<div class="am-form-group">
							<label for="user-intro" class="am-form-label">详细地址</label>
							<div class="am-form-content">
								<textarea class="" rows="3" id="address" name="address" placeholder="输入详细地址"></textarea>
							</div>
						</div>

						<div class="am-form-group theme-poptit">
							<div class="am-u-sm-9 am-u-sm-push-3">							
								<input type="submit" class="am-btn am-btn-danger" value="保存"/>
								<div class="am-btn am-btn-danger close">取消</div>
							</div>
						</div>
					</form>
				</div>

			</div>

			<div class="clear"></div>
	</body>

</html>