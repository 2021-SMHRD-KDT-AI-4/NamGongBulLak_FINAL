package model;

public class MemberDTO {
	
	private String id;
	private String pw;
	private int mileage;
	private String nickname;
	private String premium;
	private String country;
	private String share_agree;
	private String profile_img;
	
	public MemberDTO(String id, String pw, int mileage, String nickname, String premium, String country,
			String share_agree, String profile_img) {
		super();
		this.id = id;
		this.pw = pw;
		this.mileage = mileage;
		this.nickname = nickname;
		this.premium = premium;
		this.country = country;
		this.share_agree = share_agree;
		this.profile_img = profile_img;
	}

	public MemberDTO(String id, String pw) {
		// TODO Auto-generated constructor stub
		this.id = id;
		this.pw = pw;
	}
	
	public MemberDTO(String id, String pw, String nickname, String country, String share_agree, String profile_img) {
		super();
		this.id = id;
		this.pw = pw;
		this.nickname = nickname;
		this.country = country;
		this.share_agree = share_agree;
		this.profile_img = profile_img;
	}

	public MemberDTO(String id, String pw, String nickname, String country) {
		super();
		this.id = id;
		this.pw = pw;
		this.nickname = nickname;
		this.country = country;
	}
	
	public String getProfile_img() {
		return profile_img;
	}
	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPremium() {
		return premium;
	}
	public void setPremium(String premium) {
		this.premium = premium;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getShare_agree() {
		return share_agree;
	}
	public void setShare_agree(String share_agree) {
		this.share_agree = share_agree;
	}
	
	

}
