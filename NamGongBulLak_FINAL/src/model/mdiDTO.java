package model;

public class mdiDTO {
	private String albumTitle;
	private String play_date;
	private String song_title;
	private String song_singer;
	private int user_accuracy;
	
	
	public mdiDTO(String albumTitle, String play_date, String song_title, String song_singer, int user_accuracy) {
		super();
		this.albumTitle = albumTitle;
		this.play_date = play_date;
		this.song_title = song_title;
		this.song_singer = song_singer;
		this.user_accuracy = user_accuracy;
	}
	public String getAlbumTitle() {
		return albumTitle;
	}
	public void setAlbumTitle(String albumTitle) {
		this.albumTitle = albumTitle;
	}
	public String getPlay_date() {
		return play_date;
	}
	public void setPlay_date(String play_date) {
		this.play_date = play_date;
	}
	public String getSong_title() {
		return song_title;
	}
	public void setSong_title(String song_title) {
		this.song_title = song_title;
	}
	public String getSong_singer() {
		return song_singer;
	}
	public void setSong_singer(String song_singer) {
		this.song_singer = song_singer;
	}
	public int getUser_accuracy() {
		return user_accuracy;
	}
	public void setUser_accuracy(int user_accuracy) {
		this.user_accuracy = user_accuracy;
	}
	
	

}
