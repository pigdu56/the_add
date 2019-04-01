	<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta charset="utf-8">
<style>
ul>li {
	list-style: none;
	margin:0;
	padding:0;
}

#reser_table {
	text-align: center;
	min-height:502px;
	margin:0;	
}

.re_title {
	background-color: #1D1D1C;
	color: #CBCBCB;
	min-height:52px;
}

.re_title>td {
	border-right: 2px darkgray solid;
}

.re_main {
	background-color: #F2F0E5;
	min-height:450px;
}

.re_main>td {
	border-right: 2px darkgray solid;
}

.re_select {
	padding: 0;
	cursor: pointer;
}
#sd_choice > li{
	height:40px;
	vertical-align:middle;
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
.check_choice{
	background-color:#1D1D1C;
	color:white;
}
.red{
	color:red;
}
.blue{
	color:blue;
}
#sel_c{
	padding:0;
}
#sel_post{
	padding:0;
}
#sel_mv{
	padding:0;
}
 #time_choice > li{
 	list-style:none;
 }
</style>
	<div class="container">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<h1 style="text-align: center;">영화 예매</h1>
				<table class="table" id="reser_table">
					<tr class="row re_title">
						<td class="col-sm-4"><h4>영화</h4></td>
						<td class="col-sm-3"><h4>극장</h4></td>
						<td class="col-sm-1"><h4>날짜</h4></td>
						<td class="col-sm-4"><h4>시간</h4></td>
					</tr>
					<tr class="row re_main">
						<td class="col-sm-4">
							<ul class="re_select" id="mv_choice">
								<c:forEach var="ml" items="${mv_list}">
									<li style="text-align: left;" class="m_list">
										<h4 style="margin-left: 20px;"><img src="${pageContext.request.contextPath}/static/img/movie/${ml.RT_IMG}" style="width: 30px;">${ml.MV_TITLE_KR}</h4>
										<input type="hidden" name="mv_name" value="${ml.MV_TITLE_KR}">
									</li>
										
								</c:forEach>
							</ul>
						</td>
						<td class="col-sm-3">
							<ul class="re_select" id="c_choice">
								<li class="c_list">천안터미널 CGV <input type="hidden" name="c_name" value="천안터미널 CGV"></li>
								<li class="c_list">천안역 CGV <input type="hidden" name="c_name" value="천안 CGV"></li>
								<li class="c_list">천안 펜타포트 CGV <input type="hidden" name="c_name" value="천안 펜타포트"></li>
							</ul>
						</td>
						<td class="col-sm-1">
							<ul class="re_select" id="sd_choice">
								<c:set var="now" value="<%=new java.util.Date()%>" /> 
								<fmt:formatDate value="${now}" type="date" pattern="YYYY" var="years" />
								<li style="font-size: 13px; margin-top:10px;">
									${years}
								</li>
								<li style="font-size: 30px; margin-top:-25px; margin-bottom:10px">
								<fmt:formatDate value="${now}" type="date" pattern="MM" var="mon" />${mon}</li>
								<c:forEach var="i" items="${daylist}">
									<c:choose>
										<c:when test="${i.dates eq 01}">
											<li>
												<c:choose>
													<c:when test="${mon eq 01}">
														<fmt:parseDate value="${years+1}" pattern="YYYY" var="ye"/>
														<fmt:formatDate value="${ye}" type="date" pattern="YYYY" var="years2"/>
														${years2} 
													</c:when>
													<c:otherwise>
														${years}
													</c:otherwise>
												</c:choose>
											</li>
											<li style="font-size: 30px; margin-top:-25px; margin-bottom:10px;">
												<fmt:parseDate value="${mon+1}" pattern="MM" var="months"/>
												<fmt:formatDate value="${months}" type="date" pattern="MM" var='mon2'/> ${mon2}												
											</li>
											<li class="sd_dates">
												<c:choose>
													<c:when test="${i.days eq '토'}">
														<b class="blue" id="blue_check">${i.days}&nbsp;${i.dates}</b>
													</c:when>
													<c:when test="${i.days eq '일'}">
														<b class="red" id="red_check">${i.days}&nbsp;${i.dates}</b>
													</c:when>
													<c:otherwise>
														<b>${i.days}&nbsp;${i.dates}</b>
													</c:otherwise>
												</c:choose>
												<c:choose>
													<c:when test="${mon eq 01}">
														<input type="hidden" name='s_dates' value="${years2}${mon2}${i.dates}">
													</c:when>
													<c:otherwise>
														<input type="hidden" name='s_dates' value="${years}${mon2}${i.dates}">
													</c:otherwise>
												</c:choose>
											</li>
										</c:when>
										<c:otherwise>
											<li class="sd_dates">
												<c:choose>
													<c:when test="${i.days eq '토'}">
														<b class="blue" id="blue_check">${i.days}&nbsp;${i.dates}</b>
													</c:when>
													<c:when test="${i.days eq '일'}">
														<b class="red "id="red_check">${i.days}&nbsp;${i.dates}</b>
													</c:when>
													<c:otherwise>
														<b>${i.days}&nbsp;${i.dates}</b>
													</c:otherwise>
												</c:choose>
													<c:choose>
														<c:when test="${empty mon2}">
															<input type="hidden" name='s_dates' value="${years}${mon}${i.dates}">
														</c:when>
														<c:otherwise>
															<input type="hidden" name='s_dates' value="${years}${mon2}${i.dates}">
														</c:otherwise>
													</c:choose>
											</li>
										</c:otherwise>
									</c:choose>								
								</c:forEach>

							</ul>
						</td>
						<td class="col-sm-4">
							<ul id="time_choice">
							
							</ul>
						</td>
					</tr>
				</table>
			</div>
			<div class="col-sm-1"></div>
		</div>
		<div class='row'>
			<div class="col-sm-1"></div>
			<div class="col-sm-10" style="padding:0;">
				<c:url var="go_seat" value="/movie/reservation_seat" />
				<form method="get" action="${go_seat}">
				<table id="select_box">
					<tr class="row" id="selects">
						<th class="col-sm-3 box_th">
							<ul class="col-sm-6" id="sel_poster">
							</ul>
							<ul class="col-sm-6" id="sel_mv">
								<li>
									<h3 class="box_title">영화선택</h3>
								</li>
							</ul>
						</th>
						<th class="col-sm-2 box_th">
							<ul class="row" id="sel_c">
								<li style="padding-left:35px;"><h3 class="box_title">극장선택</h3></li>
							</ul>	
							<ul id="sel_tt"></ul>
						</th>
						<th class="col-sm-2 box_th">
							<h3 class="box_title" id="sel_sd">좌석선택</h3>
						</th>
						<th class="col-sm-2 box_th">
							<h3 class="box_title">결제</h3>
						</th>
						<th class="col-sm-1" id="go_btn"></th>
						<th class="col-sm-1">
							<button class="btn" id="go_seat" type="submit" disabled="disabled">
								<img class="btn-img" src="${pageContext.request.contextPath}/static/img/movie/right_seat.png">
							</button>
						</th>
					</tr>
				</table>
				</form>
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div>
<script type="text/javascript">
$( document ).ready(function() {
	var mv_check = false;
	var c_check = false;
	var sd_check = false;
	var time_check = false;
	var mv_li;
	var c_li;
	var sd_li;
	var time_li;
	var sd_dates;
	var mv_name;
	var c_name;
	var time_name;
	var tt_name;
	//영화 선택시 
	$(document).on("click", "#mv_choice .m_list", function() {
		$("#mv_choice .m_list").removeClass("check_choice");
		mv_li=$(this);
		$(mv_li).addClass("check_choice");
		mv_check=true;
		mv_name = $(this).find("input").val();
		if(c_check && sd_check){
			alert("영화 : "+mv_li.text()+" 영화관 : "+c_li.text()+" 날짜 "+ sd_dates);
			$.ajax({
	            url : "${pageContext.request.contextPath}/movie/time",
	            type : "post",
	            data : {
	               "mv_title_kr" : mv_name,
	               "c_name" : c_name,
	               "sd_day" : sd_dates
	            },            
	            success : function(data) {
            		$("#time_choice").empty();
	            	if(data == ""){
		            	$("#time_choice").append("<h4>상영시간이 없습니다. <br>다른날짜를 선택해주세요.</h4>");
	            	}else{
		            	$("#time_choice").append("<li style='text-align:left;'><h4>"+data[0].TT_NAME+"</h4></li>");
		            	for(var tt in data){
		            		$("#time_choice").append("<li style='border:2px solid black'>"+data[tt].T_TIME+"</li>");	
		            	}	
	            	}
	            },
	            error : function(jqXHR, textStatus, errorThrown, error) {
	               alert("에러 발생~~ \n" + textStatus + " : " + errorThrown
	                     + error);
	            }
			});
		}else if(!sd_check || !c_check){
			if(!sd_check && !c_check){
				alert("날짜와 영화관을 선택해주세요.");
				$.ajax({
		            url : "${pageContext.request.contextPath}/movie/tc",
		            type : "post",
		            data : {
		               "mv_title_kr" : mv_name
		            },                
		            success : function(data) {
		            	$("#c_choice").empty();
		            	$("#sel_mv").empty();
		            	$("#sel_poster").empty();
		            	for(var a in data){
		            		$("#c_choice").append("<li class='c_list'>"+data[a].C_NAME+"<input type='hidden' name='c_name' value='"+data[a].C_NAME+"'></li>");	
		            	}
		            	$("#sel_poster").append("<li><img src='"+data[0].MV_IMG+"' style='height:100px;'></li>");
		            	$("#sel_mv").append("<li><input type='hidden' name='mv_code' value='"+ data[0].MV_CODE 
		            			+ "'/><input type='hidden' name='mv_title_kr' value='"+ mv_name +"'/><h4>" + mv_name 
		            			+ "</h4><li>&nbsp;</li><li><h5>"+data[0].RT_RATING+"</h5></li>");
		            },
		            error : function(jqXHR, textStatus, errorThrown, error) {
		               alert("에러 발생~~ \n" + textStatus + " : " + errorThrown
		                     + error);
		            }
				});
			}else if(!c_check){
				alert("영화관을 선택해주세요.");
				$.ajax({
		            url : "${pageContext.request.contextPath}/movie/tc",
		            type : "post",
		            data : {
		               "mv_title_kr" : mv_name
		            },                 
		            success : function(data) {
		            	$("#c_choice").empty();
		            	$("#sel_mv").empty();
		            	$("#sel_poster").empty();
		            	for(var a in data){
		            		alert(data[a].C_NAME);
		            		$("#c_choice").append("<li class='c_list'>" + data[a].C_NAME + "<input type='hidden' name='c_name' value='"+data[a].C_NAME+"'></li>");	
		            	}
		            	$("#sel_poster").append("<li><img src='"+data[0].MV_IMG+"' style='height:100px;'></li>");
		            	$("#sel_mv").append("<li><input type='hidden' name='mv_code' value='"+ data[0].MV_CODE 
		            			+ "'/><input type='hidden' name='mv_title_kr' value='"+ mv_name +"'/><h4>"+mv_name+"</h4><li><li>"+data[0].RT_RATING+"</li>");
		            },
		            error : function(jqXHR, textStatus, errorThrown, error) {
		               alert("에러 발생~~ \n" + textStatus + " : " + errorThrown
		                     + error);
		            }
				});
			}else{
				$.ajax({
		            url : "${pageContext.request.contextPath}/movie/tc",
		            type : "post",
		            data : {
		               "mv_title_kr" : mv_name
		            },                 
		            success : function(data) {
		            	var cn_check = false;
		            	for(var cc in data){
		            		if(data[cc].C_NAME==c_name){
		            			cn_check=true;
		            			break;
		            		}
		            	}
		            	if(cn_check){
		            		alert("날짜를 선택해주세요.");
		            	}else{
		            		alert("선택하신 영화는 해당 극장에 상영하지않습니다. 다시 선택해주세요.");
		            		$("#c_choice").empty();
		            		$("#sel_c").empty();
		            		c_check=false;
		         			for(var a in data){
			            		$("#c_choice").append("<li class='c_list'>"+data[a].C_NAME+"<input type='hidden' name='c_name' value='"+data[a].C_NAME+"'></li>");	
			            	}
		            	}
		            	$("#sel_mv").empty();
		            	$("#sel_poster").empty();
		            	$("#sel_poster").append("<li><img src='"+data[0].MV_IMG+"' style='height:100px;'></li>");
		            	$("#sel_mv").append("<li><h4>"+mv_name+"</h4><li><li>"+data[0].RT_RATING+"</li>");
		            },
		            error : function(jqXHR, textStatus, errorThrown, error) {
		               alert("에러 발생~~ \n" + textStatus + " : " + errorThrown
		                     + error);
		            }
				});
			}
		}
	});
	//영화관 선택시
	$(document).on("click", "#c_choice .c_list", function() {
		$("#c_choice .c_list").removeClass("check_choice");
		c_li=$(this);
		c_check=true;
		c_name=$(this).find("input").val();
		$(c_li).addClass("check_choice");
		if(mv_check && sd_check){
			alert("영화 : "+mv_name+" 영화관 : "+c_name+" 날짜 "+ sd_dates);
			$.ajax({
	            url : "${pageContext.request.contextPath}/movie/time",
	            type : "post",
	            data : {
	               "mv_title_kr" : mv_name,
	               "c_name" : c_name,
	               "sd_day" : sd_dates
	            },            
	            success : function(data) {
            		$("#time_choice").empty();
	            	if(data == ""){
		            	$("#time_choice").append("<h4>상영시간이 없습니다. <br>다른날짜를 선택해주세요.</h4>");
	            	}else{
		            	$("#time_choice").append("<li style='text-align:left;'><h4>"+data[0].TT_NAME+"</h4></li>");
		            	for(var tt in data){
		            		$("#time_choice").append("<li style='border:2px solid black'>"+data[tt].T_TIME+"</li>");	
		            	}	
	            	}
	            },
	            error : function(jqXHR, textStatus, errorThrown, error) {
	               alert("에러 발생~~ \n" + textStatus + " : " + errorThrown
	                     + error);
	            }
			});
		}else if(!mv_check || !sd_check){
			if(!mv_check && !sd_check){
				alert("영화와 날짜를 선택해주세요.");
				$.ajax({
		            url : "${pageContext.request.contextPath}/movie/mv_c",
		            type : "post",
		            data : {
		               "c_name" : c_name
		            },                 
		            success : function(data) {
		            	$("#mv_choice").empty();
		            	$("#sel_c").empty();
		            	for(var a in data){
		            		$("#mv_choice").append("<li class='m_list' style='text-align:left;'><h4 style='margin-left: 20px;'><img src='${pageContext.request.contextPath}/static/img/movie/"+data[a].RT_IMG+"' style='width: 30px;'>"+data[a].MV_TITLE_KR+"</h4><input type='hidden' name='mv_name' value='"+data[a].MV_TITLE_KR+"'></li>");	
		            	}
		            	$("#sel_c").append("<li style='padding-left:35px;'><input type='hidden' name='c_name' value='" + c_name + "'/><h4>" + c_name + "</h4></li>");
		            },
		            error : function(jqXHR, textStatus, errorThrown, error) {
		               alert("에러 발생~~ \n" + textStatus + " : " + errorThrown
		                     + error);
		            }
				});
			}else if(!sd_check){			
				$.ajax({
		            url : "${pageContext.request.contextPath}/movie/mv_c",
		            type : "post",
		            data : {
		               "c_name" : c_name
		            },                
		            success : function(data) {
		            	var mn_check = false;
		            	for(var mn in data){
		            		if(mv_name==data[mn].MV_TITLE_KR){
		            			mn_check=true;
		            			break;
		            		}	
		            	}
		            	if(!mn_check){
		            		alert("선택하신 극장는 해당 영화를 상영하지않습니다. 다시 선택해주세요.");
		            		$("#mv_choice").empty();
			            	$("#sel_poster").empty();
			            	$("#sel_mv").empty();
			            	$("#sel_mv").append("<li><h3 class='box_title'>영화선택</h3></li>");
			            	for(var a in data){
			            		$("#mv_choice").append("<li class='c_list' style='text-align:left;'><h4 style='margin-left: 20px;'><img src='${pageContext.request.contextPath}/static/img/movie/"+data[a].RT_IMG+"' style='width: 30px;'>"+data[a].MV_TITLE_KR+"</h4><input type='hidden' name='mv_name' value="+data[a].MV_TITLE_KR+"></li>");	
			            	}
			            	mv_check=false;
		            	}else{
		            		alert("날짜를 선택해주세요.");
		            	}
		            	$("#sel_c").empty();
	            		$("#sel_c").append("<li style='padding-left:35px;'><input type='hidden' name='c_name' value='" + c_name + "'/><h4>"+c_name+"</h4></li>");
		            },
		            error : function(jqXHR, textStatus, errorThrown, error) {
		               alert("에러 발생~~ \n" + textStatus + " : " + errorThrown
		                     + error);
		            }
				});          
			}else{
				alert("영화를 선택해주세요.");
				$.ajax({
		            url : "${pageContext.request.contextPath}/movie/mv_c",
		            type : "post",
		            data : {
		               "c_name" : c_name
		            },                
		            success : function(data) {
		            	$("#mv_choice").empty();
		            	$("#sel_c").empty();
		            	for(var a in data){
		            		$("#mv_choice").append("<li class='c_list' style='text-align:left;'><h4 style='margin-left: 20px;'><img src='${pageContext.request.contextPath}/static/img/movie/"+data[a].RT_IMG+"' style='width: 30px;'>"+data[a].MV_TITLE_KR+"</h4><input type='hidden' name='mv_name' value="+data[a].MV_TITLE_KR+"></li>");	
		            	}
		            	$("#sel_c").append("<li style='padding-left:35px;'><h4>"+c_name+"</h4></li>");
		            },
		            error : function(jqXHR, textStatus, errorThrown, error) {
		               alert("에러 발생~~ \n" + textStatus + " : " + errorThrown
		                     + error);
		            }
				});
			}
		}
	});
	$("#sd_choice .sd_dates").click(function(){
		$("#sd_choice .sd_dates").removeClass("check_choice");
		sd_li=$(this);
		sd_dates = $(this).find("input").val();
		sd_check = true;
		$(sd_li).addClass("check_choice");
		sd_day = sd_li.text();
		$("#blue_check").addClass("blue");
		$("#red_check").addClass("red");
		if(sd_day.indexOf('토') != -1){
			$("#blue_check").removeClass("blue");
		}else if(sd_day.indexOf('일') != -1){
			$("#red_check").removeClass("red");
		}
		if(mv_check && c_check){
			alert("영화 : "+mv_name+" 영화관 : "+c_name+" 날짜 "+ sd_dates);
			$.ajax({
	            url : "${pageContext.request.contextPath}/movie/time",
	            type : "post",
	            data : {
	               "mv_title_kr" : mv_name,
	               "c_name" : c_name,
	               "sd_day" : sd_dates
	            },            
	            success : function(data) {
            		$("#time_choice").empty();
	            	if(data == ""){
		            	$("#time_choice").append("<h4>상영시간이 없습니다. <br>다른날짜를 선택해주세요.</h4>");
	            	}else{
	            		$("#sel_tt").empty();
	    				$("#sel_tt").append("<li><h5>"+sd_dates+"</h5></li>");
	            		$("#time_choice").append("<li style='text-align:left;'><h4>"+data[0].TT_NAME+"</h4></li>");
		            	for(var tt in data){
		            		$("#time_choice").append("<li style='border:2px solid black'>"+data[tt].T_TIME+"<input type='hidden' id='time_name' name ='time_name' value='"+data[tt].T_TIME+"'><input type='hidden' name ='tt_name' id='tt_name' value='"+data[tt].TT_NAME+"'></li>");	
		            	}
	            	}
	            },
	            error : function(jqXHR, textStatus, errorThrown, error) {
	               alert("에러 발생~~ \n" + textStatus + " : " + errorThrown
	                     + error);
	            }
			});
		}else if(!mv_check || !c_check){
			if(!mv_check && !c_check){
				alert("영화와 영화관을 선택해주세요.");
				$("#sel_c").empty();
				$("#sel_tt").empty();
				$("#sel_tt").append("<li><h5>"+sd_dates+"</h5></li>");
			}else if(!c_check){
				alert("영화관을 선택해주세요.");
				$("#sel_c").empty();
				$("#sel_tt").empty();
				$("#sel_tt").append("<li><h5>"+sd_dates+"</h5></li>");
			}else{
				alert("영화를 선택해주세요.");
				$("#sel_tt").empty();
				$("#sel_tt").append("<li><h5>"+sd_dates+"</h5></li>");
			}
		}
	});
	//상영관, 시간 클릭
	$(document).on("click", "#time_choice li", function() {
		$("#time_choice li").removeClass("check_choice");
		time_li=$(this);
		time_li.addClass("check_choice");
		tt_name = $(this).find("#tt_name").val();
		time_name = $(this).find("#time_name").val();
		$("#sel_tt").empty();
		$("#sel_tt").append("<li><h5>"+sd_dates+"</h5></li><li><h5>"+tt_name+"</h5></li><li><h6>"+time_name+"</h6></li>");
		$("#go_btn").empty();
		$("#go_btn").append("<input type='hidden' name='tt_name' value='"+tt_name+"'/> <input type='hidden' name='sd_day' value='" + sd_dates + "'/><input type='hidden' name='t_time' value='" + time_name + "'/>");
		$("#go_seat").empty();
		$("#go_seat").append("<img class='btn-img' src='${pageContext.request.contextPath}/static/img/movie/right_seat_red.png'>");
		$("#go_seat").removeAttr("disabled");
	});
});

</script>