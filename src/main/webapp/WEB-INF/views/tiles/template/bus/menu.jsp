<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#menu{font-size:15px;}

</style>
<!-- Navigation Bar -->
<div class="w3-bar w3-white w3-xlarge" style="border-bottom:solid 2px #2196F3; ">
<c:url value="/bus/main" var="main" />
  <a href="${main}" class="w3-bar-item w3-button w3-text-blue w3-hover-blue"><b><i class="fa fa-bus w3-margin-right"></i>HUMAN BUS</b></a>
  </div>
  <br>
  
<div class="w3-bar w3-white w3-middle" id="menu">
  <c:url value="/bus/member_buylist" var="member_buylist" />
  <c:if test="${!LoginUser}">
	 <a href="${member_buylist}" class="w3-bar-item w3-button w3-hover-blue w3-text-black w3-right"><i class="fa fa-bus">&nbsp;&nbsp;<b>${LoginUser}님</b></i></a>
  </c:if>
  <c:url value="/bus/admin_list" var="admin_list" />
  <c:if test="${LoginUser=='admin'}">
  	 <a href="${admin_list}" class="w3-bar-item w3-button w3-hover-blue w3-text-black w3-right"><i class="fa fa-bus">&nbsp;&nbsp;<b>예약목록</b></i></a>	
  </c:if>
  <c:url value="/bus/about" var="about" />
  <a href="${about}" class="w3-bar-item w3-button w3-hover-blue w3-text-black w3-right"><b>ABOUT</b></a>
   <c:url value="/bus/ticketing" var="ticketing" />
  <a href="${ticketing}" class="w3-bar-item w3-button w3-hover-blue w3-text-black w3-right"><b>TICKET</b></a>
  
</div>


