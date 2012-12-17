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
<script>
	var videoCount = 0;

	function onYouTubePlayerReady(playerId) {
	  ytplayer = document.getElementById("myytplayer");
	  ytplayer.addEventListener("onStateChange", "onytplayerStateChange");
	}

	function onytplayerStateChange(newState) {
	   if (newState == '0'){
		   loadNextVideo();
	   } else if (newState == '-1'){
		   startVideo();
	   }
	}
	
	function startVideo(){
		ytplayer.playVideo();
	}
	
	function loadNextVideo(){
		$.ajax({
				url:'nextvideo.jsp',
				success: function(data) {nextVideoCallback(data);updateOnDeck();},
				dataType: 'json'
		});
		
	}
	
	function updateOnDeck(){
		ondeck = $.get("ondeck.jsp");
		$("#ondeckcontainer").html(ondeck.responseText);
	}
	
	function nextVideoCallback(data){
		ytplayer.loadVideoById(data);
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Flynntown YouTube Jukebox</title>
<object 
	type="application/x-shockwave-flash" 
	id="myytplayer" 
	data="https://www.youtube.com/apiplayer?video_id=<%= playlist.getCurrentItem().getID() %>&amp;version=3&amp;enablejsapi=1&amp;playerapiid=myytflashplayer" 
	width="100%" height="100%">
	<param name="allowScriptAccess" value="always">
	<param name="bgcolor" value="#000">
</object>
</body>
</html>