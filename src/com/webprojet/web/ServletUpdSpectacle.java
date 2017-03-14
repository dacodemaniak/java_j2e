package com.webprojet.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.webprojet.reservation.spectacle.Opera;
import com.webprojet.reservation.spectacle.Spectacle;
import com.webprojet.reservation.spectacle.Theatre;

/**
 * Servlet implementation class ServletUpdSpectacle
 */
@WebServlet(description = "Service de mise à jour d'un spectacle", urlPatterns = { "/ServletUpdSpectacle" })
public class ServletUpdSpectacle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletUpdSpectacle() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Instancier un nouvel objet de spectacle
		Object spectacle = null;
		
		// TODO Définir le spectacle à partir des données saisies dans le formulaire
		request.setCharacterEncoding("utf-8");
		
		System.out.println("Type : " + request.getParameter("type"));
		
		if(request.getParameter("type").equals("Opéra")){
			spectacle = new Opera();
		} else {
			spectacle = new Theatre();
		}
		
		// On définit la valeur de l'attribut "id" de Spectacle avec la valeur du champ caché "primaryKey" du formulaire d'origine
		((Spectacle) spectacle).id(Integer.parseInt(request.getParameter("primaryKey")));
		((Spectacle) spectacle).titre(request.getParameter("titre"));
		((Spectacle) spectacle).description(request.getParameter("formDescription"));
		((Spectacle) spectacle).placesDisponibles(Integer.parseInt(request.getParameter("places")));
		
		// Maintenant, faisons persister l'objet spectacle...
		((Spectacle) spectacle).persist();
		
		// TODO Rediriger vers la page index.jsp pour réafficher la liste complète
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
