<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/trip/css/css.css" />
<section>
	<form action="http://www.naver.com">
		<table>
			<tr>
				<td><select id="s_thema_lest" id="theme">
						<option>테마</option>
						<option>여행지</option>
						<option>축제</option>
				</select></td>
				<td><input placeholder="지역을 입력하세요 " type="text" id="s_msearch"></input></td>
				<td><input type="submit" value="검색" id="s_bt"></td>
			</tr>
		</table>
	</form>
</section>


<br>
<hr id="f_hr">
<br>


<ul id="c_ul">
	<li class="bdr_nor" id="contentlist"><c:forEach var="i"
			items="${list}">
			<div id="c_photo">
				<img src="${i.firstimage}" id="c_img_main">
			</div>
			<div id="c_area_txt">
				<div id="c_tit">${i.title}</div>
				<p>${i.addr1}</p>

			</div>
		</c:forEach></li>
</ul>



