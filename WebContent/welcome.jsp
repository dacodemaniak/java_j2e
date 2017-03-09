<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.Date" %>

<% 
String nom = request.getParameter("nom");
Date today = new Date();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Welcome to JSP !</title>
	</head>
	<body>
		<p>Aujourd'hui, nous sommes le <%= today.toString() %></p>
		<% if(nom != null && nom.length() > 0) { %>
			<h1>Bonjour, <%= nom %>, bienvenue dans JSP</h1>
		<% } else { %>
			<blockquote>Pour vous dire bonjour, utilisez : welcome.jsp?nom=XXX</blockquote>
		<% } %>
	</body>
</html>