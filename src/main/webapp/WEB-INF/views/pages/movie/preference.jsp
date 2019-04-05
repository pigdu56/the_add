<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<h1>선호도</h1>
	<div class="row">
		<div class="col-sm-4" id="genre" style="width:120%;height:500px;"></div>
		<div class="col-sm-4" id="rating" style="width:120%;height:500px;"></div>
		<div class="col-sm-4" id="cinema" style="width:120%;height:400px;"></div>
	</div>
	
</div>