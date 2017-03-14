<%@ page import="com.webprojet.reservation.spectacle.Spectacle"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%


if(session.getAttribute("user") == null){%>
	<jsp:forward page="login.jsp"></jsp:forward>
<%}%>

<jsp:useBean id="dateDuJour" class="com.webprojet.web.goodies.DateDuJour"></jsp:useBean>
<jsp:useBean id="spectacles" class="com.webprojet.reservation.spectacle.Spectacles"></jsp:useBean>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Réservation - Ajouter un spectacle</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	</head>
	<body>
		<div id="page" class="container">
			<div id="sup-header" class="row">
				<div class="col-lg-2 col-md-2 col-sm-6 col-xs-6">
					<%=dateDuJour.getDate() %>
				</div>
				<div class="col-lg-10 col-md-10 col-sm-6 col-xs-6">
					<jsp:useBean id="user" beanName="utilisateur" scope="session" type="com.webprojet.web.authentification.Utilisateur"></jsp:useBean>
					<p>Bonjour <%=user.getNom() %></p>
				</div>
			</div>				
			<!-- Inclure le menu stocké dans une vue JSP -->
			<jsp:include page="menu.jsp"></jsp:include>
			
			<!-- On peut intégrer le formulaire pour la création d'un nouveau spectacle -->
			<form name="addReservation" id="addReservation" method="post" action="addReservation">

				<div class="form-group">
					<label for="spectacle">Spectacle : </label>
					<select name="spectacle" id="spectacle" size="1" class="form-control">
						<%
							for(Spectacle spectacle : spectacles.spectacles()){%>
								<option value="<%= spectacle.id() %>"><%= spectacle.titre() + " [" + spectacle.placesDisponibles() + "]" %></option>
							<%} %>
					</select>
				</div>
				
				<div class="form-group">
					<label for="nom">Nom : </label>
					<input type="text" name="nom" id="nom" class="form-control" placeholder="Nom de l'acheteur">
				</div>

				<div class="form-group">
					<label for="prenom">Préom : </label>
					<input type="text" name="prenom" id="prenom" class="form-control" placeholder="Prénom">
				</div>				

				<div class="form-group">
					<label for="email">e-mail : </label>
					<input type="email" name="email" id="email" class="form-control" placeholder="e-mail (...@...)">
				</div>
				
				<div class="form-control">
					<label for="adresse">Adresse : </label>
					<textarea name="adresse" id="adresse" class="form-control"></textarea>
				</div>
				
				<div class="form-group">
					<button type="submit" name="add" id="add" class="btn btn-success">Ajouter</button>
				</div>							
			</form>
		</div>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>		
</body>
</html>