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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>On Deck</title>
</head>
<body>
	<div class="ondeckitem">
		<img src="//i4.ytimg.com/vi/<%= playlist.getItem(playlist.getNextItemIndex(1)).getID() %>/default.jpg" alt="" tabindex="-1" width="106" data-group-key="thumb-group-0">
	</div>
	<div class="ondeckitem">
		<img src="//i4.ytimg.com/vi/<%= playlist.getItem(playlist.getNextItemIndex(2)).getID() %>/default.jpg" alt="" tabindex="-1" width="106" data-group-key="thumb-group-0">
	</div>
	<div class="ondeckitem">
		<img src="//i4.ytimg.com/vi/<%= playlist.getItem(playlist.getNextItemIndex(3)).getID() %>/default.jpg" alt="" tabindex="-1" width="106" data-group-key="thumb-group-0">
	</div>
</body>
</html>