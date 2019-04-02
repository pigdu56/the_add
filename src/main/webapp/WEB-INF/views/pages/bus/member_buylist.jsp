<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

	<table class="table text-center table-hover" style="font-size:15px;">
	<tr>
		<th>날짜</th>
		<th>예약 번호</th>
		<th>아이디</th>
		<th>출발</th>
		<th>도착</th>
		<th>출발 시각</th>
		<th>도착 시각</th>
		<th>버스 회사</th>
		<th>등급</th>
		<th>가격</th>
		<th>예약한 좌석</th>
		<th>구매한 좌석 수</th>
	</tr>
	    <c:url value="/bus/buy_view" var="buy_view"/>
		<c:forEach var="i" items="${user_list}">
		<tr onclick="location.href='${buy_view}?b_code=${i.B_CODE}'"  style="cursor:pointer">
			<td>${i.S_DAY}</td>
			<td>${i.B_CODE}</td>
			<td>${i.M_NAME}</td>
			<td>${i.DEP_TER}</td>
			<td>${i.ARR_TER}</td>
			<td>${i.S_DEP}</td>
			<td>${i.S_ARR}</td>
			<td>${i.C_NAME}</td>
			<td>${i.G_NAME}</td>
			<td><fmt:formatNumber>${i.S_CHARGE * i.SEAT_SU}</fmt:formatNumber></td>
			<td>${i.SEAT}</td>
			<td><fmt:formatNumber>${i.SEAT_SU}</fmt:formatNumber></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>