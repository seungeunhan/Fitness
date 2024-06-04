<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="uMgr" class="hanSeungEun.UserMgr" />

<%
		String email="", nickname="";
		if(request.getParameter("email")!=null){
			email = request.getParameter("email");
			nickname = request.getParameter("nickname");
		}
		String id = uMgr.snsLogin(nickname, email);
		session.setAttribute("idKey", id);
		response.sendRedirect("../../jeongJiYoon/HomePage.jsp");
%>

