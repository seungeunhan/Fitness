package jeongJiYoon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ReviewMgr {
	
	private DBConnectionMgr pool;

    public ReviewMgr() {
        pool = DBConnectionMgr.getInstance();
    }
    
    
    //데이터베이스에서 모든 리뷰 정보를 가져오는 메서드
	public List<ReviewBean> getAllReviews() {
		List<ReviewBean> reviews = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
		    con = pool.getConnection(); // 기존의 연결 관리자 객체를 사용하여 연결 가져오기
		
		 // SQL 쿼리 작성 (review 테이블과 user 테이블 조인하여 usernum에 해당하는 username 가져오기)
            String sql = "SELECT r.num, r.title, u.name, r.date " +
                         "FROM review r " +
                         "JOIN user u ON r.usernum = u.num";
            
            // PreparedStatement 객체 생성 및 쿼리 실행
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            // 결과 처리
            while (rs.next()) {
                // ReviewBean 객체 생성 및 값 설정
                ReviewBean bean = new ReviewBean();
                bean.setNum(rs.getInt("num"));
                bean.setTitle(rs.getString("title"));
                bean.setName(rs.getString("name"));
                bean.setDate(rs.getString("date"));
                reviews.add(bean);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return reviews;
	}
	
	// 데이터베이스에서 특정 ID의 리뷰 정보를 가져오는 메서드
    public ReviewBean getReviewById(int id) {
        ReviewBean review = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = pool.getConnection(); // 기존의 연결 관리자 객체를 사용하여 연결 가져오기
            
            // SQL 쿼리 작성 (review 테이블에서 특정 ID의 리뷰 정보 가져오기)
            String sql = "SELECT r.num, r.title, r.content, u.name, r.date " +
                         "FROM review r " +
                         "JOIN user u ON r.usernum = u.num " +
                         "WHERE r.num = ?";
            
            // PreparedStatement 객체 생성 및 쿼리 실행
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            
            // 결과 처리
            if (rs.next()) {
                // ReviewBean 객체 생성 및 값 설정
                review = new ReviewBean();
                review.setNum(rs.getInt("num"));
                review.setTitle(rs.getString("title"));
                review.setContent(rs.getString("content"));
                review.setName(rs.getString("name"));
                review.setDate(rs.getString("date"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return review;
    }
    
    // 데이터베이스에 리뷰를 추가하는 메서드
    public void addReview(ReviewBean bean) {
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = null;
        try {
            con = pool.getConnection();
            sql = "INSERT INTO review (title, content, usernum, date, ip) VALUES (?, ?, ?,now(), ?)";

            // PreparedStatement 객체 생성 및 쿼리 실행
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, bean.getTitle());
            pstmt.setString(2, bean.getContent());
            pstmt.setInt(3, bean.getUsernum());
            pstmt.setString(4, bean.getIp());
            pstmt.executeUpdate();
        } catch (Exception e) {
            // 예외 발생 시 자세한 정보 출력
            e.printStackTrace();
            // 추가로 예외 정보를 로그에 남기도록 수정 가능
            System.err.println("SQL Exception: " + e.getMessage());
        } finally {
            pool.freeConnection(con, pstmt);
        }
    }
    
    // 현재 날짜를 문자열로 반환하는 메소드
    public String getCurrentDate() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date currentDate = new Date();
        return dateFormat.format(currentDate);
    }
    
    // 데이터베이스에서 리뷰를 삭제하는 메서드
    public void deleteReview(int id) {
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = null;
        try {
            con = pool.getConnection();
            sql = "DELETE FROM review WHERE num = ? AND usernum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, id);
            int affectedRows = pstmt.executeUpdate();
            if (affectedRows == 0) {
                // 삭제할 리뷰가 존재하지 않는 경우 또는 삭제할 권한이 없는 경우
                throw new Exception("Review not found or user does not have permission to delete.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(con, pstmt);
        }
    }

    
    // 데이터베이스에서 리뷰를 수정하는 메서드
    public void updateReview(ReviewBean bean) {
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = null;
        try {
            con = pool.getConnection();
            sql = "UPDATE review SET title = ?, content = ?, date = now(), ip = ? WHERE num = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, bean.getTitle());
            pstmt.setString(2, bean.getContent());
            pstmt.setString(3, bean.getIp());
            pstmt.setInt(4, bean.getNum());
            pstmt.executeUpdate();
        } catch (Exception e) {
            // 예외 발생 시 자세한 정보 출력
            e.printStackTrace();
            // 추가로 예외 정보를 로그에 남기도록 수정 가능
            System.err.println("SQL Exception: " + e.getMessage());
        } finally {
            pool.freeConnection(con, pstmt);
        }
    }

}