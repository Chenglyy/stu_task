<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>后台管理</title>
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="js/respond.js"></script>
    <script src="js/admin.js"></script>
    <link type="image/x-icon" href="/favicon.ico" rel="shortcut icon" />
    <link href="/favicon.ico" rel="bookmark icon" />
</head>

<body>
<div class="lefter">
    <div class="logo"><a href="#" target="_blank"><img src="images/logo.gif" alt="后台管理系统" /></a></div>
</div>
<div class="righter nav-navicon" id="admin-nav">
    <div class="mainer">
        <div class="admin-navbar">
            <span class="float-right">
            	<a class="button button-little bg-main" href="#" target="_blank">前台首页</a>
                <a class="button button-little bg-yellow" href="login.html">注销登录</a>
            </span>
            <ul class="nav nav-inline admin-nav">
                <li class="active"><a href="indexjsp" class="icon-home"> 开始</a>
                    <ul><li><a href="system.html">发布留言</a></li><li><a href="content.html">审核信息</a></li><li><a href=userFrame.jsp>用户管理</a></li><li ><a href=newsFrame.jsp>新闻管理</a></li><li><a href="#">论坛管理</a></li><li><a href="#">树洞管理</a></li></ul>
                </li>
                <li><a href="system.html" class="icon-cog"> 系统</a>
            		<ul><li><a href="#">全局设置</a></li><li class="active"><a href="#">系统设置</a></li><li><a href="#">会员设置</a></li><li><a href="#">积分设置</a></li></ul>
                </li>
                <li><a href="content.html" class="icon-file-text"> 内容</a>
					<ul><li><a href="#">添加内容</a></li><li class="active"><a href="#">内容管理</a></li><li><a href="#">分类设置</a></li><li><a href="#">链接管理</a></li></ul>
                </li>
                <li><a href=userFrame.jsp class="icon-user"> 用户</a></li>
                <li><a href="#" class="icon-file"> 文件</a></li>
                <li><a href="#" class="icon-th-list"> 栏目</a></li>
            </ul>
        </div>
        <div class="admin-bread">
            <span>您好，admin，欢迎您的光临。</span>
            <ul class="bread">
                <li><a href="index.jsp" class="icon-home"> 开始</a></li>
                <li>后台首页</li>
            </ul>
        </div>
    </div>
</div>

<div class="admin">
	<div class="line-big">
    	<div class="xm3">
        	<div class="panel border-back">
            	<div class="panel-body text-center">
                	<img src="images/face.jpg" width="120" class="radius-circle" /><br />
                    admin
                </div>
                <div class="panel-foot bg-back border-back">您好，admin，这是您第100次登录</div>
            </div>
            <br />
        	<div class="panel">
            	<div class="panel-head"><strong>站点统计</strong></div>
                <ul class="list-group">
                	<li><span class="float-right badge bg-red">88</span><span class="icon-user"></span> 用户	</li>
                    <li><span class="float-right badge bg-main">828</span><span class="icon-file"></span> 文件</li>
                    <li><span class="float-right badge bg-main">828</span><span class="icon-file-text"></span> 留言</li>
                </ul>
            </div>
            <br />
        </div>
        <div class="xm9">
            <div class="panel">
            	<div class="panel-head"><strong>系统信息</strong></div>
                <table class="table">
                	<tr><th colspan="2">服务器信息</th><th colspan="2">系统信息</th></tr>
                    <tr><td width="110" align="right">操作系统：</td><td>Win10</td><td width="90" align="right">系统开发：</td><td><a href="#" target="_blank">STU</a></td></tr>
                    <tr><td align="right">Web服务器：</td><td>Tomcat</td><td align="right">主页：</td><td><a href="#" target="_blank">#</a></td></tr>
                    <tr><td align="right">程序语言：</td><td>JSP</td><td align="right">组长：</td><td><img src="images/bear.jpg" alt="熊大大" width=75 /></td></tr>
                    <tr><td align="right">数据库：</td><td>MySQL</td><td align="right"><td></td></tr>
                </table>
            
			</div>
        </div>
    </div>
  
</div>
</body>
</html>