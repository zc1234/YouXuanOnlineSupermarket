<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head lang="en">
		<meta charset="UTF-8">
		<title>注册页面</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="format-detection" content="telephone=no">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<link rel="stylesheet" href="/Test/one/AmazeUI-2.4.2/assets/css/amazeui.min.css" />
		<link href="/Test/one/css/dlstyle.css" rel="stylesheet" type="text/css">
		<script src="/Test/one/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="/Test/one/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
		<script type="text/javascript">
		    function checkNull()
		    {
		    var userLoginName=$("#userLoginName").val();
		    var userName=$("#userName").val();
		    var userPassword=$("#userPassword").val();
		    var userPasswordRepeat=$("#userPasswordRepeat").val();
		    var readme=$("input[type='checkbox']").is(':checked');
		    if(userLoginName==""||userLoginName==null)
		    {$("#message").text("提示：请输入用户名");}
		    else if(userName==""||userName==null)
		    {$("#message").text("提示：请输入姓名");}
		    else if(userPassword==""||userPassword==null)
		    {$("#message").text("提示：请输入密码");}
		    else if(userPasswordRepeat==""||userPasswordRepeat==null)
		    {$("#message").text("提示：请再输入一次密码");}
		    else if(userPassword.length<8)
		    {$("#message").text("提示：密码至少为8位");}
		    else if(userPassword!=userPasswordRepeat)
		    {$("#message").text("提示：两次输入密码不一致");}
		    else if(readme==false)
		    {$("#message").text("提示：请点击同意商城协议");}
		    else
		    {$("#form1").submit();}
		    }
	    </script>
	</head>
	<body>
		<div class="login-boxtitle">
			<a href="/Test/index"><img alt="" src="/Test/one/images/logobig.png" /></a>
		</div>
		<div class="login-banner">
			<div class="login-main">
				<div class="login-banner-bg"><span></span><img src="/Test/one/images/big.jpg" /></div>
				<div class="login-box">
					<h3 class="title">注册</h3>
					<div class="clear"></div>
					<div class="login-form">
						<form action="/Test/register" method="post" id="form1">	
							<div class="user-name">
								<label for="user"><i class="am-icon-user"></i></label>
								<input type="text" name="userLoginName" id="userLoginName" placeholder="请输入用户名">
	                		</div>
							<div class="user-name">
								<label for="user"><i class="am-icon-user"></i></label>
								<input type="text" name="userName" id="userName" placeholder="请输入姓名">
	                		</div>										
	                 		<div class="user-pass">
								<label for="password"><i class="am-icon-lock"></i></label>
								<input type="password" name="userPassword" id="userPassword" placeholder="设置密码">
	                 		</div>										
	                 		<div class="user-pass">
								<label for="passwordRepeat"><i class="am-icon-lock"></i></label>
								<input type="password" name="userPasswordRepeat" id="userPasswordRepeat" placeholder="确认密码">
	                 		</div>
                 		</form>
                 	</div>
                 		<span id="message" class="am-badge am-badge-danger am-round">${requestScope.message}</span>
						<div class="login-links">
							<label for="reader-me">
								<input type="checkbox" id="readme" name="readme"> 点击表示您同意商城《服务协议》
							</label>
						</div>
						<div class="am-cf">
							<input type="submit" name="" value="注册" class="am-btn am-btn-primary am-btn-sm am-fl" onclick="checkNull()">
						</div>	
				</div>
			</div>
		</div>
	</body>
</html>