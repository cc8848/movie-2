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
<title>管理页面</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/main.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="images/bjj.png">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<!--整个页面使用一个容器-->
		<!--标题部分-->
		<header class="row">
			<div class="col-xs-6 col-md-3">
				<img src="images/logo.png">
			</div>
			
			<div class="col-xs-12 col-md-2 col-xs-offset-3 col-md-offset-9">
				<div>
                	<a href="indexAction">返回首页</a>&nbsp;&nbsp;|&nbsp;&nbsp;
					<a href="adminAction_">管理页面</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                    <a href="userAction_logout">注销</a>
				</div>
			</div>
		</header>
		<main>
        <div class="row">
        	<div class="col-xs-8 col-xs-offset-2">
            <form>
            <h4>电影列表</h4>
            	<table class="table table-hover table-striped">
                	<thead>
                    	<tr>
                        	<th class="col-xs-3">推送到主页</th>
                        	<th class="col-xs-1">Id</th>
                            <th class="col-xs-8">名称</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<struts:iterator value="movies">
                    	<tr>
                        	<td><input type="checkbox"></td>
                            <td><struts:property value="id"/></td>
                            <td><struts:property value="name"/></td>
                        </tr>
                        </struts:iterator>
                    </tbody>
                </table>
               	<button type="submit" class="btn btn-success col-sm-3">向主页推送勾选的电影</button>
               	<button type="button" class="btn btn-info col-sm-offset-7" data-toggle="modal" data-target="#movieAdd">添加电影</button>
            </form>
            </div>
          </div>
        
        <div class="row">
            <div class="col-xs-8 col-xs-offset-2">
            <h4>电影类别列表</h4>
            	<table class="table table-hover table-striped">
                	<thead>
                    	<tr>
                        	<th class="col-xs-1">Id</th>
                            <th class="col-xs-2">名称</th>
                            <th class="col-xs-">修改名称</th>
                           	<th class="col-xs-2">删除</th>
                        </tr>
                    </thead>
                    <tbody>
                    <struts:iterator value="kinds">
                    	<tr>
                            <td><struts:property value="id"/></td>
                            <td><struts:property value="name"/></td>
                            <td>
                            <form action="adminAction_editKind">
                            	<div class="input-group">
                            	  <input type="hidden" name="kind.id" value="<struts:property value='id'/>">
                                  <input type="text" name="kind.name" class="form-control" required>
                                  <span class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></button>
                                  </span>
                                </div>
                                </form>
                           </td>
                            <td><a href="adminAction_deleteKind?kind.id=<struts:property value='id'/>" class="btn btn-danger"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a></td>
                        </tr>
                        </struts:iterator>
                    </tbody>
                </table>
                <div class="row">
                <div class="col-sm-6 col-sm-offset-6">
	                <form action="adminAction_addKind">
	                	<div class="col-sm-6">
	                		<input type="text" name="kind.name" class="form-control" placeholder="添加新的电影类别" required>
	                	</div>
	                	<button type="submit" class="btn btn-info">添加类别</button>
	                </form>
                </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-8 col-xs-offset-2">
            <h4>导演列表</h4>
            	<table class="table table-hover table-striped">
                	<thead>
                    	<tr>
                        	<th class="col-xs-1">Id</th>
                            <th class="col-xs-5">姓名</th>
                            <th class="col-xs-2">详情预览</th>
                            <th class="col-xs-2">修改</th>
                           	<th class="col-xs-2">删除</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<struts:iterator value="directors">
                    	<tr>
                            <td><struts:property value="id"/></td>
                            <td><struts:property value="name"/></td>
                            <td><a href="movieAction_director?director.id=<struts:property value='id'/>" class="btn btn-default"><span class="glyphicon glyphicon-new-window" aria-hidden="true"></span></a></td>
                            <td><button class="btn btn-primary" data-toggle="modal" data-target="#editor"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></button></td>
                            <td><a href="adminAction_deleteDirector?director.id=<struts:property value='id'/>" class="btn btn-danger"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a></td>
                        </tr>
                        </struts:iterator>
                    </tbody>
                </table>
                <div class="col-sm-offset-8">
                	<button class="btn btn-info" data-toggle="modal" data-target="#directorAdd">添加导演</button>
                </div>
            </div>
          </div>
          
          <div class="row">
            <div class="col-xs-8 col-xs-offset-2">
            <h4>演员列表</h4>
            	<table class="table table-hover table-striped">
                	<thead>
                    	<tr>
                        	<th class="col-xs-1">Id</th>
                            <th class="col-xs-5">姓名</th>
                            <th class="col-xs-2">详情预览</th>
                            <th class="col-xs-2">修改</th>
                           	<th class="col-xs-2">删除</th>
                        </tr>
                    </thead>
                    <tbody>
                    <struts:iterator value="actors">
                    	<tr>
                            <td><struts:property value="id"/></td>
                            <td><struts:property value="name"/></td>
                            <td><a href="movieAction_actor?actor.id=<struts:property value='id'/>" class="btn btn-default"><span class="glyphicon glyphicon-new-window" aria-hidden="true"></span></a></td>
                            <td><button class="btn btn-primary"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></button></td>
                            <td><a href="adminAction_deleteActor?actor.id=<struts:property value='id'/>" class="btn btn-danger"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a></td>
                        </tr>
                        </struts:iterator>
                    </tbody>
                </table>
                <div class="col-sm-offset-8">
                	<button class="btn btn-info" data-toggle="modal" data-target="#actorAdd">添加演员</button>
                </div>
            </div>
          </div>
		</main>
		<footer class="row">
			<div class="row-xs-12">
				<p class="text-center">版权所有&copy;赴宇宙调研小组.建议使用IE8及以上、火狐Firefox、谷歌chrome浏览器</p>
			</div>
		</footer>
	</div>
    
