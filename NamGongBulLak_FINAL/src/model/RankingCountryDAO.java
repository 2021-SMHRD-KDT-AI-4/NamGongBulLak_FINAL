package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RankingCountryDAO {
	
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
	
	public ArrayList<RankingCountryDTO> RankingCountry(String country) {
		ArrayList<RankingCountryDTO> RClist = new ArrayList<RankingCountryDTO>();
		
		RankingCountryDTO RCdto = null;
		
		conn();
		
		try {
			String sql = "SELECT ROW_NUMBER() OVER (ORDER BY MAX(a.user_accuracy) DESC) rank, (SELECT b.profile_img FROM members b WHERE a.id = b.id) as profile_img, (SELECT b.nickname FROM members b WHERE a.id = b.id) as nickname, MAX(a.user_accuracy) as accuracy, (SELECT b.emblem_1 FROM members b WHERE a.id = b.id) emblem_1, (SELECT b.emblem_2 FROM members b WHERE a.id = b.id) emblem_2, (SELECT b.emblem_3 FROM members b WHERE a.id = b.id) emblem_3, (SELECT b.country FROM members b WHERE a.id = b.id) as country FROM mydanceinfos a WHERE (SELECT b.country FROM members b WHERE a.id = b.id)=? GROUP BY a.id";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, country);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int rank = rs.getInt(1);
				String profile_Img = rs.getString(2);
				String nickname = rs.getString(3);
				int accuracy = rs.getInt(4);
				String emblem_1 = rs.getString(5);
				String emblem_2 = rs.getString(6);
				String emblem_3 = rs.getString(7);
				
				RCdto = new RankingCountryDTO(rank, profile_Img, nickname, accuracy, emblem_1, emblem_2, emblem_3);
				RClist.add(RCdto);

			};
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return RClist;
	}
	
	public ArrayList<RankingCountryDTO> select_Cranking_home() {
		ArrayList<RankingCountryDTO> RCHlist = new ArrayList<RankingCountryDTO>();
		
		RankingCountryDTO RCdto = null;
		
		conn();
		
		try {
			String sql = "select rank_30.*, sum_score.rank from (SELECT ROW_NUMBER() OVER (ORDER BY MAX(a.user_accuracy) DESC) as rank, (SELECT b.profile_img FROM members b WHERE a.id = b.id) as profile_img, (SELECT b.nickname FROM members b WHERE a.id = b.id) as nickname, MAX(a.user_accuracy) as accuracy, (SELECT b.emblem_1 FROM members b WHERE a.id = b.id) as emblem_1, (SELECT b.emblem_2 FROM members b WHERE a.id = b.id) as emblem_2, (SELECT b.emblem_3 FROM members b WHERE a.id = b.id) as emblem_3, (SELECT b.country FROM members b WHERE a.id = b.id) as country FROM mydanceinfos a GROUP BY a.id)rank_30 join (select rank() over(order by sum(user_accuracy) desc) as rank, x.country, sum(user_accuracy) from (select a.nickname, a.country, max(b.user_accuracy) as user_accuracy from members a join mydanceinfos b on a.id=b.id group by a.nickname, a.country) x group by x.country) sum_score on rank_30.country = sum_score.country where sum_score.rank = 1";
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
				String country = rs.getString(8);
				String countryrank = rs.getString(9);
				
				RCdto = new RankingCountryDTO(rank, profile_Img, nickname, accuracy, emblem_1, emblem_2, emblem_3, country, countryrank);
				RCHlist.add(RCdto);

			};
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return RCHlist;
	}
	
	public ArrayList<RankingCountryDTO> showSum() {
		ArrayList<RankingCountryDTO> CVlist = new ArrayList<RankingCountryDTO>();
		
		RankingCountryDTO rankingCVdto = null;
		
		conn();
		
		try {
			String sql = "select y.* from (select rank() over(order by sum(user_accuracy) desc) as rank, x.country, sum(user_accuracy) from (select a.nickname, a.country, max(b.user_accuracy) as user_accuracy from members a join mydanceinfos b on a.id=b.id group by a.nickname, a.country) x group by x.country) y";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int rank = rs.getInt(1);
				String country = rs.getString(2);
				int sum = rs.getInt(3);
				
				rankingCVdto = new RankingCountryDTO(rank, country, sum);
				CVlist.add(rankingCVdto);

			};
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return CVlist;
	}
	
	
	
	
	
	
	
}
