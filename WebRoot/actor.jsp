<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>主角</title>
<link rel="shortcut icon" href="images/bjj.png">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<script src="js/jquery-3.1.1.min.js"></script>
<style type="text/css">
	.worksimg{
		height:150px;
		width:120px;
	}
	.works ul li{
		display:inline;
		list-style-type:none;
	}
	section{font-size:14px;}
	.works .prize li{
		display:block;
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
			<h2 class="name">阿米尔·汗</h2>
            <div class="introduce">
            <p>1965年3月14日&nbsp;&nbsp;印度孟买&nbsp;&nbsp;印度共和国</p>
            	阿米尔·汗（Aamir Khan），1965年3月14日出生于印度孟买，印度宝莱坞演员、导演、制片人[1]  。
				8岁的时侯，阿米尔·汗出演第一部电影《Yaadon Ki Baraat》。后来练习打网球，获得了马哈拉施特拉邦的网球冠军[2]  。
				1988年，阿米尔·汗放弃网球重回银幕[3-4]  。
				1989年，出演文艺片《灰飞烟灭》，饰演复仇男子。1999年，在《义无反顾》中出演印巴边境的抗暴警察阿贾伊。
				2002年，阿米尔凭借剧情爱情电影《印度往事》获得zee电影奖最佳男主角奖 。
				2008年，凭借导演 《地球上的星星》获得宝莱坞人民选择奖最佳导演奖。
				2009年，出演了励志喜剧电影《三傻大闹宝莱坞》，饰演Rancho[5-6]  。
				2011年，阿米尔·汗制作真人访谈节目《真相访谈》，成为联合国儿童基金会印度区第三任大使。
				2013年，出演犯罪动作电影《幻影车神3》饰演Sahir和 Samar[5]  。
				2014年，出演奇幻喜剧电影《我的个神啊》，饰演遗留在地球的外星人PK。2017年，出演励志运动电影《摔跤吧！爸爸》
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
                	<h3>代表作品</h3>
                        <ul>
							<li><a href="movie.jsp"><img src="images/狼少年.jpg" class="worksimg"></a></li>
							<li><a href="movie.jsp"><img src="images/狼少年.jpg" class="worksimg"></a></li>
							<li><a href="movie.jsp"><img src="images/狼少年.jpg" class="worksimg"></a></li>
						</ul>
                    <h3>获奖记录</h3>
                    <ul class="prize">
                    	<li> 2002    影评人最佳男主角    《心归何处》    （获奖） </li>   
						<li>2002    最佳男主角    《印度往事》    （获奖）    </li>
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
