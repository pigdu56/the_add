<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
body, h1,h2,h3,h4,h5,h6 {font-family: "Montserrat", sans-serif}
.w3-row-padding img {margin-bottom: 12px}
.w3-sidebar {width: 120px;background: #222;}
#main {margin-left: 120px}
@media only screen and (max-width: 600px) {#main {margin-left: 0}}


</style>
<body class="w3-black">
	<br>
	<i class="glyphicon glyphicon-align-justify w3-xxlarge" id="show1"
		style="float:left; display: none;" onclick="clickshow1()"></i>
	<!--메인메뉴 -->
	<div id="trackblock">
		<nav class="w3-sidebar w3-bar-block w3-small w3-hide-small w3-center"
			style="background-color: black; color: white; width: 25%;">

			<c:url value="/home" var="main" />
			<img src="${pageContext.request.contextPath}/static/img/wmenulogo.png"
				style="width: 70%; margin-left: -30px;"
				onclick="location.href='${main}'">

				<i class="glyphicon glyphicon-align-justify w3-xxlarge" id="show2"
					style="float: left; display: black;" onclick="clickshow2()"></i>
				<a href="${main}" class="w3-bar-item w3-button w3-middle w3-hover-black"
					style="font-size: 15px;">
				<img src="${pageContext.request.contextPath}/static/img/mhome.png"
					style="width: 35%; height: 30%;">
			</a>
			<c:url value="/about" var="about" />
			<a href="${about}"
				class="w3-bar-item w3-button w3-middle w3-hover-black"
				style="font-size: 13px;"> <img
				src="${pageContext.request.contextPath}/static/img/mteam.png"
				style="width: 50px; height: 30%;"><br>
			</a>
			<c:url value="/bus/main" var="b_main" />
			<a href="${b_main}" class="w3-bar-item w3-button w3-middle w3-hover-black"
				style="font-size: 13px;">
				<img src="${pageContext.request.contextPath}/static/img/mbus.png"
				style="width: 50px; height: 30%;"><br>
			</a>
			
			<c:url value="/movie/main" var="movie" />
			<a href="${movie}" class="w3-bar-item w3-button w3-middle w3-hover-black"
				style="font-size: 13px;">
				<img src="${pageContext.request.contextPath}/static/img/mmovie.png"
					style="width: 50px; height: 30%;"><br>
			</a>
		
			
			<c:url value="/trip/timg" var="trip" />
			<a href="${trip}" class="w3-bar-item w3-button w3-middle w3-hover-black "
				style="font-size: 13px;">
				<img src="${pageContext.request.contextPath}/static/img/mrental.png"
				style="width: 55px; height: 30%;"><br>
			</a>
			
			<a href="#contact"
				class="w3-bar-item w3-button w3-middle w3-hover-black"
				style="font-size: 13px;"> <img
				src="${pageContext.request.contextPath}/static/img/wreal.png"
				style="width: 85px; height: 30%;"><br>
			</a>

		</nav>
	</div>

	<!--작은화면 메뉴-->
	<div class="w3-top w3-hide-large w3-hide-medium" id="myNavbar">
		<div class="w3-bar w3-black w3-opacity w3-hover-opacity-off w3-center w3-small">

			<c:url value="/home" var="main" />
			<a href="${main}" class="w3-bar-item w3-button"
				style="width: 25% !important">HOME</a>

			<c:url value="/about" var="about" />
			<a href="${about}" class="w3-bar-item w3-button"
				style="width: 25% !important">Team</a>
				
			<a href="#photos" class="w3-bar-item w3-button" style="width: 25% !important">Bus</a>
			
			<c:url var="movie" value="/movie/main" />
			<a href="${movie}" class="w3-bar-item w3-button"
				style="width: 25% !important">MOVIE</a>
		</div>
	</div>


<!-- 메뉴 펼쳤다 사라졌다 -->
<script type="text/javascript" >
function clickshow2(){
	var menu = document.getElementById("trackblock");
    var con1 = document.getElementById("show1");
    var con2 = document.getElementById("show2");
    
    menu.style.display = "none";	
	con2.style.display = "none";
	con1.style.display = "block";

}
function clickshow1() {
	var menu = document.getElementById("trackblock");
    var con1 = document.getElementById("show1");
    var con2 = document.getElementById("show2");
    
	menu.style.display = "block";
	con1.style.display = "none";
	con2.style.display = "block";
}
</script>