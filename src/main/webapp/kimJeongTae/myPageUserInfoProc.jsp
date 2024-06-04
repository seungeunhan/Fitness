<%@page import="kimJeongTae.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="mgr" class="kimJeongTae.TrainScheduleMgr"></jsp:useBean>
<!DOCTYPE html>
<!-- 이곳에서 폼태그 내에 있는 유저의 전화번호,이메일,패스워드,주소를 저장한다. -->
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<!-- 이제부터 db에 값을 저장한다. -->
	<%
		UserBean userbean = new UserBean();
		userbean.setNum(1);
		userbean.setPhontnum(request.getParameter("phone"));
		userbean.setEmail(request.getParameter("email"));
		userbean.setPwd(request.getParameter("password"));
		userbean.setStreetaddr(request.getParameter("address"));
		//세션내부의 유저 번호를 받아야 한다.
		
		mgr.updateUserBean(userbean);
		response.sendRedirect("myPage.jsp");
	%>
	
</body>
</html>