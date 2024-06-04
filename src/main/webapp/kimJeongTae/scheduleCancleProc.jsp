<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="mgr" class="kimJeongTae.TrainScheduleMgr"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
//유저의 스케줄 신청 내역을 삭제시킨다.
int scheduleNum = Integer.parseInt(request.getParameter("content1-num"));
mgr.scheduleCancleFrom(scheduleNum);
response.sendRedirect("myPage.jsp");

%>

</body>
</html>