package com.flynntown.jukebox;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.flynntown.jukebox.playlist.YouTubePlaylist;

/**
 * Servlet implementation class JukeboxServlet
 */
@WebServlet("/jukebox")
public class JukeboxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String[] videos = {"C8CLmlgyp9U","gkQvgOKI0qA","0l5gcxOV79U","9q6reEqJDjg","7YLy4j8EZIk","mCJQN9zjEo0","9bZkp7q19f0","lQlIhraqL7o","bIQHs3zl7sw","d6PDlMggROA","aMS0O3kknvk","gsL6wNP_oJo","8i5k4I1AOEI"};
	
	private static YouTubePlaylist playlist;
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		playlist = createTestPlaylist();
		
	}
	
	private static YouTubePlaylist createTestPlaylist(){
		YouTubePlaylist	ytp = new YouTubePlaylist("test");
		for(String vID : videos){
			ytp.addItem(new YouTubeVideo(vID));
		}
		return ytp;
	}
	
	public static YouTubePlaylist getPlaylist(){
		if(playlist==null){
			playlist = createTestPlaylist();
		}
		return playlist;
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] values = request.getParameterValues("video");
		if(values!=null && values[0] != null) {
			try {
				int index = new Integer(values[0]);
				playlist.goTo(index);
			} catch (Exception e) {
				// add error handling code
			}
		}
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
        out.println("<object width='560' height='315'><param name='movie' value='http://www.youtube.com/v/"+playlist.getCurrentItem().getID()+"?version=3&amp;autoplay=1&amp;hl=en_US'></param><param name='allowFullScreen' value='true'></param><param name='allowscriptaccess' value='always'></param><embed src='http://www.youtube.com/v/"+playlist.getCurrentItem().getID()+"?version=3&amp;autoplay=1&amp;hl=en_US' type='application/x-shockwave-flash' width='560' height='315' allowscriptaccess='always' allowfullscreen='true'></embed></object>");
        out.println("<div>The current videoID is "+playlist.getCurrentItem().getID()+"</div>");
        out.println("</body>");
        out.println("</html>");
        return response;
	}

}
