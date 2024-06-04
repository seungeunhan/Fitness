package project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Vector;

public class ReservMgr {
	private DBConnectionMgr pool;
	private final SimpleDateFormat SDF_DATE =
			new SimpleDateFormat("yyyy'년'  M'월' d'일' (E)");
	private final SimpleDateFormat SDF_TIME =
			new SimpleDateFormat("H:mm:ss");
	
	public ReservMgr(){
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
			}
	}
	
	
	//상담내역 날짜 최근한달 내림차순 보기
	public Vector<ReservationBean> getListReserv(){
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql = null;
	      Vector<ReservationBean> vlist = new  Vector<ReservationBean>();
		
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM reservationsa WHERE reservdate >= DATE_SUB(NOW(), INTERVAL 1 MONTH) ORDER BY reservdate DESC";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ReservationBean bean = new ReservationBean();
				
				bean.setNum(rs.getInt("num"));
				bean.setUsernum(rs.getInt("user"));
				bean.setName(rs.getString("name"));
				bean.setPhonenum(rs.getString("phone"));
				bean.setEmail(rs.getString("email"));
				bean.setPopulation(rs.getInt("population"));
				bean.setCcflag(rs.getBoolean("ccflag"));
				bean.setFrnum(rs.getInt("frnum"));			
				
	            String reservDate = SDF_DATE.format(rs.getDate("reservdate"));
	            bean.setReservdate(reservDate);
	            
				bean.setCarflag(rs.getBoolean("carflag"));
	            
	            vlist.addElement(bean);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	
	//상담내역 날짜  내림차순 보기
	public Vector<ReservationBean> getAllReserv(){
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql = null;
	      Vector<ReservationBean> vlist = new  Vector<ReservationBean>();
		
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM reservationsa ORDER BY reservdate DESC";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ReservationBean bean = new ReservationBean();
				
				bean.setNum(rs.getInt("num"));
				bean.setUsernum(rs.getInt("user"));
				bean.setName(rs.getString("name"));
				bean.setPhonenum(rs.getString("phone"));
				bean.setEmail(rs.getString("email"));
				bean.setPopulation(rs.getInt("population"));
				bean.setCcflag(rs.getBoolean("ccflag"));
				bean.setFrnum(rs.getInt("frnum"));			
				
	            String reservDate = SDF_DATE.format(rs.getDate("reservdate"));
	            bean.setReservdate(reservDate);
	            
				bean.setCarflag(rs.getBoolean("carflag"));
				bean.setFnflag(rs.getBoolean("fnflag"));
	            
	            vlist.addElement(bean);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	
	//상담완료처리
	public boolean updateFinish(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "update reservationsa set  fnflag = 1  where num = ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);

			if(pstmt.executeUpdate()==1) flag = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	
	
//--------------------------------------DB데이터 입력-----------------------	
	
	
	//예약 신청 500개
	public void reserve500(){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert reservationsa(user, name, phone, email, population, ccflag, frnum, reservdate, carflag, fnflag)";
			sql+="values(?,'aaa','111-1111','aaa@aaa.aaa',10,0,1,now(),1,0);";
			pstmt = con.prepareStatement(sql);
			for (int i = 1; i < 501; i++) {
				pstmt.setInt(1,i);
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	
	
//	public static void main(String[] args) {
//		ReservMgr mgr = new ReservMgr();
//		mgr.reserve500();
//		System.out.println("입력성공");
//	}
//	
	
	
	
}
