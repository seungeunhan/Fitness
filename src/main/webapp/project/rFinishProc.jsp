<!--rFinishProc -->

<%@page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id = "mgr" class ="project.ReservMgr"/>
<jsp:useBean id = "bean" class ="project.ReservationBean"/>
<jsp:setProperty property="*" name="bean"/>

<%
		String msg = "상담 완료";
		String url = "userReserv.jsp";
    
		String num = request.getParameter("rnum1");
		
		mgr.updateFinish(Integer.parseInt(num));
%>

<script>
			alert("<%=msg%>");
			location.href = "<%=url%>";
</script>