package jeongJiYoon;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/jeongJiYoon/reviewUpdate")
public class ReviewUpdate extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ReviewUpdate() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
	
	        // 받아온 데이터를 이용하여 ReviewBean 객체를 생성
	        ReviewBean review = new ReviewBean();
	        ReviewBean reviewBean = new ReviewBean();
	        reviewBean.setTitle(title);
	        reviewBean.setContent(content);
	        reviewBean.setUsernum(usernum);
	        reviewBean.setIp(ip);
	        reviewBean.setSecret(secret);
	
	        // ReviewMgr 클래스의 updateReview 메서드를 호출하여 리뷰를 수정
	        ReviewMgr rMgr = new ReviewMgr();
	        rMgr.updateReview(review);
	
	        // 리뷰 수정 후 ReviewPage.jsp로 리다이렉트
	        response.sendRedirect("ReviewPage.jsp");
    	}catch (Exception e) {
    		e.printStackTrace();
            response.sendRedirect("ErrorPage.jsp"); // 에러 페이지로 이동
		}
    }
}
