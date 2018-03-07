package cn.rycheng.user;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UserInsertCl extends HttpServlet{
	String tableName="tb_user";
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		String urUser=req.getParameter("urUser");
		String urPwd=req.getParameter("urPwd");
		String urType=req.getParameter("urType");
		String urEmail=req.getParameter("urEmail");
		String urPhonelong=req.getParameter("urPhonelong");
		String urPhoneshort=req.getParameter("urPhoneshort");
		String urAcademy=req.getParameter("urAcademy");
		String urDepartment=req.getParameter("urDepartment");
		String urMajor=req.getParameter("urMajor");
		String urName=req.getParameter("urName");
		String urPrincipal=req.getParameter("urPrincipal");
		String urPower=req.getParameter("urPower");
		System.out.println("urUser="+urUser);
		String sql="insert into "+tableName+" (ur_pwd,ur_type,ur_email,ur_phonelong,ur_phoneshort,"
				+ "ur_academy,ur_department,ur_major,ur_name,ur_principal,ur_power,ur_user)values(?,?,?,?,?,?,?,?,?,?,?,?);";
		String []info={urPwd,urType,urEmail,urPhonelong,urPhoneshort,urAcademy,urDepartment,urMajor,urName,urPrincipal,urPower,urUser};
		UserBeanCl ubc=new UserBeanCl();
		String sPageNow=req.getParameter("pageNow");
		System.out.println("sPageNow="+sPageNow);
		req.setAttribute("pageNow", sPageNow);
		RequestDispatcher dispatcher=req.getRequestDispatcher("operationJudge.jsp");
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
