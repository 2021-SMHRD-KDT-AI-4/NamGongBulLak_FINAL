package model;

public class CommentDTO {
	
	private int comment_seq;
	private String id;
	private String comments;
	private int article_seq;
	private String comment_date;
	
	public CommentDTO(String id, String comments, int article_seq) {
		super();
		this.id = id;
		this.comments = comments;
		this.article_seq = article_seq;
	}

	public CommentDTO(int comment_seq, String id, String comments, int article_seq, String comment_date) {
		super();
		this.comment_seq = comment_seq;
		this.id = id;
		this.comments = comments;
		this.article_seq = article_seq;
		this.comment_date = comment_date;
	}
	
	public String getDate() {
		return comment_date;
	}
	public void setDate(String comment_date) {
		this.comment_date = comment_date;
	}
	public int getComment_seq() {
		return comment_seq;
	}
	public void setComment_seq(int comment_seq) {
		this.comment_seq = comment_seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	

}
