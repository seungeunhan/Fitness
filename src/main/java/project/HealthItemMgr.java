package project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

public class HealthItemMgr {

		private DBConnectionMgr pool;
		private final SimpleDateFormat SDF_DATE =
				new SimpleDateFormat("yyyy'년'  M'월' d'일' (E)");
		private final SimpleDateFormat SDF_TIME =
				new SimpleDateFormat("H:mm:ss");
		
		public HealthItemMgr(){
			try {
				pool = DBConnectionMgr.getInstance();
			} catch (Exception e) {
				e.printStackTrace();
				}
		}
		
		
		//itemnum으로 상품 이름 찾기
		public String getItemName(int item) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			String name = null;
			try {
				con = pool.getConnection();
				sql = "select name from healthitem where num = ? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1,item);
				rs = pstmt.executeQuery();
				while(rs.next()) {
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
		
