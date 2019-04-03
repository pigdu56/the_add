<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="container">
	<table class="table">
		<thead>
			<tr>
				<th>No</th>
				<th>Title</th>
				<th>Day</th>
				<th>Time</th>
				<th>Seat</th>
				<th>Price</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="re" items="${rev_l}">
				<tr>
					<td>${re.R}</td>
					<td>${re.MV_TITLE_KR}</td>
					<td>${re.SD_DAY}</td>
					<td>${re.T_TIME}</td>
					<td>${re.S}</td>
					<td>${re.R_PRICE}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>