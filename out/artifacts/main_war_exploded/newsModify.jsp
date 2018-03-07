<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="cn.rycheng.user.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="cn.rycheng.news.*" %>
<%@ page import="cn.rycheng.news.NewsBean" %>
<%@ page import="cn.rycheng.news.NewsBeanCl" %>
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
                <li class="active"><a href="index.jsp" class="icon-home"> 开始</a>
                <ul><li><a href="system.html">发布留言</a></li><li><a href="content.html">审核信息</a></li><li ><a href=userFrame.jsp>用户管理</a></li><li class="active"><a href=newsFrame.jsp>新闻管理</a></li><li><a href="#">论坛管理</a></li><li><a href="#">树洞管理</a></li></ul>
               </li>
                <li><a href="system.html" class="icon-cog"> 系统</a>
            		<ul><li><a href="#">全局设置</a></li><li class="active"><a href="#">系统设置</a></li><li><a href="#">会员设置</a></li><li><a href="#">积分设置</a></li></ul>
                </li>
                <li><a href="content.html" class="icon-file-text"> 内容</a>
					<ul><li><a href="#">添加内容</a></li><li class="active"><a href="#">内容管理</a></li><li><a href="#">分类设置</a></li><li><a href="#">链接管理</a></li></ul>
                </li>
                <li ><a href="userFrame.jsp" class="icon-user"> 用户</a>
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
	<form  action=newsModifyCl>
	<%
		//String sPageNow=request.getParameter("pageNow");
		String sPageNow="1";
		out.println("<input type=hidden name=pageNow value="+sPageNow+" />");
	%>
    <div class="panel admin-panel">
    	<div class="panel-head"><strong>新闻编辑</strong></div>
        <table class="table table-hover" border="1">
        <%
        	String Ns_id=request.getParameter("ns_id");
        	NewsBeanCl nbc=new NewsBeanCl();
        	String []info={Ns_id};
        	String sql="select * from tb_news where ns_id=?;";
        	ArrayList<NewsBean> al=nbc.getQueryArrayList(sql, info);
        	String ns_id="";
        	String ns_title="";
        	String ns_author="";
        	String ns_content="";
        	String ns_date="";
        	String ns_doc="";
        	String ns_image_id="";
        	String ns_unit="";
        	String ns_attachment="";
        	for(NewsBean a:al)
        	{
        		ns_id=a.getNs_id()+"";
            	ns_title=a.getNs_title();
            	ns_author=a.getNs_author();
            	ns_content=a.getNs_content();
            	ns_date=a.getNs_date();
            	ns_doc=a.getNs_doc();
            	ns_image_id=a.getNs_image_id();
            	ns_unit=a.getNs_unit();
            	ns_attachment=a.getNs_attachment();
        	}
        	
        	out.println("<tr>");
    		out.println("<td>新闻编号</td>");
    		out.println("<td><input readonly type=text name=ns_id value="+ns_id+"></td>");
    		out.println("</tr>");
    		out.println("<tr>");
    		out.println("<td>发布单位/作者</td>");
    		out.println("<td><input  name=ns_author type=text value="+ns_author+"></td>");
    		out.println("</tr>");
    		out.println("<tr>");
    		out.println("<td>发布日期</td>");
    		out.println("<td><input readonly type=text name=ns_date value="+ns_date+"></td>");
    		out.println("</tr>");
    		out.println("<tr>");
    		out.println("<td>标题</td>");
    		out.println("<td><input type=text name=ns_title value="+ns_title+"></td>");
    		out.println("</tr>");
    		out.println("<tr>");
    		out.println("<td>内容</td>");
    		out.println("<td><input width=300px height=200px type=text name=ns_content value="+ns_content+"></td>");
    		out.println("</tr>");
    		out.println("<tr>");
    		out.println("<td>文档</td>");
    		out.println("<td><input type=text name=ns_doc value="+ns_doc+"></td>");
    		out.println("</tr>");
    		out.println("<tr>");
    		out.println("<td>图片id</td>");
    		out.println("<td><input type=text name=ns_image_id value="+ns_image_id+"></td>");
    		out.println("</tr>");
    		out.println("<tr>");
    	    out.println("<td>发布单位</td>");
    	    out.println("<td><input type=text name=ns_unit value="+ns_unit+"></td>");
    	    out.println("</tr>");
    	    out.println("<tr>");
    		out.println("<td>附件地址</td>");
    		out.println("<td><input type=text name=ns_attachment value="+ns_attachment+"></td>");
    		out.println("</tr>");
    		%>
   			<tr><td><input type=submit value=修改 class="button border-blue button-little"></td>
   			<td><a class="button border-yellow button-little" <%=" href=newsFrame.jsp"
   			 		+ "?pageNow="+sPageNow+" onclick=\"return window.confirm('确认放弃修改')\""%>>退出修改</a></td></tr>
        
        </table>
    </div>
    </form>
    <br />
</div>

</body>
</html>