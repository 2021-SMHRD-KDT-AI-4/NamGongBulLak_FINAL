package model;

public class MainRankingDTO {

	private String country;
	private String id;
	private String nickname;
	private int user_accuracy;
	private String season;
	private String profile_img;
	
	public MainRankingDTO(String country, String id, String nickname, int user_accuracy) {
		this.country = country;
		this.id = id;
		this.nickname = nickname;
		this.user_accuracy = user_accuracy;
	}
	
	public MainRankingDTO(String nickname, String profile_img, int user_accuracy,String season) {
		this.nickname = nickname;
		this.profile_img = profile_img;
		this.user_accuracy = user_accuracy;
		this.season = season;
	}

	public String getProfile_img() {
		return profile_img;
	}

	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	
	public String getSeason() {
		return season;
	}

	public void setSeason(String season) {
		this.season = season;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
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

	public int getUser_accuracy() {
		return user_accuracy;
	}

	public void setUser_accuracy(int user_accuracy) {
		this.user_accuracy = user_accuracy;
	}
	
	
	
}
