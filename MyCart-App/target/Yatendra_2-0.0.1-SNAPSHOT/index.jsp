<%@page import="com.learn.mycart.helper.FactoryProviderr"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="common_css_js.jsp" %>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<h1>Creating session factory object</h1>
	<%
	out.println("hello.........");
	out.println(FactoryProviderr.getFactory() + "<br>");
	out.println(FactoryProviderr.getFactory() + "<br>");
	out.println(FactoryProviderr.getFactory());
	out.println("bye..........");
	%>
</body>
</html>