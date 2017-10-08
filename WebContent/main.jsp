<%@ page contentType = "text/html;charset=utf-8" %>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="bootstrap3.3.2/css/bootstrap.css?ver=3">
  <link rel="stylesheet" href="P_style.css?ver=3">
  <title> hello, present! </title>
  <style type="text/css">
    .navbar-brand {
      color: rgb(255, 255, 255);
      font-family: 'metropolis';
    }
    body,
    html {
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
<%!
String sName,sValue;
%>
<%
	Enumeration enumeration=session.getAttributeNames();
	while(enumeration.hasMoreElements()){
		sName= enumeration.nextElement().toString();
		sValue=(String)session.getAttribute(sName);
	}
%>

<div class="container" id="main_contain">
 <div class="navbar navbar-inverse navbar-fixed-top">
   <div class="container" style="height:20%">
      <div class="navbar-header">
        <!-- 브라우저가 좁아졋을때 나오는 버튼(클릭시 메뉴출력) -->
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
        <a class="navbar-brand" href="main.html">present</a>
      </div>
      <div class="collapse navbar-collapse pull-right">
        <ul class="nav navbar-nav">
          <li><a><%=sValue %></a></li>
          <li><a href="logout.jsp" >logout</a></li>
        </ul>
      </div>
    </div>
  </div>
  <br><br>
  <br>
  <br>


  <div class="container" id="navcontain">
    <ul id="myTab" class="nav nav-tabs" role="tablist">
      <li role="presentation" class="active"><a data-target="#main_m" id="home-tab" role="tab" data-toggle="tab" aria-controls="main_m" aria-expanded="true">월별</a></li>
      <li role="presentation" class=""><a data-target="#main_d" role="tab" id="profile-tab" data-toggle="tab" aria-controls="main_d" aria-expanded="false">일별</a></li>
      <li role="presentation" class=""><a data-target="#main_s" role="tab" id="profile-tab" data-toggle="tab" aria-controls="main_s" aria-expanded="false">기간별</a></li>
    </ul>

    <!--탭에 따라 바뀌는 내용들-->

    <div id="myTabContent" class="tab-content">
      <div role="tabpanel" class="tab-pane fade active in" id="main_m" aria-labelledby="home-tab">
        <jsp:include page="main_m.jsp"></jsp:include>
      </div>

      <div role="tabpanel" class="tab-pane fade" id="main_d" aria-labelledby="home-tab">
		<jsp:include page="main_d.jsp"></jsp:include>
      </div>

      <div role="tabpanel" class="tab-pane fade" id="main_s" aria-labelledby="home-tab">
		<jsp:include page="main_s.jsp"></jsp:include>
      </div>
    </div>
  </div>

</div>
    <script src="http://code.jquery.com/jquery.js?ver=3"></script>
    <script src="bootstrap3.3.2/js/bootstrap.min.js?ver=3"></script>
</body>

</html>
