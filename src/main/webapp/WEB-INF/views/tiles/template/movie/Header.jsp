<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
#top_link{
	padding-top:0;
	padding-bottom:0;
	color:#FEFADB; 
}
.ns{
	background-color: #F40000; 
	color:#FEFADB; 
}
</style>

	<nav class="navbar navbar-expand-sm ns"
		style="min-height:35px;margin: 0; padding: 0; border-bottom:2px #E4E6E0 solid;">
		<ul class="navbar-nav"
			style="margin-left: 15px; font-size: 14px;">
			<li class="nav-item"><a class="nav-link" id="top_link"
				href="${pageContext.request.contextPath}/movie/main"><b>Movie</b></a></li>
			<li class="nav-item"><a class="nav-link" id="top_link"
				href="${pageContext.request.contextPath}/bus/main"><b>Bus</b></a></li>
			<li class="nav-item"><a class="nav-link" id="top_link"
				href=""><b>Property</b></a></li>
		</ul>
		<div class="navbar-collapse justify-content-end"
			id="collapsibleNavbar">
			<ul class="nav" style="color: white; font-size: 14px;">
				<li class="nav-item">
					<c:url var="home" value="/home" />				
					<a class="nav-link" id="top_link" href="${home}">
					<i class="glyphicon glyphicon-home">HOME</i></a></li>

				<li class="nav-item"><a class="nav-link" id="top_link" href="/the_add/movie/rev_l/1"><i
						class="glyphicon glyphicon-user">${LoginUser}님</i></a></li>
				<li class="nav-item"><a class="nav-link"  id="top_link"
					style="cursor:pointer;" onclick="logout()">
					<i class="glyphicon glyphicon-link">LOGOUT</i></a></li>

			</ul>
		</div>
	</nav>