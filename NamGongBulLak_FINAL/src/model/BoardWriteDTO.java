package model;

public class BoardWriteDTO {
	private String id;
	private String nickname;
	private String play_date;
	private String song_title;
	private String song_singer;
	private int user_accuracy;
	private String user_filename;
	private String subject;
	private String content;
	private int play_seq;
	
	
	public BoardWriteDTO(String id, String nickname, String play_date, String song_title, String song_singer, int user_accuracy,
			String user_filename, int play_seq) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.play_date = play_date;
		this.song_title = song_title;
		this.song_singer = song_singer;
		this.user_accuracy = user_accuracy;
		this.user_filename = user_filename;
		this.play_seq = play_seq;
	}

	public BoardWriteDTO(String user_filename, String subject, String content) {
		super();
		this.user_filename = user_filename;
		this.subject = subject;
		this.content = content;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
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
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPlay_seq() {
		return play_seq;
	}
	public void setPlay_seq(int play_seq) {
		this.play_seq = play_seq;
	}
	
	

}
