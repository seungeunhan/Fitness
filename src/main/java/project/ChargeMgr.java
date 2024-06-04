package project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Vector;

public class ChargeMgr {

				private DBConnectionMgr pool;
				private final SimpleDateFormat SDF_DATE =
						new SimpleDateFormat("yyyy'년'  M'월' d'일' (E)");
				private final SimpleDateFormat SDF_TIME =
						new SimpleDateFormat("H:mm:ss");
				
				public ChargeMgr(){
					try {
						pool = DBConnectionMgr.getInstance();
					} catch (Exception e) {
						e.printStackTrace();
						}
				}
				
				
				
				//결제내역 날짜 최근한달 내림차순 보기
				public Vector<ChargeInfoBean> getListCharge(){
				      Connection con = null;
				      PreparedStatement pstmt = null;
				      ResultSet rs = null;
				      String sql = null;
				      Vector<ChargeInfoBean> vlist = new  Vector<ChargeInfoBean>();
					
					try {
						con = pool.getConnection();
						sql = "SELECT * FROM chargeinfosa WHERE date >= DATE_SUB(NOW(), INTERVAL 1 MONTH)  ORDER BY date DESC";
						pstmt = con.prepareStatement(sql);
						rs = pstmt.executeQuery();
						
						while (rs.next()) {
							ChargeInfoBean bean = new ChargeInfoBean();
							
							bean.setNum(rs.getInt("num"));
							bean.setUser(rs.getInt("user"));
							bean.setItem(rs.getInt("item"));
							bean.setCode(rs.getString("code"));
							bean.setPrice(rs.getInt("price"));
													
				            String chargeDate = SDF_DATE.format(rs.getDate("date"));
				            bean.setDate(chargeDate);
										
							bean.setChamet(rs.getString("chamet"));
							bean.setCcflag(rs.getBoolean("ccflag"));
				            
				            vlist.addElement(bean);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return vlist;
				}
				
				
				//결제내역 날짜 내림차순 보기
				public Vector<ChargeInfoBean> getAllCharge(){
				      Connection con = null;
				      PreparedStatement pstmt = null;
				      ResultSet rs = null;
				      String sql = null;
				      Vector<ChargeInfoBean> vlist = new  Vector<ChargeInfoBean>();
					
					try {
						con = pool.getConnection();
						sql = "SELECT * FROM chargeinfosa  ORDER BY date DESC";
						pstmt = con.prepareStatement(sql);
						rs = pstmt.executeQuery();
						
						while (rs.next()) {
							ChargeInfoBean bean = new ChargeInfoBean();
							
							bean.setNum(rs.getInt("num"));
							bean.setUser(rs.getInt("user"));
							bean.setItem(rs.getInt("item"));
							bean.setCode(rs.getString("code"));
							bean.setPrice(rs.getInt("price"));
													
				            String chargeDate = SDF_DATE.format(rs.getDate("date"));
				            bean.setDate(chargeDate);
										
							bean.setChamet(rs.getString("chamet"));
							bean.setCcflag(rs.getBoolean("ccflag"));
				            
				            vlist.addElement(bean);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return vlist;
				}
				
				
				//차트용))) 월별 총 가격
				public Vector<ChargeInfoBean> getTotalPrice(){
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					Vector<ChargeInfoBean> vlist = new Vector<ChargeInfoBean>();
					try {
						con = pool.getConnection();
						sql = "SELECT MONTH(date) AS month, SUM(price) AS price  "
								+ "FROM chargeinfosa  "
								+ "WHERE YEAR(date) = YEAR(NOW())  "
								+ "GROUP BY MONTH(date)  "
								+ "ORDER BY MONTH(date) ASC;";
						pstmt = con.prepareStatement(sql);
								
						rs = pstmt.executeQuery();
						
						while (rs.next()) {
							ChargeInfoBean  bean = new ChargeInfoBean();
							bean.setPrice(rs.getInt("price"));			
							vlist.addElement(bean);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return vlist;
				}
				
				
				
				
				
				
				//총 결제내역 수
				public int getTotalCharge(String keyField, String keyWord) {
					
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					int totalCount = 0;
					try {
						con = pool.getConnection();
						if(keyWord.trim().equals("")|| keyWord==null) {
							//검색이 아닌 경우
							sql = "select count(*) from chargeinfosa where ccflag = 0";
							pstmt = con.prepareStatement(sql);
							
						}else if(keyField.equals("frnum")){
							
							sql = "SELECT count(*)  "
									+ "FROM chargeinfosa   "
									+ "WHERE item IN (  "
									+ "    SELECT num  "
									+ "    FROM healthitemsa  "
									+ "    WHERE frnum like ?  "
									+ ")  "
									+ "AND ccflag = 0   ";
							
							pstmt = con.prepareStatement(sql);
							pstmt.setString(1,  "%"+keyWord+"%");
									
						}else {
						sql = "select count(*) from chargeinfosa where " + keyField + " like ? and ccflag = 0" ;
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
				
				
				
				
				//관리자 사용자 결제내역(Charge) 리스트 검색 및 페이징 기능 추가
			public Vector<ChargeInfoBean> getChargeList(String keyField, String keyWord, int start, int cnt){
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = null;
				Vector<ChargeInfoBean> vlist = new Vector<ChargeInfoBean>();
				try {
					con = pool.getConnection();
					if(keyWord.trim().equals("")|| keyWord==null) {
						
						sql = "select * from chargeinfosa where ccflag = 0 order by num desc limit ?,?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1 , start);
						pstmt.setInt(2, cnt);
						
					}else if(keyField.equals("frnum")){
						
						sql = "SELECT *  "
								+ "FROM chargeinfosa   "
								+ "WHERE item IN (  "
								+ "    SELECT num  "
								+ "    FROM healthitemsa  "
								+ "    WHERE frnum = ?  "
								+ ")  "
								+ "AND ccflag = 0   "
								+ "ORDER BY num DESC   "
								+ "LIMIT ?, ?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1,  keyWord);
						pstmt.setInt(2 , start);
						pstmt.setInt(3, cnt);
								
					}else {
						
					sql = "select * from chargeinfosa where " + keyField + " like ? and ccflag = 0  order by num desc limit ?,?" ;
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,  "%"+keyWord+"%");
					pstmt.setInt(2, start);
					pstmt.setInt(3, cnt);
					}
					
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						ChargeInfoBean bean = new ChargeInfoBean();
						
						bean.setNum(rs.getInt("num"));
						bean.setUser(rs.getInt("user"));
						bean.setItem(rs.getInt("item"));
						bean.setCode(rs.getString("code"));
						bean.setPrice(rs.getInt("price"));
						bean.setDate(rs.getString("date"));
						bean.setChamet(rs.getString("chamet"));
						bean.setCcflag(rs.getBoolean("ccflag"));
						
						vlist.addElement(bean);
						
					}
					
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					pool.freeConnection(con, pstmt, rs);
				}
				
				return vlist;
			}
				
				
				
			//item 번호로 item명 찾아오기
			public String getItemNameToItemNum(int item) {
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = null;
				String id = "";
				try {
					con = pool.getConnection();
					sql = "select name from healthitemsa where num = ? ";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1,item);
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						id = rs.getString(1);
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					pool.freeConnection(con, pstmt, rs);
				}
				return id;
			}
				
			//아이템반호로  이름 찾기
			public String getLocToUseItemNum(int itemnum) {
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = null;
				String id = "";
				try {
					con = pool.getConnection();
					sql = "SELECT locationsa.id  "
							+ "FROM locationsa  "
							+ "INNER JOIN (  "
							+ "    SELECT frnum  "
							+ "    FROM healthitemsa  "
							+ "    WHERE num = ? "
							+ ") AS subquery ON locationsa.num = subquery.frnum;";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1,itemnum);
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						id = rs.getString(1);
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					pool.freeConnection(con, pstmt, rs);
				}
				return id;
			}
			
				
				
				
				
/**---------------------------payitemsa---------------------------------------		
----------------------------------------------------------------------------		
---------------------------------------------------------------------------*/		
				
				
				
				
				//유저 num로 구매 상품 번호 찾기
				public int getItemNum(int num) {
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					int id = 0;
					try {
						con = pool.getConnection();
						sql = "select itemnum from payitemsa where usernum = ? ";
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
				        sql = "SELECT h.name FROM payitemsa p JOIN healthitemsa h ON p.itemnum = h.num WHERE p.usernum = ?";
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
				
				
				//유저 num로 소속 찾기
				public int getCompany(int num) {
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					int id = 0;
					try {
						con = pool.getConnection();
						sql = "select company from usersa where num = ? ";
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
				
				
				
				
				//총 구매 아이템수
				public int getTotalPay(String keyField, String keyWord) {
					
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					int totalCount = 0;
					try {
						con = pool.getConnection();
						if(keyWord.trim().equals("")|| keyWord==null) {
							//검색이 아닌 경우
							sql = "select count(*) from payitemsa where payflag = 1";
							pstmt = con.prepareStatement(sql);
							
						}else if(keyField.equals("frnum")){
							
							sql = "SELECT count(*) "
									+ "FROM payitemsa "
									+ "WHERE itemnum IN ( "
									+ "    SELECT num "
									+ "    FROM healthitemsa "
									+ "    WHERE frnum like ? "
									+ ")  "
									+ "AND payflag = 1; ";
							
							pstmt = con.prepareStatement(sql);
							pstmt.setString(1,  "%"+keyWord+"%");
									
						}else {
						sql = "select count(*) from payitemsa where " + keyField + " like ? and payflag = 1" ;
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
				
				
				
				//총 구매 아이템수(최근 한달)
				public int getTotalPay2(String keyField, String keyWord) {
					
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					int totalCount = 0;
					try {
						con = pool.getConnection();
						if(keyWord.trim().equals("")|| keyWord==null) {
							//검색이 아닌 경우
							sql = "select count(*) from payitemsa where payflag = 1 AND paydate >= DATE_SUB(NOW(), INTERVAL 1 MONTH)";
							pstmt = con.prepareStatement(sql);
							
						}else if(keyField.equals("frnum")){
							
							sql = "SELECT count(*)  "
									+ "FROM payitemsa "
									+ "WHERE itemnum IN ( "
									+ "    SELECT num "
									+ "    FROM healthitemsa "
									+ "    WHERE frnum = ? "
									+ ") "
									+ "AND payflag = 1 "
									+ "AND paydate >= DATE_SUB(NOW(), INTERVAL 1 MONTH);";
							
							pstmt = con.prepareStatement(sql);
							pstmt.setString(1,  keyWord);
									
						}else {
						sql = "select count(*) from payitemsa where " + keyField + " like ? and payflag = 1 AND paydate >= DATE_SUB(NOW(), INTERVAL 1 MONTH)" ;
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
					
				
				
				//총 환불 아이템수 (최근 한달)
				public int getTotalPayBack(String keyField, String keyWord) {
					
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					int totalCount = 0;
					try {
						con = pool.getConnection();
						if(keyWord.trim().equals("")|| keyWord==null) {
							//검색이 아닌 경우
							sql = "select count(*) from payitemsa where payback = 1 AND paydate >= DATE_SUB(NOW(), INTERVAL 1 MONTH)";
							pstmt = con.prepareStatement(sql);
							
						}else if(keyField.equals("frnum")){
							
							sql = "SELECT *  "
									+ "FROM payitemsa "
									+ "WHERE itemnum IN ( "
									+ "    SELECT num "
									+ "    FROM healthitemsa "
									+ "    WHERE frnum = ? "
									+ ") "
									+ "AND payback = 1 "
									+ "AND paydate >= DATE_SUB(NOW(), INTERVAL 1 MONTH);";
							
							pstmt = con.prepareStatement(sql);
							pstmt.setString(1,  keyWord);
									
						}else {
						sql = "select count(*) from payitemsa where " + keyField + " like ? and payback = 1 AND paydate >= DATE_SUB(NOW(), INTERVAL 1 MONTH)" ;
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
				
				
				//총 취소 아이템수 (최근 한달)
				public int getTotalCancel(String keyField, String keyWord) {
					
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					int totalCount = 0;
					try {
						con = pool.getConnection();
						if(keyWord.trim().equals("")|| keyWord==null) {
							//검색이 아닌 경우
							sql = "select count(*) from payitemsa where ccflag = 1 AND paydate >= DATE_SUB(NOW(), INTERVAL 1 MONTH)";
							pstmt = con.prepareStatement(sql);
							
						}else if(keyField.equals("frnum")){
							
							sql = "SELECT *  "
									+ "FROM payitemsa "
									+ "WHERE itemnum IN ( "
									+ "    SELECT num "
									+ "    FROM healthitemsa "
									+ "    WHERE frnum = ? "
									+ ") "
									+ "AND ccflag = 1 "
									+ "AND paydate >= DATE_SUB(NOW(), INTERVAL 1 MONTH);";
							
							pstmt = con.prepareStatement(sql);
							pstmt.setString(1,  keyWord);
									
						}else {
						sql = "select count(*) from payitemsa where " + keyField + " like ? and ccflag = 1 AND paydate >= DATE_SUB(NOW(), INTERVAL 1 MONTH)" ;
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
					
					
					
					//관리자 사용자 결제내역(외상x) 리스트 검색 및 페이징 기능 추가
				public Vector<PayItemsBean> getPayList(String keyField, String keyWord, int start, int cnt){
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					Vector<PayItemsBean> vlist = new Vector<PayItemsBean>();
					try {
						con = pool.getConnection();
						if(keyWord.trim().equals("")|| keyWord==null) {
							
							sql = "select * from payitemsa where payflag = 1 order by num desc limit ?,?";
							pstmt = con.prepareStatement(sql);
							pstmt.setInt(1 , start);
							pstmt.setInt(2, cnt);
							
						} else if (keyField.equals("frnum")) {
						    sql = "SELECT *  "
						    		+ "FROM payitemsa "
						    		+ "WHERE itemnum IN ( "
						    		+ "SELECT num  "
						    		+ "FROM healthitemsa  "
						    		+ "WHERE frnum like ?) "
						    		+ "AND payflag = 1    "
						    		+ "ORDER BY num DESC "
						    		+ "LIMIT ?, ?;";
						    pstmt = con.prepareStatement(sql);
						    pstmt.setString(1, "%"+keyWord+"%");
						    pstmt.setInt(2, start);
						    pstmt.setInt(3, cnt);
						    
						}else {		
							
						sql = "select * from payitemsa where " + keyField + " like ? and payflag = 1  order by num desc limit ?,?" ;
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1,  "%"+keyWord+"%");
						pstmt.setInt(2, start);
						pstmt.setInt(3, cnt);
						}
						
						rs = pstmt.executeQuery();
						
						while(rs.next()) {
							PayItemsBean bean = new PayItemsBean();
							
							bean.setNum(rs.getInt("num"));
							bean.setUsernum(rs.getInt("usernum"));
							bean.setPaydate(rs.getString("paydate"));
							bean.setItemnum(rs.getInt("itemnum"));
							bean.setPayprice(rs.getInt("payprice"));
							bean.setPaymethod(rs.getString("paymethod"));
							bean.setPayflag(rs.getBoolean("payflag"));
							bean.setPayback(rs.getBoolean("payback"));
							bean.setCcflag(rs.getBoolean("ccflag"));
							
							vlist.addElement(bean);
							
						}
						
						
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					
					return vlist;
				}
				
		
				
				//최근 한달 총 가격
				public int getTotalPayPrice(String keyField, String keyWord) {
				    Connection con = null;
				    PreparedStatement pstmt = null;
				    ResultSet rs = null;
				    String sql = null;
				    int totalPrice = 0;
				    try {
				        con = pool.getConnection();
				        if (keyWord.trim().equals("") || keyWord == null) {
				            // 검색이 아닌 경우, 최근 1달 조건 추가
				            sql = "SELECT SUM(payprice) FROM payitemsa WHERE payflag = 1 AND paydate >= DATE_SUB(NOW(), INTERVAL 1 MONTH)";
				            pstmt = con.prepareStatement(sql);
				        }else if (keyField.equals("frnum")) {
				            sql = "SELECT SUM(payprice) " +
				                    "FROM payitemsa " +
				                    "WHERE itemnum IN (" +
				                    "    SELECT num " +
				                    "    FROM healthitemsa " +
				                    "    WHERE frnum = ?" +
				                    ") " +
				                    "AND payflag = 1 " +
				                    "AND paydate >= DATE_SUB(NOW(), INTERVAL 1 MONTH);";
				              pstmt = con.prepareStatement(sql);
				              pstmt.setString(1, keyWord);
				              
				          }else {
				            // 검색어가 있는 경우, 최근 1달 조건 추가
				            sql = "SELECT SUM(payprice) FROM payitemsa WHERE " + keyField + " LIKE ? AND payflag = 1 AND paydate >= DATE_SUB(NOW(), INTERVAL 1 MONTH)";
				            pstmt = con.prepareStatement(sql);
				            pstmt.setString(1, "%" + keyWord + "%");
				        }
				        rs = pstmt.executeQuery();
				        if (rs.next()) {
				            totalPrice = rs.getInt(1);
				        }
				    } catch (Exception e) {
				        e.printStackTrace();
				    } finally {
				        pool.freeConnection(con, pstmt, rs);
				    }
				    return totalPrice;
				}
				
		
				
				
				
				
				
				
				
				
//------------------------------------------------외상----------------------------
				
				
				//총 구매 아이템수
				public int getTotalNoPay(String keyField, String keyWord) {
					
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					int totalCount = 0;
					try {
						con = pool.getConnection();
						if(keyWord.trim().equals("")|| keyWord==null) {
							//검색이 아닌 경우
							sql = "select count(*) from payitemsa where payflag = 0";
							pstmt = con.prepareStatement(sql);
							
						}else {
				            sql = "SELECT COUNT(*) AS quantity " +
				                    "FROM payitemsa " +
				                    "WHERE usernum IN ( " +
				                    "    SELECT num " +
				                    "    FROM usersa " +
				                    "    WHERE company = ? " +
				                    ")";
				              pstmt = con.prepareStatement(sql);
				              pstmt.setString(1, keyWord);  // 회사 번호를 입력으로 받음
				          }
				          rs = pstmt.executeQuery();
				          if (rs.next()) totalCount = rs.getInt(1);
				      } catch (Exception e) {
				          e.printStackTrace();
				      } finally {
				          pool.freeConnection(con, pstmt, rs);
				      }
				      return totalCount;
				  }
				
				
				
				//총 구매 아이템수(최근 한달)
				public int getTotalNoPay2(String keyField, String keyWord) {
					
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					int totalCount = 0;
					try {
						con = pool.getConnection();
						if(keyWord.trim().equals("")|| keyWord==null) {
							//검색이 아닌 경우
							sql = "select count(*) from payitemsa where payflag = 0 AND paydate >= DATE_SUB(NOW(), INTERVAL 1 MONTH)";
							pstmt = con.prepareStatement(sql);
							
						}else {
						sql = "SELECT COUNT(*)  "
								+ " FROM payitemsa "
								+ " WHERE usernum IN ( "
								+ "    SELECT num "
								+ "    FROM usersa  "
								+ "    WHERE company like ? ) "
								+ " AND paydate >= DATE_SUB(NOW(), INTERVAL 1 MONTH);" ;
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
					
				
					
					
					//관리자 사용자 결제내역(외상) 리스트 검색 및 페이징 기능 추가
				public Vector<PayItemsBean> getNoPayList(String keyField, String keyWord, int start, int cnt){
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					Vector<PayItemsBean> vlist = new Vector<PayItemsBean>();
					try {
						con = pool.getConnection();
						if(keyWord.trim().equals("")|| keyWord==null) {
							
							sql = "select * from payitemsa where payflag = 1 order by num desc limit ?,?";
							pstmt = con.prepareStatement(sql);
							pstmt.setInt(1 , start);
							pstmt.setInt(2, cnt);
						}else {		
							
							sql = " SELECT pi.* "
									+ " FROM usersa u"
									+ " JOIN payitemsa pi ON u.num = pi.usernum "
									+ " WHERE u.num IN ( "
									+ "    SELECT u2.num "
									+ "    FROM companysa c "
									+ "    JOIN usersa u2 ON c.num = u2.company "
									+ "    WHERE c.num like ?) "
									+ " ORDER BY pi.num DESC "
									+ " LIMIT ?, ?; ";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1,  "%"+keyWord+"%");
						pstmt.setInt(2, start);
						pstmt.setInt(3, cnt);
						}
						
						rs = pstmt.executeQuery();
						
						while(rs.next()) {
							PayItemsBean bean = new PayItemsBean();
							
							bean.setNum(rs.getInt("num"));
							bean.setUsernum(rs.getInt("usernum"));
							bean.setPaydate(rs.getString("paydate"));
							bean.setItemnum(rs.getInt("itemnum"));
							bean.setPayprice(rs.getInt("payprice"));
							bean.setPaymethod(rs.getString("paymethod"));
							bean.setPayflag(rs.getBoolean("payflag"));
							bean.setPayback(rs.getBoolean("payback"));
							bean.setCcflag(rs.getBoolean("ccflag"));
							
							vlist.addElement(bean);
							
						}
						
						
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					
					return vlist;
				}
				
		
				
				//최근 한달 총 가격
				public int getTotalNoPayPrice(String keyField, String keyWord) {
				    Connection con = null;
				    PreparedStatement pstmt = null;
				    ResultSet rs = null;
				    String sql = null;
				    int totalPrice = 0;
				    try {
				        con = pool.getConnection();
				        if (keyWord.trim().equals("") || keyWord == null) {
				            // 검색이 아닌 경우, 최근 1달 조건 추가
				            sql = "SELECT SUM(payprice) FROM payitemsa WHERE payflag = 0 AND paydate >= DATE_SUB(NOW(), INTERVAL 1 MONTH)";
				            pstmt = con.prepareStatement(sql);
				        } else {
				            // 검색어가 있는 경우, 최근 1달 조건 추가
				            sql = "SELECT SUM(payprice)  "
				            		+ "FROM payitemsa  "
				            		+ "WHERE usernum IN (  "
				            		+ "    SELECT num  "
				            		+ "    FROM usersa  "
				            		+ "    WHERE company like ? )  "
				            		+ "AND paydate >= DATE_SUB(NOW(), INTERVAL 1 MONTH);";
				            pstmt = con.prepareStatement(sql);
				            pstmt.setString(1, "%" + keyWord + "%");
				        }
				        rs = pstmt.executeQuery();
				        if (rs.next()) {
				            totalPrice = rs.getInt(1);
				        }
				    } catch (Exception e) {
				        e.printStackTrace();
				    } finally {
				        pool.freeConnection(con, pstmt, rs);
				    }
				    return totalPrice;
				}
				
				
	
}
