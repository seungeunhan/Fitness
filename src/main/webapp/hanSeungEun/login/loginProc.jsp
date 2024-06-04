<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="hanSeungEun.LoginResult"%>
<jsp:useBean id="uMgr" class="hanSeungEun.UserMgr" />
<%
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
    LoginResult loginResult = uMgr.loginMember(id, pwd);

    if (loginResult.getMode() == 0) {
        response.sendRedirect("logError.jsp?mode=0");
    } else if (loginResult.getMode() == 1) {
        response.sendRedirect("logError.jsp?mode=1");
    } else if (loginResult.getMode() == 2) {
        int authority = loginResult.getAuthority(); // 회원의 권한 정보를 가져옴

        if (authority == 1) { // 권한이 1이면 일반 사용자
        	session.setAttribute("idKey", id);
            response.sendRedirect("../../jeongJiYoon/HomePage.jsp"); // 적절한 관리자 페이지로 이동
        } else if (authority == 2) { // 권한이 2이면 트레이너
            session.setAttribute("idKey", id);
            response.sendRedirect("../adminMain.jsp"); // 적절한 트레이너 페이지로 이동
        }else if (authority == 3) { // 권한이 3이면 관리자
            session.setAttribute("idKey", id);
            response.sendRedirect("../../project/adminMain.jsp"); // 적절한 트레이너 페이지로 이동
        }
    }
%>