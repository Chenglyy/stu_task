package cn.rycheng.news;

import cn.rycheng.user.SqlHelper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class NewsBeanCl {
	public static int rowCount;
	/*
	 * ��ɶ��û�����ɾ��Ĳ���
	 * ���ط�ҳ���ܵ�ǰ�û�����Ϣ
	 */
	
	//�����û���Ϣ,����ɾ����
	public boolean updateUser(String sql,String []info)
	{
		SqlHelper sqlHelper=new SqlHelper();
		return sqlHelper.updateExecute(sql, info);
	}
	
	//��ѯ�û���Ϣ,���������Ĳ�ѯ
	public ArrayList<NewsBean> getQueryArrayList(String sql, int pageNow, int pageSize)
	{
		SqlHelper sqlHelper=new SqlHelper();
		ResultSet rset=sqlHelper.queryExecute(sql);
		ArrayList<NewsBean> al=new ArrayList<NewsBean>();
		NewsBean nb=new NewsBean();
		try {
			int j=0;
			rowCount=0;
			while(rset.next())
			{
				rowCount++;
				if (j>=(pageNow-1)*pageSize&&j<(pageNow*pageSize))    //����ĳһҳ��Ԫ��
				{
					nb=new NewsBean();
//					nb.setIs_address(is_address);
//					nb.setIs_id(is_id);
//					nb.setIs_ns_id(is_ns_id);
//					nb.setNcm_context(ncm_context);
//					nb.setNcm_id(ncm_id);
//					nb.setNcm_ns_id(ncm_ns_id);
//					nb.setNcm_time(ncm_time);
//					nb.setNcm_ur_good(ncm_ur_good);
//					nb.setNcm_ur_user(ncm_ur_user);
					nb.setNs_attachment(rset.getString("ns_attachment"));
					nb.setNs_author(rset.getString("ns_author"));
					nb.setNs_content(rset.getString("ns_content"));
					nb.setNs_date(rset.getString("ns_date"));
					nb.setNs_doc(rset.getString("ns_doc"));
					nb.setNs_id(rset.getInt("ns_id"));
					nb.setNs_image_id(rset.getString("ns_image_id"));
					nb.setNs_title(rset.getString("ns_title"));
					nb.setNs_unit(rset.getString("ns_unit"));
					al.add(nb);
				}
				j++;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
	}
	//ֻ����һ�����ݵ��Ѳ����
	public ArrayList<NewsBean>getQueryArrayList(String sql, String []info){
		SqlHelper sqlHelper=new SqlHelper();
		ResultSet rset=sqlHelper.queryExecute(sql,info);
		ArrayList<NewsBean> al=new ArrayList<NewsBean>();
		NewsBean nb=new NewsBean();
		try {
//			nb.setIs_address(is_address);
//			nb.setIs_id(is_id);
//			nb.setIs_ns_id(is_ns_id);
//			nb.setNcm_context(ncm_context);
//			nb.setNcm_id(ncm_id);
//			nb.setNcm_ns_id(ncm_ns_id);
//			nb.setNcm_time(ncm_time);
//			nb.setNcm_ur_good(ncm_ur_good);
//			nb.setNcm_ur_user(ncm_ur_user);
			if (rset.next())
			{
				nb.setNs_attachment(rset.getString("ns_attachment"));
				nb.setNs_author(rset.getString("ns_author"));
				nb.setNs_content(rset.getString("ns_content"));
				nb.setNs_date(rset.getString("ns_date"));
				nb.setNs_doc(rset.getString("ns_doc"));
				nb.setNs_id(rset.getInt("ns_id"));
				nb.setNs_image_id(rset.getString("ns_image_id"));
				nb.setNs_title(rset.getString("ns_title"));
				nb.setNs_unit(rset.getString("ns_unit"));
			}
			al.add(nb);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
	
	}
	//���������Ѳ����
	public ArrayList<NewsBean> getQueryArrayList(String sql, String []info, int pageNow, int pageSize)
	{
		SqlHelper sqlHelper=new SqlHelper();
		ResultSet rset=sqlHelper.queryExecute(sql,info);
		ArrayList<NewsBean> al=new ArrayList<NewsBean>();
		NewsBean nb=new NewsBean();
		try {
			int j=0;
			rowCount=0;
			while(rset.next())
			{
				rowCount++;
				if (j>=(pageNow-1)*pageSize&&j<(pageNow*pageSize))    //����ĳһҳ��Ԫ��
				{
					nb=new NewsBean();
//					nb.setIs_address(is_address);
//					nb.setIs_id(is_id);
//					nb.setIs_ns_id(is_ns_id);
//					nb.setNcm_context(ncm_context);
//					nb.setNcm_id(ncm_id);
//					nb.setNcm_ns_id(ncm_ns_id);
//					nb.setNcm_time(ncm_time);
//					nb.setNcm_ur_good(ncm_ur_good);
//					nb.setNcm_ur_user(ncm_ur_user);
					nb.setNs_attachment(rset.getString("ns_attachment"));
					nb.setNs_author(rset.getString("ns_author"));
					nb.setNs_content(rset.getString("ns_content"));
					nb.setNs_date(rset.getString("ns_date"));
					nb.setNs_doc(rset.getString("ns_doc"));
					nb.setNs_id(rset.getInt("ns_id"));
					nb.setNs_image_id(rset.getString("ns_image_id"));
					nb.setNs_title(rset.getString("ns_title"));
					nb.setNs_unit(rset.getString("ns_unit"));
					al.add(nb);
				}
				j++;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
	}
}
