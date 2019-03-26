<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
	#seat_div{
		padding:0;
		margin:0;
	}
	#seat_tb{		
		background-color: #F2F0E5;
		border:1px #DDDDDD solid;
	}
	#seat_main{
		background-color:#1D1D1C;
		color:#CBCBCB;
	}
	.s_center{
		text-align:center;		
	}
	#seat_div{
		min-height:380px;
	}
	#screen{
		text-align:center;
		background-color:#ECECEC;
		padding-top:1px;
		padding-bottom:1px;
		margin-bottom:30px;
	}
	#s_table{
		margin-top:30px;
		margin-left:52px;	
	}
	ul >li{
		list-style: none;
	}
	.select_person{
		padding:0;
	}
	input[type="radio"] {
	display: none;
	}
	input[class="wh_0"]+label {
	display: inline-block;
	width: 24px;
	height: 24px;
	background-image:url('${pageContext.request.contextPath}/static/img/movie/zero_wh.png');
	cursor: pointer;
	border:0.5px #ECECEC solid;
	}
	input[class="wh_0"]:checked+label {
		background-image: url('${pageContext.request.contextPath}/static/img/movie/zero_bl.png');
	}
	input[class="wh_1"]+label {
	display: inline-block;
	width: 24px;
	height: 24px;
	background-image:url('${pageContext.request.contextPath}/static/img/movie/one_wh.png');
	cursor: pointer;
	border:0.5px #ECECEC solid;
	}
	input[class="wh_1"]:checked+label {
		background-image: url('${pageContext.request.contextPath}/static/img/movie/one_bl.png');
	}
	input[class="wh_2"]+label {
	display: inline-block;
	width: 24px;
	height: 24px;
	background-image:url('${pageContext.request.contextPath}/static/img/movie/two_wh.png');
	cursor: pointer;
	border:0.5px #ECECEC solid;
	}
	input[class="wh_2"]:checked+label {
		background-image: url('${pageContext.request.contextPath}/static/img/movie/two_bl.png');
	}
	input[class="wh_3"]+label {
	display: inline-block;
	width: 24px;
	height: 24px;
	background-image:url('${pageContext.request.contextPath}/static/img/movie/three_wh.png');
	cursor: pointer;
	border:0.5px #ECECEC solid;
	}
	input[class="wh_3"]:checked+label {
		background-image: url('${pageContext.request.contextPath}/static/img/movie/three_bl.png');
	}
	input[class="wh_4"]+label {
	display: inline-block;
	width: 24px;
	height: 24px;
	background-image:url('${pageContext.request.contextPath}/static/img/movie/four_wh.png');
	cursor: pointer;
	border:0.5px #ECECEC solid;
	}
	input[class="wh_4"]:checked+label {
		background-image: url('${pageContext.request.contextPath}/static/img/movie/four_bl.png');
	}
	input[class="wh_5"]+label {
	display: inline-block;
	width: 24px;
	height: 24px;
	background-image:url('${pageContext.request.contextPath}/static/img/movie/five_wh.png');
	cursor: pointer;
	border:0.5px #ECECEC solid;
	}
	input[class="wh_5"]:checked+label {
		background-image: url('${pageContext.request.contextPath}/static/img/movie/five_bl.png');
	}
	input[class="wh_6"]+label {
	display: inline-block;
	width: 24px;
	height: 24px;
	background-image:url('${pageContext.request.contextPath}/static/img/movie/six_wh.png');
	cursor: pointer;
	border:0.5px #ECECEC solid;
	}
	input[class="wh_6"]:checked+label {
		background-image: url('${pageContext.request.contextPath}/static/img/movie/six_bl.png');
	}	
	#person_choice{
		border-right:1px #DDDDDD solid;
		padding-left: 85px;	
	}
	
	#seat_side{
		background-color: #F2F0E5;
		border:1px #DDDDDD solid;
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
input[type="checkbox"] {
	display: none;
	}
