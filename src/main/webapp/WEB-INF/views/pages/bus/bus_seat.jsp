<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<style>
	
input[class="che"]+label {
	display: inline-block;
	line-height: 45px;
	padding-left: 45px;
	background:
		url('${pageContext.request.contextPath}/static/img/bus/checked.png')
		left/45px no-repeat;
	}

	input[class="nochecked"]+label {
	display: inline-block;
	cursor: pointer;
	line-height: 45px;
	padding-left: 45px;
	background: url('${pageContext.request.contextPath}/static/img/bus/bin.png') left/45px
		no-repeat;
	}

	input[class="nochecked"]:checked+label {
	background-image:
		url('${pageContext.request.contextPath}/static/img/bus/check.png')
	}
	input[type=checkbox] {
	display: none;
	}
   	.bus td{
   		border: 1px solid white;
   	}
   	
   	
   	.driver{
   		background-image:
		url('${pageContext.request.contextPath}/static/img/bus/driver.png');
		background-size: 100% 100%;
		height: 200px;
		border-radius: 45px;
   	}
   	
   	.seat_num{
   		font_size: 15px;
   	}
</style>

</head>

<body>
	
   <c:url value="/bus/seat_ticket" var="seat_ticket"/>
   <form action="${seat_ticket}" method="post">
		<div class="container-fluid" style="font-size:12px;">
			<!-- 전체 그리드 -->
			<div class="row">
				<!-- 상단 글씨 -->
				<div class="col-sm-12 text-center">
					<h1 style="font-size: 40px;">좌석 예매</h1>
					<br><br><br>
				</div>
				<!-- 가장 바깥 공백 -->
				<div class="col-sm-2"></div>
				
				<!-- 예매창, 버스 div sm-8을 row로 쪼갬 -->
				<div class="col-sm-8">
			
				<div>
				<div class="row">
				
				<!-- 안쪽 공백 -->
				<div class="col-sm-1 bg-primary"></div>
				
				<!-- 버스 좌석 창 -->
				<div class="col-sm-5 bus" style="border:1px solid black; border-radius: 35px;">
					
					<!-- 운전석 사진 -->
					<div class="driver">
							
					</div>
					
					<!-- 버스 좌석 추가 테이블 -->
					<table class="table text-center seat_num">
						<tbody id="seat">
							
						</tbody>
					</table>
				</div>
				
				<!-- 예매 창 -->
				<div class="col-sm-5 bus" style="border: 1px solid black;">
					<table class="table table-borderless text-center">
						<tr>
							<td>${bus_ticket.get("dep_ter")}</td>
							<td>→</td>
							<td>${bus_ticket.get("arr_ter")}</td>
						</tr>
						<tr>
							<td>${bus_ticket.get("dep")}</td>
							<td><input type="hidden" name="member_num"
								value="${member_num}">
							<td>${bus_ticket.get("arr")}</td>
						</tr>
					</table>
				
					<table class="table table-border-white text-center ">
						<tr>
							<th><input type="hidden" name="bus_seq" id="bus_seq"
								value="${bus_ticket.get('bus_seq')}"></th>
							<th>${bus_ticket.get("bus")}</th>
						</tr>
						<tr>
							<td>${bus_ticket.get("grade")}</td>
							<td>${bus_ticket.get("charge")}</td>
						</tr>
						<tr>
							<td>가격</td>
							<td>
								<input type="text" name="charge_seat"
								value="0" id="test" readonly="readonly" class="btn btn-primary">원
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="submit" value="예매하기"
								class="btn btn-primary btn-block">
							</td>
						</tr>
					</table>
					
				</div>
				<!-- 안쪽 공백 -->
				<div class="col-sm-1 bg-primary"></div>
				</div>
				</div>
				</div>
				<!-- 가장 바깥 공백 -->
			<div class="col-sm-2"></div>
			</div>
		</div>   
   </form>
