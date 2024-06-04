package project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Vector;


public class ReviewMgr {
	private DBConnectionMgr pool;
	private final SimpleDateFormat SDF_DATE =
			new SimpleDateFormat("yyyy'년'  M'월' d'일' (E)");
	private final SimpleDateFormat SDF_TIME =
			new SimpleDateFormat("H:mm:ss");
	
	public ReviewMgr(){
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
			}
	}
	
	
	//후기 게시판 날짜 최근 한달 내림차순 보기
	public Vector<ReviewBean> getListReview(){
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql = null;
	      Vector<ReviewBean> vlist = new  Vector<ReviewBean>();
		
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM reviewsa WHERE date >= DATE_SUB(NOW(), INTERVAL 1 MONTH) ORDER BY date DESC";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ReviewBean bean = new ReviewBean();
				
				bean.setNum(rs.getInt("num"));
				bean.setTitle(rs.getString("title"));
				bean.setContent(rs.getString("content"));
	            String reviewDate = SDF_DATE.format(rs.getDate("date"));
	            bean.setDate(reviewDate);
				bean.setUsernum(rs.getInt("usernum"));
				bean.setIp(rs.getString("ip"));
				bean.setFrnum(rs.getInt("frnum"));
	            
	            vlist.addElement(bean);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	
	//후기 게시판 날짜 내림차순 보기
	public Vector<ReviewBean> getAllReview(){
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql = null;
	      Vector<ReviewBean> vlist = new  Vector<ReviewBean>();
		
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM reviewsa ORDER BY date DESC";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ReviewBean bean = new ReviewBean();
				
				bean.setNum(rs.getInt("num"));
				bean.setTitle(rs.getString("title"));
				bean.setContent(rs.getString("content"));
	            String reviewDate = SDF_DATE.format(rs.getDate("date"));
	            bean.setDate(reviewDate);
				bean.setUsernum(rs.getInt("usernum"));
				bean.setIp(rs.getString("ip"));
				bean.setFrnum(rs.getInt("frnum"));
	            
	            vlist.addElement(bean);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	
	
	//총 리뷰수
	public int getTotalReview(String keyField, String keyWord) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		try {
			con = pool.getConnection();
			if(keyWord.trim().equals("")|| keyWord==null) {
				//검색이 아닌 경우
				sql = "select count(*) from reviewsa";
				pstmt = con.prepareStatement(sql);
				
			}else {
			sql = "select count(*) from reviewsa where " + keyField + " like ?" ;
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,  "%"+keyWord+"%");
			}
			rs = pstmt.executeQuery();
			if(rs.next()) totalCount = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}
		
		
	
	
	
		
		
		//리뷰 리스트 검색 및 페이징 기능 추가
	public Vector<ReviewBean> getAllRevList(String keyField, String keyWord, int start, int cnt){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ReviewBean> vlist = new Vector<ReviewBean>();
		try {
			con = pool.getConnection();
			if(keyWord.trim().equals("")|| keyWord==null) {
				
				sql = "select * from reviewsa ORDER BY date DESC limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1 , start);
				pstmt.setInt(2, cnt);
			}else {		
				
			sql = "select * from reviewsa where " + keyField + " like ?  order by date desc limit ?,?" ;
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,  "%"+keyWord+"%");
			pstmt.setInt(2, start);
			pstmt.setInt(3, cnt);
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReviewBean bean = new ReviewBean();
				
				bean.setNum(rs.getInt("num"));
				bean.setTitle(rs.getString("title"));
				bean.setContent(rs.getString("content"));
	            String reviewDate = SDF_DATE.format(rs.getDate("date"));
	            bean.setDate(reviewDate);
				bean.setUsernum(rs.getInt("usernum"));
				bean.setIp(rs.getString("ip"));
				bean.setFrnum(rs.getInt("frnum"));
	            
	            vlist.addElement(bean);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return vlist;
	}
	
				
				//리뷰 삭제
				public void deleteReview(int num) {
					Connection con = null;
					PreparedStatement pstmt = null;
					String sql = null;
					try {
						con = pool.getConnection();
						sql = "delete from reviewsa where num = ?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1,num);
						pstmt.executeUpdate();
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt);
					}
					return;
				}
				
				
	//--------------------------------Qna ----------------------------------------
				
				
				
				//총 Qna수
				public int getTotalQna(String keyField, String keyWord) {
					
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					int totalCount = 0;
					try {
						con = pool.getConnection();
						if(keyWord.trim().equals("")|| keyWord==null) {
							//검색이 아닌 경우
							sql = "select count(*) from qnasa";
							pstmt = con.prepareStatement(sql);
							
						}else {
						sql = "select count(*) from qnasa where " + keyField + " like ?" ;
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1,  "%"+keyWord+"%");
						}
						rs = pstmt.executeQuery();
						if(rs.next()) totalCount = rs.getInt(1);
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return totalCount;
				}
					
					
				
				
				
					
					
					//Qna 리스트 검색 및 페이징 기능 추가
				public Vector<QnaBean> getAllQnaList(String keyField, String keyWord, int start, int cnt){
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					Vector<QnaBean> vlist = new Vector<QnaBean>();
					try {
						con = pool.getConnection();
						if(keyWord.trim().equals("")|| keyWord==null) {
							
							sql = "select * from Qnasa ORDER BY date DESC limit ?,?";
							pstmt = con.prepareStatement(sql);
							pstmt.setInt(1 , start);
							pstmt.setInt(2, cnt);
						}else {		
							
						sql = "select * from Qnasa where " + keyField + " like ?  order by date desc limit ?,?" ;
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1,  "%"+keyWord+"%");
						pstmt.setInt(2, start);
						pstmt.setInt(3, cnt);
						}
						
						rs = pstmt.executeQuery();
						
						while(rs.next()) {
							QnaBean bean = new QnaBean();
							
							bean.setNum(rs.getInt("num"));
							bean.setTitle(rs.getString("title"));
							bean.setContent(rs.getString("content"));
				            String reviewDate = SDF_DATE.format(rs.getDate("date"));
				            bean.setDate(reviewDate);
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
				
							
							//Qna 삭제
							public void deleteQna(int num) {
								Connection con = null;
								PreparedStatement pstmt = null;
								String sql = null;
								try {
									con = pool.getConnection();
									sql = "delete from qnasa where num = ?";
									pstmt = con.prepareStatement(sql);
									pstmt.setInt(1,num);
									pstmt.executeUpdate();
								} catch (Exception e) {
									e.printStackTrace();
								} finally {
									pool.freeConnection(con, pstmt);
								}
								return;
							}
							
							
							//Board Read: 13개의 컬럼 모두 리턴
							
							public QnaBean getBoard(int num) {
								Connection con = null;
								PreparedStatement pstmt = null;
								ResultSet rs = null;
								String sql = null;
								QnaBean bean = new QnaBean();
								try {
									con = pool.getConnection();
									sql = "select * from qnasa where num=?";
									pstmt = con.prepareStatement(sql);
									pstmt.setInt(1, num);
									rs = pstmt.executeQuery();
									
									if(rs.next()) {
										bean.setNum(rs.getInt("num"));
										bean.setTitle(rs.getString("title"));
										bean.setContent(rs.getString("content"));
							            String reviewDate = SDF_DATE.format(rs.getDate("date"));
							            bean.setDate(reviewDate);
										bean.setUsernum(rs.getInt("usernum"));
										bean.setIp(rs.getString("ip"));
										bean.setSecret(rs.getBoolean("secret"));
										bean.setFrnum(rs.getInt("frnum"));
										bean.setAnsflag(rs.getBoolean("ansflag"));
									}
								} catch (Exception e) {
									e.printStackTrace();
								} finally {
									pool.freeConnection(con, pstmt, rs);
								}
								
								return bean;
							}
							
							
							// 답변 데이터넣기
							public void InsertQna(int num, String content) {
								Connection con = null;
								PreparedStatement pstmt = null;
								String sql = null;
								try {
									con = pool.getConnection();
									sql = "insert answersa(num,content,date,posnum)";
									sql+="values(?, ?, now(), 1);";
									pstmt = con.prepareStatement(sql);
									pstmt.setInt(1,num);
									pstmt.setString(2,content);
									pstmt.executeUpdate();
								} catch (Exception e) {
									e.printStackTrace();
								} finally {
									pool.freeConnection(con, pstmt);
								}
								return;
							}
					
	
	
}
