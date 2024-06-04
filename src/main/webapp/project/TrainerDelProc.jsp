<!--  TrainerDelProc.jsp -->

<%@page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id = "mgr" class ="project.UserMgr"/>
<jsp:useBean id = "bean" class ="project.UserBean"/>
<jsp:setProperty property="*" name="bean"/>

<%
		String msg = "강사정보가 삭제되었습니다.";
		String url = "trainerManage.jsp";

		String num = request.getParameter("usernum1");
		mgr.deleteUser(Integer.parseInt(num));
		mgr.delTrainerTable(Integer.parseInt(num));
%>
<script>
		alert("<%=msg%>");
		location.href = "<%=url%>";
</script>