package project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Random;
import java.util.Vector;





		public class UserMgr {
			private DBConnectionMgr pool;
			private final SimpleDateFormat SDF_DATE =
					new SimpleDateFormat("yyyy'년'  M'월' d'일' (E)");
			private final SimpleDateFormat SDF_TIME =
					new SimpleDateFormat("H:mm:ss");
			
			public UserMgr(){
				try {
					pool = DBConnectionMgr.getInstance();
				} catch (Exception e) {
					e.printStackTrace();
					}
			}
			
			
			

			
			
//---------------------------유저 ,강사 관리 ------------------------------			
			
			
			
			
			
			//유저정보 최근 한달 가입일순으로 보기
			public Vector<UserBean> getListUser(){
			      Connection con = null;
			      PreparedStatement pstmt = null;
			      ResultSet rs = null;
			      String sql = null;
			      Vector<UserBean> vlist = new  Vector<UserBean>();
				
				try {
					con = pool.getConnection();
					sql = "SELECT * FROM usersa WHERE joindate >= DATE_SUB(NOW(), INTERVAL 1 MONTH) and authority = 1 ORDER BY joinDate DESC";
					pstmt = con.prepareStatement(sql);
					rs = pstmt.executeQuery();
					
					while (rs.next()) {
						UserBean bean = new UserBean();
						
						bean.setNum(rs.getInt("num"));
						bean.setId(rs.getString("id"));
						bean.setPwd(rs.getString("pwd"));
						bean.setName(rs.getString("name"));
						bean.setGender(rs.getInt("gender"));
						
			            String birthDate = SDF_DATE.format(rs.getDate("birth"));
			            bean.setBirth(birthDate);
			            
						bean.setEmail(rs.getString("email"));
						bean.setPostnum(rs.getString("postnum"));
						bean.setCity(rs.getString("city"));
						bean.setStreetaddr(rs.getString("streetaddr"));
						
						String joinDate = SDF_DATE.format(rs.getDate("joindate"));
						bean.setJoindate(joinDate);
						
						bean.setPoint(rs.getInt("point"));
						bean.setCompany(rs.getInt("company"));
						bean.setPhone(rs.getString("phone"));
						bean.setSns(rs.getInt("sns"));
						bean.setSnsid(rs.getString("snsid"));
						bean.setSnspwd(rs.getString("snspwd"));
						bean.setFrnum(rs.getInt("frnum"));
						bean.setAuthority(rs.getInt("authority"));
			            
			            vlist.addElement(bean);
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					pool.freeConnection(con, pstmt, rs);
				}
				return vlist;
			}
			
			
			
			
			
			
			
			
			//회원정보 가입일순으로 보기
			public Vector<UserBean> getAllUser(){
			      Connection con = null;
			      PreparedStatement pstmt = null;
			      ResultSet rs = null;
			      String sql = null;
			      Vector<UserBean> vlist = new  Vector<UserBean>();
				
				try {
					con = pool.getConnection();
					sql = "SELECT * FROM usersa WHERE authority = 1 ORDER BY joinDate DESC";
					pstmt = con.prepareStatement(sql);
					rs = pstmt.executeQuery();
					
					while (rs.next()) {
						UserBean bean = new UserBean();
						
						bean.setNum(rs.getInt("num"));
						bean.setId(rs.getString("id"));
						bean.setPwd(rs.getString("pwd"));
						bean.setName(rs.getString("name"));
						bean.setGender(rs.getInt("gender"));
						
			            String birthDate = SDF_DATE.format(rs.getDate("birth"));
			            bean.setBirth(birthDate);
			            
						bean.setEmail(rs.getString("email"));
						bean.setPostnum(rs.getString("postnum"));
						bean.setCity(rs.getString("city"));
						bean.setStreetaddr(rs.getString("streetaddr"));
						
						String joinDate = SDF_DATE.format(rs.getDate("joindate"));
						bean.setJoindate(joinDate);
						
						bean.setPoint(rs.getInt("point"));
						bean.setCompany(rs.getInt("company"));
						bean.setPhone(rs.getString("phone"));
						bean.setSns(rs.getInt("sns"));
						bean.setSnsid(rs.getString("snsid"));
						bean.setSnspwd(rs.getString("snspwd"));
						bean.setFrnum(rs.getInt("frnum"));
						bean.setAuthority(rs.getInt("authority"));
			            
			            vlist.addElement(bean);
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					pool.freeConnection(con, pstmt, rs);
				}
				return vlist;
			}
			
			
			
			
			
			
			
			//관리자 가입일순으로 보기
			public Vector<UserBean> getAllAdmin(){
			      Connection con = null;
			      PreparedStatement pstmt = null;
			      ResultSet rs = null;
			      String sql = null;
			      Vector<UserBean> vlist = new  Vector<UserBean>();
				
				try {
					con = pool.getConnection();
					sql = "SELECT * FROM usersa WHERE authority = 3 ORDER BY joinDate DESC";
					pstmt = con.prepareStatement(sql);
					rs = pstmt.executeQuery();
					
					while (rs.next()) {
						UserBean bean = new UserBean();
						
						bean.setNum(rs.getInt("num"));
						bean.setId(rs.getString("id"));
						bean.setPwd(rs.getString("pwd"));
						bean.setName(rs.getString("name"));
						bean.setGender(rs.getInt("gender"));
						
			            String birthDate = SDF_DATE.format(rs.getDate("birth"));
			            bean.setBirth(birthDate);
			            
						bean.setEmail(rs.getString("email"));
						bean.setPostnum(rs.getString("postnum"));
						bean.setCity(rs.getString("city"));
						bean.setStreetaddr(rs.getString("streetaddr"));
						
						String joinDate = SDF_DATE.format(rs.getDate("joindate"));
						bean.setJoindate(joinDate);
						
						bean.setPoint(rs.getInt("point"));
						bean.setCompany(rs.getInt("company"));
						bean.setPhone(rs.getString("phone"));
						bean.setSns(rs.getInt("sns"));
						bean.setSnsid(rs.getString("snsid"));
						bean.setSnspwd(rs.getString("snspwd"));
						bean.setFrnum(rs.getInt("frnum"));
						bean.setAuthority(rs.getInt("authority"));
			            
			            vlist.addElement(bean);
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					pool.freeConnection(con, pstmt, rs);
				}
				return vlist;
			}
			
			
			
			//관리자 -  유저정보 수정(이메일,성별, 전화번호, 권한, 이름, 지점정보) + 아이디
			public boolean updateUser(String email, int gender, String phone,  int authority, String name, int frnum, String id) {
				Connection con = null;
				PreparedStatement pstmt = null;
				String sql = null;
				boolean flag = false;
				try {
					con = pool.getConnection();
					sql = "update usersa set email = ?, gender = ? , phone = ? , authority = ? , name = ? , frnum = ? where id = ?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, email);
					pstmt.setInt(2, gender);
					pstmt.setString(3, phone);
					pstmt.setInt(4, authority);
					pstmt.setString(5, name);
					pstmt.setInt(6, frnum);
					pstmt.setString(7, id);
					
					
					if(pstmt.executeUpdate()==1) flag = true;
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					pool.freeConnection(con, pstmt);
				}
				return flag;
			}
			
			
			
			
			
			
			
			
			//관리자 - 유저정보 삭제
			public void deleteUser(int num) {
				Connection con = null;
				PreparedStatement pstmt = null;
				String sql = null;
				try {
					con = pool.getConnection();
					sql = "delete from usersa where num = ?";
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
			
			
			
			//총 유저수
		public int getTotalUser(String keyField, String keyWord) {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			int totalCount = 0;
			try {
				con = pool.getConnection();
				if(keyWord.trim().equals("")|| keyWord==null) {
					//검색이 아닌 경우
					sql = "select count(*) from usersa where authority = 1";
					pstmt = con.prepareStatement(sql);
					
				}else {
				sql = "select count(*) from usersa where " + keyField + " like ?" ;
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
			
			
		
		
		
			
			
			//관리자 사용자 리스트 검색 및 페이징 기능 추가
		public Vector<UserBean> getUserList(String keyField, String keyWord, int start, int cnt){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			Vector<UserBean> vlist = new Vector<UserBean>();
			try {
				con = pool.getConnection();
				if(keyWord.trim().equals("")|| keyWord==null) {
					
					sql = "select * from usersa where authority = 1 order by num desc limit ?,?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1 , start);
					pstmt.setInt(2, cnt);
				}else {		
					
				sql = "select * from usersa where " + keyField + " like ? and authority = 1  order by num desc limit ?,?" ;
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,  "%"+keyWord+"%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, cnt);
				}
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					UserBean bean = new UserBean();
					
					bean.setNum(rs.getInt("num"));
					bean.setId(rs.getString("id"));
					bean.setPwd(rs.getString("pwd"));
					bean.setName(rs.getString("name"));
					bean.setGender(rs.getInt("gender"));
					
		            String birthDate = SDF_DATE.format(rs.getDate("birth"));
		            bean.setBirth(birthDate);
		            
					bean.setEmail(rs.getString("email"));
					bean.setPostnum(rs.getString("postnum"));
					bean.setCity(rs.getString("city"));
					bean.setStreetaddr(rs.getString("streetaddr"));
					
					String joinDate = SDF_DATE.format(rs.getDate("joindate"));
					bean.setJoindate(joinDate);
					
					bean.setPoint(rs.getInt("point"));
					bean.setCompany(rs.getInt("company"));
					bean.setPhone(rs.getString("phone"));
					bean.setSns(rs.getInt("sns"));
					bean.setSnsid(rs.getString("snsid"));
					bean.setSnspwd(rs.getString("snspwd"));
					bean.setFrnum(rs.getInt("frnum"));
					bean.setAuthority(rs.getInt("authority"));
		            
		            vlist.addElement(bean);
				}
				
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			
			return vlist;
		}
		
		
		
		
		
		
		
		
		//총 강사 수
	public int getTotalTrainer(String keyField, String keyWord) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		try {
			con = pool.getConnection();
			if(keyWord.trim().equals("")|| keyWord==null) {
				//검색이 아닌 경우
				sql = "select count(*) from usersa where authority = 2";
				pstmt = con.prepareStatement(sql);
				
			}else {
			sql = "select count(*) from usersa where " + keyField + " like ? and authority = 2" ;
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
		
		
	
	
	
	
		
		//관리자 강사 리스트 검색 및 페이징 기능 추가
	public Vector<UserBean> getAllTrainer(String keyField, String keyWord, int start, int cnt){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<UserBean> vlist = new Vector<UserBean>();
		try {
			con = pool.getConnection();
			if(keyWord.trim().equals("")|| keyWord==null) {
				
				sql = "SELECT usersa.num AS userNum, trainersa.num AS trainerNum, usersa.*, trainersa.* FROM usersa LEFT JOIN trainersa ON usersa.num = trainersa.user WHERE usersa.authority = 2 ORDER BY usersa.num DESC LIMIT ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1 , start);
				pstmt.setInt(2, cnt);
			}else {		
				
			sql = "SELECT usersa.num AS userNum, trainersa.num AS trainerNum, usersa.*, trainersa.* FROM usersa LEFT JOIN trainersa ON usersa.num = trainersa.user WHERE " + keyField + " LIKE ? AND usersa.authority = 2 ORDER BY usersa.num DESC LIMIT ?,?" ;
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,  "%"+keyWord+"%");
			pstmt.setInt(2, start);
			pstmt.setInt(3, cnt);
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				UserBean bean = new UserBean();
				TrainerBean tbean = new TrainerBean();
				
				bean.setNum(rs.getInt("userNum"));
				bean.setId(rs.getString("id"));
				bean.setPwd(rs.getString("pwd"));
				bean.setName(rs.getString("name"));
				bean.setGender(rs.getInt("gender"));
				
	            String birthDate = SDF_DATE.format(rs.getDate("birth"));
	            bean.setBirth(birthDate);
	            
				bean.setEmail(rs.getString("email"));
				bean.setPostnum(rs.getString("postnum"));
				bean.setCity(rs.getString("city"));
				bean.setStreetaddr(rs.getString("streetaddr"));
				
				String joinDate = SDF_DATE.format(rs.getDate("joindate"));
				bean.setJoindate(joinDate);
				
				bean.setPoint(rs.getInt("point"));
				bean.setCompany(rs.getInt("company"));
				bean.setPhone(rs.getString("phone"));
				bean.setSns(rs.getInt("sns"));
				bean.setSnsid(rs.getString("snsid"));
				bean.setSnspwd(rs.getString("snspwd"));
				bean.setFrnum(rs.getInt("frnum"));
				bean.setAuthority(rs.getInt("authority"));
				
				tbean.setNum(rs.getInt("trainerNum"));			
				tbean.setUser(rs.getInt("user"));			
				tbean.setImgpath(rs.getString("imgpath"));			
				tbean.setCareer(rs.getString("career"));			
				tbean.setSalary(rs.getInt("salary"));			
				
				bean.setTrainerInfo(tbean);
				
	            vlist.addElement(bean);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return vlist;
	}
		
	
	
	
	
	
	//트레이너 테이블 수정
	public boolean updateTrainerInfo(int usernum, String career, String imgpath, int salary) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "update trainersa set  career = ? , imgpath = ? , salary = ? where user = ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, career);
			pstmt.setString(2, imgpath);
			pstmt.setInt(3, salary);
			pstmt.setInt(4, usernum);

			if(pstmt.executeUpdate()==1) flag = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	
	
	
	
	
	//권한이 2(1->2)일때, 해당 유저 넘버를 트레이너 테이블에 추가하면서 트레이너 번호 생성
	public void setTrainerTable(int usernum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert trainersa(user, career, imgpath, salary)";
			sql+="values(?, null, null, null);";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, usernum);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	
	
	
	
	//권한이 1(2->1)일때, 해당 유저 넘버를 가진 트레이너 테이블 컬럼을 삭제
	public void delTrainerTable(int usernum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "delete from trainersa where user = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,usernum);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	

	//총 강사 출퇴근 수
				public int getTotalTrainerWork(String keyField, String keyWord) {
					
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					int totalCount = 0;
					try {
						con = pool.getConnection();
						if(keyWord.trim().equals("")|| keyWord==null) {
							//검색이 아닌 경우
							sql = "select count(*) from trainerworksa";
							pstmt = con.prepareStatement(sql);
							
						}else {
						sql = "select count(*) from trainerworksa where " + keyField + " like ?" ;
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
			
			
			
				//강사 출퇴근 정보 뿌리기
			public Vector<TrainerWorkBean> getTrainerWork(String keyField, String keyWord, int start, int cnt){
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = null;
				Vector<TrainerWorkBean> vlist = new Vector<TrainerWorkBean>();
				try {
					con = pool.getConnection();
					if(keyWord.trim().equals("")|| keyWord==null) {
						
						sql = "SELECT * from trainerworksa ORDER BY num DESC LIMIT ?,?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1 , start);
						pstmt.setInt(2, cnt);
					}else {		
						
					sql = "select * from trainerworksa where " + keyField + " like ?  order by num desc limit ?,?" ;
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,  "%"+keyWord+"%");
					pstmt.setInt(2, start);
					pstmt.setInt(3, cnt);
					}
					
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						TrainerWorkBean bean = new TrainerWorkBean();
						
						bean.setNum(rs.getInt("num"));
						bean.setTrainer(rs.getInt("trainer"));
						bean.setDate(rs.getString("date"));
						bean.setStarttime(rs.getString("starttime"));
						bean.setEndtime(rs.getString("endtime"));
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
	

	
			//강사 번호로 이름 알아내기
			public String getTNameToUseNum(int trainer) {
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = null;
				String name = null;
				try {
					con = pool.getConnection();
					sql = "SELECT u.name\r\n"
							+ "FROM trainerworksa tw\r\n"
							+ "JOIN trainersa t ON tw.trainer = t.user\r\n"
							+ "JOIN usersa u ON t.user = u.num\r\n"
							+ "WHERE tw.trainer = ?; ";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1,trainer);
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
	
			
			//유저 번호로 이름 찾기
			public String getUserName(int num) {
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = null;
				String name = null;
				try {
					con = pool.getConnection();
					sql = "select name from usersa where num = ? ";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1,num);
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

	
	
	
	
	
	
	
//------------------------------회사 관련 --------------------------------
	
	//총 회사 수
			public int getTotalCompany(String keyField, String keyWord) {
				
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = null;
				int totalCount = 0;
				try {
					con = pool.getConnection();
					if(keyWord.trim().equals("")|| keyWord==null) {
						//검색이 아닌 경우
						sql = "select count(*) from companysa";
						pstmt = con.prepareStatement(sql);
						
					}else {
					sql = "select count(*) from companysa where " + keyField + " like ?" ;
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
	
	
	
	//회사리스트 검색 및 페이징 기능 추가
		public Vector<CompanyBean> getCompany(String keyField, String keyWord, int start, int cnt){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			Vector<CompanyBean> vlist = new Vector<CompanyBean>();
			try {
				con = pool.getConnection();
				if(keyWord.trim().equals("")|| keyWord==null) {
					
					sql = "SELECT * from companysa ORDER BY num DESC LIMIT ?,?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1 , start);
					pstmt.setInt(2, cnt);
				}else {		
					
				sql = "select * from companysa where " + keyField + " like ?  order by num desc limit ?,?" ;
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,  "%"+keyWord+"%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, cnt);
				}
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					CompanyBean bean = new CompanyBean();
					
					bean.setNum(rs.getInt("num"));
					bean.setId(rs.getString("id"));
					bean.setPostnum(rs.getString("postnum"));
					bean.setCity(rs.getString("city"));
					bean.setStreetaddr(rs.getString("streetaddr"));
					bean.setSize(rs.getInt("size"));
					bean.setCallnum(rs.getString("callnum"));
					bean.setCompanyinfo(rs.getString("companyinfo"));
					
		            vlist.addElement(bean);
				}
				
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			
			return vlist;
		}
	
		
	
		//회사 테이블 수정
		public boolean updateCompany(String phone, String info, int num) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			boolean flag = false;
			try {
				con = pool.getConnection();
				sql = "update companysa set  callnum = ? , companyinfo = ? where num = ?";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, phone);
				pstmt.setString(2, info);
				pstmt.setInt(3, num);

				if(pstmt.executeUpdate()==1) flag = true;
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
			return flag;
		}
	
		
		//관리자 -  회사정보 삭제
		public void deleteCompany(int num) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "delete from companysa where num = ?";
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
	
	
		
		//총 외상유저수
				public int getTotalComUser(String keyField, String keyWord) {
					
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					int totalCount = 0;
					try {
						con = pool.getConnection();
						if(keyWord.trim().equals("")|| keyWord==null) {
							//검색이 아닌 경우
							sql = "select count(*) from usersa where authority = 0";
							pstmt = con.prepareStatement(sql);
							
						}else {
						sql = "select count(*) from usersa where " + keyField + " like ? and authority = 0" ;
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
					
					
				
				
				
					
					
					//관리자 외상고객 리스트 검색 및 페이징 기능 추가
				public Vector<UserBean> getComUserList(String keyField, String keyWord, int start, int cnt){
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					Vector<UserBean> vlist = new Vector<UserBean>();
					try {
						con = pool.getConnection();
						if(keyWord.trim().equals("")|| keyWord==null) {
							
							sql = "select * from usersa where authority = 0 order by num desc limit ?,?";
							pstmt = con.prepareStatement(sql);
							pstmt.setInt(1 , start);
							pstmt.setInt(2, cnt);
						}else {		
							
						sql = "select * from usersa where " + keyField + " like ? and authority = 0  order by num desc limit ?,?" ;
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1,  "%"+keyWord+"%");
						pstmt.setInt(2, start);
						pstmt.setInt(3, cnt);
						}
						
						rs = pstmt.executeQuery();
						
						while(rs.next()) {
							UserBean bean = new UserBean();
							
							bean.setNum(rs.getInt("num"));
							bean.setId(rs.getString("id"));
							bean.setPwd(rs.getString("pwd"));
							bean.setName(rs.getString("name"));
							bean.setGender(rs.getInt("gender"));
							
				            String birthDate = SDF_DATE.format(rs.getDate("birth"));
				            bean.setBirth(birthDate);
				            
							bean.setEmail(rs.getString("email"));
							bean.setPostnum(rs.getString("postnum"));
							bean.setCity(rs.getString("city"));
							bean.setStreetaddr(rs.getString("streetaddr"));
							
							String joinDate = SDF_DATE.format(rs.getDate("joindate"));
							bean.setJoindate(joinDate);
							
							bean.setPoint(rs.getInt("point"));
							bean.setCompany(rs.getInt("company"));
							bean.setPhone(rs.getString("phone"));
							bean.setSns(rs.getInt("sns"));
							bean.setSnsid(rs.getString("snsid"));
							bean.setSnspwd(rs.getString("snspwd"));
							bean.setFrnum(rs.getInt("frnum"));
							bean.setAuthority(rs.getInt("authority"));
				            
				            vlist.addElement(bean);
						}
						
						
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					
					return vlist;
				}
			
	
				
				
				//관리자 -  회사정보를 가진 유저 회사 정보 없애기
				public void updateCompanyUser(int num) {
					Connection con = null;
					PreparedStatement pstmt = null;
					String sql = null;
					int company =0;
					try {
						con = pool.getConnection();
						sql = "update usersa set  company = ? where company = ?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1,company);
						pstmt.setInt(2,num);
						pstmt.executeUpdate();
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt);
					}
					return;
				}
	
	
				//관리자 -  외상 유저정보 수정(이메일,성별, 전화번호, 권한, 이름, 지점정보) + 아이디
				public boolean updateComUser(String email, int gender, String phone,  int authority, String name, int frnum, int Company, String id) {
					Connection con = null;
					PreparedStatement pstmt = null;
					String sql = null;
					boolean flag = false;
					try {
						con = pool.getConnection();
						sql = "update usersa set email = ?, gender = ? , phone = ? , authority = ? , name = ? , frnum = ?, company = ? where id = ?";
						pstmt = con.prepareStatement(sql);
						
						pstmt.setString(1, email);
						pstmt.setInt(2, gender);
						pstmt.setString(3, phone);
						pstmt.setInt(4, authority);
						pstmt.setString(5, name);
						pstmt.setInt(6, frnum);
						pstmt.setInt(7, Company);
						pstmt.setString(8, id);
						
						
						if(pstmt.executeUpdate()==1) flag = true;
						
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt);
					}
					return flag;
				}
	
				
				//회사번호로 상품 이름 찾기
				public String getComName(int com) {
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					String name = null;
					try {
						con = pool.getConnection();
						sql = "select id from companysa where num = ? ";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1,com);
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
				
				
				
				//유저 입력
				public void userJoin(String id, String pwd, String name, String birth, String email, String phone) {
					Connection con = null;
					PreparedStatement pstmt = null;
					String sql = null;
					try {
						con = pool.getConnection();
						sql = "insert usersa(id,pwd,name,gender,birth,email,postnum,city,streetaddr,joindate,point,sns,snsid,snspwd,authority,company,frnum,phone)";
						sql+="values(?, ?, ? , 1, ?, ?, '', '', '', now(), 0, 0, null, null, 1, 0, 0, ?);";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1,id);
						pstmt.setString(2,pwd);
						pstmt.setString(3,name);
						pstmt.setString(4,birth);
						pstmt.setString(5,email);
						pstmt.setString(6,phone);
						pstmt.executeUpdate();
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt);
					}
					return;
				}
				
				
				//속한 회사의 고객수 
				public int getComUserCount(int com) {
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					int num = 0;
					try {
						con = pool.getConnection();
						sql = "select count(*) from usersa where company = ? ";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1,com);
						rs = pstmt.executeQuery();
						while(rs.next()) {
							num = rs.getInt(1);
						}
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return num;
				}
				
				
//------------------------------상품 등록 ---------------------------------
				
				//총 헬스상품 수
				public int getTotalHitem(String keyField, String keyWord) {
					
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					int totalCount = 0;
					try {
						con = pool.getConnection();
						if(keyWord.trim().equals("")|| keyWord==null) {
							//검색이 아닌 경우
							sql = "select count(*) from healthitemsa";
							pstmt = con.prepareStatement(sql);
							
						}else {
						sql = "select count(*) from  healthitemsa  where " + keyField + " like ?" ;
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
				
				
				// 판매 종료일이 지난 상품의 판매 상태를 업데이트하는 메서드
				public void updateSellFlagForExpiredItems() {
				    Connection con = null;
				    PreparedStatement pstmt = null;
				    
				    try {
				        con = pool.getConnection();
				        
				        String sql = "UPDATE healthitemsa SET sellflag = 0 WHERE sellflag = 1 AND sellperiod < CURDATE()";
				        pstmt = con.prepareStatement(sql);      
				        pstmt.executeUpdate();
				    } catch (Exception e) {
				        e.printStackTrace();
				    } finally {
				        pool.freeConnection(con, pstmt);
				    }
				}
				
				
				//관리자 헬스아이템 리스트 검색 및 페이징 기능 추가
			public Vector<HealthItemBean> getHealthItemList(String keyField, String keyWord, int start, int cnt){
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = null;
				Vector<HealthItemBean> vlist = new Vector<HealthItemBean>();
				try {
					con = pool.getConnection();
					// 판매 종료일이 지난 상품의 판매 상태를 업데이트
			        updateSellFlagForExpiredItems();
					
					if(keyWord.trim().equals("")|| keyWord==null) {
						
						sql = "select * from  healthitemsa  order by num desc limit ?,?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1 , start);
						pstmt.setInt(2, cnt);
					}else {		
						
					sql = "select * from healthitemsa where " + keyField + " like ? order by num desc limit ?,?" ;
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,  "%"+keyWord+"%");
					pstmt.setInt(2, start);
					pstmt.setInt(3, cnt);
					}
					
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						HealthItemBean bean = new HealthItemBean();
						
						bean.setNum(rs.getInt("num"));
						bean.setName(rs.getString("name"));
						bean.setHcontent(rs.getString("hcontent"));
						bean.setFcperiod(rs.getString("fcperiod"));
						bean.setPtnum(rs.getInt("ptnum"));
						bean.setGxnum(rs.getInt("gxnum"));
						bean.setFrnum(rs.getInt("frnum"));
						bean.setPrice(rs.getInt("price"));
						bean.setSellperiod(rs.getString("sellperiod"));
						bean.setSellflag(rs.getBoolean("sellflag"));
						
			            vlist.addElement(bean);
					}
					
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					pool.freeConnection(con, pstmt, rs);
				}
				
				return vlist;
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
					sql = "select name from healthitemsa where num = ? ";
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
				
				
			
				
			//상품 테이블 수정
			public boolean updateHitem(String sellperiod, boolean sellflag, int num ) {
				Connection con = null;
				PreparedStatement pstmt = null;
				String sql = null;
				boolean flag = false;
				try {
					con = pool.getConnection();
					sql = "update healthitemsa set  sellperiod = ? , sellflag = ? where num = ?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, sellperiod);
					pstmt.setBoolean(2, sellflag);
					pstmt.setInt(3, num);

					if(pstmt.executeUpdate()==1) flag = true;
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					pool.freeConnection(con, pstmt);
				}
				return flag;
			}
				
				
				
				
				
				
				
				
				
	
	
	
	
	
	
//------------------------------DB 데이터 입력 ------------------------------	
		

			
		//유저 500개 입력
		
	public void user500(){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert usersa(id,pwd,name,gender,birth,email,postnum,city,streetaddr,joindate,point,sns,snsid,snspwd,authority,company,frnum,phone)";
			sql+="values(CONCAT('a', ?), 'a', 'a', 1, '2000-01-01', 'a@A.com', 1111, '1','1', now(), 1000, 0,null,null,1,1,1,'1');";
			pstmt = con.prepareStatement(sql);
			for (int i = 0; i < 500; i++) {
				pstmt.setInt(1, i);
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	
		//강사 9개 입력
	
		public void trainer9(){
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "insert usersa(id,pwd,name,gender,birth,email,postnum,city,streetaddr,joindate,point,sns,snsid,snspwd,authority,company,frnum,phone)";
				sql+="values(CONCAT('t',?), 't', 't', 2, '2022-02-02', 't@T.com', 1111, '1','1', now(), 1000, 0,null,null,2,null,1,'2');";
				pstmt = con.prepareStatement(sql);
				for (int i = 1; i < 10; i++) {
					pstmt.setInt(1,i);
					pstmt.executeUpdate();
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
		}
		
		//회사 20개 입력
		
		public void company20(){
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "insert companysa(id, postnum, city, streetaddr, size, callnum, companyinfo)";
				sql+="values(CONCAT('c',?), 'c', 'c', 'c', 300, '051-000-0000', 'java');";
				pstmt = con.prepareStatement(sql);
				for (int i = 0; i < 20; i++) {
					pstmt.setInt(1,i);
					pstmt.executeUpdate();
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
		}
		
		//외상 + 비회원 20개 입력
		
		public void comUser20(){
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "insert usersa(id,pwd,name,gender,birth,email,postnum,city,streetaddr,joindate,point,sns,snsid,snspwd,authority,company,frnum,phone)";
				sql+="values(CONCAT('cuser',?), 'cu', 'cu', 4, '2044-04-04', 'cu@CU.com', 4444, '4','4', now(), 4000, 0,null,null,0,20,2,'010-4444-4444');";
				pstmt = con.prepareStatement(sql);
				for (int i = 22; i < 40; i++) {
					pstmt.setInt(1,i);
					pstmt.executeUpdate();
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
		}
		
		//회사유저 10개
		public void comUser10(){
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "insert usersa(id,pwd,name,gender,birth,email,postnum,city,streetaddr,joindate,point,sns,snsid,snspwd,authority,company,frnum,phone)";
				sql+="values(CONCAT('userc',?), 'uc', 'uc', 3, '2033-03-03', 'cu@CU.com', 3333, '3','3', now(), 3000, 0,null,null,0,16,1,'010-3333-3333');";
				pstmt = con.prepareStatement(sql);
				for (int i = 0; i < 10; i++) {
					pstmt.setInt(1,i);
					pstmt.executeUpdate();
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
		}
		
		
		// 유저 가입상품 500개
		
		public void payitem500(){
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "insert payitemsa(usernum, paydate, itemnum, payprice, paymethod, payflag, ccflag, payback)";
				sql+="values(?, now(), 1, 50000, 'card',1,0,0);";
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
		
		//외상 가입상품 30개
		public void payitem30(){
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "insert payitemsa(usernum, paydate, itemnum, payprice, paymethod, payflag, ccflag, payback)";
				sql+="values(?, now(), 1, 50000, '외상',0,0,0);";
				pstmt = con.prepareStatement(sql);
				for (int i = 502; i < 532; i++) {
					pstmt.setInt(1,i);
					pstmt.executeUpdate();
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
		}
		
		
		//트레이너 출퇴근 정보 10개
		public void trainerWork10(){
		    Connection con = null;
		    PreparedStatement pstmt = null;
		    String sql = null;
		    Random random = new Random();
		    try {
		        con = pool.getConnection();
		        sql = "insert trainerworksa(trainer,date,starttime, endtime, frnum) values(?, ?, '08:00', '22:00', 1)";
		        pstmt = con.prepareStatement(sql);
		        for (int i = 1; i < 10; i++) {
		            pstmt.setInt(1, i);
		            // 랜덤 연도 생성 (2000년부터 2023년까지)
		            int year = random.nextInt(24) + 2000;
		            pstmt.setString(2, year + "-01-01");
		            pstmt.executeUpdate();
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    } finally {
		        pool.freeConnection(con, pstmt);
		    }
		}
		
		
		//임의 결제 데이터 넣기 200개
		public void Charge200(){
		    Connection con = null;
		    PreparedStatement pstmt = null;
		    String sql = null;
		    Random random = new Random();
		    try {
		        con = pool.getConnection();
		        sql = "insert chargeinfosa(user, code, price, date, chamet, item, ccflag) values(?,'123445', 27800, ? ,'card',1,0 )";
		        pstmt = con.prepareStatement(sql);
		        for (int i = 1; i < 200; i++) {
		            pstmt.setInt(1, i);
		            // 랜덤 연도 생성 (2000년부터 2023년까지)
		            int month = random.nextInt(5);
		            pstmt.setString(2, "2024-0" + month +"-01");
		            pstmt.executeUpdate();
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    } finally {
		        pool.freeConnection(con, pstmt);
		    }
		}
		
		//임의 결제 데이터 넣기 300개
		public void Charge300(){
		    Connection con = null;
		    PreparedStatement pstmt = null;
		    String sql = null;
		    Random random = new Random();
		    try {
		        con = pool.getConnection();
		        sql = "insert chargeinfosa(user, code, price, date, chamet, item, ccflag) values(?,'123445', 46800, ? ,'card',2,0 )";
		        pstmt = con.prepareStatement(sql);
		        for (int i = 1; i < 300; i++) {
		            pstmt.setInt(1, i);
		            // 랜덤 연도 생성 (2000년부터 2023년까지)
		            int month = random.nextInt(5);
		            pstmt.setString(2, "2024-0" + month +"-01");
		            pstmt.executeUpdate();
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    } finally {
		        pool.freeConnection(con, pstmt);
		    }
		}
		
		//리뷰 데이터 넣기 200개
		public void Review200(){
		    Connection con = null;
		    PreparedStatement pstmt = null;
		    String sql = null;
		    Random random = new Random();
		    try {
		        con = pool.getConnection();
				sql = "insert reviewsa(title,content,date,usernum,ip,frnum)";
				sql+="values('피곤하다', '오늘 발표다', now(), ?, '192.168.1.1',1);";
		        pstmt = con.prepareStatement(sql);
		        for (int i = 1; i < 200; i++) {
		            pstmt.setInt(1, i);
		            // 랜덤 연도 생성 (2000년부터 2023년까지)
//		            int month = random.nextInt(5);
//		            pstmt.setString(2, "2024-0" + month +"-01");
		            pstmt.executeUpdate();
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    } finally {
		        pool.freeConnection(con, pstmt);
		    }
		}
		
		
		//Qna 데이터 넣기 200개
		public void Qna200(){
		    Connection con = null;
		    PreparedStatement pstmt = null;
		    String sql = null;
		    Random random = new Random();
		    try {
		        con = pool.getConnection();
				sql = "insert qnasa(title,content,date,usernum,ip,secret,frnum,ansflag)";
				sql+="values('취직', '언제하지', now(), ?, '192.168.1.1',0,2,0);";
		        pstmt = con.prepareStatement(sql);
		        for (int i = 1; i < 200; i++) {
		            pstmt.setInt(1, i);
		            // 랜덤 연도 생성 (2000년부터 2023년까지)
//		            int month = random.nextInt(5);
//		            pstmt.setString(2, "2024-0" + month +"-01");
		            pstmt.executeUpdate();
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    } finally {
		        pool.freeConnection(con, pstmt);
		    }
		}
		
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
		
		
//		
//		public static void main(String[] args) {
//			UserMgr mgr = new UserMgr();
//			mgr.user500();
//			mgr.trainer9();
//			mgr.company20();
//			mgr.comUser30();
//			mgr.comUser10();
//			mgr.payitem500();
//			mgr.payitem20();
//			mgr.trainerWork10();
//			mgr.trainerWork10();
//			mgr. Charge300();
//			mgr. Charge200();
//			mgr.Review200();
//			mgr.reserve500();
//			mgr.Qna200();
//			System.out.println("입력성공");
//		}
//
//		
			
}

		
		
		
		
//		
//		DELIMITER $$
//		CREATE TRIGGER update_sellflag_trigger BEFORE INSERT ON healthitemsa
//		FOR EACH ROW
//		BEGIN
//		    IF NEW.sellperiod < NOW() THEN
//		        SET NEW.sellflag = 0; -- 혹은 다른 값을 원하는 값으로 설정하세요.
//		    END IF;
//		END$$
//		DELIMITER ;