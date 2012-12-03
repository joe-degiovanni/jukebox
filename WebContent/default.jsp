<%@page import="com.flynntown.jukebox.playlist.YouTubePlaylist"%>
<%@page import="com.flynntown.jukebox.JukeboxServlet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<script>
	function onYouTubePlayerReady(playerId) {
	  ytplayer = document.getElementById("myytplayer");
	  ytplayer.addEventListener("onStateChange", "onytplayerStateChange");
	}

	function onytplayerStateChange(newState) {
	   alert("Player's new state: " + newState);
	   if (newState == '0'){
		   loadNextVideo();
	   } else if (newState == '-1'){
		   startVideo();
	   }
	}
	
	function startVideo(){
		alert('startVideo');
	}
	
	function loadNextVideo(){
		alert('loadNextVideo');
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Flynntown YouTube Jukebox</title>
<%
 YouTubePlaylist playlist = JukeboxServlet.getPlaylist();
%>
</head>
<body>
<h1>Welcome to the Flynntown YouTube Jukebox!</h1>
<object 
	type="application/x-shockwave-flash" 
	id="myytplayer" 
	data="https://www.youtube.com/apiplayer?video_id=<%= playlist.getCurrentItem().getID() %>&amp;version=3&amp;enablejsapi=1&amp;playerapiid=myytflashplayer" 
	width="640" height="360">
	<param name="allowScriptAccess" value="always">
	<param name="bgcolor" value="#000">
</object>

<div>The current videoID is <%= playlist.getCurrentItem().getID() %></div>
<h2>On Deck</h2>
<div>
	<div class="ondeckitem">
		<img src="//i4.ytimg.com/vi/<%= playlist.getItem(playlist.getNextItemIndex(1)).getID() %>/default.jpg" alt="" tabindex="-1" width="106" data-group-key="thumb-group-0">
	</div>
	<div class="ondeckitem">
		<img src="//i4.ytimg.com/vi/<%= playlist.getItem(playlist.getNextItemIndex(2)).getID() %>/default.jpg" alt="" tabindex="-1" width="106" data-group-key="thumb-group-0">
	</div>
	<div class="ondeckitem">
		<img src="//i4.ytimg.com/vi/<%= playlist.getItem(playlist.getNextItemIndex(3)).getID() %>/default.jpg" alt="" tabindex="-1" width="106" data-group-key="thumb-group-0">
	</div>
</div>
</body>
</html>