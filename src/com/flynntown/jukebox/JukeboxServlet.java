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
        out.println("<object width='560' height='315'><param name='movie' value='http://www.youtube.com/v/C8CLmlgyp9U?version=3&amp;autoplay=1&amp;hl=en_US'></param><param name='allowFullScreen' value='true'></param><param name='allowscriptaccess' value='always'></param><embed src='http://www.youtube.com/v/C8CLmlgyp9U?version=3&amp;hl=en_US' type='application/x-shockwave-flash' width='560' height='315' allowscriptaccess='always' allowfullscreen='true'></embed></object>");
        out.println("</body>");
        out.println("</html>");
        return response;
	}

}
