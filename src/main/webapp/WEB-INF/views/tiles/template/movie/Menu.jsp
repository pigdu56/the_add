<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#top_link{
	padding-top:0;
	padding-bottom:0;
	color:#4F3397; 
}
.ns{
	background-color: #EDEEEA; 
	color:#4F3397; 
}
.se_li{
	text-align:center;
	min-width:100px;
	color:#EDEEEA;
}
.se_li:active {	
	color:#EDEEEA;
}
.se_li:visited {
	color:#EDEEEA;
}
.se_li:hover {
	background-color:#EDEEEA;
	color:#4F3397;
}
.d_menu{
	min-width:100px;
	text-align:center;
}
.minis{	
	color:#4F3397;		
}
.minis:hover {
	background-color:#4F3397;
	color:#EDEEEA;
}
</style>
<nav class="navbar navbar-expand-sm" style="margin:0; padding:0; background-color:#4F3397; color:#EDEEEA;">
		<ul class="navbar-nav">
			<li class="nav-item" style="text-align:center;padding-top:12px;"><img
				src="${pageContext.request.contextPath}/static/img/movies2.png" alt="logo"></li>
			<li class="nav-item" style="margin-top:-5px;margin-left:5px;"><h3 style="text-shadow: 1px 1px 1px gray;">ADDMOVIE</h3></li>
		</ul>
		<ul class="navbar-nav" style="margin-left:15px; font-size:14px; padding-top:7px;">
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle se_li" href="" id="navbardrop" data-toggle="dropdown">
					<b>영화</b>
				</a>
			<div class="dropdown-menu d_menu">
       			<a class="dropdown-item minis" href="">영화예매</a>
       			<a class="dropdown-item minis" href="">상영시간표</a>
        		<a class="dropdown-item minis" href="">영화정보</a>
     		</div>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle se_li" href="" id="navbardrop" data-toggle="dropdown">
					<b>차트</b>
				</a>
				<div class="dropdown-menu d_menu">
       				<a class="dropdown-item minis" href="">박스오피스</a>
        			<a class="dropdown-item minis" href="">선호도</a>
     			</div>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle se_li" href="" id="navbardrop" data-toggle="dropdown">
					<b>극장</b>
				</a>
				<div class="dropdown-menu d_menu">
       			<a class="dropdown-item minis" href="">영화관정보</a>        		
     			</div>
			</li>
		</ul>
	</nav>
	<nav class="navbar navbar-expand-sm ns"
		style="min-height:30px; margin: 0; padding: 0; border-bottom:2px #E4E6E0 solid;">
	</nav>