package model;

public class BoardViewDTO {
	
	private String song_title;
	private String song_singer;
	private String album_filename;
	private String album_title;
	private String subject;
	private String content;
	private int like_count;
	private int view_count;
	private int article_seq;
	private String article_date;
	private String comment_date;
	private String nickname;
	private String profile_img;
	private String comments;
	private String upload_filename;
	private String writer;
	private String writer_img;
	private String commenter;
	private String commenter_img;

	// comments
	public BoardViewDTO(String comment_date, String comments, String commenter, String commenter_img) {
		super();
		this.comment_date = comment_date;
		this.comments = comments;
		this.commenter = commenter;
		this.commenter_img = commenter_img;
	}
	
	// board
	public BoardViewDTO(String song_title, String song_singer, String album_filename, String album_title,
			String subject, String content, int like_count, int view_count, String article_date, String upload_filename,
			String writer, String writer_img) {
		super();
		this.song_title = song_title;
		this.song_singer = song_singer;
		this.album_filename = album_filename;
		this.album_title = album_title;
		this.subject = subject;
		this.content = content;
		this.like_count = like_count;
		this.view_count = view_count;
		this.article_date = article_date;
		this.upload_filename = upload_filename;
		this.writer = writer;
		this.writer_img = writer_img;
	}

	public BoardViewDTO(String subject, String content, int like_count, int view_count, String article_date,
			String upload_filename, String song_title, String song_singer, String writer, String writer_img,
			String album_filename, String album_title, String comments, String comment_date, String commenter,
			String commenter_img) {
		super();
		this.subject = subject;
		this.content = content;
		this.like_count = like_count;
		this.view_count = view_count;
		this.article_date = article_date;
		this.upload_filename = upload_filename;
		this.song_title = song_title;
		this.song_singer = song_singer;
		this.writer = writer;
		this.writer_img = writer_img;
		this.album_filename = album_filename;
		this.album_title = album_title;
		this.comments = comments;
		this.comment_date = comment_date;
		this.commenter = commenter;
		this.commenter_img = commenter_img;
	}

	public BoardViewDTO(int article_seq, String album_filename, String song_title, String song_singer, String profile_img, String subject, String nickname, int like_count,
			int view_count, String article_date, String upload_filename) {
		super();
		this.article_seq = article_seq;
		this.album_filename = album_filename;
		this.song_title = song_title;
		this.song_singer = song_singer;
		this.profile_img = profile_img;
		this.subject = subject;
		this.nickname = nickname;
		this.like_count = like_count;
		this.view_count = view_count;
		this.article_date = article_date;
		this.upload_filename = upload_filename;
	}
	
	public BoardViewDTO(int article_seq, String album_filename, String song_title, String song_singer, String profile_img, String subject, String nickname, int like_count,
			int view_count, String article_date) {
		super();
		this.article_seq = article_seq;
		this.album_filename = album_filename;
		this.song_title = song_title;
		this.song_singer = song_singer;
		this.profile_img = profile_img;
		this.subject = subject;
		this.nickname = nickname;
		this.like_count = like_count;
		this.view_count = view_count;
		this.article_date = article_date;
	}
	
	public BoardViewDTO(String song_title, String song_singer, String subject, String nickname, String upload_filename) {
		super();
		this.song_title = song_title;
		this.song_singer = song_singer;
		this.subject = subject;
		this.nickname = nickname;
		this.upload_filename = upload_filename;
	}
	
	public String getWriter() {
		return writer;
	}
	
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	public String getWriter_img() {
		return writer_img;
	}
	
	public void setWriter_img(String writer_img) {
		this.writer_img = writer_img;
	}
	
	public String getCommenter() {
		return commenter;
	}
	
	public void setCommenter(String commenter) {
		this.commenter = commenter;
	}
	
	public String getCommenter_img() {
		return commenter_img;
	}
	
	public void setCommenter_img(String commenter_img) {
		this.commenter_img = commenter_img;
	}


	public String getUpload_filename() {
		return upload_filename;
	}

	public void setUpload_filename(String upload_filename) {
		this.upload_filename = upload_filename;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public int getArticle_seq() {
		return article_seq;
	}

	public void setArticle_seq(int article_seq) {
		this.article_seq = article_seq;
	}

	public String getArticle_date() {
		return article_date;
	}

	public void setArticle_date(String article_date) {
		this.article_date = article_date;
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

	public String getAlbum_filename() {
		return album_filename;
	}

	public void setAlbum_filename(String album_filename) {
		this.album_filename = album_filename;
	}

	public String getAlbum_title() {
		return album_title;
	}

	public void setAlbum_title(String album_title) {
		this.album_title = album_title;
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

	public int getLike_count() {
		return like_count;
	}

	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}

	public int getView_count() {
		return view_count;
	}

	public void setView_count(int view_count) {
		this.view_count = view_count;
	}

	public String getComment_date() {
		return comment_date;
	}

	public void setComment_date(String comment_date) {
		this.comment_date = comment_date;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getProfile_img() {
		return profile_img;
	}

	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	
	
	
	
	



}
