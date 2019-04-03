<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
		<title>安全问题</title>
		<link href="/Test/one/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="/Test/one/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
		<link href="/Test/one/css/personal.css" rel="stylesheet" type="text/css">
		<link href="/Test/one/css/stepstyle.css" rel="stylesheet" type="text/css">
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
				<c:if test="${requestScope.safe == null }">
				<div class="main-wrap">
					<div class="am-cf am-padding">
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">设置安全问题</strong> / <small>Set&nbsp;Safety&nbsp;Question</small></div>
					</div>
					<hr/>
					<!--进度条-->
					<div class="m-progress">
						<div class="m-progress-list">
							<span class="step-1 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                                <p class="stage-name">设置安全问题</p>
                            </span>
                            <span class="step-2 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">2<em class="bg"></em></i>
                                <p class="stage-name">完成</p>
                            </span>
							<span class="u-progress-placeholder"></span>
						</div>
						<div class="u-progress-bar total-steps-2">
							<div class="u-progress-bar-inner"></div>
						</div>
					</div>
					<form action="/Test/SetProblem?userID=${sessionScope.user.userID }" method="post" class="am-form am-form-horizontal">
						<div class="am-form-group select">
							<label for="question1" class="am-form-label">问题一</label>
							<div class="am-form-content">
								<select name="question1" data-am-selected>
									<option value="a" selected>请选择安全问题</option>
									<option value="b">你小时候最喜欢哪一本书？</option>
									<option value="c">你的理想工作是什么？</option>
									<option value="d">你童年时代的绰号是什么？</option>
									<option value="e">你拥有的第一辆车是什么品牌？</option>
									<option value="f">你最喜欢哪个歌手或乐队？</option>
									<option value="g">你最喜欢哪个电影或电影明星？</option>
								</select>
							</div>
						</div>
						<div class="am-form-group">
							<label for="answer1" class="am-form-label">答案</label>
							<div class="am-form-content">
								<input type="text" id="answer1" name="answer1" placeholder="请输入安全问题答案">
							</div>
						</div>
						<div class="am-form-group select">
							<label for="question2" class="am-form-label">问题二</label>
							<div class="am-form-content">
								<select name="question2" data-am-selected>
									<option value="a" selected>请选择安全问题</option>
									<option value="b">你第一次坐飞机是去哪里？</option>
									<option value="c">你少年时代最好的朋友叫什么？</option>
									<option value="d">你的第一个宠物叫什么？</option>
									<option value="e">你从小长大的那条街叫什么？</option>
									<option value="f">你最喜欢哪个球队？</option>
									<option value="g">你的父母在哪里认识的？</option>
								</select>
							</div>
						</div>
						<div class="am-form-group">
							<label for="answer2" class="am-form-label">答案</label>
							<div class="am-form-content">
								<input type="text" id="answer2" name="answer2" placeholder="请输入安全问题答案">
							</div>
						</div>
						<div class="info-btn">
							<input type="submit" class="am-btn am-btn-danger" value="保存修改">
						</div>
					</form>
				</div>
				</c:if>
				<c:if test="${requestScope.safe != null }">
					<div class="main-wrap" style="min-height: 453px">
					<div class="am-cf am-padding">
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">设置安全问题</strong> / <small>Set&nbsp;Safety&nbsp;Question</small></div>
					</div>
					<hr/>
					<!--进度条-->
					<div class="m-progress">
						<div class="m-progress-list">
							<span class="step-3 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                                <p class="stage-name">设置安全问题</p>
                            </span>
                            <span class="step-3 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">2<em class="bg"></em></i>
                                <p class="stage-name">完成</p>
                            </span>
                            <span class="u-progress-placeholder"></span>
                        </div>
                        <div class="u-progress-bar total-steps-2">
							<div class="u-progress-bar-inner"></div>
						</div>
						</div>
						<div class="am-form-group" style="margin-left: 250px">
							<label for="question1" class="am-form-label">问题一</label>
							<div class="am-form-content">
								<c:if test="${requestScope.safe.question1 eq 98 }">你小时候最喜欢哪一本书？</c:if>
								<c:if test="${requestScope.safe.question1 eq 99 }">你的理想工作是什么？</c:if>
								<c:if test="${requestScope.safe.question1 eq 100 }">你童年时代的绰号是什么？</c:if>
								<c:if test="${requestScope.safe.question1 eq 101 }">你拥有的第一辆车是什么品牌？</c:if>
								<c:if test="${requestScope.safe.question1 eq 102 }">你最喜欢哪个歌手或乐队？</c:if>
								<c:if test="${requestScope.safe.question1 eq 103 }">你最喜欢哪个电影或电影明星？</c:if>
							</div>
						</div>
						<div class="am-form-group" style="margin-left: 250px">
							<label for="answer1" class="am-form-label">答案</label>
							<div class="am-form-content">
								${requestScope.safe.answer1 }
							</div>
						</div>
						<div class="am-form-group" style="margin-left: 250px">
							<label for="question2" class="am-form-label">问题二</label>
							<div class="am-form-content">
								<c:if test="${requestScope.safe.question2 eq 98 }">你第一次坐飞机是去哪里？</c:if>
								<c:if test="${requestScope.safe.question2 eq 99 }">你少年时代最好的朋友叫什么？</c:if>
								<c:if test="${requestScope.safe.question2 eq 100 }">你的第一个宠物叫什么？</c:if>
								<c:if test="${requestScope.safe.question2 eq 101 }">你从小长大的那条街叫什么？</c:if>
								<c:if test="${requestScope.safe.question2 eq 102 }">你最喜欢哪个球队？</c:if>
								<c:if test="${requestScope.safe.question2 eq 103 }">你的父母在哪里认识的？</c:if>
							</div>
						</div>
						<div class="am-form-group" style="margin-left: 250px">
							<label for="answer2" class="am-form-label">答案</label>
							<div class="am-form-content">
								${requestScope.safe.answer2 }
							</div>
						</div>
					</div>
                </c:if>
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
							<li class="active"> <a href="/Test/GetSafeInfo?userID=${sessionScope.user.userID }">安全设置</a></li>
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