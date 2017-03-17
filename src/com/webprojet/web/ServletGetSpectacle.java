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
		
		// On commence par tenter de récupérer le paramètre ids
		String ids = request.getParameter("ids");
		if(ids == null){
			// Cela signifie que c'est le paramètre id qui a été passé
			// Récupère l'id transmis par l'appel Ajax
			int id = Integer.parseInt(request.getParameter("id"));
		
		
			Object spectacle = null;
			// Récupère le spectacle dont l'identifiant vaut "id"
			spectacle = Spectacle.get(id);
		
			// TODO : faire vraiment la suppression...
			((Spectacle) spectacle).delete();
		
			jsonResult = "{\"titre\":\"" + ((Spectacle) spectacle).titre() + "\",\"status\":\"1\",\"id\":\"" + id + "\"}";
		} else {
			// On doit parser la chaîne ids pour récupérer un tableau...
			String[] datas = ids.split(","); // <=> explode(",",$ids)
			Object spectacleASupprimer = null;
			
			for(int indice = 0; indice < datas.length; indice++){
				spectacleASupprimer = Spectacle.get(Integer.parseInt(datas[indice]));
				((Spectacle) spectacleASupprimer).delete();
			}
			// On construit un objet JSON pour retourner le résultat
			jsonResult = "{\"nb\":\"" + datas.length + "\",\"status\":\"1\",\"ids\":\"" + ids + "\"}";
		}
		// On retourne une réponse au format json en utilisant l'objet PrintWriter
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
