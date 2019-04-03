<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>后台管理</title>
<meta name="author" content="DeathGhost" />
<link rel="stylesheet" type="text/css" href="/Test/background/css/style.css" />
<link href="/Test/one/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="/Test/background/js/html5.js"></script>
<![endif]-->
<script src="/Test/background/js/jquery.js"></script>
<script src="/Test/background/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script>
	(function($){
		$(window).load(function(){
			
			$("a[rel='load-content']").click(function(e){
				e.preventDefault();
				var url=$(this).attr("href");
				$.get(url,function(data){
					$(".content .mCSB_container").append(data); //load new content inside .mCSB_container
					//scroll-to appended content 
					$(".content").mCustomScrollbar("scrollTo","h2:last");
				});
			});
			
			$(".content").delegate("a[href='top']","click",function(e){
				e.preventDefault();
				$(".content").mCustomScrollbar("scrollTo",$(this).attr("href"));
			});
			
		});
	})(jQuery);
</script>
<!--CSS-->
<link rel="stylesheet" href="/Test/background/css/styles.css" />
<!--Google Webfont -->
<link href='http://fonts.googleapis.com/css?family=Istok+Web' rel='stylesheet' type='text/css' />
<!--Javascript-->
<script type="text/javascript" src="/Test/background/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/Test/background/js/jquery.flexslider.js"></script>
<script type="text/javascript" src="/Test/background/js/jquery.easing.js"></script>
<script type="text/javascript" src="/Test/background/js/jquery.jcarousel.js"></script>
<script type="text/javascript" src="/Test/background/js/form_elements.js"></script>
<script type="text/javascript" src="/Test/background/js/custom.js"></script>
<script type="text/javascript" src="/Test/background/js/amazeui.min.js"></script>
<!--[if lt IE 9]>
    <script src="js/html5.js"></script>
<![endif]-->
<!-- mobile setting -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
<div class="wrapper">
    <div class="header_container">
        <!--Header Starts-->
        <header>
            <div class="top_bar clear" style="height: 50px;">
            </div>
            <!--Logo Starts-->
            <h1 class="logo1"> <a href="leisure_index.html"><img src="/Test/background/images/logo.png" /></a> </h1>
            <!--Logo Ends-->
        </header>
        <!--Header Ends-->
    </div>
    </div>
   <div class="navigation_container">
   </div>

<!--aside nav-->
<aside class="lt_aside_nav content mCustomScrollbar">
 <h2><font style="font-size: 20px;font-weight: bold;">后台管理</font></h2>
 <ul>
  <li>
  <dl>
  <dt>用户管理</dt>
   <dd><a href="/Test/BackUsers?CurrentPage=1">用户个人信息</a></dd>
   </dl>
   <dl>
    <dt>商品管理</dt>
    <dd><a href="/Test/BackGoods?CurrentPage=1&param=3">商品信息</a></dd>
    <dd><a href="/Test/BackGoodsPage">商品添加</a></dd>
   </dl>
  </li>
  <li>
   <dl>
    <dt>订单管理</dt>
    <dd><a class="active" href="/Test/BackOrder?CurrentPage=1&param=7">订单信息</a></dd>
   </dl>
  </li>
  <li>
   
  </li>
 </ul>
</aside>

