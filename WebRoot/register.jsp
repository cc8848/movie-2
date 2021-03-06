<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>注册网站</title>
<link rel="shortcut icon" href="images/bjj.png">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link href="css/login.css" rel="stylesheet" type="text/css">
<link href="css/main.css" rel="stylesheet" type="text/css">
</head>

<body>
	<div class="container">
		<!--标题部分-->
		<header class="row">
			<div class="col-xs-6 col-md-3">
				<img src="images/logo.png">
			</div>
			<div class="col-xs-6 col-md-3 col-md-offset-1">
				<form class="navbar-form search">
					<div class="input-group">
						<input type="text" class="form-control"> <span
							class="input-group-btn">
							<button class="btn btn-default" type="submit">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</span>
					</div>
				</form>
			</div>
			<div class="col-xs-12 col-md-2 col-xs-offset-3 col-md-offset-9">
				<!--该列会因为上一行被占满而放置到下一行，形成换行的效果-->
				<!--使用offset来将列右移，不要使用右飘-->
				<div>
					<a class="btn btn-lg btn-success" href="login.jsp">登录</a> <a
						class="btn btn-lg btn-primary" href="register.jsp">注册</a>
				</div>
				<!--使用Bootstrap的class="btn" 按钮类，不用自己去掉超链接的下划线-->
			</div>
		</header>
		<!--导航部分-->
		<nav class="row">
			<ul class="nav nav-pills text-center">
				<li class="col-xs-12 col-md-2 "><a href="index.jsp">首页</a></li>
				<li class="col-xs-12 col-md-2"><a
					href="movieAction_list?kind.id=1">爱情类</a></li>
				<li class="col-xs-12 col-md-2"><a
					href="movieAction_list?kind.id=2">喜剧类</a></li>
				<li class="col-xs-12 col-md-2 active"><a
					href="movieAction_list?kind.id=3">动漫类</a></li>
				<li class="col-xs-12 col-md-2"><a
					href="movieAction_list?kind.id=4">悬疑类</a></li>
			</ul>
		</nav>
		<main class="row">
			<div class="col-sm-4 col-md-offset-4 col-xs-offset-3">
				<form action="userAction_register" method="post">
					<div class="login">
						<h2 class="title text-center">用户注册</h2>
						<div>
							<p>
								账户名：<input name="user.account" type="text" placeholder="用户名 "
									pattern="^[a-zA-Z]\w{4,9}$" required>
							</p>
							<p>
								昵称：<input name="user.username" type="text" placeholder="昵称"
									required>
							</p>
							<p>
								密码：<input name="user.password" type="password" id="pass"
									placeholder="登录密码" pattern="^[a-zA-Z]\w{4,9}$" required>
							</p>
							<button id="register" type="submit"
								class="btn btn-info col-xs-offset-4 col-md-offset-8">注册</button>
						</div>
					</div>
				</form>
			</div>
		</main>
		<footer class="row">
			<div class="row-xs-12">
				<p class="text-center">版权所有&copy;赴宇宙调研小组.建议使用IE8及以上、火狐Firefox、谷歌chrome浏览器</p>
			</div>
		</footer>
	</div>
</body>
<script type="text/javascript" src="js/jquery.min.js"></script>
</html>