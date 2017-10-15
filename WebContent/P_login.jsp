<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.svl.present.memberDAO"%>
<%@page import="com.svl.present.memberDTO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String userid, passwd;

		/*로그인 확인 PID, PPW를 받아옴*/
		String PID = request.getParameter("inputID");
		String PPW = request.getParameter("inputPD");

		memberDAO memberDAO = new memberDAO();
		ArrayList<memberDTO> dtos = memberDAO.memberSelect();

		for (int i = 0; i < dtos.size(); i++) {
			//로그인 정보 받아옴
			memberDTO dto = dtos.get(i);
			userid = dto.getUserID();
			passwd = dto.getUserPW();

			/*로그인 정보 일치 확인*/
			if (userid.equals(PID) && passwd.equals(PPW)) {
				///세션 pid 생성
				session.setAttribute("pid", PID);
				out.print(PID + "님 로그인!");
				response.sendRedirect("main.jsp");
			} else if(userid.equals(PID)) {
				response.sendRedirect("index.jsp");
			}
		}
	%>
</body>
</html>