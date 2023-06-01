<%@page import="com.learn.mycart.entities.User"%>
<%
	User user=(User) session.getAttribute("current.user");
	if(user==null){
		session.setAttribute("message", "You are not logged in !! login first");
		response.sendRedirect("login.jsp");
		return;
	}else{
		if(user.getUserType().equals("admin")){
			session.setAttribute("message","You are not normal uset ! Do not access this page");
			response.sendRedirect("login.jsp");
			return;
		}
	}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>This is normal user</title>
</head>
<body>
	<h3>This is normal user</h3>
</body>
</html>