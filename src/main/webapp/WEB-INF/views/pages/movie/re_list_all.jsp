<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	.container { margin-top : 20px; }
	th,td,h2 { text-align: center; }
</style>

<div class="container">
	<h2>예약 리스트</h2>

	<table class="table">
		<thead>
			<tr>
				<th style="width: 8%">No</th>
				<th style="width: 22%">Title</th>
				<th style="width: 10%">Day</th>
				<th style="width: 10%">Time</th>
				<th style="width: 20%">Seat</th>
				<th style="width: 10%">Price</th>
				<th style="width: 10%">Id</th>
			</tr>
		</thead>
		<tbody id="t_list">
			<c:forEach var="re" items="${rev_l}">
				<tr>
					<td>${re.R}</td>
					<td>${re.MV_TITLE_KR}</td>
					<td>
						<fmt:parseDate value="${re.SD_DAY}" var="sd_Day" pattern="yyyyMMdd" />
						<fmt:formatDate value="${sd_Day}" pattern="yyyy.MM.dd" />
					</td>
					<td>
						<fmt:parseDate value="${re.T_TIME}" var="t_time" pattern="HHmm" />
						<fmt:formatDate value="${t_time}" pattern="HH:mm" />
					</td>
					<td>${re.S}</td>
					<td><fmt:formatNumber pattern="###,###,###" value="${re.R_PRICE}" />원</td>
					<td>${re.M_ID}</td>
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