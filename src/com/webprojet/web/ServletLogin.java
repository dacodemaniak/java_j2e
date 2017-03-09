package com.webprojet.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.webprojet.web.authentification.Utilisateur;

/**
 * Servlet implementation class ServletLogin
 */
@WebServlet(description = "Service d'identification d'un utilisateur et de redirection", urlPatterns = { "/ServletLogin" })
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
		// TODO Récupérer les deux "champs" du formulaire
		String login = request.getParameter("login");
		String pass = request.getParameter("pass");
		
		if(login.length() > 0 && pass.length() > 0){
			// TODO Lancer le processus d'identification
			Utilisateur utilisateur = new Utilisateur();
			utilisateur.setLogin(login);
			utilisateur.setPassword(pass);
			if(utilisateur.process()){
				// Okay, c'est bon, on est identifié => ajout de utilisateur à la session, et redirection vers index.jsp
			} else {
				// Il y a une erreur d'authentification => on reste sur la page de login avec un petit message d'erreur
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
