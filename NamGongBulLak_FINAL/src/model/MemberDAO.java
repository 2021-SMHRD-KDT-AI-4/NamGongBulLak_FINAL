package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {

	private Connection conn = null;
	private PreparedStatement psmt = null;
	private ResultSet rs = null;
	private MemberDTO info = null;
	private int cnt = 0;

	private void conn() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String db_url = "jdbc:oracle:thin:@210.223.239.218:1521:xe";
			String db_id = "hr";
			String db_pw = "hr";
			conn = DriverManager.getConnection(db_url, db_id, db_pw);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public int join(MemberDTO dto) {
		int cnt = 0;
		conn();
		try {
			String sql = "insert into Members values(?,?,0,?,0,?,?,?,0,0,0,0)";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			psmt.setString(3, dto.getNickname());
			psmt.setString(4, dto.getCountry());
			psmt.setString(5, dto.getShare_agree());			
			psmt.setString(6, dto.getProfile_img());			

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return cnt;
	}

	public MemberDTO login(MemberDTO dto) {

		conn();

		try {

			String sql = "SELECT * FROM Members WHERE ID=? AND PW=?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());

			rs = psmt.executeQuery();
			if (rs.next()) {
				String id = rs.getString(1);
				String pw = rs.getString(2);
				int mileage = rs.getInt(3);
				String nickname = rs.getString(4);
				String premium = rs.getNString(5);
				String country = rs.getString(6);
				String share_agree = rs.getString(7);
				String profile_img = rs.getString(8);
				
				info = new MemberDTO(id, pw, mileage, nickname, premium , country, share_agree, profile_img);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return info;
	}

	public boolean idCheck(String id) {

		boolean check = false;

		conn();

		try {

			String sql = "SELECT * FROM Members WHERE ID=?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, id);

			rs = psmt.executeQuery();

			if (rs.next()) {
				check = true;
			} else {
				check = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return check;

	}

	public int update(MemberDTO dto) {

		int cnt = 0;

		conn();

		try {

			String sql = "update Members set PW=?, NICKNAME=?, COUNTRY=?, SHARE_AGREE=?, PROFILE_IMG=? where ID=?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getPw());
			psmt.setString(2, dto.getNickname());
			psmt.setString(3, dto.getCountry());
			psmt.setString(4, dto.getShare_agree());
			psmt.setString(5, dto.getProfile_img());
			psmt.setString(6, dto.getId());

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	public int saveScore(String id, float score) {
		
		try {
			conn();
			
			String sql = "insert into members values(?,sysdate,?)";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id);
			psmt.setFloat(2, score);
			
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}
	
	public int getEmblem(EmblemDTO dto) {
		conn();
		
		String sql = "insert into embleminfos values(?, ?, user_ecode.nextval)";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getId());
			psmt.setInt(2, dto.getEmblem_code());
			
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return cnt;
	}
	
	
	public ArrayList<EmblemDTO> showUserEmblem() {

		ArrayList<EmblemDTO> list = new ArrayList<EmblemDTO>();
		
		conn();
		
		String sql = "SELECT a.emblem_name, b.id, b.emblem_code, b.user_ecode" + 
					 "FROM embleminfos a, emblems b" + 
					 "WHERE a.emblem_code = b.emblem_code";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				String emblem_name = rs.getString("emblem_name");
				String id = rs.getString("id");
				int emblem_code = rs.getInt("emblem_code");
				int user_ecode = rs.getInt("user_ecode");
				
				EmblemDTO dto = new EmblemDTO(id, emblem_code, user_ecode, emblem_name); // dto濡� 臾띠쓬
				list.add(dto); // arraylist�뿉 異붽�
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}
	
	public String premiumCheck(String id) {

		String premium = "";
		
		conn();

		try {

			String sql = "SELECT premium FROM Members WHERE ID=?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, id);

			rs = psmt.executeQuery();
			
			if (rs.next()) {
				premium = rs.getString(1);				
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return premium;

	}

	
}
