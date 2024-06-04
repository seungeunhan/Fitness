<!-- QnaReplyProc.jsp-->


<%@page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id = "mgr" class ="project.ReviewMgr"/>
<jsp:useBean id = "bean" class ="project.ReviewBean"/>
<jsp:setProperty property="*" name="bean"/>


<%
			String msg = "답변이 등록되었습니다.";
			String url = "qnaBoard.jsp";
			
			
			
			
			String num = request.getParameter("num1");
			String name = request.getParameter("name");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			
			mgr.InsertQna(Integer.parseInt(num), content);
    
%>

<script>
alert("<%=msg%>");
location.href = "<%=url%>";
</script>