<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Réservations</title>
	</head>
	<body>
		<% 
			if(session.getAttribute("user") == null){ // Session est la variable interne disponible en JSP%>
				<p>Pas d'utilisateur authentifié => redirige vers login.jsp</p>
				<jsp:forward page="login.jsp"></jsp:forward>
			<%} else { %>
				<p>Okay, on peut afficher le menu et le reste...</p>
			<% } %>
	</body>
</html>