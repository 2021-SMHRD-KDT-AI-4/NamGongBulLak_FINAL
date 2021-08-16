package model;

public class ProductinfoDTO {
	
	private String p_name;
	private String p_filename;
	private int p_category;
	private int p_code;
	
	public ProductinfoDTO(String p_name, String p_filename, int p_category, int p_code) {
		super();
		this.p_name = p_name;
		this.p_filename = p_filename;
		this.p_category = p_category;
		this.p_code = p_code;
	}
	
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_filename() {
		return p_filename;
	}
	public void setP_filename(String p_filename) {
		this.p_filename = p_filename;
	}
	public int getP_category() {
		return p_category;
	}
	public void setP_category(int p_category) {
		this.p_category = p_category;
	}
	public int getP_code() {
		return p_code;
	}
	public void setP_code(int p_code) {
		this.p_code = p_code;
	}
	
	

}
