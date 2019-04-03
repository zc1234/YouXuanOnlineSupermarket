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
    <dd><a href="/Test/BackOrder?CurrentPage=1&param=7">订单信息</a></dd>
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
      <table class="am-table am-table-hover am-table-bordered">
       <tr>
        <th width="100px" style="text-align: center;">订单项编号</th>
        <th width="100px" style="text-align: center;">商品图片</th>
        <th width="150px" style="text-align: center;">商品名称</th>
        <th width="100px" style="text-align: center;">商品价格</th>
        <th width="100px" style="text-align: center;">购买数量</th>
        <th width="100px" style="text-align: center;">价格</th>
        <th width="150px" style="text-align: center;">订单项状态</th>
        <th width="180px" style="text-align: center;">操作</th>
       </tr>
       <c:forEach items="${requestScope.orderItemsList}" var="items">
       <tr>
        <td style="text-align: center;">${items.orderitemsID }</td>
        <td style="text-align: center;"><img src="${items.goods.goodsImg }" width="80px" height="80px"/></td>
        <td style="text-align: center;"><a href="/Test/detail?goodsID=${items.goods.goodsID }">${items.goods.goodsName }</a></td>
        <td style="text-align: center;"><fmt:formatNumber value="${items.goods.goodsPrice }" type="number" pattern="#,##0.00"/></td>
        <td style="text-align: center;">${items.goodsNumber }</td>
        <td style="text-align: center;">
        	<fmt:formatNumber value="${items.priceSum }" type="number" pattern="#,##0.00"/>
 		</td>
 		<td style="text-align: center;">
 		<c:if test="${items.orderitemsStatus eq 48 }"><font color="red">退款中</font></c:if>
 		<c:if test="${items.orderitemsStatus eq 49 }">未评价</c:if>
 		<c:if test="${items.orderitemsStatus eq 50 }">已评价</c:if>
 		<c:if test="${items.orderitemsStatus eq 51 }">已处理</c:if>
 		</td>
        <td style="text-align: center;">
        	<c:if test="${items.orderitemsStatus eq 48 }">
         		<a href="/Test/BackRefund?orderitemsID=${items.orderitemsID }">查看详情</a>
        	</c:if>
        	<c:if test="${items.orderitemsStatus eq 51 }">
         		<a href="/Test/BackRefund?orderitemsID=${items.orderitemsID }">查看详情</a>
        	</c:if>
        	<!-- 
        		<a href="/Test/BackOrderDetail?orderID=${items.orderitemsID }">查看详情</a>
        	 -->
        </td>
       </tr>
       </c:forEach>
      </table>
     </section>
</body>
</html>
