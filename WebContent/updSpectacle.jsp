<%@ page import="com.webprojet.reservation.spectacle.Spectacle, com.webprojet.reservation.spectacle.Opera, com.webprojet.reservation.spectacle.Theatre"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
if(session.getAttribute("user") == null){%>
	<jsp:forward page="login.jsp"></jsp:forward>
<%} %>

<%
// Instanciation de l'objet Spectacle dont on a besoin
Object spectacle = null;
spectacle = Spectacle.get(Integer.parseInt(request.getParameter("id")));
String type = null;
// Pour pouvoir déterminer la ligne sélectionnée du composant select du formulaire
if(spectacle instanceof Opera){
	type = "Opéra";
} else {
	type = "Théâtre";
}
%>

<jsp:useBean id="dateDuJour" class="com.webprojet.web.goodies.DateDuJour"></jsp:useBean>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Réservation - Modifier <%= ((Spectacle) spectacle).titre() %></title>
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
			<form name="updSpectacle" id="updSpectacle" method="post" action="updSpectacle">
				<div class="form-group">
					<label for="type">Type : </label>
					<select name="type" id="type" size="1" class="form-control">
						<%
							for(int indice=0; indice < Spectacle.TYPES.length; indice++){
								if(Spectacle.TYPES[indice].equals(type)){%>
									<option value="<%= Spectacle.TYPES[indice]%>" selected><%= Spectacle.TYPES[indice]%></option>
								<%} else { %>
									<option value="<%= Spectacle.TYPES[indice]%>"><%= Spectacle.TYPES[indice]%></option>
								<%} %>
							<%} %>
					</select>
				</div>
				
				<div class="form-group">
					<label for="titre">Titre : </label>
					<input type="text" name="titre" id="titre" class="form-control" value="<%= ((Spectacle) spectacle).titre()%>">
				</div>
				
				<div class="form-group">
					<label for="description">
						Description :
					</label>
					<textarea name="formDescription" id="description" class="form-control"><%= ((Spectacle) spectacle).description() %></textarea>
				</div>
				
				<div class="form-group">
					<label for="places">Places : </label>
					<input type="number" name="places" id="places" class="form-control" value="<%= ((Spectacle) spectacle).placesDisponibles()%>">
				</div>
				
				<!-- Bouton de validation -->
				<div class="form-group">
					<button id="add" name="add" type="submit">Ajouter</button>
				</div>
				<!-- On n'oublie pas d'ajouter un champ "caché" avec la valeur de la clé primaire de la ligne correspondante de la table spectacle -->
				<input type="hidden" name="primaryKey" id="primaryKey" value="<%= ((Spectacle) spectacle).id() %>">				
			</form>
		</div>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>			
	</body>
</html>