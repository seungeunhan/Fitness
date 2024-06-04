package project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Vector;

public class QnaMgr {
			
	private DBConnectionMgr pool;
	private final SimpleDateFormat SDF_DATE =
			new SimpleDateFormat("yyyy'년'  M'월' d'일' (E)");
	private final SimpleDateFormat SDF_TIME =
			new SimpleDateFormat("H:mm:ss");
	
	public QnaMgr(){
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
			}
	}
	
	
	
	//QnA 최근한달 작성일순으로 보기
	public Vector<QnaBean> getListQna(){
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql = null;
	      Vector<QnaBean> vlist = new  Vector<QnaBean>();
		
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM qnasa WHERE date >= DATE_SUB(NOW(), INTERVAL 1 MONTH) ORDER BY date DESC";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				QnaBean bean = new QnaBean();
				
				bean.setNum(rs.getInt("num"));
				bean.setTitle(rs.getString("title"));
				bean.setContent(rs.getString("content"));
				
				String qnaDate = SDF_DATE.format(rs.getDate("date"));
				bean.setDate(qnaDate);
				
				bean.setUsernum(rs.getInt("usernum"));
				bean.setIp(rs.getString("ip"));
				bean.setSecret(rs.getBoolean("secret"));
				bean.setFrnum(rs.getInt("frnum"));
				bean.setAnsflag(rs.getBoolean("ansflag"));
	            
	            vlist.addElement(bean);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	
	//QnA 작성일순으로 보기
	public Vector<QnaBean> getAllQna(){
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql = null;
	      Vector<QnaBean> vlist = new  Vector<QnaBean>();
		
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM qnasa  ORDER BY date DESC";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				QnaBean bean = new QnaBean();
				
				bean.setNum(rs.getInt("num"));
				bean.setTitle(rs.getString("title"));
				bean.setContent(rs.getString("content"));
				
				String qnaDate = SDF_DATE.format(rs.getDate("date"));
				bean.setDate(qnaDate);
				
				bean.setUsernum(rs.getInt("usernum"));
				bean.setIp(rs.getString("ip"));
				bean.setSecret(rs.getBoolean("secret"));
				bean.setFrnum(rs.getInt("frnum"));
				bean.setAnsflag(rs.getBoolean("ansflag"));
	            
	            vlist.addElement(bean);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	
}
