<%@ page import="hanSeungEun.ReservationBean" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="rMgr" class="hanSeungEun.ReservationMgr" />
<jsp:useBean id="uMgr" class="hanSeungEun.UserMgr" />
<jsp:useBean id="uBean" class="hanSeungEun.UserBean" />
<jsp:useBean id="bean" class="hanSeungEun.ReservationBean" />  
<%	
	String num = request.getParameter("num");
	String name = request.getParameter("name");
	String phonenum = request.getParameter("phonenum");
	String pwd = request.getParameter("pwd");
	ReservationBean result = rMgr.checkRev(Integer.parseInt(num), name, phonenum, pwd);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>나의 예약 정보</title>
<link rel="stylesheet" href="revCheckProc.css">
</head>
<body>
<div class="main vertical_center">
    <input id="tab1" type="radio" name="tabs" checked>
    <label for="tab1">나의 예약 정보</label>
    <section id="content1">
            <p>{ <span><%= result.getName() %></span> } 회원님의 예약정보입니다.</p>
            <table class="center">
	            <tr>
	                <th>회원번호</th>
	                <td><%= result.getNum() %></td>
	            </tr>
		        <tr>
		            <th>이름</th>
		            <td><%= result.getName() %></td>
		        </tr>
		        <tr>
		            <th>전화번호</th>
		            <td><%= result.getPhonenum() %></td>
		        </tr>
		        <tr>
		            <th>예약인원</th>
		            <td><%= result.getPopulation() %></td>
		        </tr>
		        <tr>
		            <th>지점번호</th>
		            <td><%= result.getFrnum() %></td>
		        </tr>
		        <tr>
		            <th>날짜</th>
		            <td><%= result.getReservdate() %></td>
		        </tr>   
		        <tr>
		            <th>시간</th>
		            <td><%= result.getTime() %></td>
		        </tr> 
            </table>
            <button type="button" class="btn_ok center" onclick="window.location.href='reservation2.jsp'">확인</button>
    </section>
</div>
</body>
</html>