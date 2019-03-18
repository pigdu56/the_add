<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#logo{position:fixed; left:40%; width:40%;height:30%;}
#tb{position:fixed; top:35%;left:27%; width:70%;}
</style>
<body class="w3-black">
	<img src="${pageContext.request.contextPath}/static/img/memberlist.png"
		id="logo">

	<div class="container">
		<br>
		<br>
		<table class="table" id="tb">
			<thead>
				<tr>
					<th>NAME</th>
					<th>ID</th>
					<th>Birth</th>
					<th>Gender</th>
					<th>Phone</th>
					<th>email</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="i" items="${list}">
					<tr>
						<td>${i.M_NAME}</td>
						<td>${i.M_ID}</td>
						<td>${i.M_BIRTH}</td>
						<td><c:if test="${i.M_GENDER eq '1'}">남</c:if>
						<c:if test="${i.M_GENDER eq '0'}">여</c:if> </td>
						<td>${i.M_PHONE}</td>
						<td>${i.M_EMAIL}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>