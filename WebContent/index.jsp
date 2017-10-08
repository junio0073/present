<%@ page language="java" contentType = "text/html;charset=utf-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="bootstrap3.3.2/css/bootstrap.css?ver=3">
    <link rel="stylesheet" href="P_style.css?ver=3">
    <title>
          hello, present!
    </title>
    <!-- 외부 css/외부 js로 빼줄것 -->
    <style type="text/css">
      body,html {
              height: 100%;
              margin: 0;
              padding: 0;
              background-color: black;
      }
      form div {
               width: 300px;
              padding: 10px;
      }
      #loginbt {
              width: 150px;
              margin-top: 10px; 
              /*transform: translateX(50%);*/
      }
      h1 {
              text-align: center;
      }
      h4 {
              text-align: center;
      }
      .maniH {
              color: rgb(255, 255, 255);
              font-family: 'metropolis';
      }
      .container {
              min-height: 100%;
              text-align:center;
      }
      .cell {
              position: absolute;
              top: 50%;
              transform: translateY(-50%) translateX(-50%);
              left: 50%;
      }
      
    </style>
    <script>
       $('#myModal').on('shown.bs.modal', function () {
       $('#myInput').focus()
       })

        // id 중복체크 function
        function idchek(){

        }

        //비밀번호 일치 체크
        function pwchek(){

        }
    </script>
  </head>

  <body>
     <div class="container">
        <div class="cell">
           <h1 class="maniH">Present</h1>
              <!-- 디비 커넥션으로 이동 버튼-->
           <form action="P_login.jsp" class="form-horizontal" role="form" method="post">
             <div class="input-group">
               <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
               <input type="text" class="form-control" name="inputID" placeholder="ID" aria-describedby="sizing-addon2">
             </div>
             <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                <input type="password" class="form-control" name="inputPD" placeholder="password" aria-describedby="sizing-addon2">
             </div>
             <nav>
                <input class="btn btn-warning" id="loginbt" type="submit" value="login">
                <br/><br/>
                <a class="hreftext" href="#hrefuser" data-toggle="modal">회원가입</a>
             </nav>
           </form>
        </div>
     </div>

     <!-- 회원가입 Modal -->
     <div class="modal fade bs-example-modal-sm" id="hrefuser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
         <div class="modal-dialog modal-sm">
             <div class="modal-content">
                 <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                      </button>
                      <h4 class="modal-title" id="myModalLabel">회원가입</h4>
                  </div>

                  <!-- 서블릿의 커넥션으로 넘기고, 자바스크립트로 구현한 checkID, checkPW, checkMail를 반드시 실행되도록 할 것-->
                  <form action="JU" method="post">
                      <div class="modal-body">
                          <div class="from-group">
                              <input type="text" class="form-control" name="userID" placeholder="ID" style="float:left;  width:70%">
                                  <!-- ID 중복확인 -->
                              <input class="btn btn-info" type="submit" value="중복확인" style="float:right; margin-bottom:3%; width:30%">
                          </div>   
                              <input type="text" class="form-control" name="userPW"  style="margin-top:3%;" placeholder="숫자, 영문으로 이루어진 8~12자리 비밀번호">
                              <input type="text" class="form-control" name="checkPW"  style="margin-top:3%" placeholder="check your password">
                              <input type="text" class="form-control" name="E_mailCK" style="margin-top:3%" placeholder="E-mail address">
                      </div>
                      <div class="modal-footer">
                           <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                           <input type="submit" class="btn btn-warning" value="회원가입">
                      </div>
                    </form>
             </div>
         </div>
     </div>
          <script src="http://code.jquery.com/jquery.js?ver=3"></script>
          <script src="bootstrap3.3.2/js/bootstrap.min.js?ver=3"></script>
      </body>
</html>
