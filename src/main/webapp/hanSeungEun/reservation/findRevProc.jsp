<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="rMgr" class="hanSeungEun.ReservationMgr" />    
<% 
	request.setCharacterEncoding("EUC-KR");
	String name = request.getParameter("name");
	String phonenum = request.getParameter("phonenum");
	String pwd = request.getParameter("pwd");
	int revNum = rMgr.findRev(name, phonenum, pwd);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="findRev.css">
<title>예약번호 찾기</title>
<script>
     // 예약 조회 버튼 눌렀을 때 로그인 페이지 이동      
     function revcheck() {
        window.location.href = 'revCheck.jsp';
     }
     //예약하기 눌렀을 때 예약 페이지로 이동
     function rev() {
        window.location.href = 'reservation2.jsp';
     }
</script>
</head>
<body>
<div class="main vertical_center">
    <input id="tab1" type="radio" name="tabs" checked>
    <label for="tab1">예약번호 찾기</label>
    <section id="content1">
        <form name="findRevFrom" method="post" action="sucessProc.jsp">
            <div class="center rev_out">당신의 예약번호는 <span><%=revNum%></span> 입니다.</div>
            <div class="center">
            <button type="button" class="btn_check" onclick="revcheck()">예약조회</button>
            <button type="button" class="btn_rev" onclick="rev()">예약하기</button>
            </div>
        </form>
    </section>
</div>
</body>
</html>