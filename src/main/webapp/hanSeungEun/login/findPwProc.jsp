<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="uMgr" class="hanSeungEun.UserMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="findId.css">
<title>비밀번호 찾기</title>
</head>
<body>
	<div class="main vertical_center">
	    <input id="tab1" type="radio" name="tabs" checked>
	    <label for="tab1">아이디 찾기</label>
	
	    <input id="tab2" type="radio" name="tabs">
	    <label for="tab2">비밀번호 찾기</label>
	
		 <section id="content2">
	        <form name="findPwFrom" method="post" action="sucessProc.jsp">
	        	<div class="pwd_input center">
	                <span class="span_font">비밀번호</span>
	                <input name="pwd" placeholder="비밀번호 입력">
	            </div>
	            <input type="submit" class="center btn_next" value="확인">
	        </form>
	    </section>
    </div><!-- main -->
</body>
</html>