package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CommentDAO {
	
	// 필드에 객체를 생성하면 최초값이 무조건 null이 들어간 상태이다.
		private Connection conn;
		private PreparedStatement psmt;
		private ResultSet rs;
		
		private void conn() {
			
			try {
				//1. 드라이버 동적로딩(어떠한 DBMS를 사용하는지에 따라 드라이버의 종류가 다르다 해당 DBMS에 맞는 드라이버를 로딩해줘야함)
				Class.forName("oracle.jdbc.driver.OracleDriver");
				
				//2. DriverManager를 통해서 Java와 DataBase 간의 통로 개척(Connection 연결)
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
			//4. 연결종료(연결해제는 역순으로 진행한다)
			try {
				if(rs != null) {
					rs.close();
				}
				if(psmt != null){
					psmt.close();	
				}
				if(conn != null){
					conn.close();
				}
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		public int insertComment(CommentDTO dto) {
			
			int cnt = 0;
			
			try {
		         conn();
		         String sql = "INSERT INTO comments VALUES(comments_seq.nextval,?,?,?,sysdate)";
		         
		         psmt = conn.prepareStatement(sql);
		         psmt.setString(1, dto.getId());
		         psmt.setString(2, dto.getComments());
		         psmt.setInt(3, dto.getArticle_seq());
		         
		         cnt = psmt.executeUpdate();
		         
		      }catch (SQLException e) {
		         e.printStackTrace();
		      }finally {
		    	  close();
		      }
		      
		      return cnt;
		 }
		
		public ArrayList<CommentDTO> showComment() {

			ArrayList<CommentDTO> list = new ArrayList<CommentDTO>();
			
			conn();
			
			String sql = "select * from comments order by comment_date desc";
			
			try {
				psmt = conn.prepareStatement(sql);
				
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					int comment_seq = rs.getInt("comment_seq");
					int article_seq = rs.getInt("article_seq");
					String comment_id = rs.getString("id");
					String comments = rs.getString("comments");
					String comment_date = rs.getString("comment_date");
					
					CommentDTO dto = new CommentDTO(comment_seq, comment_id, comments, article_seq, comment_date); // dto로 묶음
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
