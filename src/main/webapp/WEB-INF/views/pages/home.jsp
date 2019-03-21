<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
body, h1,h2,h3,h4,h5,h6 {font-family: "Montserrat", sans-serif}
.w3-row-padding img {margin-bottom: 12px}
.w3-sidebar {width: 120px;background: #222;}
#main {margin-left: 120px}
@media only screen and (max-width: 600px) {#main {margin-left: 0}}
#main{position:fixed; left:15%; top:20%; width:70%;}
#menu1{position:fixed; left:75%; top:10%; width:8%; height:6%;}
#menu2{position:fixed; left:85%; top:10%; width:8%; height:6%;}
#menu3{position:fixed; left:85%; top:10.7%; width:12%; height:4.5%;}
</style>

<body class="w3-black">
   <div class="container-fluid bg-1 text-center">
      <!-- First Container -->
      <div class="w3-padding-large" id="main">
         <!-- 메인-->
         <div style="margin-left: 500px; margin-top: 20px;">
            <c:choose>
               <c:when test="${empty LoginUser}">
               <c:url value="/member_join" var="member_join" />
               <img src="${pageContext.request.contextPath}/static/img/wjoin.png"
                  id="menu1" onclick="location.href='${member_join}'" />
   
               <c:url value="/login" var="login" />
               <img src="${pageContext.request.contextPath}/static/img/wlogin.png"
                  id="menu2" onclick="location.href='${login}'" />
               </c:when>
               <c:when test="${'admin' eq LoginUser}">               
               <img src="${pageContext.request.contextPath}/static/img/wlogout.png"
                  id="menu1" onclick="logout()" />
                  
               <c:url value="/member_list" var="member_list" />
               <img src="${pageContext.request.contextPath}/static/img/mlist.png"
                 id="menu3" onclick="location.href='${member_list}'" />
               </c:when>
               <c:otherwise>
               <img src="${pageContext.request.contextPath}/static/img/wlogout.png"
                  id="menu2" onclick="logout()" />
               </c:otherwise>
            </c:choose>
         </div>
         <header class="w3-container w3-padding-32 w3-center w3-black" id="home">
            <img src="${pageContext.request.contextPath}/static/img/mainlg.png"
               id="main">
         </header>
      </div>
   </div>
</body>
