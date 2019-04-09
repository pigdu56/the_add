<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<style>
.pay_title {
	background-color: #1D1D1C;
	color: #CBCBCB;
}

.pay_title>th {
	text-align: center;
}
#mv_info{
	background-color:#F2F0E5;
	min-height:522px;
}
#total_pay{
	border:2px solid #1D1D1C;
}
#pay_insert{
	border:2px solid #443128;
}
.total_title > th{
	text-align:center;
}
#tt_pay{
	background-color:#1D1D1C;
	color:white;
}
#total{
	background-color:#FFFFFF;
}
#in_title{
	background-color:#F2F0E5;
}
#pay_in{
	background-color:#443128;
}
#pay_text{
	height:60px;
	font-size:20px;
	color:#FFE56B;
	background-color:#443128;
	border:2px solid #443128;	
}
#mv_infos{
	padding:0;
}
#mv_infos > li{
	list-style:none;
}
.c_info{
	padding:0;
}
.c_info > li{
	list-style:none;
}
#pay_right{
	background-color:#FFFFFF;;
}
</style>
<c:url var="ticket" value="/movie/ticket"/>
<form action="${ticket}" method="post">
<div class="container">
	<h2 style="text-align:center;">결제 페이지</h2>
	<div class="row">
		<div class="col-sm-8" id="mv_info">
			<table class="table table-borderless" id="info_table">
				<tr class="row pay_title">
					<th class="col">선택하신 상영관 정보</th>
				</tr>
				<tr class="row">
					<td class="col-sm-12">
						<div class="row">
							<div class="col-sm-3">
								<ul class="c_info">
									<li><h4>상영관 정보 : </h4></li>
									<li><h4>시간&nbsp;&nbsp;&nbsp;&nbsp;정보 : </h4></li>
									<li><h4>선택&nbsp;&nbsp;&nbsp;&nbsp;좌석 :</h4></li>
								</ul>
							</div>
							<div class="col-sm-9">
								<ul class="c_info">
									<li><h4>${ms_list.c_name} [${ms_list.tt_name}]</h4></li>
									<li>
										<h4>
											<fmt:parseDate value="${ms_list.sd_day}" pattern="YYYYMMdd" var="dates"/>
											<fmt:formatDate value="${dates}" pattern="YYYY.MM.dd" var="sd_day" />
											<fmt:parseDate value="${ms_list.t_time}" pattern="HHmm" var="times"/>
											<fmt:formatDate value="${times}" pattern="HH:mm" var="t_time" />
											<b>${sd_day} ${ms_list.week} ${t_time} ~ ${ms_list.end_time}</b>
										</h4>
									</li>
									<li>
										<h4>
										<c:forEach var="i" items="${s_names}" varStatus="status">
											<c:choose>
												<c:when test="${status.last}">
													<b>${i.s_name}</b>
												</c:when>
												<c:otherwise>
													<b>${i.s_name}, </b>
												</c:otherwise>
											</c:choose>
											<input type="hidden" name="s_name${i.s_name}" value="${i.s_name}">
										</c:forEach>
										</h4>
									</li>
								</ul>
							</div>
						</div>
						
					</td>
				</tr>
				<tr class="row pay_title">
					<th class="col">선택하신 영화 정보</th>
				</tr>
				<tr class="row">
					<td class="col-sm-4"><img src="${mv_info.MV_IMG}" style="height:280px;"></td>
					<td class="col-sm-8">
						<ul id="mv_infos">
							<li><h3><img style="width:30px;" src="${pageContext.request.contextPath}/static/img/movie/${mv_info.RT_IMG}">${ms_list.mv_title_kr}</h3></li>
							<li><h4 style="color:gray">${mv_info.MV_TITLE_EN}</h4></li>
							<li><h5>장르 : ${mv_info.G_NAME}</h5></li>
							<li><h5>감독 : ${mv_info.DT_NAME }</h5></li>
							<li><h5>배우 : ${mv_info.A_NAME}</h5></li>
							<li><h5>줄거리</h5></li>	
							<li>${mv_info.MV_STORY}</li>
						</ul>
					</td>
				</tr>
			</table>
		</div>
		<div class="col-sm-4" id="pay_right">
			<div class="row">
				<div class="col-sm-12">
					<table class="table">
						<tr class="pay_title">
							<th>결제 정보</th>
						</tr>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<table class="table" id="total_pay">
					<tr class="total_title" id="total">
						<th><h3>결제 하실 금액</h3></th>
					</tr>
					<tr class="total_title" id="tt_pay">
						<th>
							<fmt:parseNumber value="${ms_list.r_price}" var="price"/>
							 <fmt:formatNumber value="${price}" pattern="#,###" var="all_price"/>
							<h3>${all_price}원</h3>
							<input type="hidden" id="all_pay" name="all_pay" value="${ms_list.r_price}">
						</th>
					</tr>
				</table>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<table class="table" id="pay_insert">
					<tr class="total_title" id="in_title">
						<th><h3>금액 입력</h3></th>
					</tr>
					<tr class="total_title" id="pay_in">
						<th><input type="text" name="pay" id="pay_text" class="form-control form-control-lg" placeholder="금액만 입력하세요" autocomplete="off"></th>
					</tr>
				</table>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<input type="hidden" name="r_price" value="${ms_list.r_price}">
					<input type="hidden" name="sd_code" value="${ms_list.sd_code}">
					<input type="hidden" name="end_time" value="${ms_list.end_time}">
					<input type="hidden" name="t_time" value="${t_time}">
					<input type="hidden" name="sd_day" value="${sd_day}">
					<input type="hidden" name="week" value="${ms_list.week }">
					<button class="btn btn-block btn-warning" id="submit"><h3>결제완료</h3></button>
					<p class="alert alert-warning" id="price-success" style="margin:0; font-size:15px;">결제 버튼을 눌러주세요.</p>
					<p class="alert alert-danger" id="price-danger" style="margin:0; font-size:15px;">결제 금액을 똑같이 입력하세요.</p>    			      			
				</div>
			</div>
			
		</div>
	</div>
</div>
</form>
<script>
//결제 금액 입력 시
$(function(){
    $("#price-success").hide();
    $("#price-danger").hide();
    $("#submit").attr("disabled", "disabled");
    $("input").keyup(function(){
        var all_pay=$("#all_pay").val();
        var insert_pay=$("#pay_text").val();
        if(insert_pay != ""){
            if(all_pay == insert_pay){
            	//결제 금액과 입력금액이 같을 때
                $("#price-success").show();
                $("#price-danger").hide();
                $("#submit").removeAttr("disabled");
            }else{
            	//결제 금액과 입력금액이 다를 때
                $("#price-success").hide();
                $("#price-danger").show();
                $("#submit").attr("disabled", "disabled");                 
            }    
        }
    });
});
</script>