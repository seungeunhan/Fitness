<%@page import="kimJeongTae.UserBean"%>
<%@page import="kimJeongTae.ReservationBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="mgr" class="kimJeongTae.TrainScheduleMgr"></jsp:useBean>
<!DOCTYPE html>
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
	ReservationBean bean = new ReservationBean();

	bean.setUser(userbean.getNum());
	bean.setPhonenum(request.getParameter("phonNum"));
	bean.setEmail(request.getParameter("email"));
	bean.setPopulation(Integer.parseInt(request.getParameter("population")));
	bean.setCarflag(Boolean.parseBoolean(request.getParameter("parking")));
	bean.setReservdate(request.getParameter("reservationDate"));
	mgr.updateReservationBean(bean);
	response.sendRedirect("myPage.jsp");
%>


</body>
</html>