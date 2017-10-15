package com.svl.present;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.*;
import javax.sql.DataSource;

public class memberDAO {
//	private String jdbcUrl = "jdbc:mysql://localhost:3306/present"; 
//	private String id="root";
//	private String pw="1234";
	public static final int MEMBER_NON_EXIST=0;
	public static final int MEMBER_EXIST=1;
	
	private static memberDAO instance = new memberDAO();
	
	public static memberDAO getInstance() {
		return instance;
	}
	private DataSource dataSource;
	
    public memberDAO() {
//		try {
//			Class.forName("com.mysql.jdbc.Driver");
//			
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
    	
    	try {
    		Context context = new InitialContext();
    		dataSource = (DataSource)context.lookup("java:comp/env/jdbc/mysql5");
    		dataSource.getConnection();
    	}catch(NamingException e) {
    		e.printStackTrace();
    	}catch(SQLException e) {
    		e.printStackTrace();
    	}
    }
    
    public ArrayList<memberDTO> memberSelect(){
    	ArrayList<memberDTO> dtos = new ArrayList<memberDTO>();
    	
    	Connection con=null;
    	Statement stmt= null;
    	ResultSet rs = null;
    	
    	try {
    //		con=DriverManager.getConnection(jdbcUrl, id, pw);
    		con=dataSource.getConnection();
    		stmt=con.createStatement();
    		rs=stmt.executeQuery("select * from p_members");
    		
    		while(rs.next()) {
    			String userID= rs.getString("user_ID");
    			String userPW= rs.getString("user_PW");
    			String E_mail= rs.getString("E_mail");
    			
    			memberDTO dto = new memberDTO(userID, userPW, E_mail);
    			dtos.add(dto);
    		}
    	}catch(Exception e){
    		e.printStackTrace();
    	}finally {
    		try {
    		if(rs!=null) rs.close();
    		if(stmt!=null) stmt.close();
    		if(con != null) con.close();
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}
    	return dtos;
    }

    public int joinCK(String id) {
    	int ck=0;
    	
    	Connection con = null;
    	PreparedStatement pstmt = null;
    	ResultSet set = null;
    	String query = "select user_ID from p_members where user_ID=?";

    	try {
    		con=dataSource.getConnection();
    		pstmt = con.prepareStatement(query);
    		pstmt.setString(1, id);
    		set = pstmt.executeQuery();
    		if(set.next()) {
    			ck = memberDAO.MEMBER_EXIST;
    		}else {
    			ck = memberDAO.MEMBER_NON_EXIST;
    		}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		try {
    			set.close();
    			pstmt.close();
    			con.close();
    		} catch(Exception ee) {
    			ee.printStackTrace();
    		}
    	}
    			
    	return ck;
    }
    
    public int insertMember(memberDTO dto) {
		int ck = 0;
		Connection con = null;
		String query;
		Statement stmt = null;
		ResultSet rs = null;
		
    	try {
    		con = dataSource.getConnection();
			stmt = con.createStatement();
			//유저가 쓸 테이블 생성
			query = "create table " + dto.getUserID() + "_calender(syear int,\r\n" + 
					"smonth int,\r\n" + 
					"sday int,\r\n" + 
					" sprint_color varchar(15),\r\n" + 
					" sprint_name varchar(100),\r\n" + 
					" special_day varchar(50),\r\n" + 
					" primary key(syear,smonth,sday)\r\n" + 
					")";
			stmt.executeUpdate(query);
			
			//유저 정보 저장
			query = "insert into p_members value('"+dto.getUserID()+"','"+dto.getUserPW()+"','"+dto.getE_mail()+"')";
			stmt.executeUpdate(query);
			
			ck=1;
    	}catch(Exception e){
    		e.printStackTrace();
    	}finally {
    		try {
    			if(stmt!=null) stmt.close();
    			if(con!=null) con.close();
    		}catch(Exception ee){
    			ee.printStackTrace();
    		}
    	}
    	return ck;
    }
}
