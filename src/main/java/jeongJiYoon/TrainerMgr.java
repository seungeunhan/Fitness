package jeongJiYoon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TrainerMgr {

    private DBConnectionMgr pool;

    public TrainerMgr() {
        pool = DBConnectionMgr.getInstance();
    }
    
	  //데이터베이스에서 모든 트레이너 정보를 가져오는 메서드
	  public List<TrainerBean> getAllTrainers() {
	    List<TrainerBean> trainers = new ArrayList<>();
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    try {
	        con = pool.getConnection(); // 기존의 연결 관리자 객체를 사용하여 연결 가져오기
	        
	        // SQL 쿼리 작성
	        String sql = "SELECT * FROM trainer";
	        
	        // PreparedStatement 객체 생성 및 쿼리 실행
	        pstmt = con.prepareStatement(sql);
	        rs = pstmt.executeQuery();
	        
	        // 결과 처리
	        while (rs.next()) {
	            // TrainerBean 객체 생성 및 값 설정
	            TrainerBean bean = new TrainerBean();
	            bean.setNum(rs.getInt("num"));
	            bean.setUser(rs.getInt("user"));
	            bean.setImgpath(rs.getString("imgpath"));
	            bean.setCareer(rs.getString("career"));
	            trainers.add(bean);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        pool.freeConnection(con, pstmt);
	    }
	    return trainers;
	  }

    // 특정 지점에 해당하는 트레이너 이미지 경로 가져오기
    public List<String> getTrainerImagePaths(String location) {
        List<String> imagePaths = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = pool.getConnection();
            String sql = "SELECT t.imgpath FROM trainer t JOIN user u ON t.user = u.num WHERE u.frnum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, location);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                imagePaths.add(rs.getString("imgpath"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return imagePaths;
    }

    // 특정 트레이너의 Career 정보 가져오기
    public String getTrainerCareer(int trainerNum) {
        String career = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = pool.getConnection();
            String sql = "SELECT career FROM trainer WHERE num = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, trainerNum);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                career = rs.getString("career");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return career;
    }
    
    public int getTrainerFrnum(int trainerNum) {
        int frnum = 0;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
        	con = pool.getConnection();
            String sql = "SELECT frnum FROM user WHERE num = (SELECT user FROM trainer WHERE num = ?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, trainerNum);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                frnum = rs.getInt("frnum");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try { rs.close(); } catch (Exception e) { }
            }
            if (pstmt != null) {
                try { pstmt.close(); } catch (Exception e) { }
            }
            if (con != null) {
                try { con.close(); } catch (Exception e) { }
            }
        }
        return frnum;
    }
}

