<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="struts"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title><struts:property value='kind.name' /></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="js/jquery-3.1.1.min.js"></script>
<!--Bootstrap CSS必须要放在第一个，才不会覆盖自己写的CSS-->
<link rel="shortcut icon" href="images/bjj.png">
<link href="css/list.css" rel="stylesheet" type="text/css">
<link href="css/main.css" rel="stylesheet" type="text/css">

</head>
<body>
	<div class="container">
		<!--整个页面使用一个容器-->
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
		<div class="row">
			<div class="col-xs-12 col-sm-3">
				<aside class="panel panel-default panel-info">
					<div class="panel-heading">
						<h2>最新上映</h2>
					</div>
					<div class="panel-body">
						<ol>
							<struts:iterator value="newest">
								<li><a
									href="movieAction_movie?movie.id=<struts:property value='id' />"><struts:property
											value='name' /></a></li>
							</struts:iterator>
						</ol>
					</div>
				</aside>
			</div>
			<main class="col-xs-12 col-sm-9">
				<struts:iterator value='kind.movies'>
					<div class="col-xs-12 col-sm-4">
						<a
							href="movieAction_movie?movie.id=<struts:property value='id' />">
							<div class="thumbnail">
								<img src="pictures/<struts:property value='imageName'/>"
									alt="<struts:property value='name' />" />
								<div class="caption">
									<p class="text-center">
										<struts:property value='name' />
									</p>
								</div>
								<struts:if test="#session.user.admin==true">
									<p class="text-center">
										<a
											href="adminAction_movie?movie.id=<struts:property value='id' />">编辑</a>
										<a
											href="adminAction_deleteMovie?movie.id=<struts:property value='id' />">删除</a>
									</p>
								</struts:if>
							</div>
						</a>
					</div>
				</struts:iterator>
			</main>
		</div>
		<div class="row">
			<footer>
				<div class="row-xs-12">
					<p class="text-center">版权所有&copy;赴宇宙调研小组.建议使用IE8及以上、火狐Firefox、谷歌chrome浏览器</p>
				</div>
			</footer>
		</div>
	</div>
</body>
</html>