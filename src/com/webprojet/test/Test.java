package com.webprojet.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Test
 */
@WebServlet(description = "Ma première Servlet", urlPatterns = { "/Test" })
public class Test extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Test() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Renvoyons une réponse un peu plus riche...
		response.setContentType("text/html"); // Equivalent Java de header("Content-type: text/html") de PHP
		
		/**
		 * Comment on récupère des paramètres transmis dans l'URL
		 * http://localhost:8080/MyResa/Test?nom=Jean-Luc
		 * La partie paramètre se situe après le ?
		 */
		String nom = request.getParameter("nom"); // C'est la même chose que d'écrire en PHP if(array_key_exists("nom", $_GET)){ $nom = $_GET["nom"];} else { $nom = null;}
		// Symfony : $nom = $request->getParameter("nom",null);
		
		PrintWriter html = response.getWriter();
		
		String page = "<!doctype html><html><head><title>Hello JSP !</title></head><body>";
		
		page += "<h1>Bienvenue dans les Servlets Java</h1>";
		
		// On peut utiliser le paramètre "nom" ici...
		if(nom != null && nom.length() > 0){
			page += "<div>Salut " + nom + " tu vas continuer à écrire du HTML à la main ?</div>";
		}
		page += "</body></html>";
		
		html.write(page); // Utilise la méthode "write" pour envoyer les informations au client...
		
		response.getWriter().append("Hello JEE, le contexte d'exécution est : ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
