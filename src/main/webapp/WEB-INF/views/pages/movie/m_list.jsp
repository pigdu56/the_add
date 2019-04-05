<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	.container { margin-top : 20px; }
	th,td,h2 { text-align: center; }]
</style>

<div class="container">

	<h2>회원 리스트</h2>

	<table class="table">
		<thead>
			<tr>
				<th>No</th>
				<th>NAME</th>
				<th>ID</th>
				<th>Birth</th>
				<th>Gender</th>
				<th>Phone</th>
				<th>email</th>
				<th></th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="i" items="${m_list}">
				<tr>
					<td>${i.R}</td>
					<td>${i.M_NAME}</td>
					<td>${i.M_ID}</td>
					<td>${i.M_BIRTH}</td>
					<td><c:if test="${i.M_GENDER eq '1'}">남</c:if>
					<c:if test="${i.M_GENDER eq '0'}">여</c:if> </td>
					<td>${i.M_PHONE}</td>
					<td>${i.M_EMAIL}</td>
					<td>
						<c:url value="/movie/rev_l_s/1" var="m" />
						<form action="${m}" method="post">
							<input type="hidden" name="m_id" value="${i.M_ID}" />
							<input type="hidden" name="m_name" value="${i.M_NAME}" />
							<button style="border : 0; background-color: transparent;">
							<img src="${pageContext.request.contextPath}/static/img/movie/move.png" style="width: 20px;"></button>
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
		
		<tfoot style="text-align: center;">
			<!-- 페이지 표시영역 -->
			<tr id="paging">
				<td colspan="7" class="lst">
					<ul class="pagination">
						<!-- 페이징 -->
						<li class="page-item" id="p_first">
							<c:if test="${1 <= group_npage}">
								<a class="page-link" href="1"> << </a>
							</c:if></li>
						<li class="page-item">
							<c:if test="${1 < group_npage}">
								<a class="page-link" href="${group_npage-1}"><</a>
							</c:if></li>
						<li><c:forEach begin="${group_spage}" end="${group_epage}"
								var="i" step="1">
								<!--  -->
								<c:if test="${i == param.pnum}">${i}</c:if>
								<c:if test="${i != param.pnum}">
									<a class="page-link" href="${i}">${i}</a>
								</c:if>
							</c:forEach></li>
						<li class="page-item">
							<c:if test="${group_npage < all_epage}">
								<a class="page-link" href="${group_npage+1}">></a>
							</c:if></li>
						<li class="page-item"><c:if test="${group_npage < all_epage}">
								<a class="page-link" href="${all_epage}">>></a>
							</c:if></li>
					</ul>
				</td>
			</tr>
		</tfoot>
	</table>
</div>