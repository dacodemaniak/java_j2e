package com.webprojet.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.webprojet.reservation.billetterie.Reservation;
import com.webprojet.reservation.spectacle.Spectacle;
import com.webprojet.reservation.spectateur.Personne;

/**
 * Servlet implementation class ServletAddReservation
 */
@WebServlet(description = "Service de création d'une réservation", urlPatterns = { "/ServletAddReservation" })
public class ServletAddReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletAddReservation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// TODO Récupérer le spectacle à partir de l'ID transmis par le formulaire et on crée un objet Spectacle
		Object spectacle = null;
		
		spectacle = Spectacle.get(Integer.parseInt(request.getParameter("spectacle")));
		
		// TODO Instancier un objet Personne à partir des données transmises par le formulaire
		Personne acheteur = new Personne(request.getParameter("nom"), request.getParameter("prenom"), request.getParameter("email"), request.getParameter("adresse"));
		
		// TODO Faire persister un objet Reservation en base de données
		Reservation reservation = new Reservation((Spectacle) spectacle, acheteur);
		reservation.persist();
		
		// TODO Rediriger vers... index.jsp
		response.sendRedirect("index.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
