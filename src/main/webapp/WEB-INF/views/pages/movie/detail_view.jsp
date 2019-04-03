<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
	.box-image {margin-right: 30px; width: 213px; height: 305px; float: left;}
	.box-contents {float: left; width: 737px; height: 305px; }
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
	<div class="box-image">
		<img src="${movie['MV_IMG']}" id="poster">
	</div>
	
	<div class="box-contents">
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
</div>
