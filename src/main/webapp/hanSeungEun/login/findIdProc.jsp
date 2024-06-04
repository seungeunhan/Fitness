
<%@page contentType="text/html;charset=EUC-KR"%>
<jsp:useBean id="uMgr" class="hanSeungEun.UserMgr" />

<% 
	request.setCharacterEncoding("EUC-KR");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String UserId = uMgr.findId(name, email);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="findId.css">
<title>아이디 찾기</title>

<script>
     // 로그인 버튼 눌렀을 때 로그인 페이지 이동      
     function login() {
        window.location.href = 'login.jsp';
     }
     function goBack() {
         window.history.back();
     }
     function findPw() {
         window.location.href = 'findPw.jsp';
     }
</script>

</head>
<body>
	<div class="main vertical_center">
    <input id="tab1" type="radio" name="tabs" checked>
    <label for="tab1">아이디 찾기</label>

    <input id="tab2" type="radio" name="tabs">
    <label for="tab2"  onclick="findPw()">비밀번호 찾기</label>

    <section id="content1"> 
            <div class="center id_out">당신의 아이디는 <span><%=UserId%></span> 입니다.</div>
            <div class="center">
            <button type="button" class="btn_back" onclick="goBack()">뒤로가기</button>
            <button type="button" class="btn_login" onclick="login()">로그인</button>
            </div>
    </section>
    </div><!-- main -->
</body>
</html>

