<%@page import="com.flynntown.jukebox.playlist.YouTubePlaylist"%>
<%@page import="com.flynntown.jukebox.JukeboxServlet"%>
<%@ page language="java" contentType="text/javascript; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
	YouTubePlaylist playlist = JukeboxServlet.getPlaylist();
%>
{"videoId":"<%= playlist.getItem(playlist.getNextItemIndex()).getID() %>"}