<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script>
$(function() {
	$("#datepicker").datepicker(
			{
				dateFormat : 'yymmdd' //Input Display Format 변경
				,
				showOtherMonths : true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
				,
				showMonthAfterYear : true //년도 먼저 나오고, 뒤에 월 표시
				,
				changeYear : true //콤보박스에서 년 선택 가능
				,
				changeMonth : true //콤보박스에서 월 선택 가능
				,
				yearSuffix : "년" //달력의 년도 부분 뒤에 붙는 텍스트
				,
				monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8',
						'9', '10', '11', '12' ] //달력의 월 부분 텍스트
				,
				monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
						'8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 Tooltip 텍스트
				,
				dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ] //달력의 요일 부분 텍스트
				,
				dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일',
						'토요일' ],
				minDate : "+1",
					onClose : function( selectedDate ) {  // 날짜를 설정 후 달력이 닫힐 때 실행
	                      if( selectedDate != "" ) {
	                          // yyy의 minDate를 xxx의 날짜로 설정
	                          $("#datepicker2").removeAttr("disabled");
	                          $("input[name='cdt']").datepicker("option", "minDate", selectedDate);
	                      }
	                  }
	                          
			});
	// xxx의 maxDate를 yyy의 날짜로 설정
  
	$("#datepicker2").datepicker(
			{				
				dateFormat : 'yymmdd' //Input Display Format 변경
				,
				showOtherMonths : true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
				,
				showMonthAfterYear : true //년도 먼저 나오고, 뒤에 월 표시
				,
				changeYear : true //콤보박스에서 년 선택 가능
				,
				changeMonth : true //콤보박스에서 월 선택 가능
				,
				yearSuffix : "년" //달력의 년도 부분 뒤에 붙는 텍스트
				,
				monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8',
						'9', '10', '11', '12' ] //달력의 월 부분 텍스트
				,
				monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
						'8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 Tooltip 텍스트
				,
				dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ] //달력의 요일 부분 텍스트
				,
				dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일',
						'토요일' ]
			});
});
</script>
<style>
	#admin_table {
		text-align:center;
	}
	#aj_left{
		text-align:left;
	}
	#aj_left > li{
		list-style: none;
	}
	#en_gray{
		color: darkgray;
	}
