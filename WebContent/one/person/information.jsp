<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
		<title>个人资料</title>
		<link href="/Test/one/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="/Test/one/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
		<link href="/Test/one/css/personal.css" rel="stylesheet" type="text/css">
		<link href="/Test/one/css/infstyle.css" rel="stylesheet" type="text/css">
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

					<div class="user-info">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">个人资料</strong> / <small>Personal&nbsp;information</small></div>
						</div>
						<hr/>

						<!--头像 -->
						<form class="am-form am-form-horizontal" method="post" action="/Test/UpdateUserInfo?userID=${sessionScope.user.userID }" enctype="multipart/form-data">
						<div class="user-infoPic">

							<div class="filePic">
								<input type="file" name="file" class="inputPic" multiple="multiple">
								<img class="am-circle am-img-thumbnail" src="${requestScope.user.userImg }" alt="" />
							</div>

							<p class="am-form-help">头像</p>

							<div class="info-m">
								<div><b>用户名：<i>${requestScope.user.userLoginName }</i></b></div>
								<div class="u-level">
									<span class="rank r2">真实姓名：</span>${requestScope.user.userName }
								</div>
								<c:if test="${requestScope.user.userSex != '' }">
									<div class="u-level">
										<span class="rank r2">性别：</span>
										<c:if test="${requestScope.user.userSex eq 50 }">保密</c:if>
										<c:if test="${requestScope.user.userSex eq 48 }">女</c:if>
										<c:if test="${requestScope.user.userSex eq 49 }">男</c:if>
									</div>
								</c:if>
								<c:if test="${requestScope.user.userBirthday!=null }">
									<div class="u-level">
										<span class="rank r2">生日：</span>
        								<fmt:formatDate type="date" value="${requestScope.user.userBirthday }" />
        							</div>
        						</c:if>
        						<c:if test="${requestScope.user.userPhone!=null }">
        							<div class="u-level">
										<span class="rank r2">电话：</span>
        								${requestScope.user.userPhone }
        							</div>
        						</c:if>
        						<c:if test="${requestScope.user.userEmail!=null }">
        							<div class="u-level">
										<span class="rank r2">邮箱：</span>
        								${requestScope.user.userEmail }
        							</div>
        						</c:if>
							</div>
						</div>

						<!--个人信息 -->
						<div class="info-main">
							
								<div class="am-form-group">
									<label class="am-form-label">性别</label>
									<div class="am-form-content sex">
										<label class="am-radio-inline">
											<input type="radio" name="userSex" value="male" data-am-ucheck> 男
										</label>
										<label class="am-radio-inline">
											<input type="radio" name="userSex" value="female" data-am-ucheck> 女
										</label>
										<label class="am-radio-inline">
											<input type="radio" name="userSex" value="secret" data-am-ucheck> 保密
										</label>
									</div>
								</div>
								
								<div class="am-form-group">
									<label for="user-birth" class="am-form-label">生日</label>
									<div class="am-form-content birth">
										<input id="userBirthday" name="userBirthday" type="text" class="am-form-field" placeholder="请在此选择您的生日" readonly required />
									</div>
									<script>
									  $(function() {
									    var nowTemp = new Date();
									    var nowDay = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0).valueOf();
									    var nowMonth = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), 1, 0, 0, 0, 0).valueOf();
									    var nowYear = new Date(nowTemp.getFullYear(), 0, 1, 0, 0, 0, 0).valueOf();
									    var $userBirthday = $('#userBirthday');
									
									    var checkin = $userBirthday.datepicker({
									      onRender: function(date, viewMode) {
									        // 默认 days 视图，与当前日期比较
									        var viewDate = nowDay;
									
									        switch (viewMode) {
									          // moths 视图，与当前月份比较
									          case 1:
									            viewDate = nowMonth;
									            break;
									          // years 视图，与当前年份比较
									          case 2:
									            viewDate = nowYear;
									            break;
									        }
									
									        return date.valueOf() > viewDate ? 'am-disabled' : '';
									      }
									    }).data('amui.datepicker');
									  });
									</script>
								</div>
								<div class="am-form-group">
									<label for="user-phone" class="am-form-label">电话</label>
									<div class="am-form-content">
										<input id="userPhone" name="userPhone" placeholder="请在此输入您的电话号码" type="tel">
									</div>
								</div>
								<div class="am-form-group">
									<label for="user-email" class="am-form-label">电子邮件</label>
									<div class="am-form-content">
										<input id="userEmail" name="userEmail" placeholder="请在此输入您的电子邮箱地址" type="email">
									</div>
								</div>
								<div class="am-form-group address">
									<label for="user-address" class="am-form-label">收货地址</label>
									<div class="am-form-content address">
										<a href="address.html">
											<p class="new-mu_l2cw">
												<span class="province">湖北</span>省
												<span class="city">武汉</span>市
												<span class="dist">洪山</span>区
												<span class="street">雄楚大道666号(中南财经政法大学)</span>
												<span class="am-icon-angle-right"></span>
											</p>
										</a>

									</div>
								</div>
								<div class="am-form-group safety">
									<label for="user-safety" class="am-form-label">账号安全</label>
									<div class="am-form-content safety">
										<a href="safety.html">

											<span class="am-icon-angle-right"></span>

										</a>

									</div>
								</div>
								<div class="info-btn">
									<input type="submit" class="am-btn am-btn-danger" value="保存修改"/>
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
							<li class="active"> <a href="/Test/GetUserInfo?userID=${sessionScope.user.userID }">个人信息</a></li>
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
							<li> <a href="/Test/GetAllComment?userID=${sessionScope.user.userID}">评价</a></li>
						</ul>
					</li>
				</ul>
			</aside>
		</div>

	</body>

</html>