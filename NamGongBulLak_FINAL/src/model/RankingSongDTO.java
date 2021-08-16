package model;

public class RankingSongDTO {
	private int rank;
	private String profile_Img;
	private String nickname;
	private int accuracy;
	private String emblem_1;
	private String emblem_2;
	private String emblem_3;
	private String songTitle;
	
	public RankingSongDTO(int rank, String profile_Img, String nickname, int accuracy, String emblem_1, String emblem_2,
			String emblem_3, String songTitle) {
		super();
		this.rank = rank;
		this.profile_Img = profile_Img;
		this.nickname = nickname;
		this.accuracy = accuracy;
		this.emblem_1 = emblem_1;
		this.emblem_2 = emblem_2;
		this.emblem_3 = emblem_3;
		this.songTitle = songTitle;
	}

	public RankingSongDTO(int rank, String profile_Img, String nickname, int accuracy, String emblem_1, String emblem_2,
			String emblem_3) {
		super();
		this.rank = rank;
		this.profile_Img = profile_Img;
		this.nickname = nickname;
		this.accuracy = accuracy;
		this.emblem_1 = emblem_1;
		this.emblem_2 = emblem_2;
		this.emblem_3 = emblem_3;
	}
	

	public RankingSongDTO(String songTitle) {
		super();
		this.songTitle = songTitle;
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

	public String getSongTitle() {
		return songTitle;
	}

	public void setSongTitle(String songTitle) {
		this.songTitle = songTitle;
	}
	
}
