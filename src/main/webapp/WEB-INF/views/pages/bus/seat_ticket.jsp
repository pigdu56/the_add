<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title></title>

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

</head>
<style>
#want3{
position:relative;
width:80%;
left:8%;
}
#qr{
position:relative;
left:3%;
width:100%;
}
.ticket th{
background-color:skyblue;

}
#right{
position:relative;
left:3%;
width:15%;
}
.ticket{
text-align:center;
}
.ticket td{
width:30%;
}
</style>
<body>
<div class="container">


<img src="${pageContext.request.contextPath}/static/img/bus/s3.png" id="want3">
<br><br><br>

<div class="row">
<div class="col-sm-2"></div>
<div class="col-sm-8">
<div class="row">
<c:forEach var="i" items="${buy_list}" varStatus = "j">
<div class="col-sm-6" style="border-left:solid 1px gray; border-right:solid 1px gray; padding: 0 !important;">
<table class="table ticket">
<tr>
<th style="font-size:15px;">
	${fn:substring(i.S_DAY, 0, 4)}/${fn:substring(i.S_DAY, 4, 6)}/${fn:substring(i.S_DAY, 6, 8)}
</th>
<th style="font-size:20px; color:white;">승차권</th>
<th style="font-size:15px;"> (${i.M_ID}님)</th>
</tr>
<tr>
</tr>
<tr>
<td></td>
<td><img src="${pageContext.request.contextPath}/static/img/bus/qr.png" id="qr"></td>
<td></td>
</tr>
<tr>
<td style="color:#0FA3B9;font-size:15px;border-bottom:solid 1px white;"><b>출발</b></td>
<td style="border-bottom:solid 1px white;"><img src="${pageContext.request.contextPath}/static/img/bus/right (4).png" id="right"></td>
<td style="color:#0FA3B9;font-size:15px; border-bottom:solid 1px white;"><b>도착</b></td>
</tr>
<tr>
<td style="font-size:17px; border-bottom:solid 1px white;" ><b>${fn:substring(i.DEP_TER,0,2)}</b></td>
<td style="border-bottom:solid 1px white;"></td>
<td  style="font-size:17px; border-bottom:solid 1px white;"><b>${i.ARR_TER}</b></td>
</tr>

<tr>
<td style="font-size:15px;">${fn:substring(i.S_DEP,0,2)} 시 ${fn:substring(i.S_DEP,2,4)} 분</td>
<td></td>
<td style="font-size:15px;">${fn:substring(i.S_ARR,0,2)} 시 ${fn:substring(i.S_ARR,2,4)} 분</td>
</tr>

<tr>
<td style="font-size:15px;color:#0FA3B9;border-bottom:solid 1px white;"><b>등급</b></td>
<td style="font-size:15px;color:#0FA3B9;border-bottom:solid 1px white;">&nbsp;&nbsp;&nbsp;<b>버스번호</b></td>
<td style="font-size:15px;color:#0FA3B9;border-bottom:solid 1px white;"><b>버스좌석</b></td>
</tr>

<tr>
<td style="font-size:16px;"><b>${i.G_NAME}</b></td>
<td style="font-size:17px;">&nbsp;&nbsp;&nbsp;<b>${i.S_CODE}</b></td>
<td style="font-size:17px;"><b>${i.B_SEATNUM}</b></td>
</tr>
</table>
<div style="background-color:skyblue;">&nbsp;</div>
<div style="background-color:skyblue;">&nbsp;</div>
</div>
	<c:if test ="${j.index % 2 == 1}">
		<div class="col-sm-12">&nbsp;</div>
	</c:if>	
</c:forEach>
</div>
</div>
<div class="col-sm-2"></div>
</div>
</div>
</body>

