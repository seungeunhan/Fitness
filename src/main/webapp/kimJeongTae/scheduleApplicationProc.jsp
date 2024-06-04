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
//수강번호와 유저정보를 보내서 수강시킨다.
int scheduleNum = Integer.parseInt(request.getParameter("content1-num"));
int userNum = 1;
mgr.scheduleApplicationFrom(scheduleNum,userNum);
response.sendRedirect("myPage.jsp");

%>
<script>alert("예약완료");</script>
</body>
</html>