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

<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
		
		<!-- Styles personnels -->
		<link href="_assets/css/styles.css" rel="stylesheet" />
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
				
				<!-- Inclusion de la barre d'actions groupées -->
				<div class="toolbar">
					<button type="button" disabled name="delete" id="delete" class="pull-right btn-delete btn btn-danger"><i class="glyphicon glyphicon-trash"></i></button>
				</div>
				
				<!--  Ici, on peut lister les spectacles à partir d'un bean -->
				<table class="table">
					<thead>
						<tr>
							<th class="toggle-sel">Sél.</th>
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
								<td><input type="checkbox" class="selection" name="id_<%= spectacle.id() %>" <%= spectacle.deleteAutorise("toDisabled") %> data-id="<%= spectacle.id() %>"></td>
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
											<li><a href="#" title="Supprimer <%=spectacle.titre() %>" <%= spectacle.deleteAutorise() %> data-title="<%= spectacle.titre()%>"><i class="glyphicon glyphicon-trash"></i> Supprimer</a></li>
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
		<!-- Boîte de dialogue permettant de confirmer la suppression -->
		<div id="dialog-confirm" title="Suppression d'un spectacle" aria-hidden="true">
		  <p><span class="ui-icon ui-icon-alert" style="float:left; margin:12px 12px 20px 0;"></span>Etes-vous sûr de vouloir supprimer le spectacle :<br><strong class="holder"></strong></p>
		</div>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
		
		<!-- Script pour la gestion de la suppression -->
		<script charset="utf-8">
			$("a.enabled").on("click",function(){
				// Récupérons l'id du spectacle concerné
				var idSpectacle = $(this).data("id");
				var titreSpectacle = $(this).data("title");
				console.log("L'utilisateur veut supprimer le spectacle n° : " + idSpectacle);
				// Juste avant d'ouvrir la boîte de dialogue... on modifie le contenu de la balise <strong class="holder"></strong> avec le titre récupéré...
				$("#dialog-confirm strong.holder").html("").html(titreSpectacle);
				// Ouvrir la boîte de dialogue....
				$("#dialog-confirm").dialog(
					{
						resizable: false,
						height: "auto",
						width: 500,
						modal: true,
						// Boutons de la boîte de dialogue...
						buttons: {
							"Oui": function (){
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
										// On doit aussi effacer la ligne du tableau
										$("[data-id=\"" + result.id + "\"]").parents("tr").remove();
									}
									
								});
								$("#dialog-confirm").dialog("close");	
							},
							"Non": function(){
								$("#dialog-confirm").dialog("close");
							}
						}
					}
				);
			});
			
			// Gestionnaire sélection / déselction
			$(".toggle-sel").on("click", function(){
				var disableDeleteBtn = false; // Me permet d'agir sur le bouton d'action groupée
				$(".selection").each(function(){
					// On teste si la boîte est active ou non
					if(!$(this).attr("disabled")){
						// La boîte est-elle cochée ?
						if($(this).is(":checked")){
							// Donc, on décoche...
							//$(this).removeProp("checked");
							$(this).removeAttr("checked");
							disableDeleteBtn = true;
							
						} else {
							//$(this).prop("checked","checked");
							$(this).attr("checked","checked");
						}
					}
				});
				if(disableDeleteBtn){
					$(".btn-delete").attr("disabled","disabled");
				} else {
					$(".btn-delete").removeAttr("disabled");
				}
			});
			
			// Gestionnaire d'événement sur les boîtes à cocher
			$(".selection").on("change",function(){
				console.log("Détection d'un changement");
				// On détecte un changement de boîte à cocher, je dois parcourir toutes les boîtes à cocher... si aucune n'est cochée, je désactive, sinon, j'active
				var isBtnEnabled = false; // Par défaut on considère que le bouton de sélection est désactivé
				$(".selection").each(function(){
					if($(this).is(":checked")){
						// Au moins une est cochée... on sort...
						isBtnEnabled = true;
						console.log("Au moins une boîte est cochée");
					}
				});
				if(isBtnEnabled){
					console.log("Activer le bouton");
					$(".btn-delete").removeAttr("disabled");
				} else {
					console.log("Désactiver le bouton");
					$(".btn-delete").attr("disabled","disabled");
				}
			});
			
			// Gestionnaire d'événement sur le bouton btn-delete
			$(".btn-delete").on("click",function(){
				var ids = new String;
				// Lister les id des spectacles à supprimer
				$(".selection").each(function(){
					if($(this).is(":checked")){
						ids += $(this).data("id") + ","; // 1,5,7,
					}
				});
				// Ce serait bien de supprimer le dernier caractère de "ids"
				ids = ids.substring(0,(ids.length) - 1);
				
				// Maintenant, on peut déclencher l'appel Ajax...
				$.ajax(
					{
						url: "getSpectacle",
						dataType: "json",
						data: "ids=" + ids,
						success: function(result){
							var ids = result.ids.split(","); // ids est un tableau
							for(var i = 0; i < ids.length; i++){
								// Remove sur les lignes correspondantes...
								$("[data-id=\"" + ids[i] + "\"]").parents("tr").remove();
							}
						},
						error: function(){
							console.log("Problème de traitement de la demande !");
						}
					}
				);
				
			})
		</script>	
	</body>
</html>