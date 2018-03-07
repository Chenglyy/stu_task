package cn.rycheng.news;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class NewsDeleteCl extends HttpServlet{
	
	String tableName="tb_news";
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String ns_id=req.getParameter("ns_id");
		String sql="delete from "+tableName+" where ns_id=?";
		String []info={ns_id};
		NewsBeanCl nbc=new NewsBeanCl();
		RequestDispatcher dispatcher=req.getRequestDispatcher("operationJudge.jsp");
		String sPageNow=req.getParameter("pageNow");
		req.setAttribute("pageNow", sPageNow);
		if (nbc.updateUser(sql, info))
		{
			req.setAttribute("isSuccess",true);
		}else
		{
			req.setAttribute("isSuccess", false);
		}
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
	
	}
}