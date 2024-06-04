<%@page contentType="text/html;charset=EUC-KR"%>
<%
	String Path=request.getContextPath() + "/hanSeungEun/script.jsp";
%>
<jsp:setProperty property="*" name="findIdFrom"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="findId.css">
<title>아이디 찾기</title>
<script type="text/javascript" src="<%=Path%>"></script>
<script>     
     function login() {
        window.location.href = 'login.jsp';
     }
     
</script>

</head>
<body onLoad="findIdFrom.name.focus()">
	<div class="main vertical_center">
    <input id="tab1" type="radio" name="tabs" checked>
    <label for="tab1">아이디 찾기</label>

    <input id="tab2" type="radio" name="tabs">
    <label for="tab2" onclick="findPw()">비밀번호 찾기</label>

    <section id="content1">
        <form name="findIdFrom" method="post" action="findIdProc.jsp">
            <p>등록된 회원정보를 입력해주세요.</p>
            <div class="name_input center">
                <span class="span_font">이름</span>
                <input id="name" name="name" placeholder="이름 입력">
            </div>
            <div class="email_input center">
                <span class="span_font">이메일</span>
                <input id="email" name="email" type="email" placeholder="이메일 입력">
            </div>
            <input type="submit" class="center btn_next" value="다음" onclick="inputCheck1()">
        </form>
    </section>
    
        <section id="content2">
        <form name="findIPwFrom" method="post" action="findIdProc.jsp">
            <p>등록된 회원정보를 입력해주세요.</p>
            <div class="name_input center">
                <span class="span_font">이름</span>
                <input id="name" name="name" placeholder="이름 입력">
            </div>
            <div class="email_input center">
                <span class="span_font">아이디</span>
                <input id="email" name="email" type="email" placeholder="이메일 입력">
            </div>
            <input type="submit" class="center btn_next" value="다음">
        </form>
    </section>
</body>
       
</html>

