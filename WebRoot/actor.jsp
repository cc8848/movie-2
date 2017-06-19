<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="struts"%>
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
				<li class="col-xs-12 col-md-2 active"><a href="indexAction">首页</a></li>
				<struts:iterator value="kinds">
					<li class="col-xs-12 col-md-2"><a href="movieAction_list?kind.id=<struts:property value='id'/>"><struts:property value="name"/></a></li>
				</struts:iterator>
			</ul>
		</nav>
	<main class="row">
		<section class="col-xs-9">
			<h2 class="name"><struts:property value="actor.name" /></h2>
            <div class="introduce">
            <struts:property value="actor.description" />
            </div>
                <div class="works">
                	<h3>代表作品</h3>
                        <ul>
							
						</ul>
                    <h3>获奖记录</h3>
                    <ul class="prize">
                    	
                    </ul>
                </div>
            </div>
		</section>
		<aside class="col-xs-3">
       		<div><img src="images/actor/<struts:property value='actor.id' />.jpg" /></div>
		</aside>
	</main>
	<footer class="row">
		<p class="text-center">版权所有&copy;赴宇宙调研小组.建议使用IE8及以上、火狐Firefox、谷歌chrome浏览器</p>
	</footer>
</div>
</body>
</html>
