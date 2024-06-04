<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="Umgr" class = "hanSeungEun.UserMgr"/>
<jsp:useBean id="bean" class = "hanSeungEun.UserBean"/>
<jsp:setProperty name="mBean" property="*" />

<% 
	String msg = "비밀번호가 수정되었습니다."+
			     "다시 로그인해주세요." ;		
	String location = "login/login.jsp";
%>
<script type = "text/javascript">
	alert("<%=msg%>");
	location.href="<%=location%>";
</script>