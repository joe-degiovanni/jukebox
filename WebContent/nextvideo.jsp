<%@page import="com.flynntown.jukebox.playlist.YouTubePlaylist"%>
<%@page import="com.flynntown.jukebox.JukeboxServlet"%>
<%@ page language="java" contentType="text/javascript; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
	YouTubePlaylist playlist = JukeboxServlet.getPlaylist();
	playlist.goToNext();
%>
{"videoId":"<%= playlist.getItem(playlist.getCurrentItem()).getID() %>"}