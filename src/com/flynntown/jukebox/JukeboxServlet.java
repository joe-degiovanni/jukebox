package com.flynntown.jukebox;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JukeboxServlet
 */
@WebServlet("/jukebox")
public class JukeboxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response = welcomePage(response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		welcomePage(response);
	}
	
	private HttpServletResponse welcomePage(HttpServletResponse response) throws IOException{
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Flynntown YouTube Jukebox</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Welcome to the Flynntown YouTube Jukebox!</h1>");
        out.println("<iframe width='560' height='315' src='http://www.youtube.com/embed/C8CLmlgyp9U&autoplay=1' frameborder='0' allowfullscreen></iframe>");
        out.println("</body>");
        out.println("</html>");
        return response;
	}

}
