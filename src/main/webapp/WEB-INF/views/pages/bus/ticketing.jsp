<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
</head>  
    <style>
    #want{
    position:relative;
    left:10%;
    width:80%;
    }
    body {
   font-family: Verdana, sans-serif;
}

.yap{font-size:15px;}
.yap2{font-size:25px; font-family: bold; color:17AB28; padding: 0 !important;}
#yap2 td{border:solid 1px white;}
.get{width:80%; font-size:15px;}
.do{height:15%; height:50px; font-size:15px;}

#right2{width:20px;}
#listname{text-align:center;}


.buy td{border:solid 1px #B8DAFF;}
#select td{border:solid 1px white;}  
.label_margin{margin-right:10px;}

 .main_list{
    border:1px solid black;
    overflow-y:scroll;
    font-size:15px;
    width:100%;
    height:600px;
     padding: 0 !important;
   }
   
   
   .buy{
    border: 1px solid black;
    font-size:15px;
    background-color:#B8DAFF;
    border-top:none;
    border-left:none;
    border-bottom:none;
    border-right:none;
     padding: 0 !important;
   }
   
}

    </style>
<body>
<div class="container">
   <div class="row">
   <!------------------------ 맨위 사진 ------------------------>
   <div class="col-sm-12">
         <img src="${pageContext.request.contextPath}/static/img/bus/s1.png" id="want">
   </div>
   </div>
   
    <br><br>
    
   <!------------------------ 검색 input ------------------------>
   <table class="table text-center" id="select">
    <tr class="row"> 
    <!-- ************************ 출발  ************************-->
    <!-- 공백 -->
    <td class="col-sm-2"></td>
   
    <td class="col-sm-2">
       <select name="do_name" id="do"
            class="btn btn-outline-info btn-block text-dark do" >
            <option value="0">출발</option>
            <c:forEach var="i" items="${dolist}">
               <option value="${i.DO_CODE}">${i.DO_NAME}</option>
            </c:forEach>
         </select>
     </td>
     
     <td class="col-sm-2">
         <select name="start_terminal" id="start_terminal"
            class="btn btn-outline-info btn-block text-dark do" >
            <option value="0">출발 터미널</option>
         </select>
      
     </td>
     
     <!-- ************************ 도착  ************************-->
     <td class="col-sm-2">
        <select name="do_name1" id="do1"
            class="btn btn-outline-info btn-block text-dark do" >
            <option value="0">도착</option>
            <c:forEach var="i" items="${dolist}">
               <option value="${i.DO_CODE}">${i.DO_NAME}</option>
            </c:forEach>
         </select>
      </td>
      
      <td class="col-sm-2">
          <select name="arrival_terminal" id="arrival_terminal"
            class="btn btn-outline-info btn-block text-dark do">
            <option value="0">도착 터미널</option>
         </select>
      </td>
     
     <!-- 공백 -->
     <td class="col-sm-2"></td>
     </tr>
     
     <!-- ************************ 날짜, 버튼  ************************ -->
     <tr class="row">
        <td class="col-sm-2"></td>
        <td class="col-sm-4">
           <input type="text" name="date" id="datepicker" readonly="readonly"
            placeholder="날짜" class="btn btn-outline-info btn-block text-dark do" >
        </td>
        
        <td class="col-sm-4">
           <button id="search" class="btn btn-info btn-block text-dark do">검색</button>
        </td>
        <td class="col-sm-2"></td>
     </tr>
     </table>

 <!-- ************************ 폼 and 등급  ************************ -->
 <c:url value="/bus/bus_seat" var="bus_seat"/>
 <form action="${bus_seat}" method="post">
 <hr style="position:relative;left:10%;width:80%;">
 <br><br>
 <div class="row">
 <!------------------------ 공백 div ------------------------>
 <div class="col-sm-4"></div>

<!------------------------ 출발 -> 도착 ------------------------> 
 <div  class="col-sm-4"style="border:solid 2px #17A2B8;" id="listname">
 <table class="table yap2" id="yap2">
    <tr class="row">
       <td class="col-sm-5"><b>출발</b></td>
       <td class="col-sm-2"><img src="${pageContext.request.contextPath}/static/img/bus/right (4).png" id="right2"></td>
       <td class="col-sm-5"><b>도착</b></td>    
    </tr>
 </table>
 </div>
 