</body>
<script>
 $(document).ready(function(){
       $.ajax({
          url: "${pageContext.request.contextPath}/ajax_seat",
          type: "get",
          data: {
             "bus_seq" : $("#bus_seq").val()
          },
          success : function(data){
            
             // 등급을 받아와서 등급별로 다른 checkbox를 뿌림
             // 일반 고속 등급 뿌리기
             if(${bus_ticket.get("grade") eq "고속"} || ${bus_ticket.get("grade") eq "심야고속"}){
                
                for(var i=1; i<=45; i++){
                   // 체크 여부를 알기위한 boolean
                   var check = false;
                        for(var j=0; j<data.length; j++){
                           if(data[j].B_SEATNUM == i){
                              check = true;
                           }
                        }     
                   // true = 예약된 좌석이 있을 경우
                   if(check){
                	  if(i < 10){
                		    $("#seat").append(
                          		  "<td>&nbsp;<input type='checkbox' class='che' name='b_seatnum' id='box" + i + "' value='" + i 
                                    + "'disabled='disabled'>&nbsp;&nbsp;[" + i +"]<label for='box" + i
                                    + "'>&nbsp;&nbsp;</label><div class='div_checked'></td>"
                                    );
                	   }else{
                	   		$("#seat").append(
                     		  "<td>&nbsp;<input type='checkbox' class='che' name='b_seatnum' id='box" + i + "' value='" + i 
                               + "'disabled='disabled'>[" + i +"]<label for='box" + i
                               + "'>&nbsp;&nbsp;</label><div class='div_checked'></td>"
                               );
                	   }
                   // false = 예약된 좌석이 없을 경우
                   }else{
                	   if(i < 10){
                	   $("#seat").append(
                       		  "<td>&nbsp;<input type='checkbox' class='nochecked' name='b_seatnum' id='box" + i + "' value='" + i 
                         		  + "'>[" + i +"]<label for='box" + i
                                 + "'>&nbsp;&nbsp;</label><div class='div_nocheck'></td>"
                                 );
              	   	  }else{
              	   		$("#seat").append(
                         		  "<td>&nbsp;<input type='checkbox' class='nochecked' name='b_seatnum' id='box" + i + "' value='" + i 
                           		  + "'>[" + i +"]<label for='box" + i
                                   + "'>&nbsp;&nbsp;</label><div class='div_nocheck'></td>"
                                   );
              	   	  }
                   }
                   
                   if(i < 41){
                          if(i%4 == 0){ // 자리 띄우기
                             $("#seat").append("<tr></tr>");
                          }else if (i%4 == 2){ // 버스 통로길
                             $("#seat").append("<td></td>");
                          }
                       }
                    }
                
             // 우등 좌석 뿌리기
             }else if(${bus_ticket.get("grade") eq "우등"} || ${bus_ticket.get("grade") eq "심야우등"}){
                console.log("우등");
                for(var i=1; i<=28; i++){
                   // 체크 여부를 알기위한 boolean type 변수  true-예약 좌석
                   var check = false;
                        for(var j=0; j<data.length; j++){
                           if(data[j].B_SEATNUM == i){
                              check = true;
                           }
                        }
				  if(check){
					  if(i < 10){
               		    $("#seat").append(
                         		  "<td><input type='checkbox' class='che' name='b_seatnum' id='box" + i + "' value='" + i 
                                   + "'disabled='disabled'>&nbsp;&nbsp[" + i +"]<label for='box" + i
                                   + "'>&nbsp;&nbsp;</label><br><div class='div_checked'></td>"
                                   );
					  }else{
              	   		$("#seat").append(
                   		  "<td><input type='checkbox' class='che' name='b_seatnum' id='box" + i + "' value='" + i 
                             + "'disabled='disabled'>[" + i +"]<label for='box" + i
                             + "'>&nbsp;&nbsp;</label><div class='div_checked'></td>"
                             );
              	   	  }
                   }else{
                	   if(i < 10){
                		   $("#seat").append(
                          		  "<td><input type='checkbox' class='nochecked' name='b_seatnum' id='box" + i + "' value='" + i 
                            		  + "'>&nbsp;&nbsp;[" + i +"]<label for='box" + i
                                    + "'>&nbsp;&nbsp;</label><div class='div_nocheck'></td>"
                                    );
                 	   	  }else{
                 	   		$("#seat").append(
                            		  "<td><input type='checkbox' class='nochecked' name='b_seatnum' id='box" + i + "' value='" + i 
                              		  + "'>[" + i +"]<label for='box" + i
                                      + "'>&nbsp;&nbsp;</label><div class='div_nocheck'></td>"
                                      );
                 	   	  }
                   }
                   
                   if(i < 25){
                      if(i%3 == 0){ // 자리 띄우기
                         $("#seat").append("<tr></tr>");
                      }else if (i%3 == 2){ // 버스 통로길
                         $("#seat").append("<td></td>");
                      }
                   }
                }
                
             // 프리미엄 좌석 뿌리기
             }else{
                console.log("프리미엄");
                for(var i=1; i<=21; i++){
                   // 체크 여부를 알기위한 boolean
                   var check = false;
                        for(var j=0; j<data.length; j++){
                           if(data[j].B_SEATNUM == i){
                              check = true;
                           }
                        }     
                        // true = 예약된 좌석이 있을 경우
                   if(check){
                	      if(i < 10){
                 		    $("#seat").append(
                           		  "<td><input type='checkbox' class='che' name='b_seatnum' id='box" + i + "' value='" + i 
                                     + "'disabled='disabled'>&nbsp;&nbsp[" + i +"]<label for='box" + i
                                     + "'>&nbsp;&nbsp;</label><br><div class='div_checked'></td>"
                                     );
                 	   	  }else{
                 	   		$("#seat").append(
                      		  "<td><input type='checkbox' class='che' name='b_seatnum' id='box" + i + "' value='" + i 
                                + "'disabled='disabled'>[" + i +"]<label for='box" + i
                                + "'>&nbsp;&nbsp;</label><br><div class='div_checked'></td>"
                                );
                 	   	  }
                   // false = 예약된 좌석이 없을 경우
                   }else{
                	   	  if(i < 10){
                    	    $("#seat").append(
                           		  "<td><input type='checkbox' class='nochecked' name='b_seatnum' id='box" + i + "' value='" + i 
                             		  + "'>&nbsp;&nbsp;[" + i +"]<label for='box" + i
                                     + "'>&nbsp;&nbsp;</label><br><div class='div_nocheck'></td>"
                                     );
                  	   	  }else{
                  	   		$("#seat").append(
                             		  "<td><input type='checkbox' class='nochecked' name='b_seatnum' id='box" + i + "' value='" + i 
                               		  + "'>[" + i +"]<label for='box" + i
                                       + "'>&nbsp;&nbsp;</label><br><div class='div_nocheck'></td>"
                                       );
                  	   	  }
                   }
                            
                          if(i%3 == 0){ // 자리 띄우기
                             $("#seat").append("<tr><td>&nbsp;</td></tr>");
                          }else if (i%3 == 2){ // 버스 통로길
                             $("#seat").append("<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
                              + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>");
                          }
                       
                    }
             }
             
             
          }, error : function(jqXHR, textStatus, errorThrown, error) {
             alert("에러 발생~~ \n" + textStatus + " : " + errorThrown
                   + error);
          }
         
       });
    });
 /* ********************* 체크박스  ********************* */

</script>
</html>