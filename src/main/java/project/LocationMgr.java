package project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Vector;


public class LocationMgr {

	private DBConnectionMgr pool;
	private final SimpleDateFormat SDF_DATE =
			new SimpleDateFormat("yyyy'년'  M'월' d'일' (E)");
	private final SimpleDateFormat SDF_TIME =
			new SimpleDateFormat("H:mm:ss");
	
	//업로드 파일 저장 위치
	public static final String SAVEFOLDER ="C:/Jsp/myapp/src/main/webapp/ch13/storage/";
	//업로드 파일 인코딩
	public static final String ENCODING = "UTF-8";
	//업로드 파일 크기
	public static final int MAXSIZE = 1024*1024*30; // 30mb
	
	
	public LocationMgr(){
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
			}
	}
	
	
	//헬스장 이름 전체 받아오기
	public Vector<LocationBean> getLocaName(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<LocationBean> vlist = new Vector<LocationBean>();
		try {
			con = pool.getConnection();
			sql = "select id from locationsa";
			pstmt = con.prepareStatement(sql);
					
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				LocationBean  bean = new LocationBean();
				bean.setId(rs.getString("id"));			
				vlist.addElement(bean);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	
	//헬스장 이름으로 num 검색
	public int getHnum(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int num = 0;
		try {
			con = pool.getConnection();
			sql = "select num from locationsa where id =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			   if (rs.next()) {
			        num = rs.getInt(1);
			    }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return num;
	}
	
	
	//헬스장 num 으로 이름 검색
	public String getHname(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String id = null;
		try {
			con = pool.getConnection();
			sql = "select id from locationsa where num =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			   if (rs.next()) {
			        id = rs.getString(1);
			    }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return id;
	}
	

	
	
	// ---------------회사 ---------------------------
	
	
	//회사 이름 전체 받아오기
	public Vector<CompanyBean> getComName(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<CompanyBean> vlist = new Vector<CompanyBean>();
		try {
			con = pool.getConnection();
			sql = "select id from companysa";
			pstmt = con.prepareStatement(sql);
					
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				CompanyBean  bean = new CompanyBean();
				bean.setId(rs.getString("id"));			
				vlist.addElement(bean);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	
	//회사 이름으로 num 검색
	public int getCnum(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int num = 0;
		try {
			con = pool.getConnection();
			sql = "select num from companysa where id =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			   if (rs.next()) {
			        num = rs.getInt(1);
			    }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return num;
	}
	
	
}
