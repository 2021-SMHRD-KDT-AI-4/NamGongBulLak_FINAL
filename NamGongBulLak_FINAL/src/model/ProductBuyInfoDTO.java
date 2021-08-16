package model;

public class ProductBuyInfoDTO {
	
	private int buy_seq;
	private String id;
	private int p_code;
	private String p_date;
	private String virtual_face;
	private String p_name;
	private String p_filename;
	
	
	public ProductBuyInfoDTO(String virtual_face, String p_name, String p_filename) {
		super();
		this.virtual_face = virtual_face;
		this.p_name = p_name;
		this.p_filename = p_filename;
	}

	public String getVirtual_face() {
		return virtual_face;
	}

	public void setVirtual_face(String virtual_face) {
		this.virtual_face = virtual_face;
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
	
	
	public ProductBuyInfoDTO(int buy_seq, String id, int p_code, String p_date) {
		super();
		this.buy_seq = buy_seq;
		this.id = id;
		this.p_code = p_code;
		this.p_date = p_date;
	}
	
	public int getBuy_seq() {
		return buy_seq;
	}
	public void setBuy_seq(int buy_seq) {
		this.buy_seq = buy_seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getP_code() {
		return p_code;
	}
	public void setP_code(int p_code) {
		this.p_code = p_code;
	}
	public String getP_date() {
		return p_date;
	}
	public void setP_date(String p_date) {
		this.p_date = p_date;
	}
	
	

}
