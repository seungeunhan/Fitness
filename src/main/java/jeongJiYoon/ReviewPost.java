package jeongJiYoon;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/jeongJiYoon/reviewPost")
public class ReviewPost extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	
    	try {
            // 클라이언트로부터 전송된 리뷰 데이터 추출
            String title = request.getParameter("title");
            String content = request.getParameter("content");

            // 사용자 번호는 세션에 저장된 정보를 활용하거나 로그인 기능을 통해 가져와야 합니다.
            // 여기서는 간단하게 1번 사용자로 가정하겠습니다.
            int usernum = 1;

            // IP 주소를 가져오는 방법을 수정
            String ip = request.getRemoteAddr();

            // 비밀 여부와 frnum 값을 적절히 설정해야 합니다. 여기서는 간단히 false와 0으로 설정하겠습니다.
            boolean secret = false;
            
            // ReviewBean 객체 생성 및 데이터 설정
            ReviewBean reviewBean = new ReviewBean();
            reviewBean.setTitle(title);
            reviewBean.setContent(content);
            reviewBean.setUsernum(usernum);
            reviewBean.setIp(ip);
            reviewBean.setSecret(secret);

            // ReviewMgr 클래스를 사용하여 데이터베이스에 리뷰 저장
            ReviewMgr reviewMgr = new ReviewMgr();
            reviewMgr.addReview(reviewBean);

            // 저장 결과에 따라 적절한 페이지로 리다이렉트
            response.sendRedirect("ReviewPage.jsp"); // 게시판 페이지로 이동
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("ErrorPage.jsp"); // 에러 페이지로 이동
        }
    }
}
