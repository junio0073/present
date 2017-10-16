package com.svl.present;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.*;
import javax.sql.DataSource;

public class sprintDAO {
	private DataSource dataSource;
	private String userid;
	private int y, m, d;

	public void setY(int year) {
		this.y = year;
	}

	public void setM(int month) {
		this.m = month;
	}

	public void setD(int day) {
		this.d = day;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserid() {
		return userid;
	}

	private static sprintDAO instance = new sprintDAO();

	public static sprintDAO getInstance() {
		return instance;
	}

	public sprintDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/mysql5");
			dataSource.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<sprintDTO> calarderset() {
		ArrayList<sprintDTO> dtos = new ArrayList<sprintDTO>();

		Connection con = null;
		String query;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			// con=DriverManager.getConnection(jdbcUrl, id, pw);
			con = dataSource.getConnection();
			stmt = con.createStatement();
			query = "select * from " + userid + "_calender where syear=" + y + " and smonth=" + m;

			rs = stmt.executeQuery(query);

			while (rs.next()) {
				int syear = rs.getInt("syear");
				int smonth = rs.getInt("smonth");
				int sday = rs.getInt("sday");
				String sprint_color = rs.getString("sprint_color");
				String sprint_name = rs.getString("sprint_name");
				String special_day = rs.getString("special_day");
				sprintDTO dto = new sprintDTO(syear, smonth, sday, sprint_color, sprint_name, special_day);
				dtos.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return dtos;
	}

	public ArrayList<sprintDTO> sprintset() {
		ArrayList<sprintDTO> dtos = new ArrayList<sprintDTO>();

		Connection con = null;
		String query;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			con = dataSource.getConnection();
			stmt = con.createStatement();
			query = "select * from " + userid + "_calender where sprint_name=" + "(select sprint_name from " + userid
					+ "_calender where syear=" + y + " and smonth=" + m + " and sday=" + d + ")";
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				int syear = rs.getInt("syear");
				int smonth = rs.getInt("smonth");
				int sday = rs.getInt("sday");
				String sprint_color = rs.getString("sprint_color");
				String sprint_name = rs.getString("sprint_name");
				String special_day = rs.getString("special_day");
				sprintDTO dto = new sprintDTO(syear, smonth, sday, sprint_color, sprint_name, special_day);
				dtos.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return dtos;
	}

	public void InsertSprint(String userID, String sprintname, String sprintColor, int StartYear, int StartMonth,
			int StartDay, int OverYear, int OverMonth, int OverDay) {
		int[] month_max_day = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };

		try {
			Connection con = dataSource.getConnection();
			String query;
			Statement stmt = stmt = con.createStatement();
			ResultSet rs = null;

			for (int i = StartYear; i <= OverYear; i++) {
				if (StartYear == OverYear) {
					for (int j = StartMonth; j <= OverMonth; j++) {
						if (j == OverMonth && StartMonth == OverMonth) {
							for (int a = StartDay; a <= OverDay; a++) {
								query="insert into "+userID+"_calender(syear,smonth,sday,sprint_color, sprint_name) value('"+i+"','"+j+"','"+a+"','"+sprintColor+"','"+sprintname+"')";
								stmt.executeUpdate(query);
							}
						} else if (j == OverMonth) {
							for (int a = 1; a <= OverDay; a++) {
								query="insert into "+userID+"_calender(syear,smonth,sday,sprint_color, sprint_name) value('"+i+"','"+j+"','"+a+"','"+sprintColor+"','"+sprintname+"')";
								stmt.executeUpdate(query);
							}
						} else {
							for (int a = StartDay; a <= month_max_day[j - 1]; a++) {
								query="insert into "+userID+"_calender(syear,smonth,sday,sprint_color, sprint_name) value('"+i+"','"+j+"','"+a+"','"+sprintColor+"','"+sprintname+"')";
								stmt.executeUpdate(query);
							}
						}
					}
				}else if(i==OverYear) {
					for (int j = StartMonth; j <= OverMonth; j++) {
						if (j == OverMonth && StartMonth == OverMonth) {
							for (int a = StartDay; a <= OverDay; a++) {
								query="insert into "+userID+"_calender(syear,smonth,sday,sprint_color, sprint_name) value('"+i+"','"+j+"','"+a+"','"+sprintColor+"','"+sprintname+"')";
								stmt.executeUpdate(query);
							}
						} else if (j == OverMonth) {
							for (int a = 1; a <= OverDay; a++) {
								query="insert into "+userID+"_calender(syear,smonth,sday,sprint_color, sprint_name) value('"+i+"','"+j+"','"+a+"','"+sprintColor+"','"+sprintname+"')";
								stmt.executeUpdate(query);
							}
						} else {
							for (int a = StartDay; a <= month_max_day[j - 1]; a++) {
								query="insert into "+userID+"_calender(syear,smonth,sday,sprint_color, sprint_name) value('"+i+"','"+j+"','"+a+"','"+sprintColor+"','"+sprintname+"')";
								stmt.executeUpdate(query);
							}
						}
					}
				}else {
					for (int j = StartMonth; j <= 12; j++) {
						if (j == StartMonth) {
							for (int a = StartDay; a <= month_max_day[j - 1]; a++) {
								query="insert into "+userID+"_calender(syear,smonth,sday,sprint_color, sprint_name) value('"+i+"','"+j+"','"+a+"','"+sprintColor+"','"+sprintname+"')";
								stmt.executeUpdate(query);
							}
						} else {
							for (int a = StartDay; a <= month_max_day[j - 1]; a++) {
								query="insert into "+userID+"_calender(syear,smonth,sday,sprint_color, sprint_name) value('"+i+"','"+j+"','"+a+"','"+sprintColor+"','"+sprintname+"')";
								stmt.executeUpdate(query);
							}
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
	}
}
