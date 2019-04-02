<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<style>
#tikets{
	margin-top:50px;
}
#ticket_table{
	border-radius: 10px; 
	box-shadow: 5px 5px 5px 5px gray;
	min-width:100%;
}
.cgv_logo{
	margin:0;
	
}
#tops {
	padding:0;
	background-color:#FE0000;
	border-top-left-radius: 10px;
	max-height:90px;
}
#barcode{
	text-align:right;
	padding:0;
	background-color:#FE0000;
	border-top-right-radius: 10px;
	max-height:90px;
}
#ticket_main{
	background-color:#F2F0E5;
}
.mains{
	min-height:200px;
	padding-top:10px;
}
#get_home{
	margin-top:50px;
	height:80px;
}
</style>
<div class="container">
	<div class="row">
		<div class="col">
			<h2 style="text-align:center;">결제 완료</h2>
		</div>
	</div>
	<div class="row" id="tikets">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<table id="ticket_table">
				<tr class="row cgv_logo">
					<th class="col" id="tops"><img style="height:70px; padding:10px 10px 10px 10px;" src="${pageContext.request.contextPath}/static/img/movie/cgv_wh.png"></th>
					<th class="col" id="barcode"><img style="height:70px; padding:10px 10px 10px 10px;" src="${pageContext.request.contextPath}/static/img/movie/barcode.png"></th>
				</tr>
				<tr class="row cgv_logo" id="ticket_main">
					<td class="col-sm-12">
						<div class="row">
							<div class="col-sm-3 mains"><img src="${mv_info.MV_IMG}" style="height:175px;"></div>
							<div class="col-sm-9 mains" id="main_info">
								<h2>${mv_info.MV_TITLE_KR} (${mv_info.MV_TITLE_EN})</h2>
								<h4>${mv_info.C_NAME} (${mv_info.TT_NAME})</h4>
								<h4>${r_list.sd_day} ${r_list.week} ${r_list.t_time} ~ ${r_list.end_time}</h4>
								<h4>인원 :  || 좌석 : 
									<c:forEach var="i" items="${seat_num}" varStatus="status">
										<c:choose>
											<c:when test="${status.last}">
												<b>${i.s_name}</b>
											</c:when>
											<c:otherwise>
												<b>${i.s_name}, </b>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</h4>
								<h4>가격 : ${r_list.r_price} 원</h4>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div class="col-sm-2"></div>
	</div>
	<div class="row">
		<div class="col-sm-4"></div>
		<div class="col-sm-4">
			<c:url var="main" value="/movie/main" />
			<form action="main" method="get">
			<button class="btn btn-block btn-danger" id="get_home">홈으로 가기</button>
			</form>
		</div>
		<div class="col-sm-4"></div>
	</div>
</div>