<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<h3>Movie</h3>
	
	<table>
		<tbody>
			<c:forEach var="ml" items="list">
				<tr>
					<th>${ml.R}</th>
					<td>${ml.MV_IMG}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>