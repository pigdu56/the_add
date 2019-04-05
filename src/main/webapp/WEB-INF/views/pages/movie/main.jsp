<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
#title_a{ text-overflow: ellipsis; overflow: hidden; white-space: nowrap;
width: 180px; height: 20px; display: block; float: right;}
.btn_movie {
	border: 0;
	background-color: white;
}
td{
	width:350px;
}
ul > li{
	list-style:none;	
}
#b_title{
	text-align:center;
}
.poster{
	width:
}
.box_list{
	padding:0;
	background-color:white;
}
.rank_back{
	width:40px; color:white; text-align:center;
	 background-color: gray;
     background-color: rgba( 140, 140, 140, 0.5 );

}
.table-borderless{
	margin-top:0;
	margin-bottom:0;
	border:none;
	background-color:#F2F2F2;
}
.table-borderless >tbody> tr{
	margin-top:0;
	border:none;
}
.table-borderless >tbody> tr>td{
	border:none;
	padding-top:0;
	padding-bottom:0;
}
body{
	background-color:#F2F2F2;
}
.box_title{
	text-align:center;
}
.box_title > b {
	background-color:white;
	padding:10px;
}
</style>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(genreChart);
      function genreChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          <c:forEach var="i" items="${genre}" varStatus="status">
			<c:choose>
				<c:when test="${status.last}">
				['${i._id}', ${i.count}]
				</c:when>
				<c:otherwise>
				['${i._id}', ${i.count}],
				</c:otherwise>
			</c:choose>
			</c:forEach>
        ]);

        var options = {
          title: '장르별 선호도',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('genre'));
        chart.draw(data, options);
      }
    </script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(ratingChart);
      function ratingChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          <c:forEach var="i" items="${rating}" varStatus="status">
			<c:choose>
				<c:when test="${status.last}">
				['${i._id}', ${i.count}]
				</c:when>
				<c:otherwise>
				['${i._id}', ${i.count}],
				</c:otherwise>
			</c:choose>
			</c:forEach>
        ]);

        var options = {
          title: '연령별 선호도',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('rating'));
        chart.draw(data, options);
      }
    </script>
     <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(cinemaChart);
      function cinemaChart() {
        var data = google.visualization.arrayToDataTable([
        ['Element', '선호도', { role: 'style' }],
          <c:forEach var="i" items="${cinema}" varStatus="status">
			<c:choose>
			<c:when test="${status.first}">
			['${i._id}', ${i.count}, 'gold' ],
			</c:when>	
			<c:when test="${status.last}">
				['${i._id}', ${i.count}, 'color: #e5e4e2' ]
				</c:when>
				<c:otherwise>
				['${i._id}', ${i.count}, '#b87333'],
				</c:otherwise>
			</c:choose>
			</c:forEach>
        ]);

        var options = {
          title: '영화관별 선호도',
          is3D: true,
        };

        var chart = new google.visualization.ColumnChart(document.getElementById('cinema'));
        chart.draw(data, options);
      }
 </script>
<div class="container">
	<div id="black">
		<h2 class="box_title"><b>BOXOFFICE</b></h2>
		<table class="table" style="width: 100%;">
			<c:if test="${'admin' eq LoginUser}">
				<thead>
					<tr>
						<td colspan="5" style="text-align: right;">
							<c:url value="/movie/mv_insert" var="update" />
							<form action="${update}" method="get">
								<button style="border : 0; background-color: transparent;"><img src="${pageContext.request.contextPath}/static/img/movie/update.png" style="width: 40px; height: 40px;" /></button>
							</form>
						</td>
					</tr>
				</thead>			
			</c:if>
		</table>
		<table class="table table-borderless" style="width: 100%;">
			<tbody>
				<tr class="mySlides">
				<c:forEach var="m" items="${movie}" begin="0" end="4">					
					<td>
						<ul class="box_list">
							<li	style="background-image:url('${m.MV_IMG}');background-size:cover; width:100%; height:302px;">
								<h1 class="rank_back">
								<b class="rank">${m.MV_RNUM}</b>
								</h1>
							</li>
							<li class="row">
								<h5 class="col-sm-7" style="padding-right:0;">
									<img style="width:30px;" src="${pageContext.request.contextPath}/static/img/movie/${m.RT_IMG}">${m.MV_TITLE_KR}
								</h5>
								<h6 class="col-sm-4"style="padding:0;">
									<button class="btn btn-light btn-block" onclick="location.href='${pageContext.request.contextPath}/movie/detail_view?mv_code=${m.MV_CODE}'">상세정보</button>
								</h6>
							</li>
						</ul>
					</td>					
				</c:forEach>
				</tr>
				<tr class="mySlides">
				<c:forEach var="m" items="${movie}" begin="5" end="9">					
					<td>
						<ul class="box_list">
							<li	style="background-image:url('${m.MV_IMG}');background-size:cover; width:100%; height:302px;">
								<h1 class="rank_back">
								<b class="rank">${m.MV_RNUM}</b>
								</h1>
							</li>
							<li class="row">
								<h5 class="col-sm-7" style="padding-right:0;">
									<img style="width:36px;" src="${pageContext.request.contextPath}/static/img/movie/${m.RT_IMG}">${m.MV_TITLE_KR}
								</h5>
								<h6 class="col-sm-4"style="padding:0;">
									<button class="btn btn-light btn-block" onclick="location.href='${pageContext.request.contextPath}/movie/detail_view?mv_code=${m.MV_CODE}'">상세정보</button>
								</h6>
							</li>
						</ul>
					</td>			
				</c:forEach>
				</tr>
			</tbody>
		</table>		
	</div>
	<div class="row">
		<div class="col"><h2 class="box_title"><b>선호도</b></h2></div>
	</div>
	<br>
	<div class="row">
		<div class=col-sm-4>
			<div id="genre" style="width:100%;height:500px;"></div>	
		</div>
		<div class=col-sm-4>
			<div id="cinema" style="width:100%;height:500px;"></div>
		</div>
		<div class=col-sm-4>
			<div id="rating" style="width:100%;height:500px;"></div>
		</div>
	</div>
</div>
<script>
		var myIndex = 0;
		carousel();

		function carousel() {
			var i;
			var x = document.getElementsByClassName("mySlides");
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			myIndex++;
			if (myIndex > x.length) {
				myIndex = 1
			}
			x[myIndex - 1].style.display = "block";
			setTimeout(carousel, 4000); // Change image every 2 seconds
		}
	</script>