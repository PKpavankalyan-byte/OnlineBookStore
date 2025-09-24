<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
	String name ="";
	%>
	
	<%
	
	name = session.getAttribute("name_key").toString();
	%>
	<h2 style='color:peach'>Welcome <%= name %> !</h2>
	
	<a href='logout'>Logout</a>
</body>
</html>