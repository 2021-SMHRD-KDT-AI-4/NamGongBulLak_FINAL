package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductBuyinfoDAO {
	
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
	
	public int buy(ProductBuyInfoDTO dto) {
		conn();
		
		String sql = "insert into productbuyinfos values(buy_seq.nextval, ?, ?, sysdate)";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getId());
			psmt.setInt(2, dto.getP_code());
			
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return cnt;
	}
	
	public ArrayList<ProductBuyInfoDTO> showProduct() {

		ArrayList<ProductBuyInfoDTO> list = new ArrayList<ProductBuyInfoDTO>();
		
		conn();
		
		String sql = "select * from productbuyinfos order by p_date desc";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int buy_seq = rs.getInt("buy_seq");
				String id = rs.getString("id");
				int p_code = rs.getInt("p_code");
				String p_date = rs.getString("p_date");
				
				ProductBuyInfoDTO dto = new ProductBuyInfoDTO(buy_seq, id, p_code, p_date); // dto로 묶음
				list.add(dto); // arraylist에 추가
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}
public String[] selectedVirtualFace(String id) {
		
		String[] list = new String[2];
	
		conn();
		
		String sql = "SELECT a.virtual_face, c.p_name FROM MEMBERS a, productbuyinfos b, productinfos c WHERE a.id = ? AND a.id = b.id AND b.p_code = c.p_code AND a.virtual_face = c.p_filename";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				list[0] =  rs.getString(1);
				list[1] = rs.getString(2);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
		
	}
	
	public ArrayList<ProductBuyInfoDTO> showVirtualFace(String id) {
		
		ArrayList<ProductBuyInfoDTO> list = new ArrayList<ProductBuyInfoDTO>();
		
		conn();
		
		String sql = "SELECT a.virtual_face, c.p_name, c.p_filename FROM members a, productbuyinfos b, productinfos c WHERE a.id = ? AND a.id = b.id AND b.p_code = c.p_code AND c.p_category = 3 ORDER BY b.p_date";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				String virtual_face = rs.getString("virtual_face");
				String p_name = rs.getString("p_name");
				String p_filename = rs.getString("p_filename");
				
				ProductBuyInfoDTO dto = new ProductBuyInfoDTO(virtual_face, p_name, p_filename);
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}
	
	public void updateVirtualFace(String virtual_face, String id) {
		conn();
		
		String sql = "UPDATE members SET virtual_face = ? WHERE id = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, virtual_face);
			psmt.setString(2, id);
			
			cnt = psmt.executeUpdate();
			
			if (cnt >0) {
				System.out.println("버츄얼페이스 업데이트 완료");
			} else {
				System.out.println("버츄얼페이스 업데이트 실패");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
	}

}
