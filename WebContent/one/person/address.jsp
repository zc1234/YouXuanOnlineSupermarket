<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
		<title>地址管理</title>
		<script type="text/javascript" src="/Test/one/basic/js/jquery-1.7.min.js"></script>
		<link href="/Test/one/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="/Test/one/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
		<link href="/Test/one/css/personal.css" rel="stylesheet" type="text/css">
		<link href="/Test/one/css/addstyle.css" rel="stylesheet" type="text/css">
		<script src="/Test/one/AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
		<script src="/Test/one/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		<script type="text/javascript" src="/Test/one/js/amazeui.min.js"></script>
		<script type="text/javascript" src="/Test/one/js/selector.js"></script>
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
								<div class="menu-hd"><a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div>
						</ul>
						</div>

						<!--悬浮搜索框-->

						<div class="nav white">
							<div class="logo"><img src="/Test/one/images/logo.png" /></div>
							<div class="logoBig">
								<li><img src="/Test/one/images/logobig.png" /></li>
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
				</div>
			</article>
		</header>
		<b class="line"></b>

		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-address">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">地址管理</strong> / <small>Address&nbsp;list</small></div>
						</div>
						<hr/>
						<ul class="am-avg-sm-1 am-avg-md-3 am-thumbnails" style="margin-left: 20px">
							<c:forEach items="${requestScope.address }" var="items">
								<c:if test="${items.isDefault eq 49 }">
									<li class="user-addresslist defaultAddr">
									<span class="new-option-r"><i class="am-icon-check-circle"></i>默认地址</span>
								</c:if>
								<c:if test="${items.isDefault eq 48 }">
									<li class="user-addresslist">
									<span class="new-option-r"><a href="ChangeDefaultAddress?userID=${sessionScope.user.getUserID()}&addressID=${items.addressID }"><i class="am-icon-check-circle"></i>设为默认</a></span>
								</c:if>
									<p class="new-tit new-p-re">
										<span class="new-txt">${items.addressUserName }</span>
										<span class="new-txt-rd2">${items.phoneNumber }</span>
									</p>
									<div class="new-mu_l2a new-p-re">
										<p class="new-mu_l2cw">
											<span class="title">地址：</span>
											<span class="province">${items.address }</span>
										</p>
									</div>
									<div class="new-addr-btn">
										<a href="/Test/DeleteAddress?addressID=${items.addressID }&userID=${sessionScope.user.getUserID()}" onclick="delClick(this);"><i class="am-icon-trash"></i>删除</a>
									</div>
								</li>
							</c:forEach>
						</ul>
						<div class="clear"></div>
						<a class="new-abtn-type" data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0}">添加新地址</a>
						<!--例子-->
						<div class="am-modal am-modal-no-btn" id="doc-modal-1">

							<div class="add-dress">

								<!--标题 -->
								<div class="am-cf am-padding">
									<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增/修改地址</strong> / <small>Add&nbsp;or&nbsp;Edit&nbsp;address</small></div>
								</div>
								<hr/>
								<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
									<form id="address" action="InsertAddress?userID=${sessionScope.user.getUserID()}" method="post" class="am-form am-form-horizontal">
										<div class="am-form-group">
											<span class="am-badge am-badge-danger am-round am-text-sm" style="margin-left: 105px">${requestScope.message }</span>
										</div>
										<div class="am-form-group">
											<label for="user-name" class="am-form-label">收货人</label>
											<div class="am-form-content">
												<input type="text" id="addressUserName" name="addressUserName" placeholder="请输入收货人姓名">
											</div>
										</div>
										<div class="am-form-group">
											<label for="user-phone" class="am-form-label">手机号码</label>
											<div class="am-form-content">
												<input id="phoneNumber" name="phoneNumber" placeholder="手机号必填" type="text">
											</div>
										</div>
										<div class="am-form-group">
											<label for="user-address" class="am-form-label">所在地</label>
											<div class="am-form-content address">
												<select id="province" name="province" data-am-selected="{maxHeight: 200}">
													<option value="a" selected>请选择</option>
												</select>
												<select id="city" name="city"  data-am-selected="{maxHeight: 200}">
													<option value="a" selected>请选择</option>
												</select>
												<select id="area" name="area"  data-am-selected="{maxHeight: 200}">
													<option value="a" selected>请选择</option>
												</select>
											</div>
										</div>

										<div class="am-form-group">
											<label for="user-intro" class="am-form-label">详细地址</label>
											<div class="am-form-content">
												<textarea class="" rows="3" id="address" name="address" placeholder="输入详细地址"></textarea>
												<small>100字以内写出你的详细地址...</small>
											</div>
										</div>
										<div class="am-form-group">
											<div class="am-u-sm-9 am-u-sm-push-3">
												<input type="submit" class="am-btn am-btn-danger" value="保存">
												<a class="am-close am-btn am-btn-danger" data-am-modal-close>取消</a>
											</div>
										</div>
									</form>
								</div>
							</div>

						</div>

					</div>

					<script type="text/javascript">
						$(document).ready(function() {							
							$(".new-option-r").click(function() {
								$(this).parent('.user-addresslist').addClass("defaultAddr").siblings().removeClass("defaultAddr");
							});
							
							var $ww = $(window).width();
							if($ww>640) {
								$("#doc-modal-1").removeClass("am-modal am-modal-no-btn")
							}
							
						})
					</script>

					<div class="clear"></div>

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
							<li class="active"> <a href="/Test/GetUserAddress?userID=${sessionScope.user.userID }">收货地址</a></li>
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

	</body>

</html>