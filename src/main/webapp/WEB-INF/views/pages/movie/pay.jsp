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
	background-color:#F0EBD2;
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
</style>
<div class="container">
	<h2 style="text-align:center;">결제 페이지</h2>
	<div class="row">
		<div class="col-sm-8" id="mv_info">
			<table class="table table-borderless" id="info_table">
				<tr class="row pay_title">
					<th class="col">선택하신 영화 정보</th>
				</tr>
				<tr class="row">
					<td class="col-sm-4">${ms_list.MV_IMG}</td>
					<td class="col-sm-8">
						<ul>
							<li><h3>${ms_list.MV_TITLE_KR}</h3></li>
							<li></li>
						</ul>
					</td>
				</tr>
				<tr class="row pay_title">
					<th class="col">선택하신 상영관 정보</th>
				</tr>
				<tr class="row">
					<td class="col-sm-3"></td>
				</tr>
			</table>
		</div>
		<div class="col-sm-4">
			<div class="row">
				<div class="col-sm-1"></div>
				<div class="col-sm-10">
					<table class="table" id="total_pay">
					<tr class="total_title" id="total">
						<th><h3>결제 하실 금액</h3></th>
					</tr>
					<tr class="total_title" id="tt_pay">
						<th><h3>10,000</h3><input type="hidden" id="all_pay" name="all_pay" value="10000"></th>
					</tr>
				</table>
				</div>
				<div class="col-sm-1"></div>
			</div>
			<div class="row">
				<div class="col-sm-1"></div>
				<div class="col-sm-10">
					<table class="table" id="pay_insert">
					<tr class="total_title" id="in_title">
						<th><h3>금액 입력</h3></th>
					</tr>
					<tr class="total_title" id="pay_in">
						<th><input type="text" name="pay" id="pay_text" class="form-control form-control-lg" placeholder="금액만 입력하세요" autocomplete="off"></th>
					</tr>
				</table>
				</div>
				<div class="col-sm-1"></div>
			</div>
			<div class="row">
				<div class="col-sm-1"></div>
				<div class="col-sm-10">
					<button class="btn btn-block btn-warning" id="submit"><h3>결제완료</h3></button>
					<p class="alert alert-warning" id="price-success" style="margin:0; font-size:15px;">결제 버튼을 눌러주세요.</p>
					<p class="alert alert-danger" id="price-danger" style="margin:0; font-size:15px;">결제 금액을 똑같이 입력하세요.</p>    			      			
				</div>
				<div class="col-sm-1"></div>
			</div>
			
		</div>
	</div>
</div>
<script>
$(function(){
    $("#price-success").hide();
    $("#price-danger").hide();
    $("#submit").attr("disabled", "disabled");
    $("input").keyup(function(){
        var all_pay=$("#all_pay").val();
        var insert_pay=$("#pay_text").val();
        if(insert_pay != ""){
            if(all_pay == insert_pay){
                $("#price-success").show();
                $("#price-danger").hide();
                $("#submit").removeAttr("disabled");
            }else{
                $("#price-success").hide();
                $("#price-danger").show();
                $("#submit").attr("disabled", "disabled");                 
            }    
        }
    });
});
</script>