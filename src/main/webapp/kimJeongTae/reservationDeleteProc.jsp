<%@page import="kimJeongTae.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="mgr" class="kimJeongTae.TrainScheduleMgr"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//String userId = "john_doe";
	String userId = "aaa";
	UserBean userbean = mgr.getUserBean(userId);
	
%>
<%
	mgr.deleteReservationBean(userbean.getNum());
	response.sendRedirect("myPage.jsp");


%>
</body>
</html>