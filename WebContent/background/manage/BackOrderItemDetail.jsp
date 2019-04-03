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
<section>
<div class="page_title">
       <h2 class="fl">处理退款申请</h2>
      </div>
      <form class="am-form am-form-horizontal" method="post" action="/Test/BackRefundSubmit?refundID=${requestScope.refund.refundID }">
      <div class="am-form-group">
		    <label for="refundType" class="am-u-md-2 am-form-label" style="font-size: 15px;padding-right: 0em;padding-top: 0.3em">退款类型：</label>
		    <div class="am-u-sm-10"  style="font-size: 15px;margin-top: 5px;">
		      	<c:if test="${requestScope.refund.refundType eq 97 }">仅退款</c:if>
				<c:if test="${requestScope.refund.refundType eq 98 }">退货</c:if>
				<c:if test="${requestScope.refund.refundType eq 99 }">换货</c:if>
		    </div>
		  </div>
		  <div class="am-form-group">
		    <label for="refundReason" class="am-u-md-2 am-form-label" style="font-size: 15px;padding-right: 0em;padding-top: 0.3em">退款原因：</label>
		    <div class="am-u-sm-10" style="font-size: 15px;margin-top: 5px;">
		    	<c:if test="${requestScope.refund.refundReason eq 98 }">不想要了</c:if>
				<c:if test="${requestScope.refund.refundReason eq 99 }">买错了</c:if>
				<c:if test="${requestScope.refund.refundReason eq 100 }">没收到货</c:if>
				<c:if test="${requestScope.refund.refundReason eq 101 }">配送时间不符合要求</c:if>
				<c:if test="${requestScope.refund.refundReason eq 102 }">商品与说明不符</c:if>
				<c:if test="${requestScope.refund.refundReason eq 103 }">商品质量问题</c:if>
				<c:if test="${requestScope.refund.refundReason eq 104 }">其他</c:if>
		    </div>
		  </div>
		  <div class="am-form-group am-form-file">
		    <label for="refundDetail" class="am-u-md-2 am-form-label" style="font-size: 15px;padding-right: 0em;padding-top: 0.3em">退款说明：</label>
		    <div class="am-u-sm-10"  style="font-size: 15px;margin-top: 5px;">
		    	${requestScope.refund.refundDetail }
		    </div>
		  </div>
		  <c:if test="${requestScope.refund.refundStatus eq 48 }">
		  		<div class="am-form-group">
				    <label for="refundStatus" class="am-u-md-2 am-form-label" style="font-size: 15px;padding-right: 0em;padding-top: 0.3em">审核结果：</label>
				 	 <div class="am-u-sm-10" style="margin-top: 2px;">
					 	 	<label class="am-radio-inline" style="padding-top: 0;">
					 	 		<input type="radio" name="refundStatus" value="1" data-am-ucheck>允许
							</label> 
						    <label class="am-radio-inline" style="padding-top: 0;">
						      	<input type="radio" name="refundStatus" value="2" data-am-ucheck>拒绝
						    </label>
					 </div>
				  </div>
				  <div class="am-form-group">
				    <label for="refundResponse" class="am-u-md-2 am-form-label" style="font-size: 15px;padding-right: 0em;padding-top: 0.3em">回复信息：</label>
				    <div class="am-u-sm-10"  style="margin-top: 2px;">
					    <textarea name="refundResponse" style="font-size: 15px;width:400px;height:100px;"></textarea>
					 </div>
				  </div>
				  <div class="am-form-group">
				    <div class="am-u-sm-10 am-u-sm-offset-2">
				      <button type="submit" class="am-btn am-btn-default am-btn-xs">提交信息</button>
				    </div>
				  </div>
		  </c:if>
		  <c:if test="${requestScope.refund.refundStatus != 48 }">
		  		<div class="am-form-group">
				    <label for="refundStatus" class="am-u-md-2 am-form-label" style="font-size: 15px;padding-right: 0em;padding-top: 0.3em">审核结果：</label>
				 	<div class="am-u-sm-10"  style="margin-top: 5px;font-size: 15px;">
				 		<c:if test="${requestScope.refund.refundStatus eq 49 }">允许</c:if>
				 		<c:if test="${requestScope.refund.refundStatus eq 50 }">拒绝</c:if>
					</div>
				  </div>
				  <div class="am-form-group">
				    <label for="refundResponse" class="am-u-md-2 am-form-label" style="font-size: 15px;padding-right: 0em;padding-top: 0.3em">回复信息：</label>
				    <div class="am-u-sm-10" style="margin-top: 5px;font-size: 15px;">
					    ${requestScope.refund.refundResponse}
					 </div>
				  </div>
		  </c:if>
      </form>
</section>
</body>
</html>