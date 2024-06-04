<!-- comUserDelProc.jsp -->

<%@page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id = "mgr" class ="project.UserMgr"/>
<jsp:useBean id = "bean" class ="project.UserBean"/>
<jsp:setProperty property="*" name="bean"/>

<%
		String msg = "유저 정보가 삭제되었습니다.";
		String url = "companyUser.jsp";

		String num = request.getParameter("usernum1");
		mgr.deleteUser(Integer.parseInt(num));
%>
<script>
		alert("<%=msg%>");
		location.href = "<%=url%>";
</script>