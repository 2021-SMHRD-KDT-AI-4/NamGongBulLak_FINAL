package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DanceBoardDAO {
	
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
	
	public int like_plus(int btn) {
		int cnt = 0;
	
		try {
			conn();

			String sql = "UPDATE DANCEBOARDS SET Like_Count = Like_Count+1 WHERE ARTICLE_SEQ = ? ";
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, btn);

			cnt = psmt.executeUpdate();
			
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}
	
	public int select_like(int btn) {

		int like = 0;
		
		try {
			conn();
			
			String sql = "SELECT Like_Count FROM DANCEBOARDS WHERE ARTICLE_SEQ = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, btn);
			
			rs = psmt.executeQuery();
			
			if(rs.next()){
				like = rs.getInt("like_count");
			}else {
				like = 0;
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return like;
	}
	
	public int like_minus(int btn) {
		int cnt = 0;
	
		try {
			conn();

			String sql = "UPDATE DANCEBOARDS SET Like_Count = Like_Count-1 WHERE ARTICLE_SEQ = ? ";
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, btn); 

			cnt = psmt.executeUpdate();
			
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}
	
	public int upload(DanceBoardDTO dto) {
		
		int cnt = 0;
		
		try {
			conn();
			String sql = "INSERT INTO danceboards VALUES(article_seq.nextval,?,?,0,0,sysdate,?,?,?)";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getSubject());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			psmt.setInt(4, dto.getPlay_seq());
			psmt.setString(5, dto.getUpload_filename());
			
			cnt = psmt.executeUpdate();
			
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}

    public ArrayList<BoardViewDTO> board_view() {
    	
	   ArrayList<BoardViewDTO> list = new ArrayList<BoardViewDTO>();
		
		try {
			conn();
		
			//String sql = "SELECT a.article_seq, d.album_filename, b.song_title, b.song_singer, c.profile_img, a.subject, c.nickname, a.like_count, a.view_count, a.article_date, b.user_filename FROM danceboards a, mydanceinfos b, members c, danceinfos d";
			//String sql = "SELECT a.article_seq, d.album_filename, b.song_title, b.song_singer, c.profile_img, a.subject, c.nickname, a.like_count, a.view_count, a.article_date, b.user_filename FROM danceboards a, mydanceinfos b, members c, danceinfos d WHERE b.article_seq = a.article_seq AND c.id = a.id";
			//String sql = "SELECT DISTINCT a.article_seq, d.album_filename, b.song_title, b.song_singer, c.profile_img, a.subject, c.nickname, a.like_count, a.view_count, a.article_date, b.user_filename FROM danceboards a, mydanceinfos b, members c, danceinfos d WHERE b.article_seq = a.article_seq AND c.id = a.id AND d.song_seq = b.song_seq  ORDER BY a.article_seq";
			String sql = "SELECT a.article_seq, a.subject, a.like_count, a.view_count, a.article_date, a.upload_filename, b.song_title, b.song_singer, c.nickname, c.profile_img, d.album_filename FROM danceboards a, mydanceinfos b, members c, danceinfos d WHERE a.play_seq = b.play_seq AND a.id = c.id AND b.song_seq = d.song_seq ORDER BY a.article_seq DESC";	
			
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int article_seq = rs.getInt("article_seq");
				String album_filename = rs.getString("album_filename");
				String song_title = rs.getString("song_title");
				String song_singer = rs.getString("song_singer");
				String profile_img = rs.getString("profile_img");
				String subject = rs.getString("subject");
				String nickname = rs.getString("nickname");
				int like_count = rs.getInt("like_count");
				int view_count = rs.getInt("view_count");
				String article_date = rs.getString("article_date");
				String upload_filename = rs.getNString("upload_filename");
				
				BoardViewDTO dto = new BoardViewDTO(article_seq, album_filename, song_title, song_singer, profile_img, subject, nickname, like_count, view_count, article_date, upload_filename);
         	    list.add(dto);
			}	
			
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return list;
	}
    
    public ArrayList<BoardWriteDTO> board_write(String id) {
    	
 	   ArrayList<BoardWriteDTO> list = new ArrayList<BoardWriteDTO>();
 		
 		try {
 			conn();
 			String sql = "SELECT a.id, b.nickname, a.user_filename, a.play_date, a.song_title, a.song_singer, a.user_accuracy, a.play_seq FROM MYDANCEINFOS a, MEMBERS b WHERE a.id = ? AND a.id = b.id";
 			
 			psmt = conn.prepareStatement(sql);
 			psmt.setString(1, id);
 			rs = psmt.executeQuery();
 			
 			while(rs.next()) {
 				id = rs.getString("id");
 				String nickname = rs.getString("nickname");
 				String user_filename = rs.getNString("user_filename");
 				String play_date = rs.getNString("play_date");
 				String song_title = rs.getString("song_title");
 				String song_singer = rs.getString("song_singer");
 				int user_accuracy = rs.getInt("user_accuracy");
 				int play_seq = rs.getInt("play_seq");
 				
 				BoardWriteDTO dto = new BoardWriteDTO(id, nickname, play_date, song_title, song_singer, user_accuracy, user_filename, play_seq);
          	    list.add(dto);
 			}	
 			
 		}catch (SQLException e) {
 			e.printStackTrace();
 		}finally {
 			close();
 		}
 		
 		return list;
 	}
    
    public BoardViewDTO board_write_view(MyDanceinfoDTO dto) {
    	
 	   BoardViewDTO BVdto = null;
 		
 		try {
 			conn();
 			String sql = "SELECT user_filename, play_date, song_title, song_singer, user_accuracy FROM MYDANCEINFOS WHERE id = ?";
 					
 			psmt = conn.prepareStatement(sql);
 			
 			psmt.setString(1, dto.getId());
 			
 			rs = psmt.executeQuery();
 			
 			if(rs.next()) {
 				
 				String song_title = rs.getString("song_title");
 				String song_singer = rs.getString("song_singer");
 				String subject = rs.getString("subject");
 				String nickname = rs.getString("nickname");
 				String user_filename = rs.getNString("user_filename");
 				
 				BVdto = new BoardViewDTO(song_title, song_singer, subject, nickname, user_filename);
          	  
 			}	
 			
 		}catch (SQLException e) {
 			e.printStackTrace();
 		}finally {
 			close();
 		}
 		
 		return BVdto;
 	}
    
    public ArrayList<BoardViewDTO> showBoard(int choiceNum) {
    	
    	ArrayList<BoardViewDTO> list = new ArrayList<BoardViewDTO>();
    	
    	try {
    		conn();
    		String sql = "SELECT a.subject, a.content, a.like_count, a.view_count, a.article_date, a.upload_filename, b.song_title, b.song_singer, c.nickname writer, c.profile_img writer_img, d.album_filename, d.album_title FROM danceboards a, mydanceinfos b, members c, danceinfos d WHERE a.article_seq = ? AND a.play_seq = b.play_seq AND a.id = c.id AND b.song_seq = d.song_seq";
    		psmt = conn.prepareStatement(sql);
    		psmt.setInt(1, choiceNum);
    		
    		rs = psmt.executeQuery();
    		
    		while(rs.next()) {
    			String song_title = rs.getString("song_title");
    			String song_singer = rs.getString("song_singer");
    			String album_filename = rs.getString("album_filename");
    			String album_title = rs.getString("album_title");
    			String subject = rs.getString("subject");
    			String content = rs.getString("content");
    			int like_count = rs.getInt("like_count");
    			int view_count = rs.getInt("view_count");
    			String article_date = rs.getString("article_date");
    			String upload_filename = rs.getString("upload_filename");
    			String writer = rs.getString("writer");
    			String writer_img = rs.getString("writer_img");
    			
    			BoardViewDTO dto = new BoardViewDTO(song_title, song_singer, album_filename, album_title,
    					subject, content, like_count, view_count, article_date, upload_filename,
    					writer, writer_img);
    			list.add(dto);
    		}
    	} catch (SQLException e) {
    		e.printStackTrace();
    	} finally {
    		close();
    	}
    	return list;
    }
    
    public ArrayList<BoardViewDTO> showComments(int choiceNum) {
    	
    	ArrayList<BoardViewDTO> list = new ArrayList<BoardViewDTO>();
    	
    	try {
    		conn();
    		String sql = "SELECT a.comments, a.comment_date, b.nickname commenter, b.profile_img commenter_img FROM comments a, members b WHERE a.article_seq = ? AND a.id = b.id ORDER BY a.comment_date";
    		psmt = conn.prepareStatement(sql);
    		psmt.setInt(1, choiceNum);
    		
    		rs = psmt.executeQuery();
    		
    		while(rs.next()) {
    			String comments = rs.getString("comments");
				String comment_date = rs.getString("comment_date");
				String commenter = rs.getString("commenter");
				String commenter_img = rs.getString("commenter_img");
    			
    			BoardViewDTO dto = new BoardViewDTO(comment_date, comments, commenter, commenter_img);
    			list.add(dto);
    		}
    	} catch (SQLException e) {
    		e.printStackTrace();
    	} finally {
    		close();
    	}
    	return list;
    }
    
    public int plusViewCount(int choiceNum) {
    	
    	int cnt = 0;
    	
    	try {
    		conn();
    		String sql = "UPDATE danceboards SET view_count = view_count + 1 WHERE article_seq = ?";
    		psmt = conn.prepareStatement(sql);
    		psmt.setInt(1, choiceNum);
    		
    		cnt = psmt.executeUpdate();
    	} catch (SQLException e) {
    		e.printStackTrace();
    	} finally {
    		close();
    	}
    	return cnt;
    }
    
    

}
