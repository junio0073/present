<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<body>
        <!-- left 스크린-->
  <div class="left_main" style="float:left; width:79%">
     <div class="row">
       <div class="col-xs-6 col-md-2">
         <a href="#" class="thumbnail">
           <div class="caption">
           <h3>2019년<br>10월 7일 (수)</h3></div>
           <p>오예!</p>
        </a>
      </div>
    </div>
   </div>
    
   <div class="right_main" style="float:right; width:19%">
          <!-- 현 스프린트의 진행상황을 팝업으로 띄워줌 모달x-->
          <button class="btn btn-warning">일정 진행 상황</button>
          <br>
          <br>
            <!-- 기간을 클릭하면 left 스크린데 그 기간의 일정을 보여줌 탭으로 구성 미정/마지막에 작성-->
          <table class="table table-hover">
            <thead>
                현재 저장된 기간 항목
            </thead>
            <tr>
              <td>첫번째 기간</td>
            </tr>
            <tr>
              <td>두번째 기간</td>
            </tr>
          </table>
        </div>
    <script src="http://code.jquery.com/jquery.js?ver=3"></script>
    <script src="bootstrap3.3.2/js/bootstrap.min.js?ver=3"></script>
</body>

</html>
