<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="utf-8">
<style>
ul>li {
	list-style: none;
}

#reser_table {
	text-align: center;
	height:300px;
	margin:0;	
}

.re_title {
	background-color: #1D1D1C;
	color: #CBCBCB;
}

.re_title>td {
	border-right: 2px darkgray solid;
}

.re_main {
	background-color: #F2F0E5;
	height:300px;
}

.re_main>td {
	border-right: 2px darkgray solid;
}

.re_select {
	padding: 0;
	cursor: pointer;
}
#select_box{
	width:100%;
	height:105px;
	background-color:#1D1D1C;
	color:white;
}
#selects{	
	padding:10px;
	color:white;
}
#go_seat{
	border:0;
	background-color:#1D1D1C;
	padding:0;	
}
.box_th{
	border-right:1px #5B5B5B solid;
}
.box_title{
	padding:0;
	text-align:center;	
	color:#5B5B5B;
}
#go_btn{	
	padding:0;
	text-align:center;	
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<h1 style="text-align: center;">영화 예매</h1>
				<table class="table" id="reser_table">
					<tr class="row re_title">
						<td class="col-sm-4">영화</td>
						<td class="col-sm-3">극장</td>
						<td class="col-sm-1">날짜</td>
						<td class="col-sm-4">시간</td>
					</tr>
					<tr class="row re_main">
						<td class="col-sm-4"><a href=#>예매율순</a>,&nbsp;<a href=#>가나다순</a>
							<ul class="re_select">

							</ul></td>
						<td class="col-sm-3">
							<ul class="re_select">
								<li>천안터미널CGV</li>
								<li>천안역 CGV</li>
								<li>천안펜타포트 CGV</li>
							</ul>
						</td>
						<td class="col-sm-1">
							<ul class="re_select">
								<li style="font-size: 13px;"><c:set var="now"
										value="<%=new java.util.Date()%>" /> <fmt:formatDate
										value="${now}" type="date" pattern="YYYY" /></li>
								<li style="font-size: 25px;"><fmt:formatDate value="${now}"
										type="date" pattern="MM" /></li>
								<c:forEach var="i" items="${daylist}">
									<li><b>${i.days}</b>&nbsp;<b>${i.dates}</b></li>
								</c:forEach>

							</ul>
						</td>
						<td class="col-sm-4"></td>
					</tr>
				</table>
			</div>
		</div>
		<div class='row'>
			<div class="col-sm-12" style="padding:0;">
				<c:url var="go_seat" value="/movie/reservation_seat" />
				<form method="get" action="${go_seat}">
				<table id="select_box">
					<tr class="row" id="selects">
						<th class="col-sm-2 box_th">
							<h3 class="box_title">영화선택</h3>
						</th>
						<th class="col-sm-2 box_th">
							<h3 class="box_title">극장선택</h3>
						</th>
						<th class="col-sm-2 box_th">
							<h3 class="box_title">좌석선택</h3>
						</th>
						<th class="col-sm-2 box_th">
							<h3 class="box_title">결제</h3>
						</th>
						<th class="col-sm-2"></th>
						<th class="col-sm-2" id="go_btn">
							<button class="btn" id="go_seat" type="submit">
								<img class="btn-img" src="${pageContext.request.contextPath}/static/img/movie/right_seat.png">
							</button>
						</th>
					</tr>
				</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>