<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.footer {
	position: fixed;
	bottom: 0%;
	width: 100%;
}
* {
	box-sizing: border-box;
}

.mySlides {
	display : none;
}

body {
	font-family: Verdana, sans-serif;
}

img {
	vertical-align: middle;
}

/* Slideshow container */
.slideshow-container {
	position: relative;
	margin: auto;
}


/* Number text (1/3 etc) */
.numbertext {
	color: #f2f2f2;
	font-size: 12px;
	padding: 8px 12px;
	position: absolute;
	top: 0;
}

/* The dots/bullets/indicators */
.dot {
	height: 15px;
	width: 15px;
	margin: 0 2px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease;
}

.btn {
	position: absolute;
	top: 45%;
	left: 50%;
	display: block;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	background-color: #E24C4B;
	color: white;
	font-size: 16px;
	padding: 12px 24px;
	border: none;
	cursor: pointer;
	border-radius: 5px;
	text-align: center;
}

.btn:hover {
	background-color: black;
}
</style>

	<div style="margin-top: 15px;">
		<div class="slideshow-container">
			<div class="mySlides">
				<div class="numbertext">1 / 3</div>
				<img src="${pageContext.request.contextPath}/static/img/bus/b1.png"
					style="width: 100%; height: 61.5%;">
					  <c:url value="/bus/ticketing" var="ticketing" />
				<button class="btn" onclick="location.href='${ticketing}'">
					<b><i class="fa fa-bus">&nbsp;&nbsp;버스정보 보러 가기</i></b>
				</button>
			
			</div>

			<div class="mySlides">
				<div class="numbertext">2 / 3</div>
				<img src="${pageContext.request.contextPath}/static/img/bus/b2.png"
					style="width: 100%; height: 50%;">
					  <c:url value="/bus/ticketing" var="ticketing" />
				<button class="btn" onclick="location.href='${ticketing}'">
					<b><i class="fa fa-bus">&nbsp;&nbsp;버스정보 보러 가기</i></b>
				</button>
			
			</div>

			<div class="mySlides">
				<div class="numbertext">3 / 3</div>
				<img src="${pageContext.request.contextPath}/static/img/bus/b3.png"
					style="width: 100%; height: 61.5%;">
					  <c:url value="/bus/ticketing" var="ticketing" />
				<button class="btn" onclick="location.href='${ticketing}'">
					<b><i class="fa fa-bus">&nbsp;&nbsp;버스정보 보러 가기</i></b>
				</button>
			
			</div>

		</div>
	</div>
	<br>

	<div style="text-align: center">
		<span class="dot"></span>
		<span class="dot"></span>
		<span class="dot"></span>
	</div>

	<script>
		var slideIndex = 0;
		showSlides();

		function showSlides() {
			var i;
			var slides = document.getElementsByClassName("mySlides");
			var dots = document.getElementsByClassName("dot");
			for (i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}
			slideIndex++;
			if (slideIndex > slides.length) {
				slideIndex = 1
			}
			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace(" active", "");
			}
			slides[slideIndex - 1].style.display = "block";
			dots[slideIndex - 1].className += " active";
			setTimeout(showSlides, 2000); // Change image every 2 seconds
		}
	</script>