<!------------------------ 공백 div ------------------------>
<div class="col-sm-4"></div>
</div>
 <br>
<br>
   <div class="row">
   
   <!------------------------ 공백 div ------------------------>
   <div class="col-sm-1"></div>
   
   <!------------------------ 버스 조회 리스트 ------------------------>
   <div class="col-sm-7 main_list" id="main_list">
      <table class = "table table-hover text-center " id ="busresult" >
         <thead id="resulthead" class="table-primary">
            <tr>
               <th>출발</th>
               <th>도착</th>
               <th>버스회사</th>
               <th>버스등급</th>
               <th>운임비용</th>
               <th>남은 좌석</th>
            </tr>
         </thead>
         <tbody id="result" style="cursor:pointer">
            <!-- 조회한 버스 목록이 나올 곳 -->                                       
         </tbody>
     </table>
      
     </div>  
      <!------------------------ 예약 테이블 ------------------------>
      <div class="col-sm-3 buy text-dark" id="buy" >
         <table class="table text-center">
            <thead id="search_day">
               <!-- 날짜가 나옴 -->
               <tr>
                  <th>검색한 날짜</th>
               </tr>
            </thead>
            <tbody id="reservation">
               <!-- 클릭한 버스정보 나올 곳 -->
               <tr>
                  <td>예약하실 버스를 선택해주세요.</td>
               </tr>               
            </tbody>
         </table>
      </div>
      
      <!------------------------ 공백 div ------------------------>
      <div class="col-sm-1"></div>
      </div>
      </form> 
       </div>
 <script>
 
