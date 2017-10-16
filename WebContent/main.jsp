<%@ page contentType="text/html;charset=utf-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="bootstrap3.3.2/css/bootstrap.css">
<link rel="stylesheet" href="P_style.css">
<title>hello, present!</title>
<style type="text/css">
.navbar-brand {
	color: rgb(255, 255, 255);
	font-family: 'metropolis';
}

body, html {
	height: 100%;
	margin: 0;
	padding: 0;
}

#headernav {
	clear: bot;
}

#main_contain {
	min-height: 100%;
}

#navcontain {
	min-height: 80%;
}

.month_table {
	margin-top: 30px;
	border-collapse: collapse;
	width: 100%;
}

table.month_table td {
	padding: 10px;
	vertical-align: top;
	text-align: left;
	width: 14%;
	border: 1px solid #ccc;
}

table.month_table th {
	width: 350px;S
	padding: 10px;
	text-align: center;
	width: 14%;
	border-top: 1px solid #ccc;
	border-left: 1px solid #ccc;
	border-right: 1px solid #ccc;
	border-bottom: 3px solid #ccc;
	background: #ececec;
}
</style>
<script>
	$(document).ready(function() {
		$('a[data-toggle="tab"]').on('hidden.bs.tab', function(e) {
			alert("이벤트 실행됨");
		});
	});
</script>
</head>

<body>
	<%!String sName, sValue;%>
	<%
		Enumeration enumeration = session.getAttributeNames();
		while (enumeration.hasMoreElements()) {
			sName = enumeration.nextElement().toString();
			sValue = (String) session.getAttribute(sName);
		}
	%>

	<div class="container" id="main_contain">
		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="container" style="height: 20%">
				<div class="navbar-header">
					<!-- 브라우저가 좁아졋을때 나오는 버튼(클릭시 메뉴출력) -->
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="main.html">present</a>
				</div>
				<div class="collapse navbar-collapse pull-right">
					<ul class="nav navbar-nav">
						<li><a><%=sValue%></a></li>
						<li><a href="logout.jsp">logout</a></li>
					</ul>
				</div>
			</div>
		</div>
		<br> <br> <br> <br>

		<!-- 탭 넣기 -->
		<div class="container" id="navcontain">
			<ul id="myTab" class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a data-target="#main_m"
					id="home-tab" role="tab" data-toggle="tab" aria-controls="main_m"
					aria-expanded="true">월별</a></li>
	<!-- 			<li role="presentation" class=""><a data-target="#main_d"
					role="tab" id="profile-tab" data-toggle="tab"
					aria-controls="main_d" aria-expanded="false">일별</a></li>-->
				<li role="presentation" class=""><a data-target="#main_s"
					role="tab" id="profile-tab" data-toggle="tab"
					aria-controls="main_s" aria-expanded="false">기간별</a></li>
			</ul>
			<%!Calendar cal = Calendar.getInstance();
	int year;
	int month;
	int day;
	int d_of_w;%>
			<%
				if (request.getParameter("MONTH") == null) {
					year = cal.get(Calendar.YEAR);
					month = cal.get(Calendar.MONTH) + 1;
					day = cal.get(Calendar.DATE);
					cal.set(year, month - 1, 1);
					d_of_w = cal.get(Calendar.DAY_OF_WEEK);
				} else {
					month = Integer.parseInt(request.getParameter("MONTH"));
					year = Integer.parseInt(request.getParameter("YEAR"));
					day = cal.get(Calendar.DATE);
					cal.set(year, month - 1, 1);
					year = cal.get(Calendar.YEAR);
					month = cal.get(Calendar.MONTH) + 1;
					d_of_w = cal.get(Calendar.DAY_OF_WEEK);
				}
			%>

			<!--탭에 따라 바뀌는 내용들-->
			<div id="myTabContent" class="tab-content">
				<div role="tabpanel" class="tab-pane fade active in" id="main_m"
					aria-labelledby="home-tab">
					<jsp:include page="main_m.jsp" flush="false">
						<jsp:param name="YEAR" value="<%=year%>" />
						<jsp:param name="MONTH" value="<%=month%>" />
						<jsp:param name="DAY" value="<%=day%>" />
						<jsp:param name="D_OF_W" value="<%=d_of_w%>" />
					</jsp:include>
				</div>

				<div role="tabpanel" class="tab-pane fade" id="main_d"
					aria-labelledby="home-tab">
					<jsp:include page="main_d.jsp"></jsp:include>
				</div>

				<div role="tabpanel" class="tab-pane fade" id="main_s"
					aria-labelledby="home-tab">
					<jsp:include page="main_s.jsp"></jsp:include>
				</div>
			</div>
		</div>

	</div>
	<script src="http://code.jquery.com/jquery.js?ver=3"></script>
	<script src="bootstrap3.3.2/js/bootstrap.min.js?ver=3"></script>
</body>

</html>
