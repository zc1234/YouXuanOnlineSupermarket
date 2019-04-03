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
   <dd><a class="active" href="/Test/BackUsers?CurrentPage=1">用户个人信息</a></dd>
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
       <h2 class="fl">用户个人信息</h2>
      </div>
      <table class="am-table am-table-striped am-table-hover am-table-bordered">
       <tr>
        <th width="100px" style="text-align:center;">用户编号</th>
        <th width="150px" style="text-align:center;">用户名</th>
        <th width="150px" style="text-align:center;">真实姓名</th>
        <th width="100px" style="text-align:center;">性别</th>
        <th width="150px" style="text-align:center;">生日</th>
        <th width="100px" style="text-align:center;">用户积分</th>
        <th width="100px" style="text-align:center;">状态</th>
        <th width="230px" style="text-align:center;">操作</th>
       </tr>
       <c:forEach items="${requestScope.usersList}" var="items">
       <tr>
        <td style="text-align:center;">${items.userID }</td>
        <td style="text-align:center;">${items.userLoginName }</td>
        <td style="text-align:center;">${items.userName }</td>
        <td style="text-align:center;">
        	<c:if test="${items.userSex eq 49 }"><span>男</span></c:if>
        	<c:if test="${items.userSex eq 48 }"><span>女</span></c:if>
        	<c:if test="${items.userSex eq 50 }"><span>保密</span></c:if>
        	<c:if test="${items.userSex eq '' }"><span>未知</span></c:if>
        </td>
        <td style="text-align:center;">
        	<c:if test="${items.userBirthday!=null }">
        		<fmt:formatDate type="date" value="${items.userBirthday }" />
        	</c:if>
        	<c:if test="${items.userBirthday==null }">
        		<span>未知</span>
        	</c:if>
        </td>
        <td style="text-align:center;">${items.userScore }</td>
        <td style="text-align:center;">
        	<c:if test="${items.userStatus eq 48 }">
				<span class="am-badge am-round am-text-xxs">已禁用</span>
        	</c:if>
        	<c:if test="${items.userStatus eq 49 }">
				<span class="am-badge am-badge-primary am-round am-text-xxs">用户</span>
        	</c:if>
        	<c:if test="${items.userStatus eq 50 }">
				<span class="am-badge am-badge-danger am-round am-text-xxs">管理员</span>
			</c:if>	
		</td>
        <td style="text-align:center;">
        	<c:if test="${items.userStatus eq 48 }">
        		<a href="RecoverUser?userID=${items.userID}">启用</a>
        	</c:if>
        	<c:if test="${items.userStatus eq 49 }">
        		<a href="DeleteUser?userID=${items.userID}">禁用</a>
        	</c:if>
        	<c:if test="${items.userStatus != 50 }">
        		<a href="GrantAdmin?userID=${items.userID}">授予管理员权限</a>
        	</c:if>
        </td>
       </tr>
       </c:forEach>
      </table>
      <ul class="am-pagination am-pagination-right">
		<c:forEach var="i" begin="1" end="${number}">
			<c:if test="${i==param.CurrentPage}">
				<li class="am-active">
					<a href="BackUsers?CurrentPage=${i}">
						<c:out value="${i}"/>
					</a>
				</li>
			</c:if>
			<c:if test="${i!=param.CurrentPage}">
				<li>
					<a href="BackUsers?CurrentPage=${i}">
						<c:out value="${i}"/>
					</a>
				</li>
			</c:if>
		</c:forEach>
	</ul>
     </section>
</body>
</html>
