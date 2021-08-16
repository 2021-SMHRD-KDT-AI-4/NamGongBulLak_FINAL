package model;

public class TutorialDTO {
	
	private String id;
	private String tutorial_url;
	private int tutorial_accuracy;
	private int tutorial_seq;
	
	public TutorialDTO(String id, String tutorial_url, int tutorial_accuracy, int tutorial_seq) {
		super();
		this.id = id;
		this.tutorial_url = tutorial_url;
		this.tutorial_accuracy = tutorial_accuracy;
		this.tutorial_seq = tutorial_seq;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTutorial_url() {
		return tutorial_url;
	}
	public void setTutorial_url(String tutorial_url) {
		this.tutorial_url = tutorial_url;
	}
	public int getTutorial_accuracy() {
		return tutorial_accuracy;
	}
	public void setTutorial_accuracy(int tutorial_accuracy) {
		this.tutorial_accuracy = tutorial_accuracy;
	}
	public int getTutorial_seq() {
		return tutorial_seq;
	}
	public void setTutorial_seq(int tutorial_seq) {
		this.tutorial_seq = tutorial_seq;
	}
	
	

}
