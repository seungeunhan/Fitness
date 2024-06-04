package hanSeungEun;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import hanSeungEun.ReservationBean;

public class ReservationMgr {
	private DBConnectionMgr pool;

	public ReservationMgr() {
		pool = DBConnectionMgr.getInstance();
	}

	// 지점명 목록을 반환하는 메서드
	public List<String> getBranches() {
		List<String> branches = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = pool.getConnection();
			String sql = "select city from location";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				String branchId = rs.getString("city");
				branches.add(branchId);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return branches;
	}

	// 회원, 비회원 예약
	public boolean inRes(ReservationBean bean, String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			if(id!=null) {
				//회원예약
				UserMgr uMger = new UserMgr();
				UserBean uBean = uMger.getMember(id);
				bean.setUser(uBean.getNum());
				bean.setName(uBean.getName());
				bean.setPhonenum(uBean.getPhone());
				bean.setEmail(uBean.getEmail());
				bean.setFrnum(uBean.getFrnum());
			}
			sql = "insert into reservation (user, name, pwd, phonenum, population, frnum, reservdate, time) values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getUser());
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getPwd());
			pstmt.setString(4, bean.getPhonenum());
			pstmt.setInt(5, bean.getPopulation());
			pstmt.setInt(6, bean.getFrnum());
			pstmt.setString(7, bean.getReservdate());
			pstmt.setString(8, bean.getTime());
			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	
	// 예약번호 찾기
	public int findRev(String name, String phonenum, String pwd) {
		int revNum = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			String sql = "select num from reservation where name = ? and phonenum = ? and pwd = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phonenum);
			pstmt.setString(3, pwd);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				revNum = rs.getInt("num");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return revNum;
	}
	
	// 예약조회
		public ReservationBean checkRev(int num, String name, String phonenum, String pwd) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			ReservationBean bean = new ReservationBean();
			try {
				con = pool.getConnection();
				String sql = "select num, name, phonenum, population, frnum, reservdate, time from reservation where num = ? and name = ? and phonenum = ? and pwd = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, name);
				pstmt.setString(3, phonenum);
				pstmt.setString(4, pwd);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					bean.setNum(rs.getInt("num"));
					bean.setName(rs.getString("name"));
					bean.setPhonenum(rs.getString("phonenum"));
					bean.setPopulation(rs.getInt("population"));
					bean.setFrnum(rs.getInt("frnum"));
					bean.setReservdate(rs.getString("reservdate"));
					bean.setTime(rs.getString("time"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return bean;
		}
}
