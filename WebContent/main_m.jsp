<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="com.svl.present.sprintDAO"%>
<%@page import="com.svl.present.sprintDTO"%>

<%!int[] month_max_day = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
	int month, year, day, maxDay, d_of_w, i, j;
	String sName, sValue;%>
<%
	Enumeration enumeration = session.getAttributeNames();
	while (enumeration.hasMoreElements()) {
		sName = enumeration.nextElement().toString();
		sValue = (String) session.getAttribute(sName);
	}

	try {
		Calendar cal = Calendar.getInstance();
		//오늘의 년,월,일, 시작 요일
		month = Integer.parseInt(request.getParameter("MONTH"));
		year = Integer.parseInt(request.getParameter("YEAR"));
		day = Integer.parseInt(request.getParameter("DAY"));
		d_of_w = Integer.parseInt(request.getParameter("D_OF_W"));
		//해당 달의 첫번째 요일 구하기
		//윤년 확인
		if ((month == 2) && (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0))) {
			maxDay = 29;
		} else {
			maxDay = month_max_day[month - 1];
		}
	} catch (Exception e) {

	}

	int syear;
	int smonth;
	int sday;
	String sprint_color;
	String sprint_name;
	String special_day;
	//sprintDAO를 사용하여 캘린더 정보를 받아온다.
	sprintDAO sprint = new sprintDAO();
	sprint.setUserid(sValue);
	sprint.setY(year);
	sprint.setM(month);
	ArrayList<sprintDTO> dtos = sprint.calarderset();

	//dtos의 size만큼 받아옴
%>

<div class="left_main" style="float: left; width: 79%; height: 80%">

	<h3>
		<%=year%>
		년
		<%=month%>
		월

	</h3>

	<table class="month_table">
		<thead>
			<tr>
				<th><span style="color:red">일</span></th>
				<th>월</th>
				<th>화</th>
				<th>수</th>
				<th>목</th>
				<th>금</th>
				<th><span style="color:blue">토</span></th>
			</tr>
		</thead>
		<tr>
			<%
			    int cnt=0;
				//첫 줄 공백
				for (j = 1; j < d_of_w; j++) {
					out.print("<TD></TD>");
				}
				//달력 찍음
				for (i = 1; i <= maxDay; i++) {
					out.print("<TD bgcolor=\"");
					cnt=0;
					//dtos.size()만큼 확인
					for (int s = 0; s < dtos.size(); s++) {
						//기간 정보 받아옴
						sprintDTO dto = dtos.get(s);
						syear=dto.getSyear();
						smonth=dto.getSmonth();
						sday=dto.getSdays();
						sprint_color = dto.getSprint_color();
						sprint_name=dto.getSprint_name();
						special_day=dto.getSpecial_day();
						
						if(syear==year&&smonth==month&&sday==i)
						{
							if(sprint_color!=null){
						 	out.print(sprint_color+"\">" + i + "<br/>");
							out.print(sprint_name + "<br>");
							}else {
								out.print("ffffff"+"\">" + i + "<br/>");
								out.print("<br/>");
							}
							if(special_day!=null)
							{
								out.print(special_day+"<br/>");
							} else{out.print("<br/>");}
							cnt=1;
							break;
						}
					}
					
					if(cnt==0)
					{
						out.print("ffffff"+"\">" + i + "<br>");
						out.print("<br>");
						out.print("<br/>");
						cnt=1;
					}
				    out.print("</TD>");

					if ((i + j - 1) % 7 == 0) {
						out.print("</tr><tr>");
					}
				}
				
				for (;;) {
					if ((i + j - 2) % 7 != 0) {
						out.print("<td></td>");
						i++;
					} else
						break;
				}
			%>
		
	</table>
	<!-- 이전해 -->
	<a href="/present/main.jsp?YEAR=<%=year - 1%>&amp;MONTH=<%=month%>"
		target="_self"> <b>&lt;&lt;</b></a> &nbsp; &nbsp;
	<!-- 이전달 -->
	<%
		if (month > 0) {
	%>
	<a href="/present/main.jsp?YEAR=<%=year%>&amp;MONTH=<%=month - 1%>"
		target="_self"> <b>&lt;</b></a>
	<%
		} else {
			out.print("<b>&lt;</b>");
		}
	%>
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;

	<!-- 다음달-->
	<%
		if (month < 12) {
	%>
	<a href="/present/main.jsp?YEAR=<%=year%>&amp;MONTH=<%=month + 1%>"
		target="_self"> <b>&gt;</b></a>
	<%
		} else {
			out.print("<b>&gt;</b>");
		}
	%>
	&nbsp; &nbsp;
	<!-- 다음해 -->
	<a href="/present/main.jsp?YEAR=<%=year + 1%>&amp;MONTH=<%=month%>"
		target="_self"> <b>&gt;&gt;</b></a>
</div>
<div class="right_main" style="float: right; width: 19%; height: 80%">
	<br>
	<!-- 일정 항목은 클릭시 일정의 세부 내용을 보여주는 팝업을 생성 모달x-->
	<table class="table table-hover">
		<thead>기념일 목록
		</thead>
		
		<%
		for (int s = 0; s < dtos.size(); s++) {
			//기간 정보 받아옴
			sprintDTO dto = dtos.get(s);
			special_day=dto.getSpecial_day();
			if(special_day!=null){
			out.print("<tr><td>"+special_day+"</td></tr>");
			}
		}
		%>
	</table>
</div>