package project;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/project/UserEdit")
public class UserEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			UserMgr mgr = new UserMgr();
			int groupId = Integer.parseInt(request.getParameter("groupId")); 
			int index1 =  groupId *2 + 2;
			int index2 = groupId*2 + 3;
			
	        String email = request.getParameter( index1 + "_1");
	        int gender = Integer.parseInt(request.getParameter(index1+"_2"));
	        String phone = request.getParameter( index1 + "_3");
	        int authority = Integer.parseInt(request.getParameter(index1+"_8"));
	        String name = request.getParameter( index2 + "_1");
	        String birth = request.getParameter( index2 + "_2");
	        int frnum = Integer.parseInt(request.getParameter(index2+"_4"));
	        String id = request.getParameter( "userId");
	        
	        mgr.updateUser(email, gender, phone, authority, name,  frnum, id);
			response.sendRedirect("userManage.jsp");
		
	}

}

