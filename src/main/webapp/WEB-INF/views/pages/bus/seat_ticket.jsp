<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title></title>

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
<table class="table" style="font-size:13px;">
	<tr>
		<th>스케쥴 번호</th>
		<th>회원 번호</th>
		<th>회원 아이디</th>
		<th>날짜</th>
		<th>출발</th>
		<th>도착</th>
		<th>출발 시각</th>
		<th>도착 시각</th>
		<th>버스 번호</th>
		<th>버스회사</th>
		<th>운임요금</th>
		<th>등급</th>
		<th>좌석 번호</th>
	</tr>
	<c:forEach var="i" items="${buy_list}">
		<tr>
			<td>${i.S_CODE}</td>
			<td>${i.M_NUM}</td>
			<td>${i.M_ID}</td>
			<td>${i.S_DAY}</td>
			<td>${i.DEP_TER}</td>
			<td>${i.ARR_TER}</td>
			<td>${i.S_DEP}</td>
			<td>${i.S_ARR}</td>
			<td>${i.S_CODE}</td>
			<td>${i.C_NAME}</td>
			<td>${i.S_CHARGE}</td>
			<td>${i.G_NAME}</td>
			<td>${i.B_SEATNUM}</td>
		</tr>
	</c:forEach>
</table>
	
</body>
</html>