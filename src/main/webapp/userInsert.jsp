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
    <script src="js/check.js"></script>
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
                <li ><a href="index.jsp" class="icon-home"> 开始</a> </li>
                <li><a href="system.html" class="icon-cog"> 系统</a>
            		<ul><li><a href="#">全局设置</a></li><li class="active"><a href="#">系统设置</a></li><li><a href="#">会员设置</a></li><li><a href="#">积分设置</a></li></ul>
                </li>
                <li><a href="content.jsp" class="icon-file-text"> 内容</a>
					<ul><li><a href="#">添加内容</a></li><li class="active"><a href="#">内容管理</a></li><li><a href="#">分类设置</a></li><li><a href="#">链接管理</a></li></ul>
                </li>
                <li class="active"><a href=userFrame.jsp class="icon-user"> 用户</a>
                 <ul><li><a href="system.html">发布留言</a></li><li><a href="content.html">审核信息</a></li><li class="active"><a href="userFrame.jsp">用户管理</a></li><li ><a href=newsFrame.jsp>新闻管理</a></li><li><a href="#">论坛管理</a></li><li><a href="#">树洞管理</a></li></ul></li>
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
 
<div class="admin">
	<form name="UserInsert" action=userInsertCl onSubmit='return CheckForm();'>
	<%
		String sPageNow=request.getParameter("pageNow");
		out.println("<input type=hidden name=pageNow value="+sPageNow+" />");
	%>
    <div class="panel admin-panel">
    	<div class="panel-head"><strong>用户信息</strong></div>
        <table class="table table-hover" border="1">
        <%
        	out.println("<tr>");
    		out.println("<td>姓名/社团组织部门名</td>");
    		out.println("<td><input type=text name=urName ></td>");
    		out.println("</tr>");
    		out.println("<tr>");
    		out.println("<td>用户名</td>");
    		out.println("<td><input name=urUser onBlur=CheckUrUser() type=text ></td>");
    		out.println("</tr>");
    		out.println("<tr>");
    		out.println("<td>用户密码</td>");
    		out.println("<td><input type=password name=urPwd  ></td>");
    		out.println("</tr>");
    		out.println("<td>确认密码</td>");
    		out.println("<td><input type=password name=urPwd1 onBlur=CheckPwd() ></td>");
    		out.println("</tr>");
    		out.println("<tr>");
    		out.println("<td>学院</td>");
    		out.println("<td><input type=text name=urAcademy ></td>");
    		out.println("</tr>");
    		out.println("<tr>");
    		out.println("<td>系/部门</td>");
    		out.println("<td><input type=text name=urDepartment ></td>");
    		out.println("</tr>");
    		out.println("<tr>");
    		out.println("<td>用户邮箱</td>");
    		out.println("<td><input type=text name=urEmail ></td>");
    		out.println("</tr>");
    		out.println("<tr>");
    		out.println("<td>专业</td>");
    		out.println("<td><input type=text name=urMajor ></td>");
    		out.println("</tr>");
    		out.println("<tr>");
    	    out.println("<td>负责人</td>");
    	    out.println("<td><input type=text name=urPrincipal></td>");
    	    out.println("</tr>");
    	    out.println("<tr>");
    		out.println("<td>手机长号</td>");
    		out.println("<td><input type=text name=urPhonelong ></td>");
    		out.println("</tr>");
    		out.println("<tr>");
    		out.println("<td>手机短号</td>");
    		out.println("<td><input type=text name=urPhoneshort ></td>");
    		out.println("</tr>");
    		out.println("<tr>");
    		out.println("<td>权限</td>");
    		out.println("<td><input type=text name=urPower ></td>");
    		out.println("</tr>");
    		out.println("<tr>");
    		out.println("<td>用户类型</td>");
    		out.println("<td><input type=text name=urType ></td>");
    		out.println("</tr>");
    		%>
   			<tr><td><input type=submit value=添加 class="button border-blue button-little"></td>
   			<td><a class="button border-yellow button-little" <%=" href=userFrame.jsp"
   			 		+ "?pageNow="+sPageNow+" onclick=\"return window.confirm('确认放弃添加')\""%>>退出添加</a></td></tr>
        
        </table>
    </div>
    </form>
    <br />
</div>
        </div>
    </div>
</div>
</body>
</html>