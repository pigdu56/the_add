<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style>
	.box-image {margin-right: 30px; width: 213px; height: 305px;}
	.box-contents {width: 737px; height: 305px; }
	#title{font-size: 25px; vertical-align: middle; float: left; width: 737px; }
	#title > p { font-size: 12px; font-family: Verdana, Geneva, sans-serif;}
	.score { margin-top: 25px; padding-bottom: 10px; border-bottom: 1px solid #d9d6c8; font-size: 14px;}
	.content{ padding-top: 18px; }
	dt, dd { float: left; }
	.on {float: none;}
</style>
<div class="container" style="width: 80%; height : 400px; margin-left: 10%;">
	<br/><br/>
	<h2>영화 상세</h2>
	<hr style="border: 3px solid #252424;">
	<br/><br/><br/>
	<div class="box-image col-sm-3">
		<img src="${movie['MV_IMG']}" id="poster">
	</div>
	
	<div class="box-contents col-sm-9">
		<div id="title">
			<img src="${pageContext.request.contextPath}/static/img/movie/${movie['RT_IMG']}" style="width: 40px;">
			<strong> ${movie['MV_TITLE_KR']}</strong>
			<p/>${movie['MV_TITLE_EN']}
		</div>
		<div class="score">
			<strong>평점 &nbsp;</strong>
			<span>${movie['MV_UR']}</span>
		</div>
		<div class="content">
			<dl>
				<dt><strong>감독 :&nbsp;</strong></dt>
				<dd>${movie['DT_NAME']}&nbsp;/&nbsp;</dd>
				
				<dt><strong>배우 :&nbsp;</strong></dt>
				<dd class="on">${movie['A_NAME']}</dd>
				
				<dt><strong>장르 :&nbsp;</strong></dt>
				<dd>${movie['G_NAME']} &nbsp;</dd>
				
				<dt><strong>기본 :&nbsp;</strong>
				<dd class="on">
					${movie['RT_RATING']}, &nbsp;
					${movie['MV_ST']}분, &nbsp;
					${movie['CT_NAME']}
				</dd>
				
				<dt><strong>개봉일 :&nbsp;</strong></dt>
				<dd class="on">
					${movie['MV_OD']}
				</dd>
				<dt class="on"><strong style="font-size: 18px;"> 줄거리 </strong></dt>
				<dd>
					${movie['MV_STORY']}
				</dd>
			</dl>
		</div>
	</div>
	
	
	<div class="row" style="clear: both; padding-top: 50px;">
		<c:forEach var="age" items="${age}">
			<c:choose>
				<c:when test="${age._id == 1}">
					<input type="hidden" id="10" value="${age.count}" />
				</c:when>
				<c:when test="${age._id == 2}">
					<input type="hidden" id="20" value="${age.count}" />
				</c:when>
				<c:when test="${age._id == 3}">
					<input type="hidden" id="30" value="${age.count}" />
				</c:when>
				<c:when test="${age._id == 4}">
					<input type="hidden" id="40" value="${age.count}" />
				</c:when>
				<c:when test="${age._id == 5}">
					<input type="hidden" id="50" value="${age.count}" />
				</c:when>
			</c:choose>
		</c:forEach>
		<c:forEach var="i" items="${gender}">
			<c:choose>
				<c:when test="${i._id == 0}">
					<input type="hidden" id="female" value="${i.count}">
				</c:when>
				<c:otherwise>
					<input type="hidden" id="male" value="${i.count}">
				</c:otherwise>
			</c:choose>	
		</c:forEach>
		
		<div class="col-sm-4" id="genderChart" style="width: 100%; height: 400px;"></div>
		<div class="col-sm-4" id="ageChart" style="width: 100%; height: 300px;"></div>
	</div>
</div>



<script type="text/javascript">
$(document).ready(function(){
	var age10 = 0;
	var age20 = 0;
	var age30 = 0;
	var age40 = 0;
	var age50 = 0;
	var male = 0;
	var female = 0;
	
	if($("#10").length > 0){
        age10 = $("#10").val();
    }
	if($("#20").length > 0){
        age20 = $("#20").val();
    }
	if($("#30").length > 0){
        age30 = $("#30").val();
    }
	if($("#40").length > 0){
        age40 = $("#40").val();
    }
	if($("#50").length > 0){
        age50 = $("#50").val();
    }
	
	if($("#male").length > 0){
		male = $("#male").val();
    }
	if($("#female").length > 0){
		female = $("#female").val();
    }
	
	google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(cinemaChart);
    function cinemaChart() {
		var data = google.visualization.arrayToDataTable([
			['Element', '선호도', { role: 'style' }],
			['10대', Number(age10), 'gold' ],
			['20대', Number(age20), 'color: #e5e4e2' ],
			['30대', Number(age30), '#b87333'],
			['40대', Number(age40), 'color: #e5e4e2' ],
			['50대', Number(age50), '#b87333']
      	]);

      	var options = {
      		title: '연령별 선호도',
        	is3D: true,
     	};

		var chart = new google.visualization.ColumnChart(document.getElementById('ageChart'));
		chart.draw(data, options);
    }
    
    google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
		var data = google.visualization.arrayToDataTable([
			['Task', 'Hours per Day'],
			['남성', male],
			['여성', female]
    	]);

		var options = {
        	title: '성별 선호도',
			pieHole: 0.4,
			width: 400,
		  	height: 280,
		  	sliceVisibilityThreshold :0
		};

      	var chart = new google.visualization.PieChart(document.getElementById('genderChart'));
      	chart.draw(data, options);
    };
});	
</script>