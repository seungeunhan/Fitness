<!-- ProgramPage.jsp -->
<!-- 프로그램(트레이너 소개) 페이지 -->
<!-- Header와 Body, Footer를 여기서 include하여 사용 -->
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>헬스장 홈페이지</title>
</head>
<body>
    <%@ include file="Header.jsp" %> <!-- 헤더 include -->
    <%@ include file="ProPageBody.jsp" %> <!-- 바디 include -->
    <%@ include file="Footer.jsp" %> <!-- 풋터 include -->
</body>
</html>