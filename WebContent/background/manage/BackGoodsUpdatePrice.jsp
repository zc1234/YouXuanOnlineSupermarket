<%@ page language="java" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String htmlData = request.getParameter("content") != null ? request.getParameter("content") : "";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>后台管理</title>
	<link rel="stylesheet" href="/Test/background/scripts/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="/Test/background/scripts/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="/Test/background/scripts/kindeditor/plugins/code/prettify.js"></script>
	<script charset="utf-8" src="/Test/background/scripts/kindeditor/kindeditor-all.js"></script>
	<script charset="utf-8" src="/Test/background/scripts/kindeditor/lang/zh-CN.js"></script>
	<script charset="utf-8" src="/Test/one/js/jquery.min.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor_id = K.create('textarea[name="goodsDetail"]', {
				cssPath : '/Test/background/scripts/kindeditor/plugins/code/prettify.css',
				uploadJson : '/Test/background/scripts/kindeditor/jsp/upload_json.jsp',
				fileManagerJson : '/Test/background/scripts/kindeditor/jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['AddGoods'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['AddGoods'].submit();
					});
				}
			});
			prettyPrint();
		});
	</script>
<meta name="author" content="DeathGhost" />
<link rel="stylesheet" type="text/css" href="/Test/background/css/back.css" />
<link rel="stylesheet" type="text/css" href="/Test/background/css/amazeui.min.css" />
<link rel="stylesheet" type="text/css" href="/Test/background/css/GoodsAdd.css" />
<link href="/Test/one/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="background/js/html5.js"></script>
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
<script>
  $(function() {
    $('#goodsImg').on('change', function() {
      var fileNames = '';
      $.each(this.files, function() {
        fileNames += '<span class="am-badge am-round">' + this.name + '</span> ';
      });
      $('#file-list').html(fileNames);
    });
  });
</script>
<!--CSS-->
<link rel="stylesheet" href="/Test/background/css/styles.css" />
<!--Google Webfont -->
<link href='http://fonts.googleapis.com/css?family=Istok+Web' rel='stylesheet' type='text/css' />
<!--Javascript-->
<%-- <script type="text/javascript" src="background/js/jquery-1.7.2.min.js"></script> --%>
<script type="text/javascript" src="/Test/background/js/jquery.flexslider.js"></script>
<script type="text/javascript" src="/Test/background/js/jquery.easing.js"></script>
<script type="text/javascript" src="/Test/background/js/jquery.jcarousel.js"></script>
<script type="text/javascript" src="/Test/background/js/form_elements.js"></script>
<script type="text/javascript" src="/Test/background/js/custom.js"></script>
<script type="text/javascript" src="/Test/background/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="/Test/background/js/amazeui.min.js"></script>
<script type="text/javascript" src="/Test/one/js/jquery.min.js"></script>
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
    <dd><a class="active" href="/Test/BackGoodsPage">商品添加</a></dd>
   </dl>
  </li>
  <li>
   <dl>
    <dt>订单管理</dt>
    <dd><a href="/Test/BackOrder?CurrentPage=1&param=7">订单信息</a></dd>
   </dl>
  </li>
 </ul>
