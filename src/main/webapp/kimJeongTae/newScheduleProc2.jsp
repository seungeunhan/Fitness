<%@page import="kimJeongTae.TrainScheduleBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="mgr" class="kimJeongTae.TrainScheduleMgr"/>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	TrainScheduleBean bean = new TrainScheduleBean();
	
	System.out.println(request.getParameter("starttime"));
	bean.setTrainer(Integer.parseInt(request.getParameter("trainer")));
	bean.setLcontent(Integer.parseInt(request.getParameter("lcontent")));
	bean.setDate(request.getParameter("date"));
	bean.setStarttime(request.getParameter("starttime"));
	bean.setEndtime(request.getParameter("endtime"));
	
	mgr.insertTrainerSchedule(bean);

	response.sendRedirect("trainerMyPage.jsp");
%>
</body>
</html>