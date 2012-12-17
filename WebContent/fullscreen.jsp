<%@page import="com.flynntown.jukebox.playlist.YouTubePlaylist"%>
<%@page import="com.flynntown.jukebox.JukeboxServlet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
 YouTubePlaylist playlist = JukeboxServlet.getPlaylist();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	.ondeckitem{
		float: left;
		padding:10px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/swfobject/2.1/swfobject.js" type="text/javascript"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Flynntown YouTube Jukebox</title>
<object width="560" height="315">
<param name="movie" value="https://youtube.googleapis.com/v/<%= playlist.getCurrentItem().getID() %>?version=2&fs=1"></param>
<param name="allowFullScreen" value="true"></param>
<param name="allowScriptAccess" value="always"></param>
<embed src="https://youtube.googleapis.com/v/<%= playlist.getCurrentItem().getID() %>?version=2&fs=1"
  type="application/x-shockwave-flash"
  allowfullscreen="true"
  allowscriptaccess="always"
  width="560" height="315">
</embed>
</object>
</body>
</html>