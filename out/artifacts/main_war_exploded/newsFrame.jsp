<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="cn.rycheng.user.*" %>
<%@ page import="cn.rycheng.news.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="cn.rycheng.news.NewsQueryCl" %>
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
    <%
    	 int pageSize=10;		//每页显示多少条记录
   		 int pageNow;       	//希望显示第几页
   		 int pageCount=0;   	//一共有几页
   		 int rowCount=0;        //一共有多少条记录
   		int i1=1;
   		 //动态获得pageNow
   		 String sPageNow=request.getParameter("pageNow");
   		 if (sPageNow==null){
   			 pageNow=1;
   		 }else{
   			 pageNow=Integer.parseInt(sPageNow);
   		 }%>
   		 
   		 <div class="top">
</div>


<!-- 中间部分 -->
<div class="middle">
<div class="title"><font face="华文新魏" style="color:#375fa5; font-size:30px;">新闻管理中心</font></div>
</div>
   		 
   		 
   		 
	<div class="panel-head" align="right">
	<form action=newsQueryCl>
	<input type="text" size="50" name="searchFilter"/>
	<% out.println("<input type=hidden name=pageNow value="+pageNow+" />");
	   out.println("<input type=hidden name=pageSize value="+pageSize+" />");
	   %>
	<input type="submit" value="搜索" class="button button-small checkall">
	</form>
	</div>
    <div class="panel admin-panel">
    	
              <table boader="1" class="table table-hover">
                <tr style="height: 35px;background: #79a6d7; color:#fff; font-weight: bold; font-size: 22px;text-align:center; /*设置水平居中*/ vertical-align:middle;"><td>编号</td><td style="width:600px;">标题</td><td>发布单位/作者</td><td>发布日期</td><td colspan=2>操作</td></tr>
         <%
         String sql;
 		// sql="select * from tb_news;";
 		 NewsBeanCl ubc=new NewsBeanCl();
   		 ArrayList<NewsBean> al=(ArrayList)request.getAttribute("al");
   		 
   		 if (al==null)
   		 {
   			 if(NewsQueryCl.searchFilter!=null){
   				if(NewsQueryCl.searchFilter.isEmpty()){
   					sql="select * from tb_news order by ns_date DESC;";
   	   	   			al=ubc.getQueryArrayList(sql, pageNow, pageSize);
   				}else{
   					sql="select * from tb_news where ns_title like '%"+ NewsQueryCl.searchFilter+"%' order by ns_date DESC";
   	   				System.out.println(sql+ NewsQueryCl.searchFilter.isEmpty());
   	   				al=ubc.getQueryArrayList(sql,pageNow, pageSize);
   	   				System.out.println(al.size());
   				}
   			 }
   			 else{
   				sql="select * from tb_news order by ns_date DESC;";
   	   			al=ubc.getQueryArrayList(sql, pageNow, pageSize);
   			 }
   		 }		
   		 //获得userBean集合必须在rowCount之前，因为rowCount在userBeanCl进行获值
   		 //ArrayList<UserBean> al=ubc.getPageNowArrayList(pageNow, pageSize, sql);
   		
   		 //获得rowCount的值
   		 rowCount= NewsBeanCl.rowCount;
   		 if(rowCount%pageSize==0)     //计算一共有多少页
   			 pageCount=rowCount/pageSize;
   		 else
   			 pageCount=rowCount/pageSize+1;
   		 
   		 for(NewsBean a:al)
   		 {
   			 if(i1%2==0){
   		%>
   		<tr style="height: 30px; background: #a2c1c7;text-align:center; /*设置水平居中*/ vertical-align:middle; ">
	   		<td><%=a.getNs_id() %></td>
	   		<td><a href="newsModify.jsp?ns_id=<%=a.getNs_id()%>"><%=a.getNs_title()%></a></td>
	   		<td><%=a.getNs_unit()%></td>
	   		<td><%=a.getNs_date()%></td>
	   		<td><a class="button border-blue button-little" <%="href=newsModify.jsp?ns_id="+a.getNs_id() %>
   			 		 >编辑新闻</a></td>
   		<td><a class="button border-yellow button-little" <%=" href=NewsDeleteCl?ns_id="+a.getNs_id()+""
   			 		+ "&pageNow="+pageNow+" onclick=\"return window.confirm('确认删除')\""%>>删除新闻</a></td>
   		
   		</tr>
   		
   		<% }else{%> 
   		<tr style="height: 30px;background: #afcae7;text-align:center; /*设置水平居中*/ vertical-align:middle;">
	   		<td><%=a.getNs_id() %></td>
	   		<td><a href="newsModify.jsp?ns_id=<%=a.getNs_id()%>"><%=a.getNs_title()%></a></td>
	   		<td><%=a.getNs_unit()%></td>
	   		<td><%=a.getNs_date()%></td>
	   		<td><a class="button border-blue button-little" <%="href=newsModify.jsp?ns_id="+a.getNs_id() %>
   			 		 >编辑新闻</a></td>
   		<td><a class="button border-yellow button-little" <%=" href=NewsDeleteCl?ns_id="+a.getNs_id()+""
   			 		+ "&pageNow="+pageNow+" onclick=\"return window.confirm('确认删除')\""%>>删除新闻</a></td>
   		</tr>
   		 <%}i1++;}%>
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
   		 <ul class="pagination"><li><%="<a href=newsFrame.jsp?pageNow="+prePage+">上一页</a>" %></li></ul>
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
               		out.println("<a class=active href=newsFrame.jsp?pageNow="+i+">"+i+"</a>");
               	else
               		out.println("<a href=newsFrame.jsp?pageNow="+i+">"+i+"</a>");
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
              		out.println("<a class=active href=newsFrame.jsp?pageNow="+i+">"+i+"</a>");
              	else
              		out.println("<a href=newsFrame.jsp?pageNow="+i+">"+i+"</a>");
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
          <ul class="pagination"><li><%out.println("<a href=newsFrame.jsp?pageNow="+nextPage+">下一页</a>"); %></li></ul>
        </div>
    </div>
    <br />
</div>
</body>
    
</body>
</html>