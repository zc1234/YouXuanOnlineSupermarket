<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
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
<script type="text/javascript" src="/Test/background/js/custom.js"></script>
<script type="text/javascript" src="/Test/background/js/amazeui.min.js"></script>
<!--[if lt IE 9]>
    <script src="/Test/js/html5.js"></script>
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
    <dd><a class="active" href="/Test/BackGoods?CurrentPage=1&param=3">商品信息</a></dd>
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
       <h2 class="fl">商品信息</h2>
      </div>
      <ol class="am-breadcrumb am-breadcrumb-slash" style="margin-top: 1em;margin-bottom: 1em">
			<li><a href="/Test/BackGoods?CurrentPage=1&param=3">所有商品</a></li>
			<li><a href="/Test/BackGoods?CurrentPage=1&param=1">正常商品</a></li>
			<li><a href="/Test/BackGoods?CurrentPage=1&param=0">下架商品</a></li>
			<li><a href="/Test/BackGoods?CurrentPage=1&param=2">积分兑换商品</a></li>
	  </ol>
      <table class="am-table am-table-striped am-table-hover am-table-bordered">
       <tr>
       	<th width="100px" style="text-align:center;">商品编号</th>
        <th width="100px" style="text-align:center;">商品图片</th>
        <th width="200px" style="text-align:center;">商品名称</th>
        <c:if test="${requestScope.param == 2 }">
        <th width="100px" style="text-align:center;">所需积分</th>
        </c:if>
        <c:if test="${requestScope.param != 2 }">
        <th width="100px" style="text-align:center;">商品价格</th>
        </c:if>
        <th width="150px" style="text-align:center;">上架时间</th>
        <th width="100px" style="text-align:center;">库存</th>
        <th width="150px" style="text-align:center;">状态</th>
        <th width="180px" style="text-align:center;">操作</th>
       </tr>
       <c:forEach items="${requestScope.goodsList}" var="items">
       <tr>
       	<td style="text-align:center;">${items.goodsID }</td>
		<td style="text-align:center;"><img src="${items.goodsImg }" width="80px" height="80px"/></td>
        <td style="text-align:center;"><a href="/Test/detail?goodsID=${items.goodsID }">${items.goodsName }</a></td>
        <c:if test="${items.goodsStatus != 50 }">
        <td style="text-align:center;"><fmt:formatNumber value="${items.goodsPrice }" type="number" pattern="#,##0.00"/></td>
        </c:if>
        <c:if test="${items.goodsStatus == 50 }">
        <td style="text-align:center;">${items.goodsScore }</td>
        </c:if>
        <td style="text-align:center;"><fmt:formatDate type="both" value="${items.goodsCreatetime }" /></td>
        <td style="text-align:center;">${items.goodsStock }</td>
        <td style="text-align:center;">
        	<c:if test="${items.goodsStatus eq 50 }"><span class="am-badge am-badge-success am-round">积分兑换</span></c:if>
        	<c:if test="${items.goodsStatus eq 49 }"><span class="am-badge am-badge-primary am-round">正常</span></c:if>
        	<c:if test="${items.goodsStatus eq 48 }"><span class="am-badge am-round">下架</span></c:if>	
        </td>
        <td style="text-align:center;">
         <c:if test="${items.goodsStatus eq 50 }">
         <a href="/Test/BackGoodsUpdatePricePage?goodsID=${items.goodsID}">修改积分</a>
         </c:if>
         <c:if test="${items.goodsStatus != 50 }">
         <a href="/Test/BackGoodsUpdatePricePage?goodsID=${items.goodsID}">修改价格</a>
         </c:if>
         <a href="/Test/BackGoodsUpdatePage?goodsID=${items.goodsID}">修改</a>
         <c:if test="${items.goodsStatus eq 49 }">
         	<a href="/Test/DeleteGoods?goodsID=${items.goodsID}">下架</a>
         </c:if>
         <c:if test="${items.goodsStatus eq 48 }">
         	<a href="/Test/RecoverGoods?goodsID=${items.goodsID}">上架</a>
         </c:if>
        </td>
       </tr>
       </c:forEach>
      </table> 
      <ul class="am-pagination am-pagination-right">
		<c:forEach var="i" begin="1" end="${number}">
			<c:if test="${i==param.CurrentPage}">
				<li class="am-active">
					<a href="BackGoods?CurrentPage=${i}&param=${requestScope.param}">
						<c:out value="${i}"/>
					</a>
				</li>
			</c:if>
			<c:if test="${i!=param.CurrentPage}">
				<li>
					<a href="BackGoods?CurrentPage=${i}&param=${requestScope.param}">
						<c:out value="${i}"/>
					</a>
				</li>
			</c:if>
		</c:forEach>
	</ul>
     </section>
</body>
</html>
