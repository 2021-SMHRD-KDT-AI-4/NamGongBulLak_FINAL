package model;

public class RankingCountryDTO {
	
	private int rank;
	private String profile_Img;
	private String nickname;
	private int accuracy;
	private String emblem_1;
	private String emblem_2;
	private String emblem_3;
	private String country;
	private String countryrank;
	private int Sum;
	
	public RankingCountryDTO(int rank, String country, int sum) {
		super();
		this.rank = rank;
		this.country = country;
		Sum = sum;
	}
	
	public RankingCountryDTO(String country) {
		super();
		this.country = country;
	}

	public RankingCountryDTO(int rank, String profile_Img, String nickname, int accuracy, String emblem_1,
			String emblem_2, String emblem_3, String country, String countryrank) {
		super();
		this.rank = rank;
		this.profile_Img = profile_Img;
		this.nickname = nickname;
		this.accuracy = accuracy;
		this.emblem_1 = emblem_1;
		this.emblem_2 = emblem_2;
		this.emblem_3 = emblem_3;
		this.country = country;
		this.countryrank = countryrank;
	}

	public RankingCountryDTO(int rank, String profile_Img, String nickname, int accuracy, String emblem_1,
			String emblem_2, String emblem_3, String country, String countryrank, int sum) {
		super();
		this.rank = rank;
		this.profile_Img = profile_Img;
		this.nickname = nickname;
		this.accuracy = accuracy;
		this.emblem_1 = emblem_1;
		this.emblem_2 = emblem_2;
		this.emblem_3 = emblem_3;
		this.country = country;
		this.countryrank = countryrank;
		Sum = sum;
	}

	public RankingCountryDTO(int rank, String profile_Img, String nickname, int accuracy, String emblem_1,
			String emblem_2, String emblem_3, String country, int sum) {
		super();
		this.rank = rank;
		this.profile_Img = profile_Img;
		this.nickname = nickname;
		this.accuracy = accuracy;
		this.emblem_1 = emblem_1;
		this.emblem_2 = emblem_2;
		this.emblem_3 = emblem_3;
		this.country = country;
		Sum = sum;
	}

	public RankingCountryDTO(int rank, String profile_Img, String nickname, int accuracy, String emblem_1,
			String emblem_2, String emblem_3) {
		super();
		this.rank = rank;
		this.profile_Img = profile_Img;
		this.nickname = nickname;
		this.accuracy = accuracy;
		this.emblem_1 = emblem_1;
		this.emblem_2 = emblem_2;
		this.emblem_3 = emblem_3;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public String getProfile_Img() {
		return profile_Img;
	}

	public void setProfile_Img(String profile_Img) {
		this.profile_Img = profile_Img;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getAccuracy() {
		return accuracy;
	}

	public void setAccuracy(int accuracy) {
		this.accuracy = accuracy;
	}

	public String getEmblem_1() {
		return emblem_1;
	}

	public void setEmblem_1(String emblem_1) {
		this.emblem_1 = emblem_1;
	}

	public String getEmblem_2() {
		return emblem_2;
	}

	public void setEmblem_2(String emblem_2) {
		this.emblem_2 = emblem_2;
	}

	public String getEmblem_3() {
		return emblem_3;
	}

	public void setEmblem_3(String emblem_3) {
		this.emblem_3 = emblem_3;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public int getSum() {
		return Sum;
	}

	public void setSum(int sum) {
		Sum = sum;
	}

	public String getCountryrank() {
		return countryrank;
	}

	public void setCountryrank(String countryrank) {
		this.countryrank = countryrank;
	}
	
		
}
