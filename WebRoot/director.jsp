<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>导演</title>
<link rel="shortcut icon" href="images/bjj.png">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<script src="js/jquery-3.1.1.min.js"></script>
<style type="text/css">
	section{font-size:14px;}
	.works ul li{list-style-type:none;}
	aside div img{
	height:320px;
	width:270px;
	}
</style>
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
							<a href="userAction_logout">注销</a>
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
	<main class="row">
		<section class="col-xs-9">
			<h2 class="name">新海诚</h2>
            <div class="introduce">
            	新海诚（Makoto Shinkai），原名：新津诚（Makoto Niitsu），1973年2月9日出生于日本长野县南佐久郡小海町，日本动画导演和作家，居住在东京都，日本长野县野泽北高等学校、日本中央大学文学部日本文学系毕业。
2002年公开独立制作的科幻动画短片《星之声》后开始受到瞩目。现于Comix Wave Films担任映像作家。
2016年导演动画电影《你的名字。》
            </div><br>
            <div class="row">
            	<div class="col-xs-6">
            		外文名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Makoto Shinkai，しんかい まこと<br>
					出生地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日本长野县<br> 
					出生日期&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1973年2月9日 <br>
            	</div>

				<div class="col-xs-6">
                	职  业&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日本动画导演和作家<br>
					主要成就&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第40届日本电影学院奖最佳编剧奖<br> 
            	</div>
                <div class="col-xs-12 works">
                	<h3>主要作品</h3>
                    <div>
                        <ul>
							<li>她和她的猫（1999年）</li>
							<li>云之彼端，约定的地方（2004年）</li>
							<li>秒速5厘米（2007年）</li>
							<li>言叶之庭（2013年</li>
							<li>你的名字。（2016年）</li>
						</ul>
                    </div>
                    <h3>获奖记录</h3>
                    <ul>
                    <li>2017    第11届亚洲电影大奖最佳编剧奖[22]     你的名字。    （提名）    </li>
                    </ul>
                </div>
            </div>
		</section>
		<aside class="col-xs-3">
       		<div><img src="images/新海诚.jpg" /></div>
		</aside>
	</main>
	<footer class="row">
		<p class="text-center">版权所有&copy;赴宇宙调研小组.建议使用IE8及以上、火狐Firefox、谷歌chrome浏览器</p>
	</footer>
</div>
</body>
</html>
