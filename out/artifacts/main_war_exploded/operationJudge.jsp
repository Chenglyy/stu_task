<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="cn.rycheng.user.*" %>
<%@ page import="java.util.ArrayList" %>
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
                <li ><a href="index.jsp" class="icon-home"> 开始</a></li>
                <li><a href="system.html" class="icon-cog"> 系统</a>
            		<ul><li><a href="#">全局设置</a></li><li class="active"><a href="#">系统设置</a></li><li><a href="#">会员设置</a></li><li><a href="#">积分设置</a></li></ul>
                </li>
                <li><a href="content.html" class="icon-file-text"> 内容</a>
					<ul><li><a href="#">添加内容</a></li><li class="active"><a href="#">内容管理</a></li><li><a href="#">分类设置</a></li><li><a href="#">链接管理</a></li></ul>
                </li>
                <li class="active"><a href="userFrame.jsp" class="icon-user"> 用户</a>
                <ul><li><a href="system.html">发布留言</a></li><li><a href="content.html">审核信息</a></li><li class="active"><a href=userFrame.jsp>用户管理</a></li><li ><a href=newsFrame.jsp>新闻管理</a></li><li><a href="#">论坛管理</a></li><li><a href="#">树洞管理</a></li></ul>
                </li>
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
<%
	  boolean isSuccess=(boolean)request.getAttribute("isSuccess");
	  if (isSuccess)
	  {
	%>
	<p>操作成功</p>
	<%}
	  else{%>
	 <p1>操作失败</p1>
	 <%} 
	  String sPageNow=(String)request.getAttribute("pageNow");
	  int pageNow=Integer.parseInt(sPageNow);
	  out.println("<a href=userFrame.jsp?pageNow="+pageNow+">返回主界面</a>");
	 %>  
	 </div> 
</body>
</html>