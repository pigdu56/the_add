<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	th, td{text-align: center;}
	.btn_movie { border:0; background-color: white; }
</style>
<div>
	<table class="table table-bordered" style="width: 550px;">
		<thead>
			<tr>
				<th style="width: 50px;">번호</th>
				<th style="width: 300px;">제목</th>
				<th style="width: 100px;">개봉일</th>
				<th style="width: 100px;">관객수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="m" items="${movie}">
				<tr>
					<td style="width: 50px;">${m.rnum}</td>
					<td style="width: 300px;">
						<c:url var="detail_view" value="/movie/detail_view" />
						<form action="${detail_view}" method="get">
							<input type="hidden" name="movieCd" value="${m.movieCd}" />
							<button class="btn_movie">${m.movieNm}</button>
						</form>
					</td>
					<td style="width: 100px;">${m.openDt}</td>
					<td style="width: 100px;"><fmt:formatNumber pattern="###,###,###" value="${m.audiCnt}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>