<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="Umgr" class = "hanSeungEun.UserMgr"></jsp:useBean> <!--db 연동을 위해 작성 -->
<% 
	String id = request.getParameter("id");
	boolean result = Umgr.checkId(id);
%>
<!doctype html>
<html>
<head>
<link rel="stylesheet" href="join.css">
<title>ID 중복체크</title>
</head>
<body>
<div class="idCheck_alert">
<b><%=id%></b>
<%
		if(result){
			out.println("는 이미 존재하는 ID입니다.<p/>");
		}else{
			out.println("는 사용 가능합니다.<p/>");
		}
%>
</div>
</body>
</html>