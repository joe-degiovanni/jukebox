<%@page import="com.flynntown.jukebox.playlist.YouTubePlaylist"%>
<%@page import="com.flynntown.jukebox.JukeboxServlet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
 YouTubePlaylist playlist = JukeboxServlet.getPlaylist();
%>
<!DOCTYPE html>
<html>
<head>
<style>
	body{
		background-color: #cc3333;
		text-align:center;
		width:950px;
		margin-right:auto;
		margin-left:auto;
	}

	.ondeckitem{
		float: left;
		padding:10px;
	}
	
	#container{
		width:900px;
		margin:auto;
		padding:20px;
		background-color:#eeb;
	}
	
	#ondeckcontainer{
		min-height: 100px;
		border-radius: 10px;
		border-color: black;
		border: solid;
		background-color: whitesmoke;
	}
	
	#videobox object{
		padding:20px;
		background-color:black;
		border-radius:10px;
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
				success: function(data) {updateOnDeck();nextVideoCallback(data);},
				dataType: 'json'
		});
		
	}
	
	function updateOnDeck(){
		$.ajax({
			url:'ondeck.jsp',
			success: function(data) {$("#ondeckcontainer").html(data);},
			error: function(data,status,other) {alert("error");}
		});
	}
	
	function nextVideoCallback(data){
		ytplayer.loadVideoById(data);
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Flynntown YouTube Jukebox</title>
</head>
<body>
<div id="container">
<h1>Welcome to the Flynntown YouTube Jukebox!</h1>
<div id="videobox">
<object 
	type="application/x-shockwave-flash" 
	id="myytplayer" 
	data="https://www.youtube.com/apiplayer?video_id=<%= playlist.getCurrentItem().getID() %>&amp;version=3&amp;fs=1&amp;enablejsapi=1&amp;playerapiid=myytflashplayer" 
	width="640" height="360">
	<param name="allowScriptAccess" value="always">
	<param name="bgcolor" value="#000">
	<param name="allowFullScreen" value="true"></param>
</object>

<div>The current videoID is <%= playlist.getCurrentItem().getID() %></div>
</div>

<div>
	<input type="button" value="Next" onclick="loadNextVideo()"/>
</div>
<h2>On Deck</h2>
	<div id="ondeckcontainer">
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
</div>
</body>
</html>