<section class="center">
<div class="page_title">
       <h2 class="fl">订单信息</h2>
      </div>
      <ol class="am-breadcrumb am-breadcrumb-slash" style="margin-top: 1em;margin-bottom: 1em">
			<li><a href="/Test/BackOrder?CurrentPage=1&param=7">所有订单</a></li>
			<li><a href="/Test/BackOrder?CurrentPage=1&param=0">待支付</a></li>
			<li><a href="/Test/BackOrder?CurrentPage=1&param=1">待发货</a></li>
			<li><a href="/Test/BackOrder?CurrentPage=1&param=2">已发货</a></li>
			<li><a href="/Test/BackOrder?CurrentPage=1&param=3">已收货</a></li>
			<li><a href="/Test/BackOrder?CurrentPage=1&param=4">退款中</a></li>
			<li><a href="/Test/BackOrder?CurrentPage=1&param=5">已删除</a></li>
			<li><a href="/Test/BackOrder?CurrentPage=1&param=6">已处理</a></li>
	  </ol>
			    	<table class="am-table am-table-striped am-table-hover am-table-bordered">
				       <tr>
				        <th width="100px" style="text-align: center;">订单编号</th>
				        <th width="150px" style="text-align: center;">用户名</th>
				        <th width="100px" style="text-align: center;">商品数量</th>
				        <th width="150px" style="text-align: center;">下单时间</th>
				        <th width="100px" style="text-align: center;">时间</th>
				        <th width="230px" style="text-align: center;">备注</th>
				        <th width="100px" style="text-align: center;">订单状态</th>
				        <th width="150px" style="text-align: center;">操作</th>
				       </tr>
				       <c:forEach items="${requestScope.orderList}" var="items">
				       <tr>
				        <td style="text-align: center;">${items.orderID }</td>
				        <td style="text-align: center;">${items.user.userLoginName }</td>
				        <td style="text-align: center;">${items.orderNumber }</td>
				        <td style="text-align: center;"><fmt:formatDate type="both" value="${items.orderCreatetime }" /></td>
				        <td style="text-align: center;">
				        	<c:if test="${items.remainingTime>=0 }">
					        	<fmt:formatNumber var="day" type="number" value="${items.remainingTime/1440}" maxFractionDigits="0"/>
					        	<c:if test="${(items.remainingTime-day*1440)/60>=0}">
					        		<fmt:formatNumber var="hour" type="number" value="${(items.remainingTime-day*1440)/60}" maxFractionDigits="0"/>
					        	</c:if>
					        	<c:if test="${(items.remainingTime-day*1440)/60<0}">
					        		<fmt:formatNumber var="day" type="number" value="${day-1}"/> 
					        		<fmt:formatNumber var="hour" type="number" value="${(items.remainingTime-day*1440)/60}" maxFractionDigits="0"/>
					        	</c:if>
					        	<c:if test="${(items.remainingTime-day*1440-hour*60)/60>=0}">
					        		<fmt:formatNumber var="minute" type="number" value="${items.remainingTime-day*1440-hour*60}"/>
					        	</c:if>
					        	<c:if test="${(items.remainingTime-day*1440-hour*60)/60<0}">
					        		<fmt:formatNumber var="hour" type="number" value="${hour-1}"/> 
					        		<fmt:formatNumber var="minute" type="number" value="${items.remainingTime-day*1440-hour*60}"/>
					        	</c:if>
					        	剩余
					        		<c:if test="${day!=0 }">
							        	<c:out value="${day }"/>天
							        	<c:out value="${hour }"/>小时
							        	<c:out value="${minute }"/>分钟
						        	</c:if>
						        	<c:if test="${day==0 }">
						        		<c:if test="${hour!=0 }">
								        	<c:out value="${hour }"/>小时
								        	<c:out value="${minute }"/>分钟
							        	</c:if>
							        	<c:if test="${hour==0 }">
								        	<c:out value="${minute }"/>分钟
							        	</c:if>
						        	</c:if>
				        	</c:if>
				        	<c:if test="${items.remainingTime<0 }">
				        		<fmt:formatNumber var="time" type="number" groupingUsed="false" value="${-items.remainingTime }"></fmt:formatNumber>
				        		<fmt:formatNumber var="day" type="number" value="${time/1440}" maxFractionDigits="0"/>
					        	<c:if test="${(time-day*1440)/60>=0}">
					        		<fmt:formatNumber var="hour" type="number" value="${(time-day*1440)/60}" maxFractionDigits="0"/>
					        	</c:if>
					        	<c:if test="${(time-day*1440)/60<0}">
					        		<fmt:formatNumber var="day" type="number" value="${day-1}"/> 
					        		<fmt:formatNumber var="hour" type="number" value="${(time-day*1440)/60}" maxFractionDigits="0"/>
					        	</c:if>
					        	<c:if test="${(time-day*1440-hour*60)/60>=0}">
					        		<fmt:formatNumber var="minute" type="number" value="${time-day*1440-hour*60}"/>
					        	</c:if>
					        	<c:if test="${(time-day*1440-hour*60)/60<0}">
					        		<fmt:formatNumber var="hour" type="number" value="${hour-1}"/> 
					        		<fmt:formatNumber var="minute" type="number" value="${time-day*1440-hour*60}"/>
					        	</c:if>
					        	已过
					        		<c:if test="${day!=0 }">
							        	<c:out value="${day }"/>天
							        	<c:out value="${hour }"/>小时
							        	<c:out value="${minute }"/>分钟
						        	</c:if>
						        	<c:if test="${day==0 }">
						        		<c:if test="${hour!=0 }">
								        	<c:out value="${hour }"/>小时
								        	<c:out value="${minute }"/>分钟
							        	</c:if>
							        	<c:if test="${hour==0 }">
								        	<c:out value="${minute }"/>分钟
							        	</c:if>
						        	</c:if>
				        	</c:if>
				        </td>
				        <td style="text-align: center;">${items.orderNote }</td>
				        <td style="text-align: center;">
				        	<c:if test="${items.orderStatus eq 48 }"><span class="am-badge am-round am-text-xxs">待支付</span></c:if>
				 			<c:if test="${items.orderStatus eq 49 }"><span class="am-badge am-round am-text-xxs am-badge-danger">待发货</span></c:if>
				 			<c:if test="${items.orderStatus eq 50 }"><span class="am-badge am-round am-text-xxs am-badge-secondary">已发货</span></c:if>
				 			<c:if test="${items.orderStatus eq 51 }"><span class="am-badge am-round am-text-xxs am-badge-success">已收货</span></c:if>
				 			<c:if test="${items.orderStatus eq 52 }"><span class="am-badge am-round am-text-xxs am-badge-warning">退款中</span></c:if>
				 			<c:if test="${items.orderStatus eq 53 }"><span class="am-badge am-round am-text-xxs">已删除</span></c:if>
				 			<c:if test="${items.orderStatus eq 54 }"><span class="am-badge am-round am-text-xxs am-badge-warning">退款已处理</span></c:if>
				 		</td>
				        <td style="text-align: center;">
				        	<c:if test="${items.orderStatus eq 49 }">
				        	<a href="/Test/SendOutGoods?orderID=${items.orderID }">确认发货</a>
				        	</c:if>
				         	<a href="/Test/BackOrderDetail?orderID=${items.orderID }">查看详情</a>
				        </td>
				       </tr>
				       </c:forEach>
				      </table>
				      <ul class="am-pagination am-pagination-right">
						<c:forEach var="i" begin="1" end="${number}">
							<c:if test="${i==param.CurrentPage}">
								<li class="am-active">
									<a href="BackOrder?CurrentPage=${i}&param=${requestScope.param}">
										<c:out value="${i}"/>
									</a>
								</li>
							</c:if>
							<c:if test="${i!=param.CurrentPage}">
								<li>
									<a href="BackOrder?CurrentPage=${i}&param=${requestScope.param}">
										<c:out value="${i}"/>
									</a>
								</li>
							</c:if>
						</c:forEach>
					</ul>
     </section>
</body>
</html>
