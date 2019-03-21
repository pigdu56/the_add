<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>

.btn_movie {
	border: 0;
	background-color: white;
}
td{
	width:350px;
}
ul > li{
	list-style:none;	
}
#b_title{
	text-align:center;
}
</style>
<div class="container">
	<div id="black">
		<h2 id="b_title">박스오피스</h2>
		<table class="table table-bordered" style="width: 100%;">			
			<tbody>
				<tr>
				<c:forEach var="m" items="${movie}" begin="0" end="4">					
						<td>
							<ul style="background-image:url('')">
								<li>
									<h4>
									<b>${m.rnum}.</b>
									<a href="${pageContext.request.contextPath}/movie/detail_view?movieCd=${m.movieCd}">${m.movieNm}</a>
									</h4>
								</li>
								<li>
									<img src='${m.image}'>
								</li>
								<li>개봉일자 : ${m.openDt}
								</li>
								<li>누적 관람객 :<fmt:formatNumber
									pattern="###,###,###" value="${m.audiCnt}" />명</li>
								<li>평점 : ${m.userRating}</li>
							</ul>
						</td>					
				</c:forEach>
				</tr>
				<tr>
				<c:forEach var="m" items="${movie}" begin="5" end="9">					
						<td>
							<ul>
								<li>
									<h4>
									<b>${m.rnum}.</b>
									<a href="${pageContext.request.contextPath}/movie/detail_view?movieCd=${m.movieCd}">${m.movieNm}</a>
									</h4>
								</li>
								<li>
									<img src='${m.image}'>
								</li>
								<li>개봉일자 : ${m.openDt}
								</li>
								<li>누적 관람객 :<fmt:formatNumber
									pattern="###,###,###" value="${m.audiCnt}" />명</li>
								<li>평점 : ${m.userRating}</li>
							</ul>
						</td>				
				</c:forEach>
				</tr>
			</tbody>
		</table>
	</div>
</div>