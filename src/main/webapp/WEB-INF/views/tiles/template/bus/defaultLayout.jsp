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
<tiles:insertAttribute name="logo" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link href="https://fonts.googleapis.com/css?family=Gothic+A1" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body class="w3-white">

	<tiles:insertAttribute name="menu" />

	<tiles:insertAttribute name="body" />

	<!-- Footer -->
	<tiles:insertAttribute name="footer" />
	
</body>
</html>