input[class="seat_1"]+label{
	display: inline-block;
	width: 24px;
	height: 24px;
	cursor: pointer;
	background-image:url('${pageContext.request.contextPath}/static/img/movie/one.png');
}
input[class="seat_1"]:checked+label{
	background-image:url('${pageContext.request.contextPath}/static/img/movie/one_r.png');
}
input[class="seat_2"]+label{
	display: inline-block;
	width: 24px;
	height: 24px;
	cursor: pointer;
	background-image:url('${pageContext.request.contextPath}/static/img/movie/two.png');
}
input[class="seat_2"]:checked+label{
	background-image:url('${pageContext.request.contextPath}/static/img/movie/two_r.png');
}
input[class="seat_3"]+label{
	display: inline-block;
	width: 24px;
	height: 24px;
	cursor: pointer;
	background-image:url('${pageContext.request.contextPath}/static/img/movie/three.png');
}
input[class="seat_3"]:checked+label{
	background-image:url('${pageContext.request.contextPath}/static/img/movie/three_r.png');
}
input[class="seat_4"]+label{
	display: inline-block;
	width: 24px;
	height: 24px;
	cursor: pointer;
	background-image:url('${pageContext.request.contextPath}/static/img/movie/four.png');
}
input[class="seat_4"]:checked+label{
	background-image:url('${pageContext.request.contextPath}/static/img/movie/four_r.png');
}
input[class="seat_5"]+label{
	display: inline-block;
	width: 24px;
	height: 24px;
	cursor: pointer;
	background-image:url('${pageContext.request.contextPath}/static/img/movie/five.png');
}
input[class="seat_5"]:checked+label{
	background-image:url('${pageContext.request.contextPath}/static/img/movie/five_r.png');
}
input[class="seat_6"]+label{
	display: inline-block;
	width: 24px;
	height: 24px;
	cursor: pointer;
	background-image:url('${pageContext.request.contextPath}/static/img/movie/six.png');
}
input[class="seat_6"]:checked+label{
	background-image:url('${pageContext.request.contextPath}/static/img/movie/six_r.png');
}
input[class="seat_7"]+label{
	display: inline-block;
	width: 24px;
	height: 24px;
	cursor: pointer;
	background-image:url('${pageContext.request.contextPath}/static/img/movie/seven.png');
}
input[class="seat_7"]:checked+label{
	background-image:url('${pageContext.request.contextPath}/static/img/movie/seven_r.png');
}
input[class="seat_8"]+label{
	display: inline-block;
	width: 24px;
	height: 24px;
	cursor: pointer;
	background-image:url('${pageContext.request.contextPath}/static/img/movie/eight.png');
}
input[class="seat_8"]:checked+label{
	background-image:url('${pageContext.request.contextPath}/static/img/movie/eight_r.png');
}
input[class="seat_9"]+label{
	display: inline-block;
	width: 24px;
	height: 24px;
	cursor: pointer;
	background-image:url('${pageContext.request.contextPath}/static/img/movie/nine.png');
}
input[class="seat_9"]:checked+label{
	background-image:url('${pageContext.request.contextPath}/static/img/movie/nine_r.png');
}
#seat_info{
	margin-top:15px;
}
#seat_info > li {
	min-height:30px;
}
</style>
<div class="container">
	<h1 style="text-align:center;">좌석 선택</h1>
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10" id="seat_div">
			<table class="table">
				<tr class="row" id="seat_main">
					<th class="col-sm-12 s_center"><h5><b>인원 / 좌석</b></h5></th>
				</tr>
				<tr class="row" id="seat_tb">
					<td class="col-sm-6">
						<ul id="person_choice">
							<li class="row select_person">
								<div class="col-sm-2">
									<h6><b>일반</b></h6>
								</div>
								<div class="col-sm-10">
									<input type="radio" class="wh_0" id="no_0" name="nomal" checked="checked"/><label for="no_0"></label>								
									<input type="radio" class="wh_1" id="no_1" name="nomal"/><label for="no_1"></label>
									<input type="radio" class="wh_2" id="no_2" name="nomal"/><label for="no_2"></label>
									<input type="radio" class="wh_3" id="no_3" name="nomal"/><label for="no_3"></label>
									<input type="radio" class="wh_4" id="no_4" name="nomal"/><label for="no_4"></label>
									<input type="radio" class="wh_5" id="no_5" name="nomal"/><label for="no_5"></label>
									<input type="radio" class="wh_6" id="no_6" name="nomal"/><label for="no_6"></label>
								</div>
							</li>
							<li class="row select_person">
								<div class="col-sm-2">
									<h6><b>유아</b></h6>
								</div>
								<div class="col-sm-10">
									<input type="radio" id="ki_0" class="wh_0" name="kids" checked="checked"/><label for="ki_0"></label>								
									<input type="radio" id="ki_1" class="wh_1" name="kids"/><label for="ki_1"></label>
									<input type="radio" id="ki_2" class="wh_2" name="kids"/><label for="ki_2"></label>
									<input type="radio" id="ki_3" class="wh_3" name="kids"/><label for="ki_3"></label>
									<input type="radio" id="ki_4" class="wh_4" name="kids"/><label for="ki_4"></label>
									<input type="radio" id="ki_5" class="wh_5" name="kids"/><label for="ki_5"></label>
									<input type="radio" id="ki_6" class="wh_6" name="kids"/><label for="ki_6"></label>
								</div>
							</li>
							<li class="row select_person">
								<div class="col-sm-2">
									<h6><b>청소년</b></h6>
								</div>
								<div class="col-sm-10">
									<input type="radio" id="yo_0" class="wh_0" name="young" checked="checked"/><label for="yo_0"></label>								
									<input type="radio" id="yo_1" class="wh_1" name="young"/><label for="yo_1"></label>
									<input type="radio" id="yo_2" class="wh_2" name="young"/><label for="yo_2"></label>
									<input type="radio" id="yo_3" class="wh_3" name="young"/><label for="yo_3"></label>
									<input type="radio" id="yo_4" class="wh_4" name="young"/><label for="yo_4"></label>
									<input type="radio" id="yo_5" class="wh_5" name="young"/><label for="yo_5"></label>
									<input type="radio" id="yo_6" class="wh_6" name="young"/><label for="yo_6"></label>
								</div>
							</li>
						</ul>
					</td>
					<td class="col-sm-6">
						
					</td>
			</table>			
			<div class="row">
				<div class="col-sm-9" id="seat_div">
					<div class="row">
						<div class="col-sm-2"></div>
						<div class="col-sm-8">
							<div id="screen">
								<h5><b>SCREEN</b></h5>
							</div>
						</div>
						<div class="col-sm-2"></div>
					</div>
					
					<div class="row">
						<div class="col-sm-2"></div>
						<div class="col-sm-8">
							<table id="s_table">								
										<c:set var="alphabet" value="A,B,C,D,E,F" /> 
										<c:forTokens var="i" items="${alphabet}" delims=",">
											<tr>
												<c:forEach var="j" begin="1" end="9" varStatus="index">
												<c:if test="${index.first}"><td><b>${i}</b>&nbsp;&nbsp;&nbsp;</td></c:if> 
													<td>
														<c:set var="s_name" value="${i}${j}"/>
														<c:choose>
															<c:when test="${j eq 1}">
																<input type="checkbox" class="seat_1" name="seat" id="${s_name}" value="${s_name}"><label for="${s_name}"></label>
															</c:when>
															<c:when test="${j eq 2}">
																<input type="checkbox" class="seat_2" name="seat" id="${s_name}" value="${s_name}"><label for="${s_name}"></label>
															</c:when>
															<c:when test="${j eq 3}">
																<input type="checkbox" class="seat_3" name="seat" id="${s_name}" value="${s_name}"><label for="${s_name}"></label>
															</c:when>
															<c:when test="${j eq 4}">
																<input type="checkbox" class="seat_4" name="seat" id="${s_name}" value="${s_name}"><label for="${s_name}"></label>
															</c:when>
															<c:when test="${j eq 5}">
																<input type="checkbox" class="seat_5" name="seat" id="${s_name}" value="${s_name}"><label for="${s_name}"></label>
															</c:when>
															<c:when test="${j eq 6}">
																<input type="checkbox" class="seat_6" name="seat" id="${s_name}" value="${s_name}"><label for="${s_name}"></label>
															</c:when>
															<c:when test="${j eq 7}">
																<input type="checkbox" class="seat_7" name="seat" id="${s_name}" value="${s_name}"><label for="${s_name}"></label>
															</c:when>
															<c:when test="${j eq 8}">
																<input type="checkbox" class="seat_8" name="seat" id="${s_name}" value="${s_name}"><label for="${s_name}"></label>
															</c:when>
															<c:otherwise>
																<input type="checkbox" class="seat_9" name="seat" id="${s_name}" value="${s_name}"><label for="${s_name}"></label>
															</c:otherwise>																	
														</c:choose>																								
													</td>
												<c:if test="${j eq 3}">
													<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
												</c:if>
												<c:if test="${j eq 6}">
													<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
												</c:if>
												<c:if test="${index.last}"><td>&nbsp;&nbsp;&nbsp;<b>${i}</b></td></c:if>
												</c:forEach>
											</tr>
											<c:if test="${i eq 'C'}">
												<tr>
													<td>&nbsp;</td>
												</tr>
											</c:if>
										</c:forTokens>									
							</table>
						</div>
						<div class="col-sm-2"></div>						
					</div>
				</div>
				<div class="col-sm-3" id="seat_side">
					<div class="row">
						<div class="col-sm-1"></div>
						<div class="col-sm-10">
							<ul id="seat_info">
								<li><h4><b>좌석안내</b></h4></li>
								<li>
									<img src="${pageContext.request.contextPath}/static/img/movie/no_check.png">
									빈 좌석
								</li>
								<li>
									<img src="${pageContext.request.contextPath}/static/img/movie/choice.png">
									선택좌석  
								</li>
								<li>
									<img src="${pageContext.request.contextPath}/static/img/movie/x.png">
									선택불가 
								</li>
							</ul>
						</div>
						<div class="col-sm-1"></div>
					</div>
					
				</div>
			</div>
			<div class='row'>
			<div class="col-sm-12" style="padding:0;">
				<table id="select_box">
					<tr class="row" id="selects">
						<th class="col-sm-2" id="go_btn">
							<button class="btn" id="go_seat" onclick="location.href='${pageContext.request.contextPath}/movie/reservation'">
								<img class="btn-img" src="${pageContext.request.contextPath}/static/img/movie/left_mv.png">
							</button>
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
						<th class="col-sm-2" id="go_btn">
							<button class="btn" id="go_seat">
								<img class="btn-img" src="${pageContext.request.contextPath}/static/img/movie/right_pay.png">
							</button>
						</th>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<div class="col-sm-1"></div>		
	</div>
	
	
</div>