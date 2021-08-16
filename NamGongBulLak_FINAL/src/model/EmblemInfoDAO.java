package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class EmblemInfoDAO {
	
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
	

	public void updateEmblem(String fileName1, String fileName2, String fileName3, String id) {
		conn();
		
		String sql = "UPDATE MEMBERS SET EMBLEM_1 = ?, EMBLEM_2 = ?, EMBLEM_3 = ? WHERE ID = ? ";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, fileName1);
			psmt.setString(2, fileName2);
			psmt.setString(3, fileName3);
			psmt.setString(4, id);
			
			cnt = psmt.executeUpdate();
			
			if (cnt >0) {
				System.out.println("앰블럼 업데이트 완료");
			} else {
				System.out.println("앰블럼 업데이트 실패");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
	}

	public String[] selectEmblem(String id) {
		
		String[] list = new String[3];
		
		conn();
		
		String sql = "SELECT EMBLEM_1, EMBLEM_2, EMBLEM_3 FROM MEMBERS WHERE ID=?";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				list[0] =  rs.getString(1);
				list[1] = rs.getString(2);
				list[2] =  rs.getString(3);
				
			}
			
			if (cnt >0) {
				System.out.println("앰블럼 업데이트 완료");
			} else {
				System.out.println("앰블럼 업데이트 실패");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
		
	}
	
	public ArrayList<EmblemInfoDTO> showEmblemInfo(String id) {

		ArrayList<EmblemInfoDTO> list = new ArrayList<EmblemInfoDTO>();
		
		conn();
		
		try {
			
			String sql = "SELECT EMBLEM_FILENAME, EMBLEM_CODE FROM EMBLEMINFOS\r\n" + 
					"WHERE EMBLEM_CODE IN (SELECT EMBLEM_CODE FROM EMBLEMS WHERE ID = ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				String emblem_filename = rs.getString(1);
				int emblem_code = rs.getInt(2);
				
				EmblemInfoDTO dto = new EmblemInfoDTO(emblem_filename, emblem_code); // dto로 묶음
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
