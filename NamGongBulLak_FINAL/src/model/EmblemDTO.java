package model;

public class EmblemDTO {
	
	private String id;
	private int emblem_code;
	private int user_ecode;
	
	private String emblem_name;
	
	

	public EmblemDTO(String id, int emblem_code, int user_code, String emblem_name) {
		super();
		this.id = id;
		this.emblem_code = emblem_code;
		this.user_ecode = user_ecode;
		this.emblem_name = emblem_name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getEmblem_code() {
		return emblem_code;
	}

	public void setEmblem_code(int emblem_code) {
		this.emblem_code = emblem_code;
	}

	public int getUser_ecode() {
		return user_ecode;
	}

	public void setUser_ecode(int user_ecode) {
		this.user_ecode = user_ecode;
	}

	public String getEmblem_name() {
		return emblem_name;
	}

	public void setEmblem_name(String emblem_name) {
		this.emblem_name = emblem_name;
	}
	
	
	
	

}
