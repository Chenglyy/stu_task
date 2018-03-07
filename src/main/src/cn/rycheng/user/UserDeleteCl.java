package cn.rycheng.user;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UserDeleteCl extends HttpServlet{
	
	String tableName="tb_user";
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String urUser=req.getParameter("urUser");
//		System.out.println("urName="+urName);
		String sql="delete from "+tableName+" where ur_user=?";
		String []info={urUser};
		UserBeanCl ubc=new UserBeanCl();
		RequestDispatcher dispatcher=req.getRequestDispatcher("operationJudge.jsp");
		String sPageNow=req.getParameter("pageNow");
		req.setAttribute("pageNow", sPageNow);
		if (ubc.updateUser(sql, info))
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
