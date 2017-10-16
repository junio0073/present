<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.svl.present.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<%! String sName, sValue; %>
<%
		Enumeration enumeration = session.getAttributeNames();
		while (enumeration.hasMoreElements()) {
			sName = enumeration.nextElement().toString();
			sValue = (String) session.getAttribute(sName);
		}
%>
<%
String sprintname= request.getParameter("sprintname");
String sprintColor= request.getParameter("sprintColor");
int StartYear= Integer.parseInt(request.getParameter("StartYear"));
int StartMonth= Integer.parseInt(request.getParameter("StartMonth"));
int StartDay= Integer.parseInt(request.getParameter("StartDay"));
int OverYear= Integer.parseInt(request.getParameter("OverYear"));
int OverMonth= Integer.parseInt(request.getParameter("OverMonth"));
int OverDay= Integer.parseInt(request.getParameter("OverDay"));

sprintDAO dao = sprintDAO.getInstance();
dao.InsertSprint(sValue, sprintname, sprintColor, StartYear, StartMonth, StartDay, OverYear, OverMonth, OverDay);

%>
	<script language="javascript">
	 alert("입력되었습니다.");
	 document.location.href="main.jsp";
	</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
</body>
</html>