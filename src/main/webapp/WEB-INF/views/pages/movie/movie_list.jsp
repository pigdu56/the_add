<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	body {text-align: center;}
	dd { font-size : 15px; }
	table{ margin-left: 6%; text-align: left;}
	th, td { border-bottom : 1px dashed gray; padding: 15px; }
	.lst {border : none;}
</style>
<div class="container"  >
	<strong style="text-align: center; font-size : 30px;">Movie</strong>
	
	<table>
		<tbody>
			<c:forEach var="ml" items="${list}" varStatus="status">
				<tr <c:if test="${status.last}">class="lst"</c:if>>
					<td style="width: 20%;" <c:if test="${status.last}">class="lst"</c:if>><img src="${ml.MV_IMG}" style="width: 165px; height: 203px;" /></td>
					<td <c:if test="${status.last}">class="lst"</c:if>>
						<dl>
							<dt><h3><img src="${pageContext.request.contextPath}/static/img/movie/${ml.RT_IMG}" style="width: 35px;" />
								<b>${ml.MV_TITLE_KR}</b></h3></dt>
							<dd><h5 style="color : gray;">${ml.MV_TITLE_EN}</h5>
							<dd>감독 : ${ml.DT_NAME}</dd>
							<dd>출현 : ${ml.A_NAME}</dd>
							<dd>개요 : ${ml.G_NAME} &nbsp; | &nbsp; ${ml.MV_ST}분 &nbsp; | &nbsp; ${ml.MV_OD} 개봉</dd>
						</dl>
					</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot style="text-align: center;">
			<!-- 페이지 표시영역 -->
			<tr id="paging">
				<td colspan="3" class="lst">
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