package jeongJiYoon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class QnaMgr {
	
	private DBConnectionMgr pool;

    public QnaMgr() {
        pool = DBConnectionMgr.getInstance();
    }
    
    //데이터베이스에서 모든 Q&A 정보를 가져오는 메서드
    public List<QnaBean> getAllQnas() {
		List<QnaBean> Qnas = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
		    con = pool.getConnection(); // 기존의 연결 관리자 객체를 사용하여 연결 가져오기
		
		 // SQL 쿼리 작성 (review 테이블과 user 테이블 조인하여 usernum에 해당하는 username 가져오기)
            String sql = "SELECT r.num, r.title, u.name, r.date " +
                         "FROM qna r " +
                         "JOIN user u ON r.usernum = u.num";
            
            // PreparedStatement 객체 생성 및 쿼리 실행
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            // 결과 처리
            while (rs.next()) {
                // ReviewBean 객체 생성 및 값 설정
            	QnaBean bean = new QnaBean();
                bean.setNum(rs.getInt("num"));
                bean.setTitle(rs.getString("title"));
                bean.setName(rs.getString("name"));
                bean.setDate(rs.getString("date"));
                Qnas.add(bean);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return Qnas;
	}
    
    //페이지 크기 선택값(5개씩 보기, 10개씩 보기, 15개씩 보기)
    public List<QnaBean> getQnasByPageSize(int pageSize) {
        List<QnaBean> qnaList = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = pool.getConnection();
            String sql = "SELECT r.num, r.title, u.name, r.date " +
                         "FROM qna r " +
                         "JOIN user u ON r.usernum = u.num " +
                         "LIMIT ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, pageSize);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                QnaBean bean = new QnaBean();
                bean.setNum(rs.getInt("num"));
                bean.setTitle(rs.getString("title"));
                bean.setName(rs.getString("name"));
                bean.setDate(rs.getString("date"));
                qnaList.add(bean);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return qnaList;
    }
    
    // 페이지 번호에 따라 데이터 가져오기
    public List<QnaBean> getQnasByPage(int pageSize, int currentPage) {
        List<QnaBean> qnaList = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = pool.getConnection();
            int start = (currentPage - 1) * pageSize;
            String sql = "SELECT r.num, r.title, u.name, r.date " +
                         "FROM qna r " +
                         "JOIN user u ON r.usernum = u.num " +
                         "LIMIT ?, ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, start);
            pstmt.setInt(2, pageSize);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                QnaBean bean = new QnaBean();
                bean.setNum(rs.getInt("num"));
                bean.setTitle(rs.getString("title"));
                bean.setName(rs.getString("name"));
                bean.setDate(rs.getString("date"));
                qnaList.add(bean);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return qnaList;
    }
    
    public int getTotalQnaCount() {
        int totalQnaCount = 0;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = pool.getConnection();
            String sql = "SELECT COUNT(*) AS total FROM qna";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                totalQnaCount = rs.getInt("total");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return totalQnaCount;
    }

    // 데이터베이스에서 특정 ID의 질문 정보를 가져오는 메서드
    public QnaBean getQnaById(int qnaid) {
    	QnaBean qna = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = pool.getConnection(); // 기존의 연결 관리자 객체를 사용하여 연결 가져오기
            
            // SQL 쿼리 작성 (qna 테이블에서 특정 ID의 질문 정보 가져오기)
            String sql = "SELECT q.num, q.title, q.content, u.name, q.date " +
                         "FROM qna q " +
                         "JOIN user u ON q.usernum = u.num " +
                         "WHERE q.num = ?";
            
            // PreparedStatement 객체 생성 및 쿼리 실행
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, qnaid);
            rs = pstmt.executeQuery();
            
            // 결과 처리
            if (rs.next()) {
                // QnaBean 객체 생성 및 값 설정
            	qna = new QnaBean();
            	qna.setNum(rs.getInt("num"));
            	qna.setTitle(rs.getString("title"));
            	qna.setContent(rs.getString("content"));
            	qna.setName(rs.getString("name"));
            	qna.setDate(rs.getString("date"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return qna;
    }
    
    // 검색어를 기반으로 데이터베이스에서 Q&A 정보를 가져오는 메서드
    public List<QnaBean> searchQnasByKeyword(String keyword, int pageSize, int currentPage) {
        List<QnaBean> qnaList = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = pool.getConnection();
            int start = (currentPage - 1) * pageSize;
            // 검색어를 이용하여 LIKE 연산을 수행하여 특정 조건에 부합하는 Q&A 정보를 가져옴
            String sql = "SELECT r.num, r.title, u.name, r.date " +
                         "FROM qna r " +
                         "JOIN user u ON r.usernum = u.num " +
                         "WHERE r.title LIKE ? " +
                         "LIMIT ?, ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "%" + keyword + "%");
            pstmt.setInt(2, start);
            pstmt.setInt(3, pageSize);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                QnaBean bean = new QnaBean();
                bean.setNum(rs.getInt("num"));
                bean.setTitle(rs.getString("title"));
                bean.setName(rs.getString("name"));
                bean.setDate(rs.getString("date"));
                qnaList.add(bean);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return qnaList;
    }
    
    public int getTotalQnaCountByKeyword(String keyword) {
        int totalQnaCount = 0;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = pool.getConnection();
            // 검색어를 이용하여 LIKE 연산을 수행하여 특정 조건에 부합하는 Q&A의 총 개수를 가져옴
            String sql = "SELECT COUNT(*) AS total " +
                         "FROM qna " +
                         "WHERE title LIKE ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "%" + keyword + "%");
            rs = pstmt.executeQuery();
            if (rs.next()) {
                totalQnaCount = rs.getInt("total");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return totalQnaCount;
    }    
}
