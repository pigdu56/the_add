<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
   <p class="text-center" style="font-size: 40px;">예매 내역</p>
   <br><br>
   <c:url value="/bus/buy_view" var="buy_view"/>
   <table class="table text-center table-hover" style="font-size:15px;">
   <tr>
      <th>날짜</th>
      <th>아이디</th>
      <th>출발</th>
      <th>도착</th>
      <th>출발 시각</th>
      <th>도착 시각</th>
      <th>버스 회사</th>
      <th>등급</th>
      <th>가격</th>
      <th>예매 좌석</th>
   </tr>
      <c:forEach var="i" items="${user_list}">
      <tr onclick="location.href='${buy_view}?b_code=${i.B_CODE}'"  style="cursor:pointer">
         <td>${fn:substring(i.S_DAY, 0, 4)}/${fn:substring(i.S_DAY, 4, 6)}/${fn:substring(i.S_DAY, 6, 8)}</td>
         <td>${i.M_ID}</td>
         <td>${i.DEP_TER}</td>
         <td>${i.ARR_TER}</td>
         <td>${fn:substring(i.S_DEP, 0, 2)}시 ${fn:substring(i.S_DEP, 2, 4)}분</td>
         <td>${fn:substring(i.S_ARR, 0, 2)}시 ${fn:substring(i.S_ARR, 2, 4)}분</td>
         <td>${i.C_NAME}</td>
         <td>${i.G_NAME}</td>
         <td><fmt:formatNumber>${i.S_CHARGE * i.SEAT_SU}</fmt:formatNumber></td>
         <td>${i.SEAT}</td>
      </tr>
      </c:forEach>
   </table>
</body>
</html>