<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="cn.rycheng.user.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="cn.rycheng.user.UserQueryCl" %>
<%@ page import="cn.rycheng.user.UserBean" %>
<%@ page import="cn.rycheng.user.UserBeanCl" %>
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
    	 int pageSize=8;		//每页显示多少条记录
   		 int pageNow;       	//希望显示第几页
   		 int pageCount=0;   	//一共有几页
   		 int rowCount=0;        //一共有多少条记录
   		 //动态获得pageNow
   		 String sPageNow=request.getParameter("pageNow");
   		 if (sPageNow==null){
   			 pageNow=1;
   		 }else{
   			 pageNow=Integer.parseInt(sPageNow);
   		 }%>
	<div class="panel-head" align="right">
	<form action=userQueryCl>
	<input type="text" size="50" name="searchFilter"/>
	<% out.println("<input type=hidden name=pageNow value="+pageNow+" />");
	   out.println("<input type=hidden name=pageSize value="+pageSize+" />");
	   %>
	<input type="submit" value="搜索" class="button button-small checkall">
	</form>
	</div>
    <div class="panel admin-panel">
    	<div class="panel-head"><strong>内容列表</strong></div>
        <div class="padding border-bottom">
            <input type="button" class="button button-small checkall" name="checkall" checkfor="id" value="全选" />
            <a class="button button-small border-green" <% out.println("href=userInsert.jsp?pageNow="+pageNow+"");%>>添加用户</a>
            <input type="button" class="button button-small border-yellow" value="批量删除" />
        </div>
        <table boader="1" class="table table-hover">
                	<tr><th></th><th width="200">姓名/社团组织部门名</th><th width="120">用户名</th><th width="120">用户密码</th><th width="120">学院</th><th width="140">系/部门</th><th width="120">用户邮箱</th><th width="380">专业</th><th width="120">负责人</th><th width="120">手机长号</th><th width="120">手机短号</th><th width="120">权限</th> <th width="150">用户类型</th><th width="150" colspan=2>操作</th></tr>
         <%
   		 String sql;
   		 ArrayList<UserBean> al=(ArrayList)request.getAttribute("al");
   		 UserBeanCl ubc=new UserBeanCl();
   		 if (al==null)
   		 {
   			 if(UserQueryCl.searchFilter!=null){
   				if(UserQueryCl.searchFilter.isEmpty()){
   					sql="select * from tb_user;";
   	   	   			al=ubc.getQueryArrayList(sql, pageNow, pageSize);
   				}else{
   					sql="select * from tb_user where ur_name like '%"+ UserQueryCl.searchFilter+"%';";
   	   				al=ubc.getQueryArrayList(sql,pageNow, pageSize);
   				}
   			 }
   			 else{
   				sql="select * from tb_user;";
   	   			al=ubc.getQueryArrayList(sql, pageNow, pageSize);
   			 }
   		 }		
   		 //获得userBean集合必须在rowCount之前，因为rowCount在userBeanCl进行获值
   		 //ArrayList<UserBean> al=ubc.getPageNowArrayList(pageNow, pageSize, sql);
   		
   		 //获得rowCount的值
   		 rowCount= UserBeanCl.rowCount;
   		 if(rowCount%pageSize==0)     //计算一共有多少页
   			 pageCount=rowCount/pageSize;
   		 else
   			 pageCount=rowCount/pageSize+1;
   		 for(UserBean a:al)
   		 {
   		%><tr>
   		<td><input type="checkbox"></td>
   		<td><%=a.getUrName()%></td>
   		<td><%=a.getUrUser()%></td>
   		<td><%=a.getUrPwd()%></td>
   		<td><%=a.getUrAcademy()%></td>
   		<td><%=a.getUrDepartment()%></td>
   		<td><%=a.getUrEmail()%></td>
   		<td><%=a.getUrMajor()%></td>
   		<td><%=a.getUrPrincipal()%></td>
   		<td><%=a.getUrPhonelong()%></td>
   		<td><%=a.getUrPhoneshort()%></td>
   		<td><%=a.getUrPower()%></td>
   		<td><%=a.getUrType()%></td>
   		<td><a class="button border-blue button-little" <%="href=userModify.jsp?urName="+a.getUrName()+"&urUser="+a.getUrUser()+""
   			 		+ "&urPwd="+a.getUrPwd()+"&urAcademy="+a.getUrAcademy()+"&urDepartment="+a.getUrDepartment()+
   			 		"&urEmail="+a.getUrEmail()+"&urMajor="+a.getUrMajor()+"&urPrincipal="+a.getUrPrincipal()+
   			 		"&urPhonelong="+a.getUrPhonelong()+"&urPhoneshort="+a.getUrPhoneshort()+
   			 		"&urPower="+a.getUrPower()+"&urType="+a.getUrType()+"&pageNow="+pageNow+"" %>
   			 		 >修改</a></td>
   		<td><a class="button border-yellow button-little" <%=" href=UserDeleteCl?urUser="+a.getUrUser()+""
   			 		+ "&pageNow="+pageNow+" onclick=\"return window.confirm('确认删除')\""%>>删除</a></td>   		
   			 </tr>
   		<% }%>
        </table>
        <div class="panel-foot text-center">
        <% 
   		 //判断是否已经是第一页，如果是，则上一页内容显示最后一页的内容
   		 int prePage;
   		 if(pageNow==1)
   			 prePage=pageCount;
   		 else
   			 prePage=pageNow-1;
   		 %>
   		 <ul class="pagination"><li><%="<a href=userFrame.jsp?pageNow="+prePage+">上一页</a>" %></li></ul>
   		 <% 
   		 //控制超链接的显示数量
   		 //如果pageCount的数量大于或等于10时，显示10个链接
   		 if (pageCount>=10){
   			 int startA,endA;
      		 if ((pageNow-5)<=0)
      			 startA=1;
      		 else
      			 startA=pageNow-5;
      		 if((pageNow+4)>pageCount){
      			 endA=pageCount;
      			 startA=pageCount-10;
      		 }
      		 else{
      			 if (startA==1)
      				 endA=10;
      			 else
      				 endA=pageNow+4;
      		 }%>
      		 <ul class="pagination pagination-group">
             <%
             for(int i=startA;i<=endA;i++){
               	out.println("<li>");
               	if (i==pageNow)
               		out.println("<a class=active href=userFrame.jsp?pageNow="+i+">"+i+"</a>");
               	else
               		out.println("<a href=userFrame.jsp?pageNow="+i+">"+i+"</a>");
               	out.println("</li>");
               }
             %>
             </ul>
    		<% 
   		 }else{
   			%>
     		 <ul class="pagination pagination-group">
            <%
            for(int i=1;i<=pageCount;i++){
              	out.println("<li>");
              	if (i==pageNow)
              		out.println("<a class=active href=userFrame.jsp?pageNow="+i+">"+i+"</a>");
              	else
              		out.println("<a href=userFrame.jsp?pageNow="+i+">"+i+"</a>");
              	out.println("</li>");
              }
            %>
            </ul>
   		<% 
   		 }
   		 
           
   		 //判断是否已经是最后一页，如果是，则下一页内容显示第一页的内容
   		 int nextPage;
   		 if (pageNow==pageCount)
   			 nextPage=1;
   		 else
   			 nextPage=pageNow+1;
            	%>                      
          <ul class="pagination"><li><%out.println("<a href=userFrame.jsp?pageNow="+nextPage+">下一页</a>"); %></li></ul>
        </div>
    </div>
    <br />
</div>
    
</body>
</html>