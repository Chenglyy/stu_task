package cn.rycheng.user;

import java.sql.*;

public class SqlHelper {
	static String driver="com.mysql.jdbc.Driver";
	String url="jdbc:mysql://localhost/db_stu_message?user=root&password=admin";
	private Connection connection;
	ResultSet rset;
	PreparedStatement ps;
	static {
		try{
			Class.forName(driver);
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
	}
	public void close(){
		try{
			if (ps!=null) ps.close();
			if (rset!=null) rset.close();
			if (connection!=null) connection.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	public ResultSet queryQuery(String sql){
		try {
			connection = DriverManager.getConnection(url);
			ps = connection.prepareStatement(sql);
			rset = ps.executeQuery();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return rset;
	}
	public boolean updateExecute(String sql,String []info){
			
			boolean isSuccess=true;		//�ж��Ƿ�ɹ��������
			try {
				connection=DriverManager.getConnection(url);
	
				ps=connection.prepareStatement(sql);
				for(int i=0;i<info.length;i++){
					ps.setString(i+1, info[i]);
				}
				ps.executeUpdate();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				isSuccess=false;
				e1.printStackTrace();
			}finally{
				this.close();
			}
	 		return isSuccess;	
		}
	public ResultSet queryExecute(String sql,String []info){
		try {
			connection=DriverManager.getConnection(url);
			ps=connection.prepareStatement(sql);
			for(int i=0;i<info.length;i++){
				ps.setString(i+1, info[i]);
			}
			rset=ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rset;
	}

	public ResultSet queryExecute(String sql){
		try {
			connection=DriverManager.getConnection(url);
			ps=connection.prepareStatement(sql);
			rset=ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rset;
	}
	
}
