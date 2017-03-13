<%@ page import="com.webprojet.reservation.spectacle.Spectacle"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%


if(session.getAttribute("user") == null){%>
	<jsp:forward page="login.jsp"></jsp:forward>
<%}%>

<jsp:useBean id="dateDuJour" class="com.webprojet.web.goodies.DateDuJour"></jsp:useBean>

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
			<form name="addSpectacle" id="addSpectacle" method="post" action="addSpectacle">
				<div class="form-group">
					<label for="type">Type : </label>
					<select name="type" id="type" size="1" class="form-control">
						<%
							for(int indice=0; indice < Spectacle.TYPES.length; indice++){%>
								<option value="<%= Spectacle.TYPES[indice]%>"><%= Spectacle.TYPES[indice]%></option>
							<%} %>
					</select>
				</div>
				
				<div class="form-group">
					<label for="titre">Titre : </label>
					<input type="text" name="titre" id="titre" class="form-control" value="">
				</div>
				
				<div class="form-group">
					<label for="description">
						Description :
					</label>
					<textarea name="formDescription" id="description" class="form-control"></textarea>
				</div>
				
				<div class="form-group">
					<label for="places">Places : </label>
					<input type="number" name="places" id="places" class="form-control" value="1">
				</div>
				
				<!-- Bouton de validation -->
				<div class="form-group">
					<button id="add" name="add" type="submit">Ajouter</button>
				</div>				
			</form>
		</div>	
	</body>
</html>