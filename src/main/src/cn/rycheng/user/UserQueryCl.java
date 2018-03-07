package cn.rycheng.user;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class UserQueryCl extends HttpServlet{

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
		UserBeanCl ubc=new UserBeanCl();
		ArrayList<UserBean> al;
		if(searchFilter==null){
			sql="select * from tb_user;";
			al=ubc.getQueryArrayList(sql, pageNow, pageSize);
		}
		else{
			if(searchFilter.isEmpty()){
				sql="select * from tb_user;";
				al=ubc.getQueryArrayList(sql, pageNow, pageSize);
			}else{
				sql="select * from tb_user where ur_name like '%"+searchFilter+"%';";
//				String []info={searchFilter};
//				al=ubc.getQueryArrayList(sql, info, pageNow, pageSize);
				al=ubc.getQueryArrayList(sql, pageNow, pageSize);
			}
		}
		req.setAttribute("al", al);	
		RequestDispatcher dispatcher=req.getRequestDispatcher("userFrame.jsp");
		
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
	}

}
