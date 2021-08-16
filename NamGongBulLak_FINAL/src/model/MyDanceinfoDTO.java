package model;

public class MyDanceinfoDTO {
	
	private String id;
	private String premium;
	private String play_date;
	private String song_title;
	private String song_singer;
	private int user_accuracy;
	private String user_filename;
	private String season;
	private int song_seq;
	private int article_seq;
	private int play_seq;
	
	public MyDanceinfoDTO(String id, String premium, String play_date, String song_title, String song_singer,
			int user_accuracy, String user_filename, String season, int song_seq, int article_seq, int play_seq) {
		super();
		this.id = id;
		this.premium = premium;
		this.play_date = play_date;
		this.song_title = song_title;
		this.song_singer = song_singer;
		this.user_accuracy = user_accuracy;
		this.user_filename = user_filename;
		this.season = season;
		this.song_seq = song_seq;
		this.article_seq = article_seq;
		this.play_seq = play_seq;
	}
	
	public MyDanceinfoDTO(String id, String play_date, String song_title, String song_singer, int user_accuracy,
			String user_filename) {
		super();
		this.id = id;
		this.play_date = play_date;
		this.song_title = song_title;
		this.song_singer = song_singer;
		this.user_accuracy = user_accuracy;
		this.user_filename = user_filename;
	}

	public MyDanceinfoDTO(String play_date, int user_accuracy) {
		super();
		this.play_date = play_date;
		this.user_accuracy = user_accuracy;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPremium() {
		return premium;
	}
	public void setPremium(String premium) {
		this.premium = premium;
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
	public String getUser_filename() {
		return user_filename;
	}
	public void setUser_filename(String user_filename) {
		this.user_filename = user_filename;
	}
	public String getSeason() {
		return season;
	}
	public void setSeason(String season) {
		this.season = season;
	}
	public int getSong_seq() {
		return song_seq;
	}
	public void setSong_seq(int song_seq) {
		this.song_seq = song_seq;
	}
	public int getArticle_seq() {
		return article_seq;
	}
	public void setArticle_seq(int article_seq) {
		this.article_seq = article_seq;
	}
	public int getPlay_seq() {
		return play_seq;
	}
	public void setPlay_seq(int play_seq) {
		this.play_seq = play_seq;
	}
	
	

}
