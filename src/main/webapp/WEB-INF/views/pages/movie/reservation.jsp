<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="utf-8">
<style>
	ul > li {
		list-style: none;
	}
	#reser_table{
		text-align:center;
	}
	.re_title{
		background-color:black;
		color:darkgray;
	}
	.re_title > td {
		border-right: 2px darkgray solid;
	}
	.re_main{
		background-color:antiquewhite;
	}
	.re_main > td {
		border-right: 2px darkgray solid;
	}
	.re_select{
		padding:0;
	}
</style>
</head>
<body>
	<div class="container">
		<h1 style="text-align:center;">영화 예매</h1>
		<table class="table" id="reser_table">
			<tr class="row re_title">
				<td class="col-sm-4">영화</td>
				<td class="col-sm-3">극장</td>
				<td class="col-sm-1">날짜</td>
				<td class="col-sm-4">시간</td>
			</tr>
			<tr class="row re_main">
				<td class="col-sm-4">
					<a href=#>예매율순</a>,&nbsp;<a href=#>가나다순</a>
					<ul class="re_select">
						
					</ul>
				</td>
				<td class="col-sm-3">
					<ul class="re_select">
						<li>천안터미널CGV</li>
						<li>천안역 CGV</li>
						<li>천안펜타포트 CGV</li>
					</ul>
				</td>
				<td class="col-sm-1">
					<ul class="re_select">
						<li style="font-size:13px;">
							<c:set var="now" value="<%= new java.util.Date() %>" />
							<fmt:formatDate value="${now}" type="date" pattern="YYYY" />
						</li>
						<li style="font-size:25px;">
							<fmt:formatDate value="${now}" type="date" pattern="MM" />
						</li>
						<c:forEach var="i" items="${daylist}">
						<li>
							<b>${i.days}</b>&nbsp;<b>${i.dates}</b>
						</li>
						</c:forEach>
						
					</ul>	
				</td>
				<td class="col-sm-4">
					
				</td>
			</tr>
		</table>
	</div>
</body>
</html>