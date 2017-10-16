<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="com.svl.present.sprintDAO"%>
<%@page import="com.svl.present.sprintDTO"%>
<script type="text/javascript">
<!--
function insertsprintchek(){
	if(document.InsertSprint.sprintname.value==""){
		alert("기간명을 입력하세요.");
		document.InsertSprint.sprintname.focus();
		return;
	}
	if(document.InsertSprint.sprintColor.value==""){
		alert("색을 입력하세요.");
		document.InsertSprint.sprintColor.focus();
		return;
	}
	if(document.InsertSprint.StartYear.value==""){
		alert("시작년도를 입력하세요.");
		document.InsertSprint.StartYear.focus();
		return;
	}
	if(document.InsertSprint.StartMonth.value==""){
		alert("시작월을 입력하세요.");
		document.InsertSprint.StartMonth.focus();
		return;
	}
	if(document.InsertSprint.StartDay.value==""){
		alert("시작일을 입력하세요.");
		document.InsertSprint.StartDay.focus();
		return;
	}
	if(document.InsertSprint.OverYear.value==""){
		alert("끝나는 년도를 입력하세요.");
		document.InsertSprint.OverYear.focus();
		return;
	}
	if(document.InsertSprint.OverMonth.value==""){
		alert("종료월을 입력하세요.");
		document.InsertSprint.OverMonth.focus();
		return;
	}
	if(document.InsertSprint.OverDay.value==""){
		alert("종료일을 입력하세요.");
		document.InsertSprint.OverDay.focus();
		return;
	}
	if(document.InsertSprint.StartYear.value>document.InsertSprint.OverYear.value)
	{
		alert("기간의 시작일은 종료일 보다 빨라야 합니다.");
		document.InsertSprint.StartYear.focus();
	}else if(document.InsertSprint.StartYear.value==document.InsertSprint.OverYear.value 
			&& document.InsertSprint.StartMonth.value>document.InsertSprint.OverMonth.value){
		alert("기간의 시작일은 종료일 보다 빨라야 합니다.");
		document.InsertSprint.StartYear.focus();
	}else if(document.InsertSprint.StartYear.value==document.InsertSprint.OverYear.value
			&& document.InsertSprint.StartMonth.value==document.InsertSprint.OverMonth.value 
			&& document.InsertSprint.StartDay.value > document.InsertSprint.OverDay.value){
		alert("기간의 시작일은 종료일 보다 빨라야 합니다.");
		document.InsertSprint.StartYear.focus();
	}
	
	document.InsertSprint.submit();
}
//-->
</script>
<%!String sName, sValue;%>
<%
	Enumeration enumeration = session.getAttributeNames();
	while (enumeration.hasMoreElements()) {
		sName = enumeration.nextElement().toString();
		sValue = (String) session.getAttribute(sName);
	}

	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH) + 1;
	int day = cal.get(Calendar.DATE);

	int syear, smonth, sday;
	String sprint_name, sprint_color, special_day;
%>

<!-- left 스크린-->
<div class="left_main" style="float: left; width: 75%">
	<br>
	<%
		sprintDAO sprint = new sprintDAO();
		sprint.setUserid(sValue);
		sprint.setY(year);
		sprint.setM(month);
		sprint.setD(day);
		ArrayList<sprintDTO> dtos = sprint.sprintset();
		if (dtos.size() == 0) {
			out.print(year + "년" + month + "월" + day + "일</br>");
			out.print("현재 진행중인 스프린트가 존재하지 않습니다.");

		} else {
	%>
	<div class="row">
		<%
			for (int s = 0; s < dtos.size(); s++) {
					//기간 정보 받아옴
					sprintDTO dto = dtos.get(s);
					syear = dto.getSyear();
					smonth = dto.getSmonth();
					sday = dto.getSdays();
					sprint_color = dto.getSprint_color();
					sprint_name = dto.getSprint_name();
					special_day = dto.getSpecial_day();
		%>
		<div class="col-xs-5 col-md-3">
			<a href="#" class="thumbnail">
				<div class="caption">
					<h3>
						<%
							out.print(syear + "년<br/>" + smonth + "월 " + sday + "일");
						%>
					</h3>
				</div> <%
 	out.print(sprint_name);
 %>
			</a>
		</div>
		<%
			}
			}
		%>

	</div>
</div>
	<div class="right_main" style="float: right; width: 19%">
		<!-- 현 스프린트의 진행상황을 팝업으로 띄워줌 모달x-->
		<button class="btn btn-warning" data-toggle="modal"
			data-target="#insertSPRINT">스프린트 추가</button>
		<br> <br>
		<!-- 기간을 클릭하면 left 스크린데 그 기간의 일정을 보여줌 탭으로 구성 미정/마지막에 작성-->
		<table class="table table-hover">
			<thead>현재 저장된 기간 항목
			</thead>
			<%
				ArrayList<sprintDTO> cdt = sprint.calarderset();
				String[] spr = new String[cdt.size()];
				for (int s = 0; s < cdt.size(); s++) {
					sprintDTO dto = cdt.get(s);
					spr[s] = dto.getSprint_name();
					int cnt = 0;
					for (int i = 0; i < s; i++) {
						if (spr[i].equals(spr[s])) {
							cnt++;
						}
					}
					if (cnt == 0 && spr[s] != null) {
						out.print("<tr><td>" + spr[s] + "</td></tr>");
					}
				}
			%>

		</table>
	</div>


	<!-- 스프린트 기간 추가 모달 -->
	<div class="modal fade bs-example-modal-sm" id="insertSPRINT"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">기간 추가</h4>
				</div>

				<!-- 기간 추가 -->
				<form action="InsertSprint.jsp" method="post" name="InsertSprint">
					<div class="modal-body">
						<div class="col">
							<input type="text" class="form-control" name="sprintname"
								style="float: left; whight = 69%; margin-bottom: 3%;"
								placeholder="기간 이름"> <input type="text"
								class="form-control" name="sprintColor"
								style="float: right; whight = 29%; margin-bottom: 3%"
								placeholder="원하는 색의 웹 컬러 코드를 입력해 주세요.">
						</div>
						<div class="row">
							<div class="col-md-4">
								<input type="text" class="form-control" name="StartYear"
									style="margin-top: 3%;" placeholder="시작년도(ex : 1993)">
							</div>
							<div class="col-md-4">
								<input type="text" class="form-control" name="StartMonth"
									style="margin-top: 3%;" placeholder="시작월(ex : 10)">
							</div>
							<div class="col-md-4">
								<input type="text" class="form-control" name="StartDay"
									style="margin-top: 3%;" placeholder="시작일(ex : 10)">
							</div>
						</div>
						<div class="row">
							<div class="col-md-4">
								<input type="text" class="form-control" name="OverYear"
									style="margin-top: 3%;" placeholder="종료년도(ex : 1993)">
							</div>
							<div class="col-md-4">
								<input type="text" class="form-control" name="OverMonth"
									style="margin-top: 3%;" placeholder="종료월(ex : 10)">
							</div>
							<div class="col-md-4">
								<input type="text" class="form-control" name="OverDay"
									style="margin-top: 3%;" placeholder="종료일(ex : 10)">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<input type="button" class="btn btn-warning" value="추가"
							onclick="insertsprintchek()">
					</div>
				</form>
			</div>
		</div>
	</div>