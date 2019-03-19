<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html lang="kor">
<head>
<!-- Theme Made By www.w3schools.com - No Copyright -->
<title><tiles:insertAttribute name="title" /></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/static/img/id.png">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link href="https://fonts.googleapis.com/css?family=Gothic+A1" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/hellojs/2.0.0-4/hello.all.js"></script>
<script>
function logout(){
	if(${g_user == null}){
		$.ajax({
			url : "${pageContext.request.contextPath}/logout",
	        type: "get",
	        success:function(data){     	
	    			alert("로그아웃 되셨습니다.");
	    			window.alert("로그아웃 되셨습니다");
	    			window.location.href="${pageContext.request.contextPath}/home";			
	    	}	
		});			
	}else{		
		$.ajax({
			url : "${pageContext.request.contextPath}/logout",
		    type: "get",
		    success:function(data){		        			        	
		     	hello('google').logout({force:true}).then(
		     		function() {		    		
		    		window.alert("로그아웃 되셨습니다");
		    		window.location.href="${pageContext.request.contextPath}/home";
		    	});
			},
			function(e) {
				console.log('구글 로그아웃 에러: ' + e.error.message);
		    }
		});		
	}		
}
</script>
</head>
<body>
	<tiles:insertAttribute name="header" />

	<tiles:insertAttribute name="menu" />

	<tiles:insertAttribute name="body" />


	<!-- Footer -->
	<footer class="container-fluid bg-4 text-center">
		<tiles:insertAttribute name="footer" />
	</footer>
</body>
</html>