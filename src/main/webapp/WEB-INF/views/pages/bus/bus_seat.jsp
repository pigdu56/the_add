<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
   #want2{
    position:relative;
    width:80%;
    }
   
   input[class="che"]+label {
   display: inline-block;
   line-height: 45px;
   padding-left: 45px;
   background:
      url('${pageContext.request.contextPath}/static/img/bus/checkedseat.png')
      left/45px no-repeat;
   }

   input[class="nochecked"]+label {
   display: inline-block;
   cursor: pointer;
   line-height: 45px;
   padding-left: 45px;
   background: url('${pageContext.request.contextPath}/static/img/bus/binseat.png') left/45px
      no-repeat;
   }

   input[class="nochecked"]:checked+label {
   background-image:
      url('${pageContext.request.contextPath}/static/img/bus/checkseat.png')
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
      border-radius:45px;
      }
      
      .seat_num{
         font_size: 15px;
      }
   .btsky{
   width:100%;
   background-color:#5C9CD5;
   color:black;
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
             <img src="${pageContext.request.contextPath}/static/img/bus/s2.png" id="want2">
            </div>
            <!-- 가장 바깥 공백 -->
            <div class="col-sm-2"></div>
            
            <!-- 예매창, 버스 div sm-8을 row로 쪼갬 -->
            <div class="col-sm-8">
         
            <div>
            <div class="row">
            
            <!-- 안쪽 공백 -->
            <div class="col-sm-1"></div>
            
            <!-- 버스 좌석 창 -->
            <div class="col-sm-5 bus" style="border:5px double skyblue; border-radius: 35px;">
               
               <!-- 운전석 사진 -->
               <div class="driver">
                     
               </div>
               
               <!-- 버스 좌석 추가 테이블 -->
               <table class="table text-center">
                  <tbody id="seat">
                     
                  </tbody>
               </table>
            </div>
            
            <!-- 예매 창 -->
            <div class="col-sm-5 bus">
            <img src="${pageContext.request.contextPath}/static/img/bus/seat_logo.png" style="width:100%;">
            <br><br>
               <table class="table text-center" style='font-size: 15px;'>
                  <tr>
                     <td>${bus_ticket.get("dep_ter")}</td>
                     <td>
                        <img src='${pageContext.request.contextPath}/static/img/bus/right (4).png'
                         style="width:20px;">
                     </td>
                     <td>${bus_ticket.get("arr_ter")}</td>
                  </tr>
                  <tr>
                     <td>${bus_ticket.get("dep")}</td>
                     <td><input type="hidden" name="member_num"
                        value="${member_num}">
                     <td>${bus_ticket.get("arr")}</td>
                  </tr>
               </table>
               
               <table class="table text-center"  style="font-size: 15px;">
               	  <tr>
               	  	 <td></td>
               	  	 <td></td>
                     <td></td>
               	  </tr>
                  <tr>
                     <td><input type="hidden" name="bus_seq" id="bus_seq"
                        value="${bus_ticket.get('bus_seq')}">
                                                버스 회사
                     </td>
                     <td></td>
                     <td>${bus_ticket.get("bus")}</td>
                  </tr>
                  <tr>
                     <td></td>
                     <td></td>
                     <td></td>
                  </tr>
                  <tr>
                     <td>${bus_ticket.get("grade")}</td>
                     <td></td>
                     <td>${bus_ticket.get("charge")}</td>
                  </tr>
                  <tr>
                     <td></td>
                     <td></td>
                     <td></td>
                  </tr>
                  <tr>
                     <td>운임 비용</td>
                     <td></td>
                     <td id="charge">
                        <input type="text" name="charge_seat"
                        value="" id="test" size="5px;" readonly="readonly" class="btn" style="font-size: 15px;">원
                     </td>
                  </tr>
                  <tr>
                     <td></td>
                     <td></td>
                     <td></td>
                  </tr>
                  <tr>
                     <td style="font-size: 15px;">결제</td>
                     <td></td>
                     <td id="m_payment_td"><input type="text" placeholder="금액 입력" id="m_payment" 
                        class="btn" size="5px;" style="font-size: 15px;">원
                     </td>
                  </tr>
                  <tr>
                     <td></td>
                     <td></td>
                  </tr>
                  <tr>
                     <td colspan="3">
                        <input type="submit" id="submit" value="예매하기"
                        class="btn btn-block btsky" disabled="disabled" style="font-size: 15px;" onclick="buy_alert()">
                     </td>
                  </tr>
               </table>
               <!-- 좌석 수  -->
               <table class="table" style='font-size: 15px;'>
                   <tr>
                    	<td id="seat_nam" style="text-align: right;"></td>
                   </tr>
               </table>
               
            </div>
            <!-- 안쪽 공백 -->
            <div class="col-sm-1"></div>
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
function leadingZeros(n, digits) {
    var zero = '';
    n = n.toString();

    if (n.length < digits) {
      for (i = 0; i < digits - n.length; i++)
        zero += '0';
    }
    return zero + n;
  }

     // 오늘 날짜 일 경우 
     var d = new Date();
     var todayY = d.getFullYear();
     var todayMT = leadingZeros(d.getMonth() + 1, 2);
     var todayD = leadingZeros(d.getDate(), 2);
     
     var todayYMD =  String(todayY) + String(todayMT) + String(todayD);
     
     var todayH = leadingZeros(d.getHours(), 2);
     var todayM = leadingZeros(d.getMinutes(), 2);
     var todayHM = "1" + String(todayH) + String(todayM);	
	
	
function noEvent() {
	if (event.keyCode == 116) {
		event.keyCode= 2;
		return false;
	}else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82)){
		return false;
	}
	}
	document.onkeydown = noEvent;
	
	
	function buy_alert(){
		 alert("예매가 완료되었습니다.");
	}
   
    // 체크박스 개수를 가져와 가격에 * 하기
   function check(frm){
      // 체크된 체크박스개수 가져오기
      var check = $("input:checkbox[class=nochecked]:checked").length;
      // 운임비용 가져와 뒷자리 " 원" 자르기
      var charge = '${bus_ticket.get("charge")}'.substr(0, '${bus_ticket.get("charge")}'.length-2);
      $("#charge").empty();        // 운임비용 td 지우기
      $("#m_payment_td").empty();  // 입력 금액 td 지우기
      $("#charge").append(
         "<input type='text' name='charge_seat'"
         + "value='" + charge * check +"' id='payment' readonly='readonly' size='5px;' class='btn' style='font-size: 15px;'>원"
      );
      $("#m_payment_td").append(
         "<input type='text' placeholder='금액 입력' id='m_payment' size='5px;' class='btn'  style='font-size: 15px;'>원"      
      );
      
      // 체크박스를 클릭할 때 예매 버튼 막기
      $("#submit").attr("disabled", "disabled");
      
      // 운임비용하고 결제금액 입력이 같을 경우 실행 
      $(function(){
         // 결제할 금액이 없거나 0원일 경우 막기 
         if($("#payment").val() != "" && $("#payment").val() != 0){
            $("#m_payment").keyup(function(){
               // 결제금액을 입력 한값이 있을 경우
               if($(this.vlaue) != ""){
                  // 결제할 금액과 입력 금액이 같고 0원이 아닐 경우, 
                  if($("#m_payment").val() == $("#payment").val() && ($("#m_payment").val() == $("#payment").val()) != 0){
                     $("#submit").removeAttr("disabled");
                   }else{
                      $("#submit").attr("disabled", "disabled");
                  }
               }
               })
            }
         })
   }
   
   
 $(document).ready(function(){
       $.ajax({
          url: "${pageContext.request.contextPath}/ajax_seat",
          type: "get",
          data: {
             "bus_seq" : $("#bus_seq").val()
          },
          success : function(data){
             
        	  var over_time_check = '${bus_ticket.get("dep")}';
              over_time_check = "1"+over_time_check.substring(0,2) + over_time_check.substring(4, 6)
              todayHM = "1" + String(todayH) + String(todayM);
              
              // 다시한번 막기
              if(Number(todayHM) >= Number(over_time_check)){
            	  alert("이미 출발한 버스입니다.");
            	  window.history.back();
            	  return;
              }
        	  
             // 등급을 받아와서 등급별로 다른 checkbox를 뿌림
             // 일반 고속 등급 뿌리기
             if(${bus_ticket.get("grade") eq "고속"} || ${bus_ticket.get("grade") eq "심야고속"}){
                // 남은 좌석 가져오기
            	$("#seat_nam").empty();
                $("#seat_nam").append(
                		"<p>남은 좌석 수 / " + (45 - data.length) + "</p>"	
                		);                
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
                                 + "' onclick='check(this.form)'>[" + i +"]<label for='box" + i
                                 + "'>&nbsp;&nbsp;</label><div class='div_nocheck'></td>"
                                 );
                         }else{
                          $("#seat").append(
                                 "<td>&nbsp;<input type='checkbox' class='nochecked' name='b_seatnum' id='box" + i + "' value='" + i 
                                   + "' onclick='check(this.form)'>[" + i +"]<label for='box" + i
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
            	
            	 console.log(data.length);
            	// 남은 좌석 가져오기
             	$("#seat_nam").empty();
                $("#seat_nam").append(
                 		"<p>남은 좌석 수 / " + (28 - data.length) + "</p>"
                 		);
            	 
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
                                    + "' onclick='check(this.form)'>&nbsp;&nbsp;[" + i +"]<label for='box" + i
                                    + "'>&nbsp;&nbsp;</label><div class='div_nocheck'></td>"
                                    );
                            }else{
                             $("#seat").append(
                                    "<td><input type='checkbox' class='nochecked' name='b_seatnum' id='box" + i + "' value='" + i 
                                      + "' onclick='check(this.form)'>[" + i +"]<label for='box" + i
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
                
            	// 남은 좌석 가져오기
              	$("#seat_nam").empty();
                $("#seat_nam").append(
                		"<p>남은 좌석 수 / " + (21 - data.length) + "</p>"
                  		);
            	 
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
                                     + "' onclick='check(this.form)'>&nbsp;&nbsp;[" + i +"]<label for='box" + i
                                     + "'>&nbsp;&nbsp;</label><br><div class='div_nocheck'></td>"
                                     );
                             }else{
                              $("#seat").append(
                                     "<td><input type='checkbox' class='nochecked' name='b_seatnum' id='box" + i + "' value='" + i 
                                       + "' onclick='check(this.form)'>[" + i +"]<label for='box" + i
                                       + "'>&nbsp;&nbsp;</label><br><div class='div_nocheck'></td>"
                                       );
                             }
                   }
                            
                          if(i%3 == 0){ // 자리 띄우기
                             $("#seat").append("<tr></tr>");
                          }else if (i%3 == 2){ // 버스 통로길
                             $("#seat").append("<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
                              + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>");
                          }
                       
                    }
             }
         
          }
         
       });
    });
 
 
 /* ********************* 체크박스  ********************* */

</script>
