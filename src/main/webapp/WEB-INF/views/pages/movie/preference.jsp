<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<h1>장르</h1>
	<ul>
		<c:forEach var="i" items="${genre}">
			<li>${i._id} : ${i.count}</li>
		</c:forEach>
	</ul>
	<h1>연령</h1>
	<ul>
		<c:forEach var="i" items="${rating}">
			<li>${i._id} : ${i.count}</li>
		</c:forEach>
	</ul>
	<h1>영화관</h1>
	<ul>
		<c:forEach var="i" items="${cinema}">
			<li>${i._id} : ${i.count}</li>
		</c:forEach>
	</ul>
</div>