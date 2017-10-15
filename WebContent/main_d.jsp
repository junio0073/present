<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<div class="left_main" style="float:left; width:100%">
          <p>일 세부 일정</p>
          오늘 날짜는 <br>
          <% Calendar cal = Calendar.getInstance(); %>
          <%= cal.get(Calendar.YEAR) %>
          <%= cal.get(Calendar.MONTH)+1 %>월
          <%= cal.get(Calendar.DATE) %>일
          입니다.
</div>
        