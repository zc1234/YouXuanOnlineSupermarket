<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head lang="en">
		<meta charset="UTF-8">
		<title>登录页面</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="format-detection" content="telephone=no">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<link rel="stylesheet" href="/Test/one/AmazeUI-2.4.2/assets/css/amazeui.css" />
		<link href="/Test/one/css/dlstyle.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="/Test/one/js/jquery.min.js"></script>
		<script type="text/javascript">
		    function checkNull()
		    {
		    var userLoginName=$("#userLoginName").val();
		    var userPassword=$("#userPassword").val();
		    if(userLoginName==""||userLoginName==null)
		    {$("#message").text("提示：请输入用户名");}
		    else if(userPassword==""||userPassword==null)
		    {$("#message").text("提示：请输入密码");}
		    else
		    {$("#form1").submit();}
		    }
	    </script>
	</head>
	<body>
		<div class="login-boxtitle">
			<a href="/Test"><img alt="logo" src="/Test/one/images/logobig.png" /></a>
		</div>
		<div class="login-banner">
			<div class="login-main">
				<div class="login-banner-bg"><span></span><img src="/Test/one/images/big.jpg" /></div>
				<div class="login-box">
							<h3 class="title">登录商城</h3>
							<div class="clear"></div>
						<div class="login-form">
						  <form action="/Test/login" method="post" id="form1">
							   <div class="user-name">
								    <label for="user"><i class="am-icon-user"></i></label>
								    <input type="text" name="userLoginName" id="userLoginName" placeholder="请输入用户名">
                 				</div>
                 				<div class="user-pass">
								    <label for="password"><i class="am-icon-lock"></i></label>
								    <input type="password" name="userPassword" id="userPassword" placeholder="请输入密码">
                 				</div>	
              			</form>
         			 </div>
          			<span id="message" class="am-badge am-badge-danger am-round">${requestScope.message}</span>
					<div class="am-cf">
						<input type="submit" name="" value="登 录" class="am-btn am-btn-primary am-btn-sm" onclick="checkNull()"><br>
					</div>
					<div class="am-cf">
						<a href="/Test/one/home/register.jsp" class="am-btn am-btn-primary am-btn-sm">注&nbsp;册</a>
						<br />
					</div>
				</div>
			</div>
		</div>
	</body>
</html>