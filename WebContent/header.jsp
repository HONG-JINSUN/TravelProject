<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/touryogi.css">
</head>
<body>

	<input type="button" class="navy" value="전체"
		onclick="location.href = 'FLine.jsp'">
	<input type="button" class="green" value="2호선"
		onclick="location.href = '2Line.jsp'">
	<input type="button" class="orange" value="3호선"
		onclick="location.href = '3Line.jsp'">
	<input type="button" class="skyblue" value="4호선"
		onclick="location.href = '4Line.jsp'">
	<input type="button" class="puple" value="5호선"
		onclick="location.href = '5Line.jsp'">

</body>
</html>