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
	aside div img{
	height:320px;
	width:270px;
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
			<h2 class="name">神木隆之介</h2>
            <div class="introduce">
            <p>1993年5月19日 埼玉 日本</p>
 	神木隆之介（Kamiki Ryunosuke）1993年5月19日出生于日本埼玉县，日本演员、声优，毕业于堀越高校艺能班[1]  。
	2004年凭借电影《爸爸的背摔绝技》中摔交选手的儿子下田雄一一角获得第十四届日本电影批评家大奖新人奖 。
	2005年，首次主演电影《妖怪大战争》，获得日本电影学院奖新人演员奖。
	2007年，首次主演电视剧《侦探学园Q》。
	2012年，主演小说改编电影《听说桐岛要退部》，获得第4回TAMA电影奖最优秀新人男演员奖。
	2013年，凭借电视剧《家族游戏》获得第77回日剧学院赏最佳男配角奖[8]  。2014年，主演东野圭吾小说改编电视剧《变身》。
	2015年，主演漫改电影《爆漫王》。
	2016年，为动画电影《你的名字。》男主角配音。
	2017年，主演漫改电影《3月的狮子：前篇》、《3月的狮子：后篇》
            </div><br>
            <div class="row">
            	<div class="col-xs-6">
            		外文名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;かみき りゅうのすけ、Ryunosuke Kamiki <br>
					出生地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日本埼玉<br> 
					出生日期&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1993年5月19日<br>
            	</div>

				<div class="col-xs-6">
                	职  业&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;演员、声优<br>
					主要成就&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第29回日本电影学院赏 新人演员赏 <br> 
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
                    	<li> 2013    第17回    日刊体育日剧大赏 最佳男助演赏    《家族游戏》    （获奖）</li>   
						<li> 2013    第23回    TV LIFE年度电视剧大赏最佳男助演赏    《家族游戏》    （获奖）</li>
                    </ul>
                </div>
            </div>
		</section>
		<aside class="col-xs-3">
       		<div><img src="images/神木隆之介.jpg" /></div>
		</aside>
	</main>
	<footer class="row">
		<p class="text-center">版权所有&copy;赴宇宙调研小组.建议使用IE8及以上、火狐Firefox、谷歌chrome浏览器</p>
	</footer>
</div>
</body>
</html>
