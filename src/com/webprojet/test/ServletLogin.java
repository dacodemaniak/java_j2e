package com.webprojet.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServletLogin
 */
@WebServlet(description = "Processus d'identification sur mon application", urlPatterns = { "/ServletLogin" })
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter html = response.getWriter();
		
		String page = "<!doctype html><html><head><title>Hello JSP !</title></head><body>";
		
		String identifiant = request.getParameter("identifiant");
		String password = request.getParameter("password");
		
		page += "<h1>Bienvenue</h1>";
		
		// On peut utiliser le paramètre "nom" ici...
		if(identifiant != null && identifiant.length() > 0){
			page += "<div><a href=\"#\" title=\"Déconnexion\" role=\"button\" class=\"btn btn-warning\">" + identifiant + "</a></div>";
		}
		page += "</body></html>";
		
		html.write(page); // Envoyer la page vers le Client
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
