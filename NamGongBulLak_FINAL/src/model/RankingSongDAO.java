package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RankingSongDAO {
	
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	  
	private void conn() {
	      
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
	         
	        String db_url = "jdbc:oracle:thin:@210.223.239.218:1521:xe";
	        String db_id = "hr";
	        String db_pw = "hr";
	         
	        conn = DriverManager.getConnection(db_url, db_id, db_pw); 
	         
	    } catch (ClassNotFoundException e) {
	         e.printStackTrace();
	    } catch (SQLException e) {
	         e.printStackTrace();
	    }
	      
	}
	
	private void close() {
	   try {
	      if(rs!=null){
	         rs.close();
	      }
	      if(psmt!=null){
	         psmt.close();
	      }
	      if(conn!=null){
	         conn.close();
	      }
	   } catch (SQLException e) {
	      e.printStackTrace();
	   }
	}
	
	public ArrayList<RankingSongDTO> songranklist(String song_title) {
		RankingSongDTO rankingSdto = null;
		ArrayList<RankingSongDTO> RSFlist = new ArrayList<RankingSongDTO>();
		
		conn();
		
		try {
			String sql = "SELECT ROW_NUMBER() OVER (ORDER BY MAX(a.user_accuracy) DESC) rank, (SELECT b.profile_img FROM members b WHERE a.id = b.id) as profile_img, (SELECT b.nickname FROM members b WHERE a.id = b.id) as nickname, MAX(a.user_accuracy) as accuracy, (SELECT b.emblem_1 FROM members b WHERE a.id = b.id) emblem_1, (SELECT b.emblem_2 FROM members b WHERE a.id = b.id) emblem_2, (SELECT b.emblem_3 FROM members b WHERE a.id = b.id) emblem_3 FROM mydanceinfos a WHERE a.song_title = ? GROUP BY a.id";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, song_title);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int rank = rs.getInt(1);
				String profile_Img = rs.getString(2);
				String nickname = rs.getString(3);
				int accuracy = rs.getInt(4);
				String emblem_1 = rs.getString(5);
				String emblem_2 = rs.getString(6);
				String emblem_3 = rs.getString(7);
				
				rankingSdto = new RankingSongDTO(rank, profile_Img, nickname, accuracy, emblem_1, emblem_2, emblem_3);
				RSFlist.add(rankingSdto);
			};
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return RSFlist;
	}
	
	public ArrayList<RankingSongDTO> select_ranking_home() {
		RankingSongDTO rankingSHdto = null;
		ArrayList<RankingSongDTO> RSFHlist = new ArrayList<RankingSongDTO>();
		
		conn();
		
		try {
			String sql = "SELECT ROW_NUMBER() OVER (ORDER BY MAX(a.user_accuracy) DESC) rank, (SELECT b.profile_img FROM members b WHERE a.id = b.id) as profile_img, (SELECT b.nickname FROM members b WHERE a.id = b.id) as nickname, MAX(a.user_accuracy) as accuracy, (SELECT b.emblem_1 FROM members b WHERE a.id = b.id) emblem_1, (SELECT b.emblem_2 FROM members b WHERE a.id = b.id) emblem_2, (SELECT b.emblem_3 FROM members b WHERE a.id = b.id) emblem_3 FROM mydanceinfos a WHERE a.song_title = '∂Û¿œ∂Ù' GROUP BY a.id";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int rank = rs.getInt(1);
				String profile_Img = rs.getString(2);
				String nickname = rs.getString(3);
				int accuracy = rs.getInt(4);
				String emblem_1 = rs.getString(5);
				String emblem_2 = rs.getString(6);
				String emblem_3 = rs.getString(7);
				
				rankingSHdto = new RankingSongDTO(rank, profile_Img, nickname, accuracy, emblem_1, emblem_2, emblem_3);
				RSFHlist.add(rankingSHdto);
			};
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return RSFHlist;
	}
	
	
}
