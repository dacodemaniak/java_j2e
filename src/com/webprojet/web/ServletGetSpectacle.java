package com.webprojet.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.webprojet.reservation.spectacle.Spectacle;

/**
 * Servlet implementation class ServletGetSpectacle
 */
@WebServlet(description = "Service de récupération d'un spectacle en Ajax", urlPatterns = { "/ServletGetSpectacle" })
public class ServletGetSpectacle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletGetSpectacle() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String jsonResult = null;
		
		// Récupère l'id transmis par l'appel Ajax
		int id = Integer.parseInt(request.getParameter("id"));
		
		Object spectacle = null;
		// Récupère le spectacle dont l'identifiant vaut "id"
		spectacle = Spectacle.get(id);
		
		jsonResult = "{\"titre\":\"" + ((Spectacle) spectacle).titre() + "\",\"status\":\"1\"}";
		
		// On retourne le tout directement
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(jsonResult);
		out.flush();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