</style>
	<div class="container">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<h1>관리자 등록</h1>
				<!--<c:url var="po_regi" value="/movie/regi_ok" />-->
				<!-- <form action="${po_regi}" method="post"> -->
				<table class="table" id="admin_table">
					<tr class="row">
						<td class="col-sm-4"><h4>영화 선택</h4></td>
						<td class="col-sm-4"><h4>영화관 선택</h4></td>
						<td class="col-sm-4"><h4>상영관 선택</h4></td>												
					</tr>
					<tr class="row">
						<td class="col-sm-4">
							<select name="movie_num" class="form-control form-control-lg" id="mv_change" required="required">
								<option>--영화 선택--</option>
								<c:forEach var="i" items="${movielist}">
									<option value="${i.MV_CODE}">${i.MV_TITLE_KR}-${i.RT_RATING}</option>						
								</c:forEach>
							</select>
						</td>
						<td class="col-sm-4">
							<select name="c_code" class="form-control form-control-lg" required="required">
								<option>--영화관 선택--</option>
								<option value="1">CGV 천안터미널</option>
								<option value="2">CGV 천안역</option>
								<option value="3">CGV 천안펜타포트</option>								
							</select>
						</td>
						<td class="col-sm-4">
							<select name="tt_code" class="form-control form-control-lg" required="required">
								<option>--상영관 선택--</option>
								<option value="1">1관</option>
								<option value="2">2관</option>
								<option value="3">3관</option>
							</select>
						</td>
					</tr>
					<tr class="row">
						<td class="col-sm-3"><h4>상영일</h4></td>	
						<td class="col-sm-3">
							<input type="text" id="datepicker" autocomplete='off' name="odt" class="form-control form-control-lg" readonly="readonly" required="required">
						</td>
						<td class="col-sm-3"><h4>마감일</h4></td>	
						<td class="col-sm-3">
							<input type="text" id="datepicker2" autocomplete='off' name="cdt" class="form-control form-control-lg" readonly="readonly" disabled="disabled" required="required">
						</td>
					</tr>
					<tr class="row">
						<td class="col-sm-3"><h4>상영 시간</h4></td>
						<td class="col-sm-3">
							<select name="" class="form-control form-control-lg" required="required">
								<option>-- 첫 상영 시간 --</option>
								<option value="0900">09:00</option>
								<option value="0930">09:30</option>
								<option value="1000">10:00</option>
								<option value="1030">10:30</option>
								<option value="1100">11:00</option>
								<option value="1200">12:00</option>		
							</select>
						</td>
						<td class="col-sm-3">
							<select name="" class="form-control form-control-lg" required="required" id="interval">
							<option>-- 영화 런타임 / 상영 간격 --</option>
							</select>
						</td>
						<td class="col-sm-3">
							<select name="" class="form-control form-control-lg" required="required">
								<option>-- 마지막 상영 시간 --</option>
								<option value="2130">21:30</option>
								<option value="2200">22:00</option>
								<option value="2230">22:30</option>
								<option value="2300">23:00</option>
								<option value="2330">23:30</option>
								<option value="2300">24:00</option>
							</select>
						</td>
					</tr>
					<tr class="row" id="movie_info">
					</tr>
					<tr class="row">
						<td class="col-sm-3"></td>
						<td class="col-sm-6">
							<button type="submit" class="btn btn-block btn-danger"><h5>영화등록</h5></button>
						</td>
						<td class="col-sm-3"></td>
					</tr>
				</table>
				<!--</form>-->
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div>
<script>
$("#mv_change").bind(
        "change",
        function() {
        	 $("#movie_info").empty();
        	 $("#interval").empty();
        	 $.ajax({
                 url : "${pageContext.request.contextPath}/movie/info",
                 type : "get",
                 data : {
                    "mv_code" : this.value
                 },                 
                 success : function(data) {            
                	var runtime = data.MV_ST;
                	var interval = 30;
                	var hour = parseInt((runtime*60)/3600);
         			var min = parseInt(((runtime*60)%3600)/60);
         			var m = Math.round(min/10)*10;
         			if(m == 60){
         				hour = hour+1;
         				m = 0;
         			}
         			var run_plus = (hour*60)+m;
         			var in_30 =run_plus+interval;
                	var in_60= run_plus+(interval*2);
                	var in_90 = run_plus+(interval*3);
                	var in_120 = run_plus+(interval*4);
         			var times = hour+"시간 "+m+"분";
                    $("#movie_info").append("<td class='col-sm-4'><img src='"+data.MV_IMG+"'></td><td class='col-sm-8'><ul id='aj_left'><li><h3><img src='${pageContext.request.contextPath}/static/img/movie/"+data.RT_IMG+"' style='width:40px;'>"+data.MV_TITLE_KR+"</h3></li><li id='en_gray'><h5>"+data.MV_TITLE_EN+"</h5></li><li><h5>감독 : "+data.DT_NAME+"</h5></li><li><h5>배우 : "+data.A_NAME+"</h5></li><li><h5>장르 : "+data.G_NAME+"</h5></li><li><h5>상영시간  : "+runtime+" 분</h5><input type='hidden' name='mv_st' value='"+runtime+"'><li><h5>줄거리</h5></li><li><h6>"+data.MV_STORY+"</h6></li></ul></td>");
                    $("#interval").append("<option>-- 영화 런타임 / 상영 간격 --</option><option name='in_time' value="+in_30+">"+times+"/ +30분 간격</option><option name='in_time' value='"+in_60+"'>"+times+"/+1시간</option><option name='in_time' value='"+in_90+"'>"+times+"/+1시간30분</option><option name='in_time' value='"+in_120+"'>"+times+"/+2시간</option>");
                 },
                 error : function(jqXHR, textStatus, errorThrown, error) {
                    alert("에러 발생~~ \n" + textStatus + " : " + errorThrown
                          + error);
                 }
           })        	 
        });
</script>
