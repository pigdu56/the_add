<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
.se_li{
	text-align:center;
	min-width:100px;
	color:black;
}
.se_li:active {	
	color:black;
}
.se_li:visited {
	color:black;
}
.se_li:hover {
	background-color:#F40000;
	color:#FEFADB;
}
.d_menu{
	min-width:100px;
	text-align:center;
}
.minis{	
	color:black;		
}
.minis:hover {
	background-color:#F40000;
	color:#FEFADB;
}
#logos{
	width:64px;
	height:50px;
	padding-bottom:10px;
	margin-left:10px;
}
</style>
<nav class="navbar navbar-expand-sm" style="margin:0; padding:0; background-color:#FEFADB; color:black;">
		<ul class="navbar-nav">
			<li class="nav-item" style="text-align:center;padding-top:12px;">
				<c:url value="/movie/main" var="main"/>
				<a href="${main}">
				<img src="${pageContext.request.contextPath}/static/img/movie/cgv.png" alt="logo" id="logos" />
				</a></li>
			<li class="nav-item" style="margin-left:5px;"><h3 style="text-shadow: 1px 1px 1px gray;">CHEONAN</h3></li>
		</ul>
		<ul class="navbar-nav" style="margin-left:15px; font-size:14px; padding-top:7px;">
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle se_li" href="" id="navbardrop" data-toggle="dropdown">
					<b>영화</b>
				</a>
			<div class="dropdown-menu d_menu">
       			<a class="dropdown-item minis" href="${pageContext.request.contextPath}/movie/reservation">영화예매</a>
        		<a class="dropdown-item minis" href="/the_add/movie/movie_list/1">영화정보</a>
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
			<c:if test="${'admin' eq LoginUser}">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle se_li" href="" id="navbardrop" data-toggle="dropdown">
						<b>관리자</b>
					</a>
					<div class="dropdown-menu d_menu">
						<c:url value="/movie/registration" var="up" />
		       			<a class="dropdown-item minis" href="${up}">영화상영등록</a>
		       			<c:url value="/movie/m_list/1" var="m_list" />
	       				<a class="dropdown-item minis" href="${m_list}">회원 리스트</a>     
		       			<c:url value="/movie/rev_l_all/1" var="rev_l" />
	       				<a class="dropdown-item minis" href="${rev_l}">예약 리스트</a>         		
	     			</div>
				</li>
			</c:if>
		</ul>
	</nav>
	<nav class="navbar navbar-expand-sm ns"
		style="min-height:30px; margin: 0; padding: 0; border-bottom:2px #E4E6E0 solid;">
	</nav>