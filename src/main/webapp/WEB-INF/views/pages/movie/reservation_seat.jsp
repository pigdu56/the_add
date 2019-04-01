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
.go_seat{
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
input[class="x"]+label{
	display: inline-block;
	width: 24px;
	height: 24px;
	cursor: pointer;
	background-image:url('${pageContext.request.contextPath}/static/img/movie/x.png');
}
#seat_info{
	margin-top:15px;
}
#seat_info > li {
	min-height:30px;
}
dt, dd { float: left; }
.on {float: none;}
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
					<!-- 인원수 -->
					<td class="col-sm-6">
						<ul id="person_choice">
							<li class="row select_person">
								<div class="col-sm-2">
									<h6><b>성인</b></h6>
								</div>
								<div class="col-sm-10" id="adult">
									<input checked="checked" type="radio" class="wh_0" id="no_0" name="adult" value="0"  /><label for="no_0"></label>								
									<input type="radio" class="wh_1" id="no_1" name="adult" value="1" /><label for="no_1"></label>
									<input type="radio" class="wh_2" id="no_2" name="adult" value="2" /><label for="no_2"></label>
									<input type="radio" class="wh_3" id="no_3" name="adult" value="3" /><label for="no_3"></label>
									<input type="radio" class="wh_4" id="no_4" name="adult" value="4" /><label for="no_4"></label>
									<input type="radio" class="wh_5" id="no_5" name="adult" value="5" /><label for="no_5"></label>
									<input type="radio" class="wh_6" id="no_6" name="adult" value="6" /><label for="no_6"></label>
								</div>
							</li>
							
							<li class="row select_person">
								<div class="col-sm-2">
									<h6><b>청소년</b></h6>
								</div>
								<div class="col-sm-10" id="young">
									<input type="radio" id="yo_0" class="wh_0" name="young" value="0" checked="checked"/><label for="yo_0"></label>								
									<input type="radio" id="yo_1" class="wh_1" name="young" value="1" /><label for="yo_1"></label>
									<input type="radio" id="yo_2" class="wh_2" name="young" value="2" /><label for="yo_2"></label>
									<input type="radio" id="yo_3" class="wh_3" name="young" value="3" /><label for="yo_3"></label>
									<input type="radio" id="yo_4" class="wh_4" name="young" value="4" /><label for="yo_4"></label>
									<input type="radio" id="yo_5" class="wh_5" name="young" value="5" /><label for="yo_5"></label>
									<input type="radio" id="yo_6" class="wh_6" name="young" value="6" /><label for="yo_6"></label>
								</div>
							</li>
							
							<li class="row select_person" id="kids">
								<div class="col-sm-2">
									<h6><b>어린이</b></h6>
								</div>
								<div class="col-sm-10">
									<input type="radio" id="ki_0" class="wh_0" name="kids" value="0" checked="checked"/><label for="ki_0"></label>								
									<input type="radio" id="ki_1" class="wh_1" name="kids" value="1" /><label for="ki_1"></label>
									<input type="radio" id="ki_2" class="wh_2" name="kids" value="2" /><label for="ki_2"></label>
									<input type="radio" id="ki_3" class="wh_3" name="kids" value="3" /><label for="ki_3"></label>
									<input type="radio" id="ki_4" class="wh_4" name="kids" value="4" /><label for="ki_4"></label>
									<input type="radio" id="ki_5" class="wh_5" name="kids" value="5" /><label for="ki_5"></label>
									<input type="radio" id="ki_6" class="wh_6" name="kids" value="6" /><label for="ki_6"></label>
								</div>
							</li>					
						</ul>
					</td>
					<td class="col-sm-6">
						<div style="padding-top : 15px;">
							<dl style="font-size: 16px;">
								<dt><strong>${mv_list['c_name']} &nbsp;|&nbsp;</strong></dt>
								<dt><strong>${mv_list['tt_name']} &nbsp;|&nbsp;</strong></dt>
								<dt><strong>남은 좌석 </strong>&nbsp;</dt>
								<dd class="on"><font color="red">${sd_list['TT_SEAT']-seat_count}</font> / ${sd_list['TT_SEAT']}</dd>
							</dl>
							<dl style="font-size: 24px;">
								<dt>
									<fmt:parseDate value="${mv_list['sd_day']}" var="noticePostDate" pattern="yyyyMMdd"/>
									<fmt:formatDate value="${noticePostDate}" pattern="yyyy.MM.dd"/> &nbsp;
									<div id="week" style="float: right;"></div>
									<input type="hidden" id="day" value="<fmt:formatDate value="${noticePostDate}" pattern="yyyy.MM.dd"/>">
								</dt>
								<dt>&nbsp;
									<fmt:parseDate value="${mv_list['t_time']}" var="s_time" pattern="HHmm"/>
									<fmt:formatDate value="${s_time}" pattern="HH:mm"/> &nbsp; ~ &nbsp;
									<input type="hidden" id="st_time" value="<fmt:formatDate value="${s_time}" pattern="HH:mm"/>"/>
								</dt>
									
								<dt>
									<input type="hidden" id="ed_time" value="${sd_list['MV_ST']}"/>
									<div id="et"></div>
								</dt>
							</dl>
						</div>
					</td>
				</tr>
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
														<c:set var="bl" value="false" />
														<%-- <c:forEach var=st items="${seat}">
															<c:if test="${s_name eq st.s_name}">
																<c:set var="bl" value="true" />														
															</c:if>															
														</c:forEach>
														<c:choose>
															<c:when test="${true eq bl}">
																<input type="checkbox" class="x" name="seat" id="${s_name}" value="${s_name}" disabled="disabled"><label for="${s_name}"></label>
															</c:when>
															<c:otherwise> --%>
																<input type="checkbox" class="seat_1" name="seat" id="${s_name}" value="${s_name}"><label for="${s_name}"></label>
															<%--</c:otherwise>
														</c:choose> --%>
													</c:when>
													<%-- <c:when test="${j eq 2}">
														<c:set var="bl" value="false" />
														<c:forEach var=st items="${seat}">
															<c:if test="${s_name eq st.s_name}">
																<c:set var="bl" value="true" />														
															</c:if>															
														</c:forEach>
														<c:choose>
															<c:when test="${true eq bl}">
																<input type="checkbox" class="x" name="seat" id="${s_name}" value="${s_name}" disabled="disabled"><label for="${s_name}"></label>
															</c:when>
															<c:otherwise>
																<input type="checkbox" class="seat_2" name="seat" id="${s_name}" value="${s_name}"><label for="${s_name}"></label>
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:when test="${j eq 3}">
														<c:set var="bl" value="false" />
														<c:forEach var=st items="${seat}">
															<c:if test="${s_name eq st.s_name}">
																<c:set var="bl" value="true" />														
															</c:if>															
														</c:forEach>
														<c:choose>
															<c:when test="${true eq bl}">
																<input type="checkbox" class="x" name="seat" id="${s_name}" value="${s_name}" disabled="disabled"><label for="${s_name}"></label>
															</c:when>
															<c:otherwise>
																<input type="checkbox" class="seat_3" name="seat" id="${s_name}" value="${s_name}"><label for="${s_name}"></label>
															</c:otherwise>
														</c:choose>	
													</c:when>
													<c:when test="${j eq 4}">
														<c:set var="bl" value="false" />
														<c:forEach var=st items="${seat}">
															<c:if test="${s_name eq st.s_name}">
																<c:set var="bl" value="true" />														
															</c:if>															
														</c:forEach>
														<c:choose>
															<c:when test="${true eq bl}">
																<input type="checkbox" class="x" name="seat" id="${s_name}" value="${s_name}" disabled="disabled"><label for="${s_name}"></label>
															</c:when>
															<c:otherwise>
																<input type="checkbox" class="seat_4" name="seat" id="${s_name}" value="${s_name}"><label for="${s_name}"></label>
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:when test="${j eq 5}">
														<c:set var="bl" value="false" />
														<c:forEach var=st items="${seat}">
															<c:if test="${s_name eq st.s_name}">
																<c:set var="bl" value="true" />														
															</c:if>															
														</c:forEach>
														<c:choose>
															<c:when test="${true eq bl}">
																<input type="checkbox" class="x" name="seat" id="${s_name}" value="${s_name}" disabled="disabled"><label for="${s_name}"></label>
															</c:when>
															<c:otherwise>
																<input type="checkbox" class="seat_5" name="seat" id="${s_name}" value="${s_name}"><label for="${s_name}"></label>
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:when test="${j eq 6}">
														<c:set var="bl" value="false" />
														<c:forEach var=st items="${seat}">
															<c:if test="${s_name eq st.s_name}">
																<c:set var="bl" value="true" />														
															</c:if>															
														</c:forEach>
														<c:choose>
															<c:when test="${true eq bl}">
																<input type="checkbox" class="x" name="seat" id="${s_name}" value="${s_name}" disabled="disabled"><label for="${s_name}"></label>
															</c:when>
															<c:otherwise>
																<input type="checkbox" class="seat_6" name="seat" id="${s_name}" value="${s_name}"><label for="${s_name}"></label>
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:when test="${j eq 7}">
														<c:set var="bl" value="false" />
														<c:forEach var=st items="${seat}">
															<c:if test="${s_name eq st.s_name}">
																<c:set var="bl" value="true" />														
															</c:if>															
														</c:forEach>
														<c:choose>
															<c:when test="${true eq bl}">
																<input type="checkbox" class="x" name="seat" id="${s_name}" value="${s_name}" disabled="disabled"><label for="${s_name}"></label>
															</c:when>
															<c:otherwise>
																<input type="checkbox" class="seat_7" name="seat" id="${s_name}" value="${s_name}"><label for="${s_name}"></label>
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:when test="${j eq 8}">
														<c:set var="bl" value="false" />
														<c:forEach var=st items="${seat}">
															<c:if test="${s_name eq st.s_name}">
																<c:set var="bl" value="true" />														
															</c:if>															
														</c:forEach>
														<c:choose>
															<c:when test="${true eq bl}">
																<input type="checkbox" class="x" name="seat" id="${s_name}" value="${s_name}" disabled="disabled"><label for="${s_name}"></label>
															</c:when>
															<c:otherwise>
																<input type="checkbox" class="seat_8" name="seat" id="${s_name}" value="${s_name}"><label for="${s_name}"></label>
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>
														<c:set var="bl" value="false" />
														<c:forEach var=st items="${seat}">
															<c:if test="${s_name eq st.s_name}">
																<c:set var="bl" value="true" />														
															</c:if>															
														</c:forEach>
														<c:choose>
															<c:when test="${true eq bl}">
																<input type="checkbox" class="x" name="seat" id="${s_name}" value="${s_name}" disabled="disabled"><label for="${s_name}"></label>
															</c:when>
															<c:otherwise>
																<input type="checkbox" class="seat_9" name="seat" id="${s_name}" value="${s_name}"><label for="${s_name}"></label>
															</c:otherwise>
														</c:choose>
													</c:otherwise> --%>																	
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
							<button class="btn go_seat" id="go_seat" onclick="location.href='${pageContext.request.contextPath}/movie/reservation'">
								<img class="btn-img" src="${pageContext.request.contextPath}/static/img/movie/left_mv.png">
							</button>
						
							<th class="col-sm-2 box_th">
								<h3 class="box_title">${mv_list['mv_title_kr']}</h3>
							</th>
							<th class="col-sm-2 box_th">
								<h3 class="box_title">${mv_list['c_name']}</h3>
							</th>
							<th class="col-sm-2 box_th">
								<h3 class="box_title">좌석선택</h3>
							</th>
							<th class="col-sm-2 box_th">
								<h3 class="box_title">결제</h3>
							</th>
							<th class="col-sm-2" id="go_btn">
								<c:url var="go_pay" value="/movie/"/>
								<form action="${go_pay}" method="post">
									<input type="hidden" name="mv_code" value="${mv_list['mv_code']}" />
									<input type="hidden" name="mv_title_kr" value="${mv_list['mv_title_kr']}" />
									<input type="hidden" name="c_name" value="${mv_list['c_name']}" />
									<input type="hidden" name="tt_name" value="${mv_list['tt_name']}" />
									<input type="hidden" name="s_name" />
									<input type="hidden" name="r_price" />
									
									<button class="btn go_seat" id="go_pay" disabled="disabled">
										<img class="btn-img" src="${pageContext.request.contextPath}/static/img/movie/right_pay.png">
									</button>
								</form>
							</th>
						
					</tr>
				</table>
			</div>
		</div>
		</div>
		<div class="col-sm-1"></div>		
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		// 시간
		var day = $("#day").val();	// 날짜
		var st_time = $("#st_time").val();	// 시작 시간
		var end_time = $("#ed_time").val();	// 상영 시간
		var st_day = day+" "+st_time;	// 날짜 + 시작 시간
		var D_Day = new Date(st_day); 
		D_Day.setMinutes(D_Day.getMinutes()+ end_time);
		
		var week = ['일', '월', '화', '수', '목', '금', '토'];
		var dayOfWeek = week[D_Day.getDay()];
		document.getElementById("week").innerHTML="("+dayOfWeek+")";	// 상영 요일
		var Hours = D_Day.getHours();
		Hours = Hours > 9? Hours : '0' + Hours;
		var minutes = D_Day.getMinutes();
		minutes = minutes > 9 ? minutes : '0' + minutes;
		document.getElementById("et").innerHTML=(Hours +":"+ minutes);
		
		// 좌석
		var adult = $(':radio[name="adult"]:checked').val();
		var young = $(':radio[name="young"]:checked').val();
		var kids = $(':radio[name="kids"]:checked').val();
		var sum = Number(adult) + Number(young) + Number(kids);
		var checkboxBoxes = $('table').parent().find(':checkbox[name="seat"]:checked');

		var price = (Number(adult)* ${sd_list['P_PRICE']}) + (Number(young)* ${sd_list['P_PRICE']}) + (Number(kids)* ${sd_list['P_PRICE']});
		$('input[name="r_price"]').val(price);
		
		
		
		if(sum == 0){
			$(':checkbox[name="seat"]').attr("disabled", "disabled");
		}
		
		var saveAdultId = "no";
		var saveYoungId = "no";
		var saveKidsId = "no";
		
		$('#adult :radio').change(function () {
			adult = $(':radio[name="adult"]:checked').val();
			young = $(':radio[name="young"]:checked').val();
			kids = $(':radio[name="kids"]:checked').val();
			sum = Number(adult) + Number(young) + Number(kids);
			checkboxBoxes = $('table').parent().find(':checkbox[name="seat"]:checked');
			
			if(sum == 0){
				$(':checkbox[name="seat"]').attr("disabled", "disabled");
			} else {
				$(':checkbox[name="seat"]').removeAttr("disabled");
			}
				

			if(checkboxBoxes.length > sum){			
				alert('좌석이 초과 되었습니다');
				console.log($("#adult").find("input").length);
				
				for(i=0; i < $("#adult").find("input").length; i++){
					if ($($("#adult").find("input")[i]).attr("id") == saveAdultId) {
						$($("#adult").find("input")[i]).prop('checked', true);
						return;
					}
				} 	
			}
			
			if(checkboxBoxes.length == sum && sum != 0){
				$("#go_pay").attr('disabled', false);
			} else {
				$("#go_pay").attr('disabled', true);
			}
			
			price = (Number(adult)* ${sd_list['P_PRICE']}) + (Number(young)* ${sd_list['P_PRICE']}) + (Number(kids)* ${sd_list['P_PRICE']});
			$('input[name="r_price"]').val(price);
			
			saveAdultId = $(this).attr("id");

		});
		
		$('#young :radio').change(function(){
			adult = $(':radio[name="adult"]:checked').val();
			young = $(':radio[name="young"]:checked').val();
			kids = $(':radio[name="kids"]:checked').val();
			sum = Number(adult) + Number(young) + Number(kids);
			checkboxBoxes = $('table').parent().find(':checkbox[name="seat"]:checked');
					
			if(sum == 0){
				$(':checkbox[name="seat"]').attr("disabled", "disabled");
			} else {
				$(':checkbox[name="seat"]').removeAttr("disabled");
			}
			
			if(checkboxBoxes.length > sum){
				alert('좌석이 초과 되었습니다');
				console.log($("#young").find("input").length);
				
				for(i=0; i < $("#young").find("input").length; i++){
					if ($($("#young").find("input")[i]).attr("id") == saveYoungId) {
						$($("#young").find("input")[i]).prop('checked', true);
						return;
					}
				} 	
			}
			
			if(checkboxBoxes.length == sum && sum != 0){
				$("#go_pay").attr('disabled', false);
			} else {
				$("#go_pay").attr('disabled', true);
			}
			
			saveYoungId = $(this).attr("id");
		});
		
		$('#kids :radio').bind('click' ,function(){
			adult = $(':radio[name="adult"]:checked').val();
			young = $(':radio[name="young"]:checked').val();
			kids = $(':radio[name="kids"]:checked').val();
			sum = Number(adult) + Number(young) + Number(kids);
			checkboxBoxes = $('table').parent().find(':checkbox[name="seat"]:checked');
			
			if(sum == 0){
				$(':checkbox[name="seat"]').attr("disabled", "disabled");
			} else {
				$(':checkbox[name="seat"]').removeAttr("disabled");
			}
			
			if(checkboxBoxes.length > sum){
				alert('좌석이 초과 되었습니다');
				console.log($("#young").find("input").length);
				
				for(i=0; i < $("#kids").find("input").length; i++){
					if ($($("#kids").find("input")[i]).attr("id") == saveKidsId) {
						$($("#kids").find("input")[i]).prop('checked', true);
						return;
					}
				}
			}
			
			if(checkboxBoxes.length == sum && sum != 0){
				$("#go_pay").attr('disabled', false);
			} else {
				$("#go_pay").attr('disabled', true);
			}
			
			saveKidsId = $(this).attr("id");
		});
		
		$(':checkbox[name="seat"]').click(function(){
			checkboxBoxes = $('table').parent().find(':checkbox[name="seat"]:checked');
			if (checkboxBoxes.length > sum) {
				this.checked = false;
			}
			
			if(checkboxBoxes.length == sum && sum != 0){
				$("#go_pay").attr('disabled', false);
			} else {
				$("#go_pay").attr('disabled', true);
			}
		});	
	});
</script>