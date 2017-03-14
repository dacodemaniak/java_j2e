<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<nav id="main-menu" class="navbar navbar-inverse">
	<div class="container-fluid">
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#menu" aria-expanded="false">
	        <span class="sr-only">Ouvrir / Fermer</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="#">Réservations</a>
	    </div>
    
	    <div class="collapse navbar-collapse" id="menu">
			<ul class="nav navbar-nav">
				<li class="active dropdown">
					<a href="#" title="Menu Fichier" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
						Fichier <span class="caret"></span>
					</a>
				
					<!-- Sous-options du menu Fichier -->
					<ul class="dropdown-menu">
						<li>
							<a href="addSpectacle.jsp" title="Nouveau Spectacle">Nouveau spectacle</a>
						</li>
						<li>
							<a href="addReservation.jsp" title="Nouvelle réservation">Nouvelle réservation</a>
						</li>
						<li class="divider"></li>
						<li>
							<a href="logout" title="Quitter">Quitter</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</nav>