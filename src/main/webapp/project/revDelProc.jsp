<!-- revDelProc-->

<%@page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id = "mgr" class ="project.ReviewMgr"/>
<jsp:useBean id = "bean" class ="project.ReviewBean"/>
<jsp:setProperty property="*" name="bean"/>

<%
			String msg = "리뷰가 삭제되었습니다.";
			String url = "notice.jsp";
			
			String num = request.getParameter("revnum1");
			mgr.deleteReview(Integer.parseInt(num));
    
%>

<script>
alert("<%=msg%>");
location.href = "<%=url%>";
</script>