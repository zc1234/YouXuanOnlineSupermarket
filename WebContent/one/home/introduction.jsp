<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>商品页面</title>
		<link rel="stylesheet" href="http://cdn.amazeui.org/amazeui/2.5.0/css/amazeui.min.css"/>
		<link href="one/AmazeUI-2.4.2/assets/css/amazeui.min.css" rel="stylesheet" type="text/css" />
		<link href="one/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
		<link href="one/basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link type="text/css" href="one/css/optstyle.css" rel="stylesheet" />
		<link type="text/css" href="one/css/style.css" rel="stylesheet" />
		<script type="text/javascript" src="one/basic/js/jquery-1.7.min.js"></script>
		<script type="text/javascript" src="one/basic/js/quick_links.js"></script>
		<script type="text/javascript" src="one/js/jquery.imagezoom.min.js"></script>
		<script type="text/javascript" src="one/js/jquery.flexslider.js"></script>
		<script type="text/javascript" src="one/js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="one/js/amazeui.min.js"></script>
		<script type="text/javascript" src="one/js/list.js"></script>
		<script type="text/javascript" src="one/js/selector.js"></script>
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
								<strong id="J_MiniCartNum" class="h">
								</strong>
							</a>
						</c:if>
						<c:if test="${sessionScope.user!=null }">
							<a id="mc-menu-hd" href="/Test/showCart?userID=${sessionScope.user.userID}" target="_top">
								<i class="am-icon-shopping-cart  am-icon-fw"></i>
								<span>购物车</span>
								<strong id="J_MiniCartNum" class="h">
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
			<div class="listMain">
				<!--分类-->
			<div class="nav-table">
			</div>
				<ol class="am-breadcrumb am-breadcrumb-slash">
					<!-- 
					<li><a href="#">首页</a></li>
					<li><a href="#">分类</a></li>
					<li class="am-active">内容</li>
					 -->
				</ol>
				<script type="text/javascript">
					$(function() {});
					$(window).load(function() {
						$('.flexslider').flexslider({
							animation: "slide",
							start: function(slider) {
								$('body').removeClass('loading');
							}
						});
					});
				</script>
				<div class="scoll">
					<section class="slider">
						<div class="flexslider">
							<ul class="slides">
								<li>
									<img src="${requestScope.goods.goodsImg}" title="pic" />
								</li>
								<li>
									<img src="one/images/02.jpg" />
								</li>
								<li>
									<img src="one/images/03.jpg" />
								</li>
							</ul>
						</div>
					</section>
				</div>
				<!--放大镜-->
				<div class="item-inform">
					<div class="clearfixLeft" id="clearcontent">
						<div class="box">
							<script type="text/javascript">
								$(document).ready(function() {
									$(".jqzoom").imagezoom();
									$("#thumblist li a").click(function() {
										$(this).parents("li").addClass("tb-selected").siblings().removeClass("tb-selected");
										$(".jqzoom").attr('src', $(this).find("img").attr("mid"));
										$(".jqzoom").attr('rel', $(this).find("img").attr("big"));
									});
								});
							</script>
							<div class="tb-booth tb-pic tb-s310">
								<a href="${requestScope.goods.goodsImg}"><img src="${requestScope.goods.goodsImg}" alt="细节展示放大镜特效" rel="${requestScope.goods.goodsImg}" class="jqzoom" /></a>
							</div>
						</div>
						<div class="clear"></div>
					</div>
					<div class="clearfixRight">
						<!--规格属性-->
						<!--名称-->
						<div class="tb-detail-hd">
							<h1>	
				 ${requestScope.goods.goodsName}
	          </h1>
						</div>
						<div class="tb-detail-list">
							<!--价格-->
							<c:set var="price" value="${requestScope.price }"></c:set>
							<c:set var="originalprice" value="${requestScope.originalprice }"></c:set>
							<c:if test="${price<originalprice}">
								<div class="tb-detail-price">
									<li class="price iteminfo_price">
										<dt>促销价</dt>
										<dd><em>¥</em><b class="sys_item_price"><fmt:formatNumber minFractionDigits="2" value="${price }"/></b>  </dd>                                 
									</li>
									<li class="price iteminfo_mktprice">
										<dt>原价</dt>
										<dd><em>¥</em><b class="sys_item_mktprice"><fmt:formatNumber minFractionDigits="2" value="${originalprice }"/></b></dd>									
									</li>
									<div class="clear"></div>
								</div>
							</c:if>
							<c:if test="${price>originalprice || originalprice==0}">
								<div class="tb-detail-price" style="height: 40px">
									<li class="price iteminfo_price">
										<dt>价格</dt>
										<dd><em>¥</em><b class="sys_item_price"><fmt:formatNumber minFractionDigits="2" value="${price }"/></b></dd>                                 
									</li>
									<div class="clear"></div>
								</div>
							</c:if>
							
							<!--
							<dl class="iteminfo_parameter freight">
								<dt>配送至</dt>
								<div class="iteminfo_freprice">
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
									<div class="pay-logis">
										快递<b class="sys_item_freprice">10</b>元
									</div>
								</div>
							</dl>
							-->
							<div class="clear"></div>
							<!--销量-->
							<ul class="tm-ind-panel" style="margin-top: 20px">
								<li class="tm-ind-item tm-ind-sellCount canClick">
									<div class="tm-indcon"><span class="tm-label">月销量</span><span class="tm-count">${requestScope.monthsale }</span></div>
								</li>
								<li class="tm-ind-item tm-ind-sumCount canClick">
									<div class="tm-indcon"><span class="tm-label">累计销量</span><span class="tm-count">${requestScope.sale }</span></div>
								</li>
								<li class="tm-ind-item tm-ind-reviewCount canClick tm-line3">
									<div class="tm-indcon"><span class="tm-label">累计评价</span><span class="tm-count">${requestScope.sum }</span></div>
								</li>
							</ul>
							<div class="clear"></div>
							<!--各种规格-->
							<dl class="iteminfo_parameter sys_item_specpara">
								<dt class="theme-login"><div class="cart-title">可选规格<span class="am-icon-angle-right"></span></div></dt>
								<dd>
									<!--操作页面-->
									<div class="theme-popover-mask"></div>
									<div class="theme-popover">
										<div class="theme-span"></div>
										<div class="theme-poptit">
											<a href="javascript:;" title="关闭" class="close">×</a>
										</div>
										<div class="theme-popbod dform">
											<form class="theme-signin" name="loginform" action="" method="post">
												<div class="theme-signin-left">
													<div class="theme-options">
														<div class="cart-title number">数量</div>
														<dd>
															<input id="min" class="am-btn am-btn-default" name="" type="button" value="-" />
															<input id="text_box" name="" type="text" value="1" style="width:30px;" />
															<input id="add" class="am-btn am-btn-default" name="" type="button" value="+" />
															<span id="Stock" class="tb-hidden">库存<span class="stock">${requestScope.goods.goodsStock }</span>件</span>
														</dd>
													</div>
													<div class="clear"></div>
													<div class="btn-op">
														<div class="btn am-btn am-btn-warning">确认</div>
														<div class="btn close am-btn am-btn-warning">取消</div>
													</div>
												</div>
												<div class="theme-signin-right">
													<div class="img-info">
														<img src="one/images/songzi.jpg" />
													</div>
													<div class="text-info">
														<span class="J_Price price-now">¥39.00</span>
														<span id="Stock" class="tb-hidden">库存<span class="stock">1000</span>件</span>
													</div>
												</div>
											</form>
										</div>
									</div>
								</dd>
							</dl>
							<div class="clear"></div>
						</div>
						<div class="pay">
							<div class="pay-opt">
							<a href="home.html"><span class="am-icon-home am-icon-fw">首页</span></a>
							<a><span class="am-icon-heart am-icon-fw">收藏</span></a>
							</div>
							<li>
								<div class="clearfix tb-btn tb-btn-buy theme-login">
									<c:if test="${sessionScope.user==null }">
										<a id="LikBuy" title="加入购物车" href="one/home/login.jsp"><i></i>加入购物车</a>
									</c:if>
									<c:if test="${sessionScope.user!=null }">
										<a id="LikBuy" title="加入购物车" href="/Test/addToCart?userID=${sessionScope.user.userID}&goodsID=${requestScope.goods.goodsID}"><i></i>加入购物车</a>
									</c:if>
								</div>
							</li>
							<li>
								<div class="clearfix tb-btn tb-btn-basket theme-login">
									<c:if test="${sessionScope.user==null }">
										<a id="LikBasket" title="收藏商品" href="one/home/login.jsp">收藏商品</a>
									</c:if>
									<c:if test="${sessionScope.user!=null }">
										<a id="LikBasket" title="收藏商品" href="/Test/addToFavorite?userID=${sessionScope.user.userID}&goodsID=${requestScope.goods.goodsID}">收藏商品</a>
									</c:if>
									
								</div>
							</li>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<hr style="margin-left: 55px;margin-right: 55px;">
				<!-- introduce-->
				<div class="introduce">
					<div class="browse">
					    <div class="mc"> 
						     <ul>					    
						     	<div class="mt">            
						            <h2>看了又看</h2>        
					            </div>							      
							      <li>
							      	<div class="p-img">                    
							      		<a  href="#"> <img class="" src="/Test/GoodsImg/nabaodi.jpg"> </a>               
							      	</div>
							      	<div class="p-name"><a href="#">
							      		印尼进口丽芝士纳宝帝奶酪威化饼干200g
							      	</a>
							      	</div>
							      	<div class="p-price"><strong>￥10.80</strong></div>
							      </li>							      
						     </ul>					
					    </div>
					</div>
					<div class="introduceMain">
						<div class="am-tabs" data-am-tabs>
							<ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active">
									<a href="#">
										<span class="index-needs-dt-txt">宝贝详情</span></a>
								</li>
								<li>
									<a href="#">
										<span class="index-needs-dt-txt">全部评价</span></a>
								</li>
								<li>
									<a href="#">
										<span class="index-needs-dt-txt">猜你喜欢</span></a>
								</li>
							</ul>
							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active">
									<div class="details">
										${requestScope.goods.goodsDetail}
									</div>
									<div class="clear"></div>
								</div>
								<div class="am-tab-panel am-fade">
                                    <div class="actor-new">
                                    	<div class="rate">                
                                    		<strong><fmt:formatNumber maxFractionDigits="1" value="${requestScope.avg }"/><span>分</span></strong><br> <span>综合评分</span>            
                                    	</div>
                                        <dl>                    
                                            <dt><font color="black">评论数:</font>(${requestScope.sum })</dt><br>                    
                                            <dt><font color="black">好评:</font>(${requestScope.good })&nbsp;&nbsp;&nbsp;
                                            <font color="black">中评:</font>(${requestScope.normal })&nbsp;&nbsp;&nbsp;
                                            <font color="black">差评:</font>(${requestScope.bad })</dt>                                   
                                         </dl> 
                                    </div>
									<div class="clear"></div>
									<ul class="am-comments-list am-comments-list-flip">
										<c:forEach items="${commentlist }" var="items">
											<c:if test="${items.score==5 }">
												<li class="am-comment am-comment-success">
													<img class="am-comment-avatar" src="${items.user.userImg }" />
												<div class="am-comment-main">
												<!-- 评论内容容器 -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">评论标题</h3>-->
													<div class="am-comment-meta">
														<!-- 评论元数据 -->
														<a href="#link-to-user" class="am-comment-author">${items.user.userLoginName }</a>
														<!-- 评论者 -->
														评论于
														<time datetime=""><fmt:formatDate type="both" value="${items.commentCreatetime }"/></time>
													</div>
												</header>
												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="255776406962">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															${items.commenttext }
														</div>
													</div>
												</div>
												<!-- 评论内容 -->
											</div>
											</li>
											</c:if>
											<c:if test="${items.score==3 }">
												<li class="am-comment am-comment-warning">
													<img class="am-comment-avatar" src="${items.user.userImg }" />
												<div class="am-comment-main">
												<!-- 评论内容容器 -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">评论标题</h3>-->
													<div class="am-comment-meta">
														<!-- 评论元数据 -->
														<a href="#link-to-user" class="am-comment-author">${items.user.userLoginName }</a>
														<!-- 评论者 -->
														评论于
														<time datetime=""><fmt:formatDate type="both" value="${items.commentCreatetime }"/></time>
													</div>
												</header>
												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="255776406962">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															${items.commenttext }
														</div>
													</div>
												</div>
												<!-- 评论内容 -->
											</div>
											</li>
											</c:if>
											<c:if test="${items.score==1 }">
												<li class="am-comment am-comment-danger">
													<img class="am-comment-avatar" src="${items.user.userImg }" />
												<div class="am-comment-main">
												<!-- 评论内容容器 -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">评论标题</h3>-->
													<div class="am-comment-meta">
														<!-- 评论元数据 -->
														<a href="#link-to-user" class="am-comment-author">${items.user.userLoginName }</a>
														<!-- 评论者 -->
														评论于
														<time datetime=""><fmt:formatDate type="both" value="${items.commentCreatetime }"/></time>
													</div>
												</header>
												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="255776406962">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															${items.commenttext }
														</div>
													</div>
												</div>
												<!-- 评论内容 -->
											</div>
											</li>
											</c:if>
										</c:forEach>
									</ul>
									<div class="clear"></div>
									<!--分页 -->
									<ul class="am-pagination am-pagination-right">
									</ul>
									<div class="clear"></div>
								</div>
								<div class="am-tab-panel am-fade">
									<div class="like">
										<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
											<li>
												<div class="i-pic limit">
													<img src="one/images/imgsearch1.jpg" />
													<p>【良品铺子_开口松子】零食坚果特产炒货
														<span>东北红松子奶油味</span></p>
													<p class="price fl">
														<b>¥</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
										</ul>
									</div>
									<div class="clear"></div>
									<!--分页 -->
									<ul class="am-pagination am-pagination-right">
										<li class="am-disabled"><a href="#">&laquo;</a></li>
										<li class="am-active"><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">&raquo;</a></li>
									</ul>
									<div class="clear"></div>
								</div>
							</div>
						</div>
						<div class="clear"></div>
						<div class="footer">
						</div>
					</div>
				</div>
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
	</body>
</html>