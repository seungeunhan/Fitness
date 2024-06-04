<!-- companyDelProc-->

<%@page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id = "mgr" class ="project.UserMgr"/>
<jsp:useBean id="lMgr" class="project.LocationMgr"/>
<jsp:useBean id = "bean" class ="project.UserBean"/>
<jsp:useBean id = "lbean" class ="project.LocationBean"/>
<jsp:setProperty property="*" name="bean"/>

<%

	String msg = "회사정보가 삭제되었습니다";
	String url = "company.jsp";
	
	String num = request.getParameter("comnum1");
	mgr.deleteCompany(Integer.parseInt(num));
	mgr.updateCompanyUser(Integer.parseInt(num));
	
    
%>

<script>
			alert("<%=msg%>");
			location.href = "<%=url%>";
</script>