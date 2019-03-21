<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
th, td {
	text-align: center;
}

.btn_movie {
	border: 0;
	background-color: white;
}

#black{
	
}
</style>
<div class="container">
	<div id="black">
		<table class="table table-bordered" style="width: 100%;">			
			<tbody>
				<tr>
				<c:forEach var="m" items="${movie}" begin="0" end="4">					
						<td>${m.rnum}<c:url var="detail_view"
								value="/movie/detail_view" />
							<form action="${detail_view}" method="get">
								<input type="hidden" name="movieCd" value="${m.movieCd}" />
								<button class="btn_movie">${m.movieNm}</button>
							</form>
						${m.openDt}
						<fmt:formatNumber
								pattern="###,###,###" value="${m.audiCnt}" />
						<img src='${m.image}'>
						${m.userRating}</td>					
				</c:forEach>
				</tr>
				<tr>
				<c:forEach var="m" items="${movie}" begin="5" end="9">					
						<td>${m.rnum}<c:url var="detail_view"
								value="/movie/detail_view" />
							<form action="${detail_view}" method="get">
								<input type="hidden" name="movieCd" value="${m.movieCd}" />
								<button class="btn_movie">${m.movieNm}</button>
							</form>
						${m.openDt}
						<fmt:formatNumber
								pattern="###,###,###" value="${m.audiCnt}" />
						<img src='${m.image}'>
						${m.userRating}</td>				
				</c:forEach>
				</tr>
			</tbody>
		</table>
	</div>
</div>