</aside>

 <section>
 <div class="page_title">
       <h2 class="fl">商品价格修改</h2>
      </div>
      <form class="am-form am-form-horizontal" method="post" action="/Test/BackGoodsUpdatePrice?goodsID=${goods.goodsID }">
          <div class="am-form-group">
		    <label for="goodsImg" class="am-u-md-2 am-form-label" style="font-size: 15px;padding-right: 0em;padding-top: 0.3em">商品图片：</label>
		    <div class="am-u-sm-10">
		      <img alt="${goods.goodsName }" src="${goods.goodsImg }" width="200px" height="200px"/>
		    </div>
		  </div>
          <div class="am-form-group">
		    <label for="goodsName" class="am-u-md-2 am-form-label" style="font-size: 15px;padding-right: 0em;padding-top: 0.3em">商品名称：</label>
		    <div class="am-u-sm-10" style="height: 30px;margin-top: 7px;">
		      <span>${goods.goodsName }</span>
		    </div>
		  </div>
		  <c:if test="${goods.goodsOriginalPrice==0 }">
		  	<c:if test="${goods.goodsStatus != 50 }">
			  	<div class="am-form-group">
			    	<label for="goodsPrice" class="am-u-md-2 am-form-label" style="font-size: 15px;padding-right: 0em;padding-top: 0.3em">商品价格：</label>
			    	<div class="am-u-sm-10" style="height: 30px;margin-top: 7px;">
			    			<span><fmt:formatNumber value="${goods.goodsPrice }" type="number" pattern="#,##0.00"/>元</span>
			    	</div>
			  	</div>
		  	</c:if>
		  	<c:if test="${goods.goodsStatus eq 50 }">
		  		<div class="am-form-group">
			    	<label for="goodsPrice" class="am-u-md-2 am-form-label" style="font-size: 15px;padding-right: 0em;padding-top: 0.3em">所需积分：</label>
			    	<div class="am-u-sm-10" style="height: 30px;margin-top: 7px;"> 		
			    		<span>${goods.goodsScore }分</span>	
			    	</div>
			  	</div>
		  	</c:if>
		  </c:if>
		  <c:if test="${goods.goodsOriginalPrice!=0 }">
		  	<c:if test="${goods.goodsStatus != 50 }">
		  		<div class="am-form-group">
				    <label for="goodsPrice" class="am-u-md-2 am-form-label" style="font-size: 15px;padding-right: 0em;padding-top: 0.3em">商品原价：</label>
				    <div class="am-u-sm-10" style="height: 30px;margin-top: 7px;">
				      <span><fmt:formatNumber value="${goods.goodsOriginalPrice }" type="number" pattern="#,##0.00"/>元</span>
				    </div>
				</div>
				<div class="am-form-group">
				    <label for="goodsPrice" class="am-u-md-2 am-form-label" style="font-size: 15px;padding-right: 0em;padding-top: 0.3em">商品现价：</label>
				    <div class="am-u-sm-10" style="height: 30px;margin-top: 7px;">
				      <span><fmt:formatNumber value="${goods.goodsPrice }" type="number" pattern="#,##0.00"/>元</span>
				    </div>
				</div>
		  	</c:if>
			<c:if test="${goods.goodsStatus eq 50 }">
				<div class="am-form-group">
				    <label for="goodsPrice" class="am-u-md-2 am-form-label" style="font-size: 15px;padding-right: 0em;padding-top: 0.3em">所需积分：</label>
				    <div class="am-u-sm-10" style="height: 30px;margin-top: 7px;">
				      <span>${goods.goodsScore }分</span>
				    </div>
				</div>
			</c:if>
		  </c:if>
		  <div class="am-form-group">
		  	<c:if test="${goods.goodsStatus != 50 }">
		    	<label for="goodsNewPrice" class="am-u-md-2 am-form-label" style="font-size: 15px;padding-right: 0em;padding-top: 0.3em">商品新价格：</label>
		    </c:if>
		    <c:if test="${goods.goodsStatus eq 50 }">
		    	<label for="goodsNewPrice" class="am-u-md-2 am-form-label" style="font-size: 15px;padding-right: 0em;padding-top: 0.3em">商品新积分：</label>
		    </c:if>
		    <div class="am-u-sm-10">
		    	<input style="width: 100px;height: 20px;" type="text" id="goodsNewPrice" name="goodsNewPrice" value="">
		    </div>
		  </div>
		  <div class="am-form-group">
		    <div class="am-u-sm-10 am-u-sm-offset-2">
		      <c:if test="${goods.goodsOriginalPrice!=0 }">
		  	  <a class="am-btn am-btn-danger am-btn-xs" href="/Test/BackGoodsRecoverPrice?goodsID=${goods.goodsID }">恢复原价</a>
		      </c:if>
		      <button type="submit" class="am-btn am-btn-primary am-btn-xs">提交信息</button>
		    </div>
		  </div>
      </form>
     </section>
     <!--tabStyle-->
     <script>
     $(document).ready(function(){
		 //tab
		 $(".admin_tab li a").click(function(){
		  var liindex = $(".admin_tab li a").index(this);
		  $(this).addClass("active").parent().siblings().find("a").removeClass("active");
		  $(".admin_tab_cont").eq(liindex).fadeIn(150).siblings(".admin_tab_cont").hide();
		 });
		 });
     </script>
</body>
</html>
<%!
private String htmlspecialchars(String str) {
	str = str.replaceAll("&", "&amp;");
	str = str.replaceAll("<", "&lt;");
	str = str.replaceAll(">", "&gt;");
	str = str.replaceAll("\"", "&quot;");
	return str;
}
%>