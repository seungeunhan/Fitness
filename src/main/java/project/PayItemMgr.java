package project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

public class PayItemMgr {

		private DBConnectionMgr pool;
		private final SimpleDateFormat SDF_DATE =
				new SimpleDateFormat("yyyy'년'  M'월' d'일' (E)");
		private final SimpleDateFormat SDF_TIME =
				new SimpleDateFormat("H:mm:ss");
		
		public PayItemMgr(){
			try {
				pool = DBConnectionMgr.getInstance();
			} catch (Exception e) {
				e.printStackTrace();
				}
		}
		
		
		//유저 num로 구매 상품 번호 찾기
		public int getItemNum(int num) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			int id = 0;
			try {
				con = pool.getConnection();
				sql = "select itemnum from payitems where usernum = ? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1,num);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					id = rs.getInt(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return id;
		}
		
		
		//유저 num으로 상품이름 찾기
		public String getItemNameByUserNum(int userNum) {
		    Connection con = null;
		    PreparedStatement pstmt = null;
		    ResultSet rs = null;
		    String sql = null;
		    String name = null;
		    try {
		        con = pool.getConnection();
		        sql = "SELECT h.name FROM payitems p JOIN healthitem h ON p.itemnum = h.num WHERE p.usernum = ?";
		        pstmt = con.prepareStatement(sql);
		        pstmt.setInt(1, userNum);
		        rs = pstmt.executeQuery();
		        
		        if(rs.next()) {
		            name = rs.getString(1);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    } finally {
		        pool.freeConnection(con, pstmt, rs);
		    }
		    return name;
		}
		
		
}
