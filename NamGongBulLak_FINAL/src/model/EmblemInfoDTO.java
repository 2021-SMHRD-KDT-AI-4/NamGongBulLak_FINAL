package model;

public class EmblemInfoDTO {
	
	private String emblem_filename;
	private String emblem_name;
	private int emblem_code;
	
	public EmblemInfoDTO(String emblem_filename, String emblem_name, int emblem_code) {
		super();
		this.emblem_filename = emblem_filename;
		this.emblem_name = emblem_name;
		this.emblem_code = emblem_code;
	}
	
	public EmblemInfoDTO(String emblem_filename, int emblem_code) {
		super();
		this.emblem_filename = emblem_filename;
		this.emblem_code = emblem_code;
	}

	public String getEmblem_filename() {
		return emblem_filename;
	}
	public void setEmblem_filename(String emblem_filename) {
		this.emblem_filename = emblem_filename;
	}
	public String getEmblem_name() {
		return emblem_name;
	}
	public void setEmblem_name(String emblem_name) {
		this.emblem_name = emblem_name;
	}
	public int getEmblem_code() {
		return emblem_code;
	}
	public void setEmblem_code(int emblem_code) {
		this.emblem_code = emblem_code;
	}
	

}
