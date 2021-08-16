package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MyDanceinfoDAO {
	
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	ArrayList<mdiDTO> list = new ArrayList<mdiDTO>();
	ArrayList<MyDanceinfoDTO> acclist = new ArrayList<MyDanceinfoDTO>();
	ArrayList<MyDanceinfoDTO> mylist = new ArrayList<MyDanceinfoDTO>();
	
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
	
	public ArrayList<MyDanceinfoDTO> board_write_view(MyDanceinfoDTO dto) {
    	
	 	   ArrayList<MyDanceinfoDTO> list = new ArrayList<MyDanceinfoDTO>();
	 		
	 		try {
	 			conn();
	 			String sql = "SELECT user_filename, play_date, song_title, song_singer, user_accuracy FROM MYDANCEINFOS WHERE id = ?";
	 					
	 			psmt = conn.prepareStatement(sql);
	 			
	 			psmt.setString(1, dto.getId());
	 			
	 			rs = psmt.executeQuery();
	 			
	 			while(rs.next()) {
	 				
	 				String id = rs.getString("id");
	 				String user_filename = rs.getString("user_filename");
	 				String play_date = rs.getString("play_date");
	 				String song_title = rs.getString("song_title");
	 				String song_singer = rs.getString("song_singer");
	 				int user_accuracy = rs.getInt("user_accuracy");
	 				
	 				MyDanceinfoDTO BVdto = new MyDanceinfoDTO(id, play_date, song_title, song_singer, user_accuracy, user_filename);
	          	    list.add(BVdto);
	 			}	
	 			
	 		}catch (SQLException e) {
	 			e.printStackTrace();
	 		}finally {
	 			close();
	 		}
	 		
	 		return list;
	 	}
	
	public ArrayList<ReplayDTO> replay_view(String id) {
    	
	 	   ArrayList<ReplayDTO> list = new ArrayList<ReplayDTO>();
	 		
	 		try {
	 			conn();
	 			String sql = "SELECT a.user_filename, a.play_date, a.song_title, a.song_singer, a.user_accuracy, a.play_seq, a.id, a.song_seq, b.song_seq, b.difficulty\r\n" + 
	 					"FROM mydanceinfos a, danceinfos b\r\n" + 
	 					"WHERE a.id = ? AND a.song_seq = b.song_seq";
	 					
	 					
	 			psmt = conn.prepareStatement(sql);
	 			psmt.setString(1, id);
	 			rs = psmt.executeQuery();
	 			
	 			while(rs.next()) {
	 				
	 				id = rs.getString("id");
	 				String user_filename = rs.getString("user_filename");
	 				String song_title = rs.getString("song_title");
	 				String song_singer = rs.getString("song_singer");
	 				int user_accuracy = rs.getInt("user_accuracy");
	 				String difficulty = rs.getString("difficulty");
	 				int play_Seq = rs.getInt("play_seq");
	 				String play_date = rs.getString("play_date");
	 				
	 				ReplayDTO Rdto = new ReplayDTO(id, user_filename, song_title, song_singer, user_accuracy, difficulty, play_Seq, play_date);
	 				list.add(Rdto);
	 			}	
	 			
	 		}catch (SQLException e) {
	 			e.printStackTrace();
	 		}finally {
	 			close();
	 		}
	 		
	 		return list;
	 	}
	
	public ArrayList<mdiDTO> select(String id) {

		conn();
		mdiDTO dto = null;

		try {

			String sql = "SELECT D.ALBUM_TITLE, D.SONG_TITLE, M.SONG_SINGER,M.USER_ACCURACY, M.PLAY_DATE FROM MYDANCEINFOS M, DANCEINFOS D WHERE M.ID = (SELECT ID FROM MEMBERS WHERE ID = ?)";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);

			rs = psmt.executeQuery();

			while (rs.next()) {
				String albumTitle = rs.getString(1);
				String song_title = rs.getString(2);
				String song_singer = rs.getString(3);
				int userAcc = rs.getInt(4);
				String play_date = rs.getString(5);

				dto = new mdiDTO(albumTitle, play_date, song_title, song_singer, userAcc);
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	public ArrayList<MyDanceinfoDTO> avgAcc() {
		conn();
		MyDanceinfoDTO dto = null;
		try {

			String sql = "SELECT USER_ACCURACY, PLAY_DATE FROM MYDANCEINFOS WHERE ROWNUM <= 50 ORDER BY PLAY_DATE";

			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int usersAcc = rs.getInt(1);
				String playDate = rs.getString(2);
				dto = new MyDanceinfoDTO(playDate, usersAcc);
				acclist.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return acclist;
	}
	public ArrayList<MyDanceinfoDTO> myAcc(String id) {
		conn();
		MyDanceinfoDTO dto = null;
		try {

			String sql = "SELECT USER_ACCURACY, PLAY_DATE FROM MYDANCEINFOS WHERE ROWNUM <= 10 AND ID = (SELECT ID FROM MEMBERS WHERE ID = ?) ORDER BY PLAY_DATE";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int usersAcc = rs.getInt(1);
				String playDate = rs.getString(2);
				dto = new MyDanceinfoDTO(playDate, usersAcc);
				mylist.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return mylist;
	}
	
}
