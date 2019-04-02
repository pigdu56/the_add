<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<style>
body{font-family: 'Gothic A1', sans-serif;}
#about_logo{position:relative; top:3%; left:60%; width:35%;}
#tb1{position:relative; left:28%;}
#tb2{position:relative; left:50%;}
#tb3{position:relative; left:28%;}
#tb4{position:relative; left:50%;}
#tb5{position:relative; left:28%;}
#tb6{position:relative; left:50%;}
</style>

<body class="w3-black">
	<div>
		<img src="${pageContext.request.contextPath}/static/img/r_about.png"
			id="about_logo">
	</div>
	<br>
	<br>

	<table id="tb1">
		<tr>
			<td><img
				src="${pageContext.request.contextPath}/static/img/ybus.png"
				style="width: 130px;" id="bus"></td>
			<td><p style="font-size: 25px; color: #FFD966;">&nbsp;&nbsp;Bus
					Program</p>
				<p style="font-size: 15px;">&nbsp;&nbsp;개발자:서형철, UI:이하현</p>
				<p style="font-size: 15px;">&nbsp;&nbsp;버스정보와 좌석을 조회하고 예약할 수 있는
					프로그램입니다.</p></td>
		</tr>
	</table>

	<br>
	<br>
	<br>
	<br>
	<br>

	<table id="tb2">
		<tr>
			<td style="text-align: right;"><p
					style="font-size: 25px; color: #FFD966;">Movie Program
					&nbsp;&nbsp;</p>
				<p style="font-size: 15px;">개발자:여인범, 이준표 &nbsp;&nbsp;</p>
				<p style="font-size: 15px;">영화예매 및 좌석을 선택 할 수 있는
					프로그램입니다.&nbsp;&nbsp;</p></td>
			<td><img
				src="${pageContext.request.contextPath}/static/img/ymovie.png"
				style="width: 130px;" id="bus"></td>
		</tr>
	</table>

	<br>
	<br>
	<br>
	<br>
	<br>
	<table id="tb3">
		<tr>
			<td><img
				src="${pageContext.request.contextPath}/static/img/back.png"
				style="width: 130px;" id="bus"></td>
			<td><p style="font-size: 25px; color: #FFD966;">&nbsp;&nbsp;Real Property Program</p>
				<p style="font-size: 15px;">&nbsp;&nbsp;개발자:장백훈,박민용 </p>
				<p style="font-size: 15px;">&nbsp;&nbsp;부동산 정보를 조회 할 수 있는 프로그램입니다.</p>
				</td>
		</tr>
	</table>

	<br>
	<br>
	<br>
	
</body>