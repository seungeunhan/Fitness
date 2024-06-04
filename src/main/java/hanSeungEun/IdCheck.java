package hanSeungEun;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hanSeungEun.UserMgr;

@WebServlet("/hanSeungEun/idCheck")
public class IdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		PrintWriter out = response.getWriter();
		
		UserMgr Umgr = new UserMgr();
		boolean result = Umgr.checkId(id);
		int idCheck = 0;
		if(result) {
			idCheck = 0; 
			System.out.println("이미 존재하는 아이디입니다");
		}else{
			idCheck = 1; 
			System.out.println("사용 가능한 아이디입니다.");
		}
		out.write(idCheck+"");
	}

}
