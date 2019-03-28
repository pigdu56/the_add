<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
	#admin_table {
		text-align:center;
	}
</style>
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
							<select name="movie_num" class="form-control form-control-lg">
								<option>--영화 선택--</option>
								<c:forEach var="i" items="${movielist}">
									<option value="${i.MV_CODE}" data-icon="${pageContext.request.contextPath}/static/img/movie/${i.RT_IMG}" data-html-text="${i.MV_TITLE_KR}&lt;i&gt;in stock&lt;/i&gt;">${i.MV_TITLE_KR}-${i.RT_RATING}</option>								
									
								</c:forEach>
							</select>
						</td>
						<td class="col-sm-4">
							<select name="" class="form-control form-control-lg">
								<option>--영화관 선택--</option>
								<option value="1">CGV 천안터미널</option>
								<option value="2">CGV 천안역</option>
								<option value="3">CGV 천안펜타포트</option>								
							</select>
						</td>
						<td class="col-sm-4">
							<select name="" class="form-control form-control-lg">
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
							<input type="text" id="datepicker" autocomplete='off' name="odt" class="form-control form-control-lg">
						</td>
						<td class="col-sm-3"><h4>마감일</h4></td>	
						<td class="col-sm-3">
							<input type="text" id="datepicker2" autocomplete='off' name="cdt" class="form-control form-control-lg">
						</td>
					</tr>
					<tr class="row">
						<td class="col-sm-3"><h4>시간 선택</h4></td>
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
	
