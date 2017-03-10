<%@page import="com.webprojet.reservation.spectacle.Spectacle"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="dateDuJour" class="com.webprojet.web.goodies.DateDuJour"></jsp:useBean>
<jsp:useBean id="spectacles" class="com.webprojet.reservation.spectacle.Spectacles"></jsp:useBean>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Réservations</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	</head>
	<body>
		<div id="page" class="container">
			<div id="sup-header" class="row">
				<div class="col-lg-2 col-md-2 col-sm-6 col-xs-6">
					<%=dateDuJour.getDate() %>
				</div>
				<div class="col-lg-10 col-md-10 col-sm-6 col-xs-6">
					<% 
					if(session.getAttribute("user") == null){ // Session est la variable interne disponible en JSP%>
						<p>Pas d'utilisateur authentifié => redirige vers login.jsp</p>
						<jsp:forward page="login.jsp"></jsp:forward>
					<%} else { %>
						<jsp:useBean id="user" beanName="utilisateur" scope="session" type="com.webprojet.web.authentification.Utilisateur"></jsp:useBean>
						<p>Bonjour <%=user.getNom() %></p>
						</div>
						
						<!--  Ici, on peut lister les spectacles à partir d'un bean -->
						<table class="table">
							<thead>
								<tr>
									<th>Nom</th>
									<th>Description</th>
									<th>Nb. Places</th>
								</tr>
							</thead>
							<tbody>
						<% //Début de la structure d'affichage des lignes
							for(Spectacle spectacle : spectacles.spectacles()){
								%>
								<tr>
									<td><%= spectacle.titre() %></td>
									<td><%= spectacle.description() %></td>
									<td><%= spectacle.placesDisponibles() %></td>
								</tr>
							<%} // Fin de la boucle "for"
						// Fin de la structure d'affichage des lignes %>
						</tbody>
						</table>
					<% } %>
				
			</div>
		</div>
	</body>
</html>