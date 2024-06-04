package hanSeungEun;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import hanSeungEun.UserBean;

public class UserMgr {

	private DBConnectionMgr pool;

	public UserMgr() {
		pool = DBConnectionMgr.getInstance();
	}

	//로그인(일반 사용자 : 1, 트레이너 : 2, 관리자 : 3)
	public LoginResult loginMember(String id, String pwd) {
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = null;
	    
	    LoginResult result = new LoginResult();

	    try {
	        if (!checkId(id)) {
	            result.setMode(0); // 아이디가 존재하지 않음
	            return result;
	        }
	        con = pool.getConnection();
	        sql = "select id, pwd, authority from user where id = ? and pwd = ?";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, id);
	        pstmt.setString(2, pwd);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            result.setMode(2); // 아이디와 비밀번호 모두 일치함
	            result.setAuthority(rs.getInt("authority")); // 권한 정보 저장
	        } else {
	            result.setMode(1); // 아이디는 존재하지만 비밀번호가 일치하지 않음
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        pool.freeConnection(con, pstmt, rs);
	    }
	    return result;
	}
	
	
	//sns 로그인
	public String snsLogin(String nickname, String email) {
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = null;
	    try {
	        con = pool.getConnection();
	        // 사용자가 이미 존재하는지 확인하기 위해 SELECT 쿼리를 실행합니다.
	        sql = "SELECT id FROM user WHERE id = ?";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, nickname);
	        rs = pstmt.executeQuery();
	        
	        // 이미 존재하는 사용자라면 바로 닉네임을 반환합니다.
	        if(rs.next()) {
	            return nickname;
	        } else {
	            // 존재하지 않는 사용자라면 새로운 레코드를 삽입합니다.
	            sql = "INSERT INTO user (id, email) VALUES (?, ?)";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1, nickname);
	            pstmt.setString(2, email);
	            pstmt.executeUpdate();
	            return nickname;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        // 자원을 해제합니다.
	        pool.freeConnection(con, pstmt, rs);
	    }
	    // 오류가 발생한 경우에는 null을 반환합니다.
	    return null;
	}
	
	
	//ID 중복확인
		public boolean checkId(String id) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			boolean flag  = false;
			try {
				con = pool.getConnection();
				sql = "select id from user where id= ? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();//sql문 실행
				flag = rs.next();//true이면 중복, false 중복아님.
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return flag;
		}
		
		
		//회원가입
		public boolean insertMember(UserBean bean) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			boolean flag = false;
			try {
				con = pool.getConnection();
				sql = "insert into user (id, pwd, name, gender, birth, email, phone) values(?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, bean.getId());
				pstmt.setString(2, bean.getPwd());
				pstmt.setString(3, bean.getName());
				pstmt.setInt(4, bean.getGender());
				pstmt.setString(5, bean.getBirth());
				pstmt.setString(6, bean.getEmail());
				pstmt.setString(7, bean.getPhone());
				if(pstmt.executeUpdate()==1) flag = true;
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
			return flag;
		}
		
		
		//아이디 찾기
		public String findId(String name, String email) {
	        String userId = null;
	        Connection con = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        try {
	            con = pool.getConnection();
	            String sql = "select id from user where name = ? and email = ?";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1, name);
	            pstmt.setString(2, email);
	            rs = pstmt.executeQuery();
	            if (rs.next()) {
	            	userId = rs.getString("id");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            pool.freeConnection(con, pstmt, rs);
	        }
	        return userId;
	    }
		
		
		//회원정보 가져오기
		public UserBean getMember(String id) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			UserBean bean = new UserBean();
			try {
				con = pool.getConnection();
				sql = "select * from user where id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					bean.setNum(rs.getInt("num"));
					bean.setId(rs.getString("id"));
					bean.setPwd(rs.getString("pwd"));
					bean.setName(rs.getString("name"));
					bean.setGender(rs.getInt("gender"));
					bean.setBirth(rs.getString("birth"));
					bean.setEmail(rs.getString("email"));
					bean.setPostnum(rs.getString("postnum"));
					bean.setPhone(rs.getString("phone"));
					bean.setCity(rs.getString("city"));
					bean.setStreetaddr(rs.getString("streetaddr"));
					bean.setJoindate(rs.getString("joindate"));
					bean.setPoint(rs.getInt("point"));
					bean.setSns(rs.getInt("sns"));
					bean.setSnsid(rs.getString("snsid"));
					bean.setSnspwd(rs.getString("snspwd"));
					bean.setAuthority(rs.getInt("authority"));
					bean.setCompany(rs.getInt("company"));
					bean.setFrnum(rs.getInt("frnum"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return bean;
		}
		
	    
}
