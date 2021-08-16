package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MainRankingDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	int cnt = 0;

	public void conn() {
		
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
	
	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<String> load_country() {
		
		ArrayList<String> list = new ArrayList<String>();
		
		try {
			conn();
			
			String sql = "select distinct country from members";
			
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				list.add(rs.getString(1));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}

	public int sumacc(String country) {
		
		int acc = 0;
		
		try {
			conn();
			
			String sql = "select sum(user_accuracy) from mydanceinfos where id in (select id from members where country=?)";
			
			ps=conn.prepareStatement(sql);
			
			ps.setString(1, country);
			
			rs= ps.executeQuery();
			
			if(rs.next()) {
				acc = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return acc;
	}

	public ArrayList<MainRankingDTO> load_top3_acc(String country) {
		
		ArrayList<MainRankingDTO> list = new ArrayList<MainRankingDTO>();
		int cnt = 0;
		
		try {
			conn();
			
			String sql = "select distinct ms.nickname, my.user_accuracy, my.season from MEMBERS ms, mydanceinfos my where ms.id=my.id and ms.country=? order by my.user_accuracy desc";
			
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, country);
			
			rs = ps.executeQuery();
			
			while(rs.next()&&cnt!=3) {
				
				System.out.println(cnt+"///");
				
				int acc = rs.getInt("user_accuracy");
				
				String nickname = rs.getString("nickname");
				String season = rs.getString("season");
				
				MainRankingDTO dto = new MainRankingDTO(nickname,acc,season);
				
				list.add(dto);
				cnt+=1;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
}
