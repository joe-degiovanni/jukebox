package com.flynntown.jukebox.playlist;

import java.util.ArrayList;

public class Playlist {
	
	@SuppressWarnings("rawtypes")
	protected ArrayList items;
	protected int currentPosition;
	protected String playlistName;
	protected String playlistID;

	//---------------------------------------------------------------------------
	// Constructors
	public Playlist(){
		playlistName = "";
		items = new ArrayList<Object>();
		double random = Math.random()*1000000000;
		playlistID = "p"+new Integer((int) random);
	}
	
	public Playlist(String name){
		playlistName = name;
		items = new ArrayList<Object>();
		double random = Math.random()*1000000000;
		playlistID = "p"+new Integer((int) random);
	}
	//---------------------------------------------------------------------------
	//---------------------------------------------------------------------------
	
	//---------------------------------------------------------------------------
	// Get Playlist Information
	public String getName(){
		return playlistName;
	}
	
	public String getID(){
		return playlistID;
	}
	
	public Object getCurrentItem(){
		return getItem(currentPosition);
	}
	
	public int getNextItemIndex(){
		if(currentPosition >= items.size()-1){
			return 0;
		}
		else {
			return currentPosition+1;
		}
	}
	
	public int getNextItemIndex(int interval){
		if(currentPosition+interval >= items.size()){
			return interval - (items.size()-currentPosition);
		}
		else {
			return currentPosition+interval;
		}
	}
	
	public int getPrevItemIndex(){
		if(currentPosition==0){
			return items.size();
		}
		else {
			return currentPosition-1;
		}
	}
	
	public Object getItem(int index){
		if(index < 0 || index >= items.size()){
			throw new IllegalArgumentException("Cannot go to number "+index+" in playlist. This item does not exist.");
		} else {
			return items.get(index);
		}
	}
	//---------------------------------------------------------------------------
	//---------------------------------------------------------------------------
	
	
	//---------------------------------------------------------------------------
	// Change position
	public void goToNext(){
		currentPosition = getNextItemIndex();
	}
	
	public void goToPrev(){
		currentPosition = getPrevItemIndex();
	}
	
	public void goTo(int index){
		if(index < 0 || index >= items.size()){
			throw new IllegalArgumentException("Cannot go to number "+index+" in playlist. This item does not exist.");
		} else {
			currentPosition = index;
		}
	}
	//---------------------------------------------------------------------------
	//---------------------------------------------------------------------------
	
	

	//---------------------------------------------------------------------------
	// add items
	public void addItem(Object item){
		items.add(items.size(),item);
	}
	public void addItem(Object item,int index){
		items.add(index, item);
	}
	//---------------------------------------------------------------------------
	//---------------------------------------------------------------------------
	

	//---------------------------------------------------------------------------
	// remove items
	public void removeItem(int index){
		items.remove(index);
	}
	//---------------------------------------------------------------------------
	//---------------------------------------------------------------------------
	

}
