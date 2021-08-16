package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class EmblemDAO {
	
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	int cnt = 0;
	
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
				
				EmblemDTO dto = new EmblemDTO(id, emblem_code, user_ecode, emblem_name); // dto로 묶음
				list.add(dto); // arraylist에 추가
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}

}
