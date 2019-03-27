<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
#title_a{ text-overflow: ellipsis; overflow: hidden; white-space: nowrap;
width: 180px; height: 20px; display: block; float: right;}
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
.poster{
	width:
}
.box_list{
	padding:0;
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
						<ul class="box_list">
							<li>
								<h4>
								<b>${m.rnum}.</b>
								<a href="${pageContext.request.contextPath}/movie/detail_view?movieCd=${m.movieCd}" id="title_a">${m.movieNm}</a>
								</h4>
							</li>
							<li>								
								<c:choose>
									<c:when test="${fn:contains(m.posters, '|')}">
										<img class="poster" src='${fn:substringBefore(m.posters,"|")}'>
									</c:when>
									<c:otherwise>
										<img class="poster" src='${m.posters}'>
									</c:otherwise>
								</c:choose>											
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
							<ul class="box_list">
								<li>
									<h4>
									<b>${m.rnum}.</b>
									<a href="${pageContext.request.contextPath}/movie/detail_view?movieCd=${m.movieCd}" id="title_a">${m.movieNm}</a>
									</h4>
								</li>
								<li>
									<c:choose>
										<c:when test="${fn:contains(m.posters, '|')}">
											<img class="poster" src='${fn:substringBefore(m.posters,"|")}'>
										</c:when>
										<c:otherwise>
											<img class="poster" src='${m.posters}'>
										</c:otherwise>
									</c:choose>
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