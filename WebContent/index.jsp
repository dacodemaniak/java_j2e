<%@page import="com.webprojet.reservation.spectacle.Spectacle"%>
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
					<jsp:useBean id="user" beanName="utilisateur" scope="session" type="com.webprojet.web.authentification.Utilisateur"></jsp:useBean>
					<p>Bonjour <%=user.getNom() %></p>
				</div>
				
				<!-- Inclure le menu stocké dans une vue JSP -->
				<jsp:include page="menu.jsp"></jsp:include>		
				
				<!--  Ici, on peut lister les spectacles à partir d'un bean -->
				<table class="table">
					<thead>
						<tr>
							<th>Nom</th>
							<th>Description</th>
							<th>Nb. Places</th>
							<th>Actions</th>
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
								<td>
									<div class="btn-group">
										<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										Action <span class="caret"></span>
										</button>
										<!--  La liste des options possibles -->
										<ul class="dropdown-menu">
											<li><a href="updSpectacle.jsp?id=<%= spectacle.id() %>" title="Mettre à jour <%=spectacle.titre() %>"><i class="glyphicon glyphicon-pencil"></i> Mettre à jour</a></li>
											<li><a href="#" title="Supprimer <%=spectacle.titre() %>" <%= spectacle.deleteAutorise() %>><i class="glyphicon glyphicon-trash"></i> Supprimer</a></li>
										</ul>
									</div>
								</td>
							</tr>
					<%} // Fin de la boucle "for"
					// Fin de la structure d'affichage des lignes %>
					</tbody>
				</table>
			</div>
		</div>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
		
		<!-- Script pour la gestion de la suppression -->
		<script charset="utf-8">
			$("a.enabled").on("click",function(){
				// Récupérons l'id du spectacle concerné
				var idSpectacle = $(this).data("id");
				console.log("L'utilisateur veut supprimer le spectacle n° : " + idSpectacle);
				// Déclencher un appel Ajax pour la suppression
				$.ajax({
					url: "getSpectacle",
					dataType: "json",
					method: "post",
					data: "id=" + idSpectacle,
					contentType: "application/x-www-form-urlencoded; charset=utf-8",
					success: function(result){
						// Do what u want with result
						console.log("vous avez demandé la suppression de : " + result.titre);
					}
					
				});
			})
		</script>	
	</body>
</html>