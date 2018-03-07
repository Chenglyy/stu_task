package cn.rycheng.user;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserBeanCl {
	public static int rowCount;
	/*
	 * ??????????????????
	 * ????????????????????
	 */
	
	//??????????,?????????
	public boolean updateUser(String sql,String []info)
	{
		SqlHelper sqlHelper=new SqlHelper();
		return sqlHelper.updateExecute(sql, info);
	}
	
	//?????????,????????????
	public ArrayList<UserBean> getQueryArrayList(String sql, int pageNow, int pageSize)
	{
		SqlHelper sqlHelper=new SqlHelper();
		ResultSet rset=sqlHelper.queryExecute(sql);
		ArrayList<UserBean> al=new ArrayList<UserBean>();
		UserBean ub=new UserBean();
		try {
			int j=0;
			rowCount=0;
			while(rset.next())
			{
				rowCount++;
				if (j>=(pageNow-1)*pageSize&&j<(pageNow*pageSize))    //????????????
				{
					ub=new UserBean();
					ub.setUrUser(rset.getString("ur_user"));
					ub.setUrPwd(rset.getString("ur_pwd"));
					ub.setUrAcademy(rset.getString("ur_academy"));
					ub.setUrDepartment(rset.getString("ur_department"));
					ub.setUrEmail(rset.getString("ur_email"));
					ub.setUrMajor(rset.getString("ur_major"));
					ub.setUrName(rset.getString("ur_name"));
					ub.setUrPhonelong(rset.getString("ur_phonelong"));
					ub.setUrPhoneshort(rset.getString("ur_phoneshort"));
					ub.setUrPower(rset.getString("ur_power"));
					ub.setUrPrincipal(rset.getString("ur_principal"));
					ub.setUrType(rset.getString("ur_type"));
					al.add(ub);
				}
				j++;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
	}
	//??????????????
	public ArrayList<UserBean> getQueryArrayList(String sql, String []info, int pageNow, int pageSize)
	{
		SqlHelper sqlHelper=new SqlHelper();
		ResultSet rset=sqlHelper.queryExecute(sql,info);
		ArrayList<UserBean> al=new ArrayList<UserBean>();
		UserBean ub=new UserBean();
		try {
			int j=0;
			rowCount=0;
			while(rset.next())
			{
				rowCount++;
				if (j>=(pageNow-1)*pageSize&&j<(pageNow*pageSize))    //????????????
				{
					ub=new UserBean();
					ub.setUrUser(rset.getString("ur_user"));
					ub.setUrPwd(rset.getString("ur_pwd"));
					ub.setUrAcademy(rset.getString("ur_academy"));
					ub.setUrDepartment(rset.getString("ur_department"));
					ub.setUrEmail(rset.getString("ur_email"));
					ub.setUrMajor(rset.getString("ur_major"));
					ub.setUrName(rset.getString("ur_name"));
					ub.setUrPhonelong(rset.getString("ur_phonelong"));
					ub.setUrPhoneshort(rset.getString("ur_phoneshort"));
					ub.setUrPower(rset.getString("ur_power"));
					ub.setUrPrincipal(rset.getString("ur_principal"));
					ub.setUrType(rset.getString("ur_type"));
					al.add(ub);
				}
				j++;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
	}
	//?????????pageNow????????
	public ArrayList<UserBean> getPageNowArrayList(int pageNow, int pageSize, String sql)
	{
		SqlHelper sqlHelper=new SqlHelper();
		ResultSet rset=sqlHelper.queryQuery(sql);
		UserBean ub;
		ArrayList<UserBean> al=new ArrayList<UserBean>();
		try {
			int j=0;
			rowCount=0;
			while(rset.next())
			{
				rowCount++;
				if (j>=(pageNow-1)*pageSize&&j<(pageNow*pageSize))    //????????????
				{
					ub=new UserBean();
					ub.setUrUser(rset.getString("ur_user"));
					ub.setUrPwd(rset.getString("ur_pwd"));
					ub.setUrAcademy(rset.getString("ur_academy"));
					ub.setUrDepartment(rset.getString("ur_department"));
					ub.setUrEmail(rset.getString("ur_email"));
					ub.setUrMajor(rset.getString("ur_major"));
					ub.setUrName(rset.getString("ur_name"));
					ub.setUrPhonelong(rset.getString("ur_phonelong"));
					ub.setUrPhoneshort(rset.getString("ur_phoneshort"));
					ub.setUrPower(rset.getString("ur_power"));
					ub.setUrPrincipal(rset.getString("ur_principal"));
					ub.setUrType(rset.getString("ur_type"));
					al.add(ub);
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
