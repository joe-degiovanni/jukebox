<%
 YouTubePlaylist playlist = JukeboxServlet.getPlaylist();
 int videoCount = 0;
%>
{videoid:'<%=playlist.getItem(playlist.getNextItemIndex()).getID();%>'}