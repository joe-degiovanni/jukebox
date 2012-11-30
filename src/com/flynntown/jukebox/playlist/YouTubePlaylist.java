package com.flynntown.jukebox.playlist;

import java.util.ArrayList;

import com.flynntown.jukebox.YouTubeVideo;

public class YouTubePlaylist extends Playlist {
	

	//---------------------------------------------------------------------------
	// Constructors
	public YouTubePlaylist(){
		playlistName = "";
		items = new ArrayList<YouTubeVideo>();
		double random = Math.random()*1000000000;
		playlistID = "p"+new Integer((int) random);
	}
	
	public YouTubePlaylist(String name){
		playlistName = name;
		items = new ArrayList<YouTubeVideo>();
		double random = Math.random()*1000000000;
		playlistID = "p"+new Integer((int) random);
	}
	//---------------------------------------------------------------------------
	//---------------------------------------------------------------------------
	
	
	public YouTubeVideo getCurrentItem(){
		return (YouTubeVideo) super.getItem(currentPosition);
	}
	
	public YouTubeVideo getItem(int index){
		return (YouTubeVideo) super.getItem(index);
	}
}
