<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="struts"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>添加页面</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<!--Bootstrap CSS必须要放在第一个，才不会覆盖自己写的CSS-->
<link href="css/admin.css" rel="stylesheet" type="text/css">
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
								<span class="glyphicon glyphicon-search">
							</button>
						</span>
					</div>
				</form>
			</div>
			<div class="col-xs-12 col-md-2 col-xs-offset-3 col-md-offset-9">
				<!--该列会因为上一行被占满而放置到下一行，形成换行的效果-->
				<!--使用offset来将列右移，不要使用右飘-->
				<div class="welcome">
					<a href="add.html">添加电影</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">注销</a>
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

			<div class="col-xs-12 col-md-4 col-md-offset-2 edit">
				<h3>编辑电影</h3>
				<form name="addform" method="post" enctype="multipart/form-data"
					action="adminAction_editMovie?movie.id=<struts:property value='movie.id' />">
					<label>电影图片：</label><img src="pictures/<struts:property value='movie.imageName' />" /><br> <br>
					<label>电影名字：</label><input name="movie.name" placeholder="电影名字"><br>
					<br> <label>电影描述：</label><input name="movie.description"
						placeholder="详情链接"><br> <br> <label>详情链接：</label><input
						name="movie.url" placeholder="详情链接"><br> <label>电影分类：</label>
					<select name="movie.kind.id" required>
						<option value="1" selected>爱情</option>
						<option value="2">喜剧</option>
						<option value="3">动漫</option>
						<option value="4">悬疑</option>
					</select> <br>
					<button type="submit">修改</button>
				</form>
			</div>
		</main>
		<footer class="row">
			<div class="row-xs-12">
				<p class="text-center">建议使用IE8及以上、火狐Firefox、谷歌chrome浏览器</p>
				<!--使用text-center来获得文字居中效果-->
			</div>
		</footer>
	</div>
</body>
</html>