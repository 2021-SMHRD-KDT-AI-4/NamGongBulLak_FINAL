package model;

public class DanceBoardDTO {
	
	private int article_seq;
	private String subject;
	private String content;
	private int like_count;
	private int view_count;
	private String id;
	private String article_date;
	private int play_seq;
	private String upload_filename;
	
	public DanceBoardDTO(int article_seq, String subject, String content, int like_count, int view_count, String id,
			String article_date, String upload_filename) {
		super();
		this.article_seq = article_seq;
		this.subject = subject;
		this.content = content;
		this.like_count = like_count;
		this.view_count = view_count;
		this.id = id;
		this.article_date = article_date;
		this.upload_filename = upload_filename;
	}
	
	
	public DanceBoardDTO(String subject, String content, String id, int play_seq, String upload_filename) {
		super();
		this.subject = subject;
		this.content = content;
		this.id = id;
		this.play_seq = play_seq;
		this.upload_filename = upload_filename;
	}
	
	

	public int getPlay_seq() {
		return play_seq;
	}
	
	
	public void setPlay_seq(int play_seq) {
		this.play_seq = play_seq;
	}
	public String getUpload_filename() {
		return upload_filename;
	}


	public void setUpload_filename(String upload_filename) {
		this.upload_filename = upload_filename;
	}


	public String getArticle_date() {
		return article_date;
	}
	public void setArticle_date(String article_date) {
		this.article_date = article_date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getArticle_seq() {
		return article_seq;
	}
	public void setArticle_seq(int article_seq) {
		this.article_seq = article_seq;
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
	
	

}
