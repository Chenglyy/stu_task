package cn.rycheng.news;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class NewsQueryCl extends HttpServlet{

	public static String searchFilter;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		searchFilter=req.getParameter("searchFilter");
		String sPageNow=req.getParameter("pageNow");
		String sPageSize=req.getParameter("pageSize");
		int pageNow=Integer.parseInt(sPageNow);
		int pageSize=Integer.parseInt(sPageSize);
		String sql;
		NewsBeanCl ubc=new NewsBeanCl();
		ArrayList<NewsBean> al;
		if(searchFilter==null){
			sql="select * from tb_news order by ns_date DESC;";
			al=ubc.getQueryArrayList(sql, pageNow, pageSize);
		}
		else{
			if(searchFilter.isEmpty()){
				sql="select * from tb_news order by ns_date DESC;";
				al=ubc.getQueryArrayList(sql, pageNow, pageSize);
			}else{
				//searchFilter="1";
//				sql="select * from tb_news where ns_title=? order by ns_date DESC";
//				String []info={searchFilter};
				sql="select * from tb_news where ns_title like '%"+searchFilter+"%' order by ns_date DESC";
//				al=ubc.getQueryArrayList(sql, info, pageNow, pageSize);
				al=ubc.getQueryArrayList(sql, pageNow, pageSize);
			}
		}
		req.setAttribute("al", al);	
		RequestDispatcher dispatcher=req.getRequestDispatcher("newsFrame.jsp");
		
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
	}

}
