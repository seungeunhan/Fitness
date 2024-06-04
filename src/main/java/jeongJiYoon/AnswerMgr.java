package jeongJiYoon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AnswerMgr {
	
	private DBConnectionMgr pool;

    public AnswerMgr() {
        pool = DBConnectionMgr.getInstance();
    }
    
 // 질문글에 해당하는 답변을 가져오는 메서드
    public AnswerBean getAnswerByQnaId(int qnaId) {
    	AnswerBean answer = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = pool.getConnection(); // 기존의 연결 관리자 객체를 사용하여 연결 가져오기
            
            // SQL 쿼리 작성 (answer 테이블에서 질문글에 해당하는 답변 정보 가져오기)
            String sql = "SELECT num, content, date " +
                         "FROM answer " +
                         "WHERE posnum = ?";
            
            // PreparedStatement 객체 생성 및 쿼리 실행
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, qnaId);
            rs = pstmt.executeQuery();
            
            // 결과 처리
            if (rs.next()) {
                // AnswerBean 객체 생성 및 값 설정
                answer = new AnswerBean();
                answer.setNum(rs.getInt("num"));
                answer.setContent(rs.getString("content"));
                answer.setDate(rs.getString("date"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return answer;
    }
}
