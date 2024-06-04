<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="findRev.css">
<script type="text/javascript" src="inputCheck.js"></script>
<title>예약번호 찾기</title>
</head>
<body onLoad="findRevFrom.name.focus()">
<div class="main vertical_center">
    <input id="tab1" type="radio" name="tabs" checked>
    <label for="tab1">예약번호 찾기</label>
    <section id="content1">
        <form name="findRevFrom" method="post" action="findRevProc.jsp">
            <p>예약 시 작성했던 회원정보를 입력해주세요.</p>
            <div class="name_input center">
                <span class="span_font">이름</span>
                <input name="name" placeholder="이름 입력">
            </div>
            <div class="phone_input center">
                <span class="span_font">전화번호</span>
                <input name="phonenum" placeholder="전화번호 입력">
            </div>
            <div class="phone_input center">
                <span class="span_font">비밀번호</span>
                <input name="pwd" placeholder="비밀번호 입력">
            </div>
            <input type="button" id="btn_ok1" value="확인" onclick="inputCheck2()">
        </form>
    </section>
</div>
</body>
</html>