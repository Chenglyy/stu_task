package cn.rycheng.news;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class NewsModifyCl extends HttpServlet {

	String tableName="tb_news";
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		String ns_id=req.getParameter("ns_id");
    	String ns_title=req.getParameter("ns_title");
    	String ns_author=req.getParameter("ns_author");
    	String ns_content=req.getParameter("ns_content");
    	String ns_date=req.getParameter("ns_date");
    	String ns_doc=req.getParameter("ns_doc");
    	String ns_image_id=req.getParameter("ns_image_id");
    	String ns_unit=req.getParameter("ns_unit");
    	String ns_attachment=req.getParameter("ns_attachment");	
		String sql="update "+tableName+" set ns_title=?,ns_author=?,ns_content=?,ns_date=?,ns_doc=?,"
				+ "ns_image_id=?,ns_unit=?,ns_attachment=? where ns_id=?;";
		String []info={ns_title,ns_author,ns_content,ns_date,ns_doc,ns_image_id,ns_unit,ns_attachment,ns_id};
		NewsBeanCl nbc=new NewsBeanCl();
		String sPageNow=req.getParameter("pageNow");
		System.out.println("sPageNow="+sPageNow);
		req.setAttribute("pageNow", sPageNow);
		RequestDispatcher dispatcher=req.getRequestDispatcher("operationJudge.jsp");
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
