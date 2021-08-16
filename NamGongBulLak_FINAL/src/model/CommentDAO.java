package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CommentDAO {
	
	// �ʵ忡 ��ü�� �����ϸ� ���ʰ��� ������ null�� �� �����̴�.
		private Connection conn;
		private PreparedStatement psmt;
		private ResultSet rs;
		
		private void conn() {
			
			try {
				//1. ����̹� �����ε�(��� DBMS�� ����ϴ����� ���� ����̹��� ������ �ٸ��� �ش� DBMS�� �´� ����̹��� �ε��������)
				Class.forName("oracle.jdbc.driver.OracleDriver");
				
				//2. DriverManager�� ���ؼ� Java�� DataBase ���� ��� ��ô(Connection ����)
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
			//4. ��������(���������� �������� �����Ѵ�)
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
					
					CommentDTO dto = new CommentDTO(comment_seq, comment_id, comments, article_seq, comment_date); // dto�� ����
					list.add(dto); // arraylist�� �߰�
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			
			return list;
		}
		
}
