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
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>电影详情</title>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/movie.css" rel="stylesheet" type="text/css">
<link href="css/main.css" rel="stylesheet" type="text/css">
<script src="js/jquery-3.1.1.min.js"></script>
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
								<span class="glyphicon glyphicon-search">
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
						<a href="login.html">登录</a>
						<a href="register.html">注册</a>
					</struts:if>
					<struts:else>
						<p>
							<struts:property value="#session.user.username" />
						</p>
						<struts:if test="#session.user.admin==true">
							<a href="admin.html">添加电影</a>
						</struts:if>
						<a href="userAction_logout">注销</a>
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

		<section class="row">
			<div class="col-sm-4 col-xs-10">
				<a href="<struts:property value='movie.url' />"> <img
					src="pictures/<struts:property value='movie.imageName' />"
					title="在线观看" /></a></a>
			</div>

			<div class="col-sm-8 col-xs-12">
				<p class="moviename">
					<struts:property value='movie.name' />
				</p>
				<p class="detail_t">剧情简介：</p>
				<div class="detail">
					<p>
						<struts:property value='movie.description' />
					</p>
					<a href="<struts:property value='movie.url' />"> <img
						src="images/play.PNG" / class="play"></a>
				</div>
			</div>
		</section>

		<main>
			<div class="row">
				<div class="col-md-12">

					<form method="post"
						action="userAction_addComment?movie.id=<struts:property value='movie.id' />">
						<p class="user_comment">用户评论</p>
						<textarea name="comment.commentText" type="text"></textarea>
						<button type="submit" class="btn btn-info">发表</button>
					</form>
					<struts:iterator value="movie.comments">
						<div class="result" style="margin-top:10px">
							<p class="user_name">
								<struts:property value='user.username' />
							</p>
							<div class="comment">
								<p>
									<struts:property value='commentText' />
								</p>
							</div>
							<struts:if test="#session.user.admin==true">
							<div><a href="adminAction_deleteComment?comment.id=<struts:property value='id' />">[删除]</a></div>
							</struts:if>
						</div>
					</struts:iterator>
				</div>
			</div>
		</main>
		<footer class="row">
			<p class="row-xs-12 text-center">建议使用IE8及以上、火狐Firefox、谷歌chrome浏览器</p>
			<!--使用text-center来获得文字居中效果-->
		</footer>

	</div>
</body>
</html>
