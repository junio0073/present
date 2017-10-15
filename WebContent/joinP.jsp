<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.svl.present.*" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>


<%
	String userid= request.getParameter("userID");
	String userpw= request.getParameter("userPW");
	String E_mail= request.getParameter("E_mail");

	memberDTO dto = new memberDTO(userid, userpw, E_mail);

	memberDAO dao = memberDAO.getInstance();
	if(dao.joinCK(dto.getUserID())==memberDAO.MEMBER_EXIST){
%>
	<script language="javascript">
	 alert("아이디가 이미 존재 합니다.");
	 history.back();
	</script>
<%		
	}else{
		int ck=dao.insertMember(dto);
		if(ck==1){
			session.setAttribute("id", dto.getUserID());
%>
	<script language="javascript">
	 alert("회원가입을 축하 합니다!");
	 document.location.href="main.jsp";
	</script>
<%		
		} else {
%>
	<script language="javascript">
	 alert("회원가입에 실패했습니다.");
	 document.location.href="index.jsp";
	</script>
	<%
		}
	}
	%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
회원가입 창
</body>
</html>