package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductinfoDAO {
	
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
	
	public ArrayList<ProductinfoDTO> showProduct() {

		ArrayList<ProductinfoDTO> list = new ArrayList<ProductinfoDTO>();
		
		conn();
		
		String sql = "select * from productinfos order by p_name desc";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int p_code = rs.getInt("p_code");
				String p_name = rs.getString("p_name");
				String p_filename = rs.getString("p_filename");
				int p_category = rs.getInt("p_category");
				
				ProductinfoDTO dto = new ProductinfoDTO(p_name, p_filename, p_category, p_code); // dto로 묶음
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
