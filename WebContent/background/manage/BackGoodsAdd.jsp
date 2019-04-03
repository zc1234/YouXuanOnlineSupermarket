<%@ page language="java" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String htmlData = request.getParameter("content") != null ? request.getParameter("content") : "";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
       <h2 class="fl">商品添加</h2>
      </div>
      <c:if test="${goods.goodsID!=null }">
      <form class="am-form am-form-horizontal" id="AddGoods" name="AddGoods" method="post" action="/Test/GoodsUpdate?goodsID=${goods.goodsID }" enctype="multipart/form-data">
      <div class="am-form-group">
		    <label for="goodsName" class="am-u-md-2 am-form-label" style="font-size: 15px;padding-right: 0em;padding-top: 0.3em">商品名称：</label>
		    <div class="am-u-sm-10">
		      <input style="width: 500px;height: 20px;" type="text" id="goodsName" name="goodsName" value="${goods.goodsName }">
		    </div>
		  </div>
		  <div class="am-form-group">
		    <label for="goodsPrice" class="am-u-md-2 am-form-label" style="font-size: 15px;padding-right: 0em;padding-top: 0.3em">商品价格：</label>
		    <div class="am-u-sm-10">
		      <input style="width: 500px;height: 20px;" type="text" id="goodsPrice" name="goodsPrice" value="${goods.goodsPrice }">
		    </div>
		  </div>
		  <div class="am-form-group am-form-file">
		    <label for="goodsImg" class="am-u-md-2 am-form-label" style="font-size: 15px;padding-right: 0em;padding-top: 0.8em">商品图片：</label>
		    <div class="am-u-sm-10">
		    	<button type="button" class="am-btn am-btn-secondary am-btn-xs" >
		    	<i class="am-icon-cloud-upload"></i>选择要上传的文件</button>
		      	<input type="file" id="goodsImg" name="file" style="width: 100px;height: 20px" multiple="multiple">
		    </div>
		  </div>  
		  <div class="am-form-group">
		  	<label for="goodsImgName" class="am-u-md-2 am-form-label" style="font-size: 15px;padding-right: 0em;padding-top: 0.3em">选取文件：</label>
		  	<div class="am-u-sm-10" id="file-list">
		  		<c:if test="${goods.goodsImg!=null }">
		  			<span class="am-badge am-badge-success am-round">当前图片:${filename}</span>
		  		</c:if>
			  	<c:if test="${requestScope.message!=null }">
			  		<span class="am-badge am-badge-success am-round">${requestScope.message}</span>
			  	</c:if>
		  	</div>
		  </div>
		  <div class="am-form-group">
		    <label for="goodsType" class="am-u-md-2 am-form-label" style="font-size: 15px;padding-right: 0em;padding-top: 0.9em">商品分类：</label>
		    <div class="am-u-sm-10 am-form-content type" style="margin-left: 0px;padding-left: 24px;">
		    	<select name="goodsType" data-am-selected="{maxHeight: 200, btnSize: 'xs'}">
		    		<option value="0" selected>请选择</option>
			    	<c:forEach items="${fatherTypes }" var="i">
						<c:forEach items="${i.childTypes }" var="j">
							<c:forEach items="${j.childTypes}" var="k">
								<option value="${k.typeID }">${k.typeName }</option>
							</c:forEach>
						</c:forEach>
			    	</c:forEach>
			    </select>
			</div>
		  </div>
		  <div class="am-form-group">
		    <label for="goodsStock" class="am-u-md-2 am-form-label" style="font-size: 15px;padding-right: 0em;padding-top: 0.3em">商品库存：</label>
		    <div class="am-u-sm-10">
		    	<input style="width: 100px;height: 20px;" type="text" id="goodsStock" name="goodsStock" value="${goods.goodsStock }">
		    </div>
		  </div>
		  <div class="am-form-group">
		    <label for="goodsStatus" class="am-u-md-2 am-form-label" style="font-size: 15px;padding-right: 0em;padding-top: 0.2em">商品状态：</label>
		 	 <div class="am-u-sm-10">
		 	 	<c:if test="${goods.goodsStatus!=null }">
		 	 		<c:if test="${goods.goodsStatus eq 48 }">
			 	 		<label class="am-radio-inline" style="padding-top: 0;">
			 	 			<input type="radio" name="goodsStatus" value="1" data-am-ucheck>上架
					    </label> 
				    	<label class="am-radio-inline" style="padding-top: 0;">
				      		<input type="radio" name="goodsStatus" value="0" data-am-ucheck checked>下架
				    	</label>
				    	<label class="am-radio-inline" style="padding-top: 0;">
				      		<input type="radio" name="goodsStatus" value="2" data-am-ucheck>积分兑换
				    	</label>
				    </c:if>
				    <c:if test="${goods.goodsStatus eq 49 }">
			 	 		<label class="am-radio-inline" style="padding-top: 0;">
			 	 			<input type="radio" name="goodsStatus" value="1" data-am-ucheck checked>上架
					    </label> 
				    	<label class="am-radio-inline" style="padding-top: 0;">
				      		<input type="radio" name="goodsStatus" value="0" data-am-ucheck>下架
				    	</label>
				    	<label class="am-radio-inline" style="padding-top: 0;">
				      		<input type="radio" name="goodsStatus" value="2" data-am-ucheck>积分兑换
				    	</label>
				    </c:if>
				    <c:if test="${goods.goodsStatus eq 50 }">
			 	 		<label class="am-radio-inline" style="padding-top: 0;">
			 	 			<input type="radio" name="goodsStatus" value="1" data-am-ucheck>上架
					    </label> 
				    	<label class="am-radio-inline" style="padding-top: 0;">
				      		<input type="radio" name="goodsStatus" value="0" data-am-ucheck>下架
				    	</label>
				    	<label class="am-radio-inline" style="padding-top: 0;">
				      		<input type="radio" name="goodsStatus" value="2" data-am-ucheck checked>积分兑换
				    	</label>
				    </c:if>
		 	 	</c:if>
		 	 	<c:if test="${goods.goodsStatus==null }">
			  		<label class="am-radio-inline" style="padding-top: 0;">
				      <input type="radio" name="goodsStatus" value="1" data-am-ucheck checked>上架
				    </label>
				    <label class="am-radio-inline" style="padding-top: 0;">
				      <input type="radio" name="goodsStatus" value="0" data-am-ucheck>下架
				    </label>
				    <label class="am-radio-inline" style="padding-top: 0;">
				      <input type="radio" name="goodsStatus" value="2" data-am-ucheck>积分兑换
				    </label>
			    </c:if>
			 </div>
		  </div>
		  <div class="am-form-group">
		    <label for="goodsStatus" class="am-u-md-2 am-form-label" style="font-size: 15px;padding-right: 0em;padding-top: 0.2em">商品详情：</label>
		    <div class="am-u-sm-10">
			    <textarea id="editor_id" name="goodsDetail" style="width:800px;height:300px;">
				</textarea>
			 </div>
		  </div>
		  <div class="am-form-group">
		    <div class="am-u-sm-10 am-u-sm-offset-2">
		      <button type="submit" class="am-btn am-btn-default am-btn-xs">提交信息</button>
		    </div>
		  </div>
      </form>
      </c:if>
	  <c:if test="${goods.goodsID==null }">
	  	<form class="am-form am-form-horizontal" id="AddGoods" name="AddGoods" method="post" action="/Test/GoodsAdd" enctype="multipart/form-data">
      <div class="am-form-group">
		    <label for="goodsName" class="am-u-md-2 am-form-label" style="font-size: 15px;padding-right: 0em;padding-top: 0.3em">商品名称：</label>
		    <div class="am-u-sm-10">
		      <input style="width: 500px;height: 20px;" type="text" id="goodsName" name="goodsName" value="${goods.goodsName }">
		    </div>
		  </div>
		  <div class="am-form-group">
		    <label for="goodsPrice" class="am-u-md-2 am-form-label" style="font-size: 15px;padding-right: 0em;padding-top: 0.3em">商品价格：</label>
		    <div class="am-u-sm-10">
		      <input style="width: 500px;height: 20px;" type="text" id="goodsPrice" name="goodsPrice" value="${goods.goodsPrice }">
		    </div>
		  </div>
		  <div class="am-form-group am-form-file">
		    <label for="goodsImg" class="am-u-md-2 am-form-label" style="font-size: 15px;padding-right: 0em;padding-top: 0.8em">商品图片：</label>
		    <div class="am-u-sm-10">
		    	<button type="button" class="am-btn am-btn-secondary am-btn-xs" >
		    	<i class="am-icon-cloud-upload"></i>选择要上传的文件</button>
		      	<input type="file" id="goodsImg" name="file" style="width: 100px;height: 20px" multiple="multiple">
		    </div>
		  </div>  
		  <div class="am-form-group">
		  	<label for="goodsImgName" class="am-u-md-2 am-form-label" style="font-size: 15px;padding-right: 0em;padding-top: 0.3em">选取文件：</label>
		  	<div class="am-u-sm-10" id="file-list">
		  		<c:if test="${goods.goodsImg!=null }">
		  			<span class="am-badge am-badge-success am-round">当前图片:${filename}</span>
		  		</c:if>
			  	<c:if test="${requestScope.message!=null }">
			  		<span class="am-badge am-badge-success am-round">${requestScope.message}</span>
			  	</c:if>
		  	</div>
		  </div>
		  <div class="am-form-group">
		    <label for="goodsType" class="am-u-md-2 am-form-label" style="font-size: 15px;padding-right: 0em;padding-top: 0.9em">商品分类：</label>
		    <div class="am-u-sm-10 am-form-content type" style="margin-left: 0px;padding-left: 24px;">
		    	<select name="goodsType" data-am-selected="{maxHeight: 200, btnSize: 'xs'}">
		    		<option value="a" selected>请选择</option>
			    	<c:forEach items="${fatherTypes }" var="i">
						<c:forEach items="${i.childTypes }" var="j">
							<c:forEach items="${j.childTypes}" var="k">
								<option value="${k.typeID }">${k.typeName }</option>
							</c:forEach>
						</c:forEach>
			    	</c:forEach>
			    </select>
			</div>
		  </div>
		  <div class="am-form-group">
		    <label for="goodsStock" class="am-u-md-2 am-form-label" style="font-size: 15px;padding-right: 0em;padding-top: 0.3em">商品库存：</label>
		    <div class="am-u-sm-10">
		    	<input style="width: 100px;height: 20px;" type="text" id="goodsStock" name="goodsStock" value="${goods.goodsStock }">
		    </div>
		  </div>
		  <div class="am-form-group">
		    <label for="goodsStatus" class="am-u-md-2 am-form-label" style="font-size: 15px;padding-right: 0em;padding-top: 0.2em">商品状态：</label>
		 	 <div class="am-u-sm-10">
		 	 	<c:if test="${goods.goodsStatus!=null }">
		 	 		<c:if test="${goods.goodsStatus eq 48 }">
			 	 		<label class="am-radio-inline" style="padding-top: 0;">
			 	 			<input type="radio" name="goodsStatus" value="1" data-am-ucheck>上架
					    </label> 
				    	<label class="am-radio-inline" style="padding-top: 0;">
				      		<input type="radio" name="goodsStatus" value="0" data-am-ucheck checked>下架
				    	</label>
				    	<label class="am-radio-inline" style="padding-top: 0;">
				      		<input type="radio" name="goodsStatus" value="2" data-am-ucheck>积分兑换
				    	</label>
				    </c:if>
				    <c:if test="${goods.goodsStatus eq 49 }">
			 	 		<label class="am-radio-inline" style="padding-top: 0;">
			 	 			<input type="radio" name="goodsStatus" value="1" data-am-ucheck checked>上架
					    </label> 
				    	<label class="am-radio-inline" style="padding-top: 0;">
				      		<input type="radio" name="goodsStatus" value="0" data-am-ucheck>下架
				    	</label>
				    	<label class="am-radio-inline" style="padding-top: 0;">
				      		<input type="radio" name="goodsStatus" value="2" data-am-ucheck>积分兑换
				    	</label>
				    </c:if>
				    <c:if test="${goods.goodsStatus eq 50 }">
			 	 		<label class="am-radio-inline" style="padding-top: 0;">
			 	 			<input type="radio" name="goodsStatus" value="1" data-am-ucheck>上架
					    </label> 
				    	<label class="am-radio-inline" style="padding-top: 0;">
				      		<input type="radio" name="goodsStatus" value="0" data-am-ucheck>下架
				    	</label>
				    	<label class="am-radio-inline" style="padding-top: 0;">
				      		<input type="radio" name="goodsStatus" value="2" data-am-ucheck checked>积分兑换
				    	</label>
				    </c:if>
		 	 	</c:if>
		 	 	<c:if test="${goods.goodsStatus==null }">
			  		<label class="am-radio-inline" style="padding-top: 0;">
				      <input type="radio" name="goodsStatus" value="1" data-am-ucheck checked>上架
				    </label>
				    <label class="am-radio-inline" style="padding-top: 0;">
				      <input type="radio" name="goodsStatus" value="0" data-am-ucheck>下架
				    </label>
				    <label class="am-radio-inline" style="padding-top: 0;">
				      <input type="radio" name="goodsStatus" value="2" data-am-ucheck>积分兑换
				    </label>
			    </c:if>
			 </div>
		  </div>
		  <div class="am-form-group">
		    <label for="goodsStatus" class="am-u-md-2 am-form-label" style="font-size: 15px;padding-right: 0em;padding-top: 0.2em">商品详情：</label>
		    <div class="am-u-sm-10">
			    <textarea id="editor_id" name="goodsDetail" style="width:800px;height:300px;">
				</textarea>
			 </div>
		  </div>
		  <div class="am-form-group">
		    <div class="am-u-sm-10 am-u-sm-offset-2">
		      <button type="submit" class="am-btn am-btn-default am-btn-xs">提交信息</button>
		    </div>
		  </div>
      </form>
	  </c:if>
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