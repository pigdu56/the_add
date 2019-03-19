<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#poster {width: 185px; height: 260px; }
.box-image {margin-right: 30px; width: 185px; height: 260px; float: left;}
.box-contents {float: left; width: 765px; height: 260px; }
#title{font-size: 25px; vertical-align: middle; float: left; width: 765px; }
#title > p { font-size: 12px; font-family: Verdana, Geneva, sans-serif;}
.score { margin-top: 25px; padding-bottom: 10px; border-bottom: 1px solid #d9d6c8; font-size: 14px;}
.content{ padding-top: 18px; }
dt, dd { float: left; }
.on {float: none;}
</style>
</head>
<body>
	<div style="width: 80%; margin-left: 10%;">
		<h2>영화 상세</h2>
		<hr style="border: 3px solid #252424;">
		<div class="box-image">
			<img src="${img}" id="poster">
		</div>
		
		<div class="box-contents">
			<div id="title">
				<strong>${movie['movieNm']}</strong>
				<p/>${movie['movieNmEn']}
			</div>
			<div class="score">
				<strong>평점 &nbsp;</strong>
				<span>${rating}</span>
			</div>
			<div class="content">
				<dl>
					<dt><strong>감독 :&nbsp;</strong></dt>
					<dd><c:forEach var="d" items="${movie['directors']}" varStatus="status">
						${d.peopleNm}
							<c:choose>
								<c:when test="${status.last}">/ &nbsp;</c:when>
								<c:otherwise>,&nbsp;</c:otherwise>
							</c:choose>
						</c:forEach>
					</dd>
					<dt><strong>배우 :&nbsp;</strong></dt>
					<dd class="on"><c:forEach var="a" items="${movie['actors']}" varStatus="status">
						${a.peopleNm}
							<c:choose>
								<c:when test="${status.last}"> &nbsp;</c:when>
								<c:otherwise>,&nbsp;</c:otherwise>
							</c:choose>
						</c:forEach>
					</dd>
					<dt><strong>장르 :&nbsp;</strong></dt>
					<dd><c:forEach var="g" items="${movie['genres']}" varStatus="status">
							${g.genreNm}
								<c:choose>
									<c:when test="${status.last}">/&nbsp;</c:when>
									<c:otherwise>,&nbsp;</c:otherwise>
								</c:choose>
						</c:forEach>
					</dd>
					<dt><strong>기본 :&nbsp;</strong>
					<dd class="on">
						<c:forEach var="ad" items="${movie['audits']}" end="0">
							${ad.watchGradeNm}, &nbsp;
						</c:forEach>
						${movie['showTm']}분, &nbsp;
						<c:forEach var="nt" items="${movie['nations']}">
							${nt.nationNm}
						</c:forEach>
					</dd>
					<dt><strong>개봉일 :&nbsp;</strong></dt>
					<dd>
						<fmt:parseDate value="${movie['openDt']}" var="mm" pattern="yyyyMMdd"/>
						<fmt:formatDate value="${mm}" pattern="yyyy.MM.dd"/>
					</dd>
				</dl>
			</div>
		</div>
		<span>
			<a href=""><img src="${pageContext.request.contextPath}/static/img/movie/ticket.PNG"></a>
		</span>
	</div>
</body>
</html>