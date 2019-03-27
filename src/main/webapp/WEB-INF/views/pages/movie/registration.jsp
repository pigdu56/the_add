<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<div class="container">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<h1>관리자 등록</h1>
				<!--<c:url var="po_regi" value="/movie/regi_ok" />-->
				<!-- <form action="${po_regi}" method="post"> -->
				<table class="table">
					<tr class="row">
						<td class="col-sm-4"><h4>영화 선택</h4></td>
						<td class="col-sm-4"><h4>영화관 선택</h4></td>
						<td class="col-sm-4"><h4>상영관 선택</h4></td>						
					</tr>
					<tr class="row">
						<td class="col-sm-4">
							<select name="movie_num">
								<!--<c:forEach var="i" items="${ }"><option value=""></option></c:forEach>-->
							</select>
						</td>
						<td class="col-sm-4">
							<select name="">
								<option value="">CGV 천안터미널</option>
								<option value="">CGV 천안역</option>
								<option value="">CGV 천안펜타포트</option>								
							</select>
						</td>
						<td class="col-sm-4">
							<select name="">
								<option value="1">1관</option>
								<option value="2">2관</option>
								<option value="3">3관</option>
							</select>
						</td>
					</tr>
					<tr class="row">
						<td class="col-sm-3">시간 선택</td>
						<td class="col-sm-7">
						
						</td>
						<td class="col-sm-2">
							<button type="submit" class="btn btn-block btn-danger">영화등록</button>
						</td>
					</tr>
				</table>
				<!--</form>-->
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div>
