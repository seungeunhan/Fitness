<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="Umgr" class = "hanSeungEun.UserMgr"/>
<jsp:useBean id="bean" class = "hanSeungEun.UserBean"/>
<jsp:setProperty property="*" name="bean"/>
<% 
	boolean result = Umgr.insertMember(bean);
	String msg = "가입에 실패하였습니다." ;
	String location = "join.jsp";
	if(result){
		msg = "가입을 축하합니다.";
		location = "login/login.jsp";
	}
%>
<script type = "text/javascript">
	alert("<%=msg%>");
	location.href="<%=location%>";
</script>
