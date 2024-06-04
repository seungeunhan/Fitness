package kimJeongTae;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.HashSet;
import java.util.Vector;

public class TrainScheduleMgr {
	
	private DBConnectionMgr pool;
	
	public TrainScheduleMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getTrainerName(int trainerNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String name = "x";

		try {
			con = pool.getConnection();
			sql = "SELECT name\r\n"
					+ "FROM trainer\r\n"
					+ "JOIN user ON trainer.user = user.num\r\n"
					+ "WHERE trainer.num = ?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, trainerNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				name = rs.getString(1);				
			}
				
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return name;
	}
	
	public Vector<TrainScheduleBean> getTrainSchedule(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<TrainScheduleBean> vlist = new Vector<TrainScheduleBean>();
		try {
			con = pool.getConnection();
			sql = "SELECT *\r\n"
					+ "FROM trainschedule;";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {	
				TrainScheduleBean bean = new TrainScheduleBean();
			    bean.setNum(rs.getInt("num"));
			    bean.setUser(rs.getInt("user"));
			    bean.setTrainer(rs.getInt("trainer"));
			    bean.setLcontent(rs.getInt("lcontent"));
			    bean.setDate(rs.getString("date"));
			    bean.setStarttime(rs.getString("starttime"));
			    bean.setEndtime(rs.getString("endtime"));
			    bean.setFrnum(rs.getInt("frnum"));
			    
			    vlist.add(bean);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return vlist;
	}
	
	public Date getTrainDate(int trainNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Date date = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			con = pool.getConnection();
			sql = "SELECT *\r\n"
					+ "FROM trainschedule\r\n"
					+ "WHERE trainschedule.num = ?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, trainNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {	
				date = sdf.parse(rs.getString("date"));
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return date;
	}
	
	//scheduleApplicationFrom.jsp수강신청 메서드
	public void scheduleApplicationFrom(int scheduleNum,int userNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			con = pool.getConnection();
			sql = "UPDATE trainschedule\r\n"
					+ "SET user = ?\r\n"
					+ "WHERE num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			pstmt.setInt(2, scheduleNum);
			
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt);
		}
		return;
	}
	//scheduleCancleProc.jsp수강취소 메서드
	public void scheduleCancleFrom(int scheduleNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update trainschedule\r\n"
					+ "SET user = '0'\r\n"
					+ "WHERE num = ?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, scheduleNum);
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt);
		}
		return;
	}
	//트레이너 이름찾기 기능
	public String selectTrainerName(int userNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String name = "이름못찾음";
		
		try {
			con = pool.getConnection();
			sql = "SELECT *\r\n"
					+ "FROM user\r\n"
					+ "WHERE num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				name = rs.getString("name");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		
		
		return name;
	}
	//트레이너 스케줄 일정 insert
	public void insertTrainerSchedule(TrainScheduleBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "INSERT INTO trainschedule (trainer, lcontent, DATE, starttime, endtime) "
					+ "VALUES (?, ?, ?, ?, ?);";
			
			pstmt = con.prepareStatement(sql);
			
			
			pstmt.setInt(1, bean.getTrainer());
			pstmt.setInt(2, bean.getLcontent());
			pstmt.setString(3, bean.getDate());
			pstmt.setString(4, bean.getStarttime());
			pstmt.setString(5, bean.getEndtime());
			
			
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt);
		}
		return;
	}
	//트레이너 번호 select
	public int selectTrainerNum(int userNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int num = 0;
		
		try {
			con = pool.getConnection();
			sql = "SELECT *\r\n"
					+ "FROM trainer\r\n"
					+ "WHERE user = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				num = rs.getInt("num");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		
		
		return num;
	}
	
	public void trainerScheduleCancleFrom(int scheduleNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "DELETE FROM trainschedule\r\n"
					+ "WHERE num = ?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,scheduleNum);
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt);
		}
		return;
		
	}
	//===============================스케줄 사이드 컨텐츠==============================================
	public Vector<PayitemsBean> getPayitemsList(int userNum) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		System.out.println("*********" + userNum);
		Vector<PayitemsBean> vlist01 = new Vector<PayitemsBean>();
		try {
			con = pool.getConnection();
			sql = "SELECT * "
					+ "FROM payitems "
					+ "WHERE payflag = 1 and payback = 0 AND user = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				PayitemsBean bean = new PayitemsBean();
				bean.setNum(rs.getInt("num"));
				bean.setUser(rs.getInt("user"));
				bean.setPaydate(rs.getString("paydate"));
				bean.setItem(rs.getInt("item"));
				bean.setPayflag(rs.getBoolean("payflag"));
				bean.setCcflag(rs.getBoolean("ccflag"));
				bean.setPayback(rs.getBoolean("payback"));
				
				vlist01.add(bean);			
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return vlist01;
	}
	
	public healthitemBean userItem(int userNum) {
		PayitemsBean item = null;
		Vector<PayitemsBean> payItemList = getPayitemsList(userNum);
		//가장 최근의 구매 상품 불러오기
		if(payItemList.size()==0) {
			healthitemBean item02 = new healthitemBean();
			return item02;
		}
		item = payItemList.get(0);
		for (int i = 0; i < payItemList.size(); i++) {
			if(payItemList.get(i).getNum()>item.getNum()) {
				item = payItemList.get(i);
			}
		}
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		healthitemBean item01 = new healthitemBean();
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM healthitem "
					+ "WHERE num = ?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, item.getItem());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				item01.setNum(rs.getInt("num"));
				item01.setItemname(rs.getString("itemname"));
				item01.setHcontent(rs.getString("hcontent"));
				//날짜 처리해서 보내주기
		        LocalDate date1 = LocalDate.parse(item.getPaydate());
		        LocalDate date2 = LocalDate.parse(rs.getString("fcperiod"));

		        LocalDate newDate = date1.plusYears(date2.getYear())
		                                .plusMonths(date2.getMonthValue())
		                                .plusDays(date2.getDayOfMonth());
				item01.setFcperiod(newDate.toString());
				//gx와 pt횟수 계산해서 보내주기
				item01.setPtnum(rs.getInt("ptnum"));
				item01.setGxnum(rs.getInt("gxnum"));
				item01.setFrnum(rs.getInt("frnum"));
				item01.setSellperiod(rs.getString("sellperiod"));
				item01.setPrice(rs.getInt("price"));
				item01.setSellflag(rs.getBoolean("sellflag"));
				System.out.println(item01.getNum());
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		
		return item01;
	}
	
	public UserBean getUserBean(String userId) {
		UserBean userbean = new UserBean();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "SELECT*\r\n"
					+ "FROM user\r\n"
					+ "WHERE id = ?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {	
				userbean.setNum(rs.getInt(1));
				userbean.setId(rs.getString(2));
				userbean.setPwd(rs.getString(3));
				userbean.setName(rs.getString(4));
				userbean.setGander(rs.getBoolean(5));
				userbean.setBirth(rs.getString(6));
				userbean.setEmail(rs.getString(7));
				userbean.setPostnum(rs.getString(8));
				userbean.setPhontnum(rs.getString(9));
				userbean.setCity(rs.getString(10));
				userbean.setStreetaddr(rs.getString(11));
				userbean.setJoindate(rs.getString(12));
				userbean.setPoint(rs.getInt(13));
				userbean.setSns(rs.getInt(14));
				userbean.setSnsid(rs.getString(15));
				userbean.setSnspwd(rs.getString(16));
				userbean.setAuthority(rs.getInt(17));
				userbean.setCompany(rs.getInt(18));
				userbean.setFrnum(rs.getInt(19));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		
		return userbean;
	}
	//========================예약 정보=================================================
	public ReservationBean getReservationBean(int user) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ReservationBean bean = new ReservationBean();
		try {
			con = pool.getConnection();
			sql = "SELECT *\r\n"
					+ "FROM reservation\r\n"
					+ "WHERE user = ?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, user);
			rs = pstmt.executeQuery();
			if(rs.next()) {	
				bean.setNum(rs.getInt(1));
				bean.setUser(rs.getInt(2));
				bean.setName(rs.getString(3));
				bean.setPhonenum(rs.getString(4));
				bean.setEmail(rs.getString(5));
				bean.setPopulation(rs.getInt(6));
				bean.setCcflag(rs.getBoolean(7));
				bean.setFrnum(rs.getInt(8));
				bean.setReservdate(rs.getString(9));
				bean.setCarflag(rs.getBoolean(10));
				bean.setUserflag(rs.getBoolean(11));
			}else {
				bean.setNum(0);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return bean;
	}
	
	public void updateReservationBean(ReservationBean rBean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "UPDATE reservation\r\n"
					+ "SET phonenum = ?,email=?,population = ?,carflag = ?,reservdate = ?\r\n"
					+ "WHERE user = ?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rBean.getPhonenum());
			pstmt.setString(2, rBean.getEmail());
			pstmt.setInt(3, rBean.getPopulation());
			pstmt.setBoolean(4, rBean.getCarflag());
			pstmt.setString(5, rBean.getReservdate());
			pstmt.setInt(6, rBean.getUser());
			
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt);
		}
		return;
		
		
	}
	
	public void deleteReservationBean(int userNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "DELETE FROM reservation WHERE user = ?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt);
		}
		return;
		
	}
	
	//==========================구매 내역================================================
	public Vector<PayitemsBean> getUserPayItemList(int userNum){
		
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = null;
				
				Vector<PayitemsBean> vlist01 = new Vector<PayitemsBean>();
				try {
					con = pool.getConnection();
					sql = "SELECT *\r\n"
							+ "FROM payitems\r\n"
							+ "WHERE user = ?;";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, userNum);
					rs = pstmt.executeQuery();
					while(rs.next()) {
						PayitemsBean bean = new PayitemsBean();
						bean.setNum(rs.getInt("num"));
						bean.setUser(rs.getInt("user"));
						bean.setPaydate(rs.getString("paydate"));
						bean.setItem(rs.getInt("item"));
						bean.setPayflag(rs.getBoolean("payflag"));
						bean.setCcflag(rs.getBoolean("ccflag"));
						bean.setPayback(rs.getBoolean("payback"));
						
						vlist01.add(bean);			
					}
				}catch (Exception e) {
					e.printStackTrace();
				}finally {
					pool.freeConnection(con,pstmt,rs);
				}
				return vlist01;
	}

	public Vector<ChargeinfoBean> getUserChargeinfoList(int userNum){
		Vector<ChargeinfoBean> vlist = new Vector<ChargeinfoBean>();
		
		
		
		
		return vlist;
	}
	
	//========================== 개인 정보 =================================
	public UserBean getUserBean(int userNum) {
		UserBean userbean = new UserBean();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "SELECT*\r\n"
					+ "FROM user\r\n"
					+ "WHERE num = ?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {	
				userbean.setNum(rs.getInt(1));
				userbean.setId(rs.getString(2));
				userbean.setPwd(rs.getString(3));
				userbean.setName(rs.getString(4));
				userbean.setGander(rs.getBoolean(5));
				userbean.setBirth(rs.getString(6));
				userbean.setEmail(rs.getString(7));
				userbean.setPostnum(rs.getString(8));
				userbean.setPhontnum(rs.getString(9));
				userbean.setCity(rs.getString(10));
				userbean.setStreetaddr(rs.getString(11));
				userbean.setJoindate(rs.getString(12));
				userbean.setPoint(rs.getInt(13));
				userbean.setSns(rs.getInt(14));
				userbean.setSnsid(rs.getString(15));
				userbean.setSnspwd(rs.getString(16));
				userbean.setAuthority(rs.getInt(17));
				userbean.setCompany(rs.getInt(18));
				userbean.setFrnum(rs.getInt(19));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		
		return userbean;
	}
	
	public void updateUserBean(UserBean userbean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = null;
		
		try {
			con = pool.getConnection();
			sql = "UPDATE user\r\n"
					+ "SET phontnum = ?, email = ?, pwd = ?, streetaddr = ?\r\n"
					+ "WHERE num = ?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userbean.getPhontnum());
			pstmt.setString(2, userbean.getEmail());
			pstmt.setString(3, userbean.getPwd());
			pstmt.setString(4, userbean.getStreetaddr());
			pstmt.setInt(5, userbean.getNum());
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt);
		}
		return;
	}
	
	
}





