<div class="modal fade" id="editor" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    <!--
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
      -->
    </div>
  </div>
</div>

<div class="modal fade" id="movieAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">添加电影</h4>
      </div>
      <div class="modal-body">
     	 <form id="addMovieForm" class="form-horizontal" method="post" enctype="multipart/form-data" action="adminAction_addMovie">
      		<div class="form-group">
				<label class="col-sm-2 control-label">电影图片：</label>
				<div class="com-sm-6">
					<input name="image" class="form-control" type="file">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">电影名字：</label>
				<div class="com-sm-6">
					<input name="movie.name" class="form-control" placeholder="电影名字">
					</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">&#12288;&#12288;导演：</label>
				<div class="com-sm-6">
					<select name="movie.director.id" class="form-control" required>
					<struts:iterator value="directors">
						<option value="<struts:property value='id'/>"><struts:property value="name"/></option>
					</struts:iterator>
					</select>
					</div>
			</div>
			<div class="form-group">	
				<label class="col-sm-2 control-label">&#12288;&#12288;主演：</label>
				<div class="com-sm-6">
					<select name="movie.actor.id" class="form-control" required>
					<struts:iterator value="actors">
						<option value="<struts:property value='id'/>"><struts:property value="name"/></option>
					</struts:iterator>
					</select>
					</div>
			</div>
			<div class="form-group">	
				<label class="col-sm-2 control-label">电影描述：</label>
				<div class="com-sm-6">
					<input name="movie.description" class="form-control" placeholder="电影描述">
					</div>
			</div>
			<div class="form-group">	
				<label class="col-sm-2 control-label">详情链接：</label>
				<div class="com-sm-6">
					<input name="movie.url" class="form-control" placeholder="详情链接">
					</div>
			</div>
			<div class="form-group">	
				<label class="col-sm-2 control-label">电影分类：</label>
				<div class="com-sm-6">
					<select name="movie.kind.id" class="form-control" required>
					<struts:iterator value="kinds">
						<option value="<struts:property value='id'/>"><struts:property value="name"/></option>
					</struts:iterator>
					</select>
				</div>
			</div>
			</form>
	  </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭界面</button>
        <button type="submit" form="addMovieForm" class="btn btn-primary">添加</button>
      </div>
      
    </div>
  </div>
</div>

<div class="modal fade" id="directorAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">添加导演</h4>
        <s>由于还未定义页面排版方式及字段，暂时将描述性文字以html源码的方式存储，只需在描述中输入html源码即可在预览界面得到显示效果。该行文本为无用文本，请在后续的版本中将我删除。</s>
      </div>
      <form action="adminAction_addDirector" method="post">
      <div class="modal-body">
        <div class="form-group">
		  <label>导演名字</label>
		  <input type="text" name="director.name" class="form-control">
		</div>
		<div class="form-group">
		  <label>描述</label>
		  <textarea rows="20" name="director.description" class="form-control" placeholder="请在此处植入html代码"></textarea>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭界面</button>
        <button type="submit" class="btn btn-primary">添加</button>
      </div>
      </form>
    </div>
  </div>
</div>

<div class="modal fade" id="actorAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">添加演员</h4>
        <s>由于还未定义页面排版方式及字段，暂时将描述性文字以html源码的方式存储，只需在描述中输入html源码即可在预览界面得到显示效果。该行文本为无用文本，请在后续的版本中将我删除。</s>
      </div>
      <form action="adminAction_addActor" method="post">
      <div class="modal-body">
        <div class="form-group">
		  <label>演员名字</label>
		  <input type="text" name="actor.name" class="form-control">
		</div>
		<div class="form-group">
		  <label>描述</label>
		  <textarea rows="20" name="actor.description" class="form-control" placeholder="请在此处植入html代码"></textarea>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭界面</button>
        <button type="submit" class="btn btn-primary">添加</button>
      </div>
      </form>
    </div>
  </div>
</div>
</body>
</html>