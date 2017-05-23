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
			<h2 class="name">詹姆斯·古恩</h2>
            <div class="introduce">
            	詹姆斯·古恩（James Gunn），1970年8月5日出生于美国密苏里州圣路易，电影导演、编剧、制片人、演员。
				2015年3月5日，凭借《银河护卫队》入围第41届美国科幻恐怖电影奖土星奖最佳导演
            </div><br>
            <div class="row">
            	<div class="col-xs-6">
           			中文名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;詹姆斯·古恩<br>
            		外文名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;James Gunn <br>
					出生地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;美国密苏里州圣路易<br> 
					出生日期&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1970年8月5日 <br>
            	</div>

				<div class="col-xs-6">
                	职  业&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;导演、编剧、制片人、演员 <br>
					主要成就&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;入围第41届美国科幻恐怖电影奖土星奖最佳导演<br> 
					代表作品&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;《银河护卫队》
            	</div>
                <div class="col-xs-12 works">
                	<h3>主要作品</h3>
                    <div>
                        <ul>
							<li>《撕裂人》2006年</li>
							<li>《超级英雄》2010年</li>
							<li>《电影43》2013年</li>
							<li>《雷神2：黑暗世界》2013年（彩蛋）</li>
							<li>《银河护卫队》2014年</li>
							<li>《银河护卫队2》2017年</li>
							<li>《撕裂人》2006年</li>
							<li>《超级英雄》2010年</li>
							<li>《电影43》2013年</li>
							<li>《雷神2：黑暗世界》2013年（彩蛋）</li>
							<li>《银河护卫队》2014年</li>
							<li>《银河护卫队2》2017年</li>
						</ul>
                    </div>
                    <h3>获奖记录</h3>
                    <ul>
                    <li>2015-03    第41届    美国科幻恐怖电影奖土星奖最佳导演    银河护卫队    （提名）</li>
                    </ul>
                </div>
            </div>
		</section>
		<aside class="col-xs-3">
       		<div><img src="images/詹姆斯古恩.jpg" /></div>
		</aside>
	</main>
	<footer class="row">
		<p class="text-center">版权所有&copy;赴宇宙调研小组.建议使用IE8及以上、火狐Firefox、谷歌chrome浏览器</p>
	</footer>
</div>
</body>
</html>
