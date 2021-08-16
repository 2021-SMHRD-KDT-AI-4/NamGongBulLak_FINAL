package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.DanceInfosDTO;

	public class DanceInfosDAO {
		
		private Connection conn;
		private PreparedStatement psmt;
		private ResultSet rs;
		private MemberDTO info = null;
	
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
		
		public ArrayList<DanceInfosDTO> songlist() {
			ArrayList<DanceInfosDTO> songlist = new ArrayList<DanceInfosDTO>();
			
			conn();
			
			try {
			String sql="select album_file_name, song_title, song_singer, album_name from dence_info order by album_name desc";
			psmt = conn.prepareStatement(sql);
			rs=psmt.executeQuery();
			
			while(rs.next()) {
				String album_file_name = rs.getString("album_file_name");
				String song_title = rs.getString("song_title");
				String song_singer = rs.getString("song_singer");
				String album_name = rs.getString("album_name");
				DanceInfosDTO dto = new DanceInfosDTO(album_file_name, song_title, song_singer, album_name);
				songlist.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}	
		
		return songlist;
		
		}
		
		public ArrayList<DanceInfosDTO> menu_songlist() {
			ArrayList<DanceInfosDTO> menu_songlist = new ArrayList<DanceInfosDTO>();
			
			conn();
			
			try {
			String sql="select album_filename, song_title, song_singer, song_seq, difficulty from danceinfos order by song_title desc";
			psmt = conn.prepareStatement(sql);
			rs=psmt.executeQuery();
			
			while(rs.next()) {
				String album_filename = rs.getString("album_filename");
				String song_title = rs.getString("song_title");
				String song_singer = rs.getString("song_singer");
				String difficulty = rs.getString("difficulty");
				int song_seq = rs.getInt("song_seq");
				DanceInfosDTO dto = new DanceInfosDTO(song_title, song_singer, album_filename, song_seq, difficulty);
				menu_songlist.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}	
		
		return menu_songlist;
	}
		
//		노래별 랭킹으로 dao 추가한 거
		public ArrayList<DanceInfosDTO> dancelist() {
			ArrayList<DanceInfosDTO> dancelist = new ArrayList<DanceInfosDTO>();
			
			conn();
			try {
			String sql="select song_seq, song_title, song_singer, album_filename, album_title from DANCEINFOS ORDER BY song_seq";
			psmt = conn.prepareStatement(sql);
			rs=psmt.executeQuery();
			
			while(rs.next()) {
				int song_seq = rs.getInt("song_seq");
				String song_title = rs.getString("song_title");
				String song_singer = rs.getString("song_singer");
				String album_filename = rs.getString("album_filename");
				String album_title = rs.getString("album_title");
				DanceInfosDTO danceinfosdto = new DanceInfosDTO(song_title, song_singer, album_filename, album_title, song_seq);
				dancelist.add(danceinfosdto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}	
		
		return dancelist;
		}
		
		
}
