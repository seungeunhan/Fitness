package jeongJiYoon;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/jeongJiYoon/reviewDelete")
public class ReviewDelete extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        try {
            // 클라이언트로부터 전송된 리뷰 ID와 사용자 ID 추출
            int reviewId = Integer.parseInt(request.getParameter("id"));
            int userId = Integer.parseInt(request.getParameter("userId"));

            // ReviewMgr 클래스를 사용하여 데이터베이스에서 해당 리뷰 정보 가져오기
            ReviewMgr reviewMgr = new ReviewMgr();
            ReviewBean review = reviewMgr.getReviewById(reviewId);

            if (review != null && review.getUsernum() == userId) { // 해당 리뷰가 존재하고 사용자의 글인 경우에만 삭제 수행
                // 데이터베이스에서 해당 리뷰 삭제
                reviewMgr.deleteReview(reviewId);

                // 삭제 후 적절한 페이지로 리다이렉트
                response.sendRedirect("ReviewPage.jsp"); // 게시판 페이지로 이동
            } else {
                // 사용자의 글이 아닌 경우 에러 메시지 표시 후 리다이렉트
                response.sendRedirect("ErrorPage.jsp?message=Unauthorized"); // 권한 없음 에러 페이지로 이동
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("ErrorPage.jsp"); // 에러 페이지로 이동
        }
    }
}
