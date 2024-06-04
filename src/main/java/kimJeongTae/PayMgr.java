package kimJeongTae;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class PayMgr {

	private DBConnectionMgr pool;
	
	public PayMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//상품 리스트 select
	public Vector<healthitemBean> ItemListSelect() {
		Vector<healthitemBean> vlist = new Vector<healthitemBean>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "SELECT *\r\n"
					+ "FROM healthitem;";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {	
				healthitemBean bean = new healthitemBean();
			    bean.setNum(rs.getInt("num"));
			    bean.setItemname(rs.getString("itemname"));
			    bean.setHcontent(rs.getString("hcontent"));
			    bean.setFcperiod(rs.getString("fcperiod"));
			    
			    bean.setPtnum(rs.getInt("ptnum"));
			    bean.setGxnum(rs.getInt("gxnum"));
			    bean.setFrnum(rs.getInt("frnum"));
			    bean.setSellperiod(rs.getString("sellperiod"));
			    bean.setPrice(rs.getInt("price"));
			    bean.setSellflag(rs.getBoolean("sellflag"));
			    
			    vlist.add(bean);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return vlist;
	}
	//유저정보 select
	public UserBean UserSelect(String id) {
		UserBean user = new UserBean();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;

		try {
			con = pool.getConnection();
			sql = "SELECT *\r\n"
					+ "FROM user\r\n"
					+ "WHERE id = ?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				user.setNum(rs.getInt("num"));
				user.setId(rs.getString("id"));
				user.setPwd(rs.getString("pwd"));
				user.setName(rs.getString("name"));
				user.setGander(rs.getBoolean("gender"));
				user.setBirth(rs.getString("birth"));
				user.setEmail(rs.getString("email"));
				user.setPostnum(rs.getString("postnum"));
				user.setPhontnum(rs.getString("phontnum"));
				user.setCity(rs.getString("city"));
				user.setStreetaddr(rs.getString("streetaddr"));
				user.setJoindate(rs.getString("joindate"));
				user.setPoint(rs.getInt("point"));
				user.setSns(rs.getInt("sns"));
				user.setSnsid(rs.getString("snsid"));
				user.setSnspwd(rs.getString("snspwd"));
				user.setAuthority(rs.getInt("authority"));
				user.setCompany(rs.getInt("company"));
				user.setFrnum(rs.getInt("frnum"));
			}
				
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		
		return user;
	}
	//구매가능여부 채크(결제전 확인)
	public boolean CheckUserItem(String id) {
		boolean flag = false;
		//payitem본인 아이템 확인한다(payitems에서 트레이너 스케줄에서 사용 내역확인해서 카운터가 0이거나 기한이 null이면 결제진행).
		PayitemsBean payitem = new PayitemsBean();
		UserBean user = new UserBean();
		user = UserSelect(id);
		payitem = selectPayitem(user.getNum());
		//구매한 상품이 없을때
		if(payitem==null) flag = true;
		//구매한 상품의 시설 이용기한만 있을때
		if(payitem.getPtdate()==null&&payitem.getGxdate()==null) {
			//피티와 지액스 상품이 남지 않을때
			flag = true;
		}
		System.out.println(flag);
		return flag;
	}
	//유저의 페이아이템 찾기
	public PayitemsBean selectPayitem(int num) {
		PayitemsBean bean = new PayitemsBean();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "SELECT *\r\n"
					+ "FROM payitems\r\n"
					+ "WHERE user = ?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setNum(rs.getInt("num"));
				bean.setUser(rs.getInt("user"));
				bean.setPaydate(rs.getString("paydate"));
				bean.setOpdate(rs.getString("opdate"));
				bean.setPtdate(rs.getString("ptdate"));
				bean.setGxdate(rs.getString("gxdate"));
				bean.setItem(rs.getInt("item"));
				bean.setPayflag(rs.getBoolean("payflag"));
				bean.setCcflag(rs.getBoolean("payflag"));
				bean.setPayback(rs.getBoolean("payback"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		System.out.println(bean.getUser());
		return bean;
	}
	//아이템 이름으로 아이템 번호 리턴받기
	public int SelectItemNum(String itemName) {
		int itemNum = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "SELECT num\r\n"
					+ "FROM healthitem\r\n"
					+ "WHERE itemname = ?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, itemName);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				itemNum = rs.getInt("num");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return itemNum;
	}
	//아이템 번호 기반으로 아이템정보를 받아와야한다.
	public healthitemBean SelectHealthitem(int itemNum) {
		healthitemBean bean = new healthitemBean();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "SELECT *\r\n"
					+ "FROM healthitem\r\n"
					+ "WHERE num = ?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, itemNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setNum(rs.getInt("num"));
				bean.setItemname(rs.getString("itemname"));
				bean.setHcontent(rs.getString("hcontent"));
				bean.setFcperiod(rs.getString("fcperiod"));
				bean.setPtnum(rs.getInt("ptnum"));
				bean.setGxnum(rs.getInt("gxnum"));
				bean.setFrnum(rs.getInt("frnum"));
				bean.setSellperiod(rs.getString("sellperiod"));
				bean.setPrice(rs.getInt("price"));
				bean.setSellflag(rs.getBoolean("sellflag"));
				bean.setDeadlinedate(rs.getString("deadlinedate"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		
		
		return bean;
	}
	//결제이후 payitem 행 추가하기
	public void InsertPayitem(PayitemsBean insertPayitem) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "INSERT INTO payitems (num,user,paydate,opdate,ptdate,gxdate,item,payflag,ccflag,payback)\r\n"
					+ "VALUES (NULL,?,?,?,?,?,?,?,?,?);";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, insertPayitem.getUser());
			pstmt.setString(2, insertPayitem.getPaydate());
			pstmt.setString(3, insertPayitem.getOpdate());
			pstmt.setString(4, insertPayitem.getPtdate());
			pstmt.setString(5, insertPayitem.getGxdate());
			pstmt.setInt(6, insertPayitem.getItem());
			pstmt.setBoolean(7, insertPayitem.getPayflag());
			pstmt.setBoolean(8, insertPayitem.getCcflag());
			pstmt.setBoolean(9, insertPayitem.getPayback());
			
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt);
		}
		return;
	}
	//결제이후 chargeinfo 행 삽입
	public void insertChargeinfo(ChargeinfoBean chargeinfo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "INSERT INTO chargeinfo (num,user,item,code,price,date,chamet,ccflag)\r\n"
					+ "VALUES (NULL,?,?,?,?,?,?,?);";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, chargeinfo.getUser());
			pstmt.setInt(2, chargeinfo.getItem());
			pstmt.setString(3, chargeinfo.getCode());
			pstmt.setInt(4, chargeinfo.getPrice());
			pstmt.setString(5, chargeinfo.getDate());
			pstmt.setString(6, chargeinfo.getChamet());
			pstmt.setBoolean(7, chargeinfo.getCcflag());
			
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt);
		}
		return;
	}
	
}







