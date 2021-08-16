package model;

public class ReplayDTO {
	
	private String id;
	private String user_filename;
	private String song_title;
	private String song_singer;
	private int user_accuracy;
	private String difficulty;
	private int play_Seq;
	private String play_date;
	
	public ReplayDTO(String id, String user_filename, String song_title, String song_singer, int user_accuracy,
			String difficulty, int play_Seq, String play_date) {
		super();
		this.id = id;
		this.user_filename = user_filename;
		this.song_title = song_title;
		this.song_singer = song_singer;
		this.user_accuracy = user_accuracy;
		this.difficulty = difficulty;
		this.play_Seq = play_Seq;
		this.play_date = play_date;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUser_filename() {
		return user_filename;
	}
	public void setUser_filename(String user_filename) {
		this.user_filename = user_filename;
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
	public String getDifficulty() {
		return difficulty;
	}
	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}
	public int getPlay_Seq() {
		return play_Seq;
	}
	public void setPlay_Seq(int play_Seq) {
		this.play_Seq = play_Seq;
	}
	public String getPlay_date() {
		return play_date;
	}
	public void setPlay_date(String play_date) {
		this.play_date = play_date;
	}

}