//포맷 함수
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
              
    /*************************** 출발 ajax ***************************/
    $("#do").bind(
          "change",
          function() {
             $("#start_terminal").empty();
             $.ajax({
                url : "${pageContext.request.contextPath}/api_ajax",
                type : "post",
                data : {
                   "do_name" : this.value
                },
                success : function(data) {
                   // 시도를 선택 안할 시 막기  
                   var dovalue = $("#do").val();
                   if (dovalue == 0) {
                      $("#start_terminal").append(
                            "<option value='0'>시/도를 다시 선택해주세요</option>")
                   }

                   for (var i = 0; i < data.length; i++) {
                      $("#start_terminal").append(
                            "<option value="+ data[i].T_ID +">"
                                  + data[i].T_NAME + "</option>")
                   }
                },
                error : function(jqXHR, textStatus, errorThrown, error) {
                   alert("에러 발생~~ \n" + textStatus + " : " + errorThrown
                         + error);
                }
             })
          });
    /*************************** 도착 ajax ***************************/
    $("#do1").bind(
          "change",
          function() {
             $("#arrival_terminal").empty();
             $.ajax({
                url : "${pageContext.request.contextPath}/api_ajax",
                type : "post",
                data : {
                   "do_name" : this.value
                },
                success : function(data) {
                   // 시도를 선택 안할 시 막기 
                   var dovalue = $("#do1").val();
                   if (dovalue == 0) {
                      $("#arrival_terminal").append(
                            "<option value='0'>시/도를 다시 선택해주세요</option>")
                   }

                   for (var i = 0; i < data.length; i++) {
                      $("#arrival_terminal").append(
                            "<option value="+ data[i].T_ID +">"
                                  + data[i].T_NAME + "</option>")
                   }
                },
                error : function(jqXHR, textStatus, errorThrown, error) {
                   alert("에러 발생~~ \n" + textStatus + " : " + errorThrown
                         + error);
                }
             })
          });
    /*************************** api ajax ***************************/
    $("#search").bind(
            "click",
            function() {
               $("#main_list").show();
               // 아무선택이 없을 경우
               if ($("#do").val() == "0") {
                  alert("출발 터미널을 설정해주세요.");
                  return;
               }else if($("#do1").val() == "0"){
                  alert("도착 터미널을 설정해주세요.");
                  return;
               }else if($("#start_terminal").val() == $("#arrival_terminal").val()){
                  alert("그럴거면 걸어서 가세요.");
                  return;
               }
               $("#listname").empty();    // 출발 -> 도착 div
               $("#result").empty();      // 검색한 버스 목록
               $("#reservation").empty(); // 예약하기 div
               $("#search_day").empty();  // 검색 일시 지우기
               $.ajax({
                  url : "${pageContext.request.contextPath}/api_search",
                  type : "get",
                  data : {
                     "date" : $("#datepicker").val(),
                     "start_terminal" : $("#start_terminal").val(),
                     "arrival_terminal" : $("#arrival_terminal").val(),
                  },
                   
                  success : function(data) {
                     
                     /* 출발 터미널 -> 도착 터미널 */
                      if(data[0] == null){
                         alert("조회된 버스가 없습니다.");
                         $("#listname").append(
                               "<h1>출발<img src='${pageContext.request.contextPath}/static/img/bus/right (4).png' id='right2'>도착</h1>"       
                         );
                         return;
                      }else{
                         $("#listname").append(
                              "<table class='table yap2' id='yap2'><tr class='row'><td class='col-sm-5'><b>"
                               +"<input type='text' name='dep_ter' class='btn btn-block text-center yap2' value='" + data[0].DEP_TER + "' readonly='readonly'></b></td>" 
                               + "<td class='col-sm-2'><img src='${pageContext.request.contextPath}/static/img/bus/right (4).png' id='right2'></td>"
                               + "<td class='col-sm-5'><input type='text' name='arr_ter' class='btn btn-block text-center yap2' value='" + data[0].ARR_TER + "' readonly='readonly'></b></td></tr></table>"
                               );
                         
                         // 검색한 날짜
                         if(todayYMD == data[0].SCHE_DAY){
                            $("#search_day").append(
                                  "<tr>"
                                    + "<th>검색 일</th>"
                                    + "<th>"
                                    + (String(data[0].SCHE_DAY).substring(4, 8)).substring(0, 2) + "월" 
                                    + (String(data[0].SCHE_DAY).substring(4, 8)).substring(2, 4) + "일 (오늘)"
                                    + " </th></tr>"
                            );
                         }else if (Number(todayYMD) + 1 == data[0].SCHE_DAY){
                            $("#search_day").append(
                                "<tr>"
                                + "<th>검색 일</th>"
                                + "<th>"
                                + (String(data[0].SCHE_DAY).substring(4, 8)).substring(0, 2) + "월" 
                                + (String(data[0].SCHE_DAY).substring(4, 8)).substring(2, 4) + "일 (내일)"
                                + " </th></tr>"
                                );
                         }else{
                            $("#search_day").append(
                                  "<tr>"
                                    + "<th>검색 일</th>"
                                    + "<th>"
                                    + (String(data[0].SCHE_DAY).substring(4, 8)).substring(0, 2) + "월" 
                                    + (String(data[0].SCHE_DAY).substring(4, 8)).substring(2, 4) + "일"
                                    + " </th></tr>"
                                 );
                         }
                     }
                     
                           
                     // 컴퓨터로 받아온 날짜와 검색 날짜가 같을 경우         
                     if(todayYMD == data[0].SCHE_DAY){
                        for (var i = 0; i < data.length; i++) {

                            // 자르기 
                            var start;           // 시간 자르기
                            var start_hour;      // 시만 자르기
                            var start_minute;    // 분만 자르기
                           
                            var arrival;
                            var arrival_hour;
                            var arrival_minute;  
                                                
                           // 출발 시간 
                           start = "1" + data[i].DEP_TIME; // 오전일 경우 앞자리인 0 이 지워져서 1을 더함
                           start_hour = start.substring(1,3) + "시 ";
                           start_minute = start.substring(3,5) + "분"
                                                
                            // 도착 시간
                            arrival = data[i].ARR_TIME;
                            arrival_hour = arrival.substring(0,2) + "시 ";
                            arrival_minute = arrival.substring(2,4) + "분"
                     
                            Number(todayHM)
                           // 컴퓨터에 시간을 받아와 시간이 지난 것들이 안나오게 하기
                           if(Number(todayHM) < Number(start)){
                              $("#result").append(
                                  "<tr><td style='display:none;'>" + data[i].SCHE_CODE + "</td>"
                                     + "<td>" + start_hour + start_minute 
                                     + "</td><td>"    + arrival_hour + arrival_minute
                                     + "</td><td>"    + data[i].BUS_CODE
                                     + "</td><td>"    + data[i].GRADE      
                                     + "</td><td>"    + data[i].SCHE_CHARGE
                                     + " 원</td><td>" + data[i].BUS_SEATNAM
                                     + " 석</td></tr>");
                           }
                        }
                        // 날짜가 오늘 날짜가 아닌 경우
                         }else{
                            for (var i = 0; i < data.length; i++) {
                               $("#result").append(
                                  "<tr><td style='display:none;'>" + data[i].SCHE_CODE + "</td>"
                                      + "<td>" + data[i].DEP_TIME.substring(0,2) + "시 " + data[i].DEP_TIME.substring(2,4) + "분" 
                                     + "</td><td>"    + data[i].ARR_TIME.substring(0,2) + "시 " + data[i].ARR_TIME.substring(2,4) + "분"
                                     + "</td><td>"    + data[i].BUS_CODE
                                     + "</td><td>"    + data[i].GRADE      
                                     + "</td><td>"    + data[i].SCHE_CHARGE
                                     + " 원</td><td>" + data[i].BUS_SEATNAM
                                     + " 석</td></tr>");
                            }
                         }
                     
                     /* 버스 선택시 값 가져오기 */
                      $("#result tr").click(function(){
                          $("#reservation").empty();
                   
                          var tr =$(this);               //선택한 tr 값을 this로 가져옴
                          var td = tr.children();        //tr.children() == td를 의미
                         
                          var bus_seq = td.eq(0).text();   //.eq(인덱스 번호)
                          var dep = td.eq(1).text();
                          var arr = td.eq(2).text();
                          var bus = td.eq(3).text();
                          var grade = td.eq(4).text();
                          var charge = td.eq(5).text();
                          var seat_nam = td.eq(6).text();
                          
                          $("#reservation").append(
                             "<tr>"
                             + "<td><label class='label_margin text-center'>출발</label></td>"
                             + "<td><input type='text' id='dep' size='10px' class='btn text-center yap' name='dep' value='"+ dep +"' readonly='readonly'></td>"
                             + "</tr><tr>"
                             + "<td><input type='hidden' name='bus_seq' value='"+ bus_seq +"'></td>"
                             + "<td class='text-center'> ↓ </td>"
                             + "</tr><tr>"
                             + "<td><label class='label_margin text-center'>도착</label></td>"
                             + "<td><input type='text'  size='10px' class='btn text-center  yap' name='arr' value='"+ arr +"' readonly='readonly'></td>"
                             + "</tr><tr>"
                             + "<td></td>"
                             + "<td><input type='text' size='10px' class='btn text-center  yap' name='bus' value='"+ bus +"' readonly='readonly'></td>"
                             + "</tr><tr>"
                             + "<td></td>"
                             + "<td><input type='text' size='10px' class='btn text-center  yap' name='grade' value='"+ grade +"' readonly='readonly'></td>"
                             + "</tr><tr>"
                             + "<td><label class='label_margin text-center'>운임 비용</label></td>"
                             + "<td><input type='text' size='10px' class='btn text-center yap' name='charge' value='"+ charge +"' readonly='readonly'></td>"
                             + "</tr><tr><td><br></td></tr><tr>"
                             + "<td colspan='2'>"
                             + "<input type='hidden' name='id' value='${LoginUser}'>"
                             + "<input type='submit' id='submit' value='예매하기' class='btn btn-info btn-block text-center get'>"
                             + "</td>"
                             + "</tr>"
                         );     
                          
                          // 좌석이 없을 경우 예약하기 막기
                          if(seat_nam == '0 석'){
                             $(function(){
                                $("#submit").attr("disabled", "disabled");
                             });
                          }
                          
                       });
                  }
               })
            });
    
 /*************************** 달력 ajax ***************************/
   $(function() {
      $("#datepicker").datepicker(
            {
               dateFormat : 'yymmdd', //Input Display Format 변경

               showOtherMonths : true, //빈 공간에 현재월의 앞뒤월의 날짜를 표시

               showMonthAfterYear : true, //년도 먼저 나오고, 뒤에 월 표시

               changeYear : true, //콤보박스에서 년 선택 가능

               changeMonth : true, //콤보박스에서 월 선택 가능

               yearSuffix : "년",//달력의 년도 부분 뒤에 붙는 텍스트

               monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8',
                     '9', '10', '11', '12' ], //달력의 월 부분 텍스트

               monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
                     '8월', '9월', '10월', '11월', '12월' ], //달력의 월 부분 Tooltip 텍스트

               dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ], //달력의 요일 부분 텍스트

               dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일',
                     '토요일' ],
               minDate : "y"
            });
   });
</script>