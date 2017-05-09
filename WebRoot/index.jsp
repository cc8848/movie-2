<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="struts"%>
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
<title>首页</title>
<link rel="shortcut icon" href="images/favicon.ico">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link href="css/index.css" rel="stylesheet" type="text/css">
<link href="css/main.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="images/bjj.png">
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/jquery.slides.min.js"></script>
<script src="js/bootstrap.min.js"></script>
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
					<struts:if test="#session.user==null">
						<a class="btn btn-lg btn-success" href="login.jsp">登录</a>
						<a class="btn btn-lg btn-primary" href="register.jsp">注册</a>
					</struts:if>
					<struts:else>
					<div>
						<p>
							<struts:property value="#session.user.username" />
						</p>
							<struts:if test="#session.user.admin==true">
								<a href="add.jsp">添加电影</a>
							</struts:if>
							|<a href="userAction_logout">注销</a>
						</div>
					</struts:else>
				</div>
				<!--使用Bootstrap的class="btn" 按钮类，不用自己去掉超链接的下划线-->
			</div>
		</header>
		<!--导航部分-->
		<nav class="row">
			<ul class="nav nav-pills text-center">
				<li class="col-xs-12 col-md-2 active"><a href="index.jsp">首页</a></li>
				<li class="col-xs-12 col-md-2"><a
					href="movieAction_list?kind.id=1">爱情类</a></li>
				<li class="col-xs-12 col-md-2"><a
					href="movieAction_list?kind.id=2">喜剧类</a></li>
				<li class="col-xs-12 col-md-2"><a
					href="movieAction_list?kind.id=3">动漫类</a></li>
				<li class="col-xs-12 col-md-2"><a
					href="movieAction_list?kind.id=4">悬疑类</a></li>
			</ul>
		</nav>
		<main class="row">
			<div id="slides" class="col-md-6 col-xs-10">
				<a href="movie.jsp"><img src="images/超脑48小时.jpg"></a> <a
					href="movie.jsp"><img src="images/神奇动物在哪里.jpg"></a> <a
					href="movie.jsp"><img src="images/狼少年.jpg"></a>
			</div>
			<div class="col-md-6 col-xs-10 right_aside">
				<div class="panel-heading">
					<h2>热播榜</h2>
				</div>
				<ol class="row">
					<li class="col-sm-offset-4"><a href="movie.jsp">喜欢你</a></li>
					<li class="col-sm-offset-4"><a href="movie.jsp">速度与激情8</a></li>
					<li class="col-sm-offset-4"><a href="movie.jsp">傲娇与偏见</a></li>
					<li class="col-sm-offset-4"><a href="movie.jsp">嫌疑人x的献身</a></li>
					<li class="col-sm-offset-4"><a href="movie.jsp">记忆大师</a></li>
					<li class="col-sm-offset-4"><a href="movie.jsp">灵狼传奇</a></li>
				</ol>
			</div>
		</main>
		<footer class="row">
			<div class="row-xs-12">
				<p class="text-center">版权所有&copy;赴宇宙调研小组。建议使用IE8及以上、火狐Firefox、谷歌chrome浏览器。</p>
				<!--使用text-center来获得文字居中效果-->
			</div>
		</footer>

		<script>
			$(function() {
				$('#slides').slidesjs({
					width : 400,
					height : 300,
					play : {
						active : true,
						auto : true,
						interval : 4000,
						swap : true
					}
				});
			});
		</script>
	</div>
</body>
</html>