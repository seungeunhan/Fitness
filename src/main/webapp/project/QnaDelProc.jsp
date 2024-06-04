<!--QnaDelProc -->

<%@page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id = "mgr" class ="project.ReviewMgr"/>
<jsp:useBean id = "bean" class ="project.ReviewBean"/>
<jsp:setProperty property="*" name="bean"/>

<%
			String msg = "질문이 삭제되었습니다.";
			String url = "qnaBoard.jsp";
			
			String num = request.getParameter("num1");
			mgr.deleteQna(Integer.parseInt(num));
    
%>

<script>
alert("<%=msg%>");
location.href = "<%=url%>";
</script>