<%@page import="com.flynntown.jukebox.playlist.YouTubePlaylist"%>
<%@page import="com.flynntown.jukebox.JukeboxServlet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Flynntown YouTube Jukebox</title>
<%
 YouTubePlaylist playlist = JukeboxServlet.getPlaylist();
%>
</head>
<body>
<h1>Welcome to the Flynntown YouTube Jukebox!</h1>
<img src="/jukebox/images/jukebox.jpg" />
<object width='820' height='515' style='position: absolute;left: 300px;top: 700px;'>
	<param name='movie' value='http://www.youtube.com/v/<%= playlist.getCurrentItem().getID() %>?version=3&amp;autoplay=1&amp;hl=en_US'></param>
	<param name='allowFullScreen' value='true'></param>
	<param name='allowscriptaccess' value='always'></param>
	<embed src='http://www.youtube.com/v/<%= playlist.getCurrentItem().getID() %>?version=3&amp;autoplay=1&amp;hl=en_US' 
		type='application/x-shockwave-flash' width='820' height='515' allowscriptaccess='always' allowfullscreen='true'></embed>
</object>");
<div>The current videoID is <%= playlist.getCurrentItem().getID() %></div>
</body>
</html>