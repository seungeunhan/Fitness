<!--companyEditProc -->

<%@page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id = "mgr" class ="project.UserMgr"/>
<jsp:useBean id="lMgr" class="project.LocationMgr"/>
<jsp:useBean id = "bean" class ="project.UserBean"/>
<jsp:useBean id = "lbean" class ="project.LocationBean"/>
<jsp:setProperty property="*" name="bean"/>

<%
	String msg = "";
	String url = "company.jsp";
	String dateFormatRegex = "\\d{4}-\\d{2}-\\d{2}";
	boolean isValid = false; // 유효성 검사 결과를 저장하는 변수 (예시로 false 설정)
	
	String tr5 = request.getParameter("tr5");
	String tr6 = request.getParameter("tr6");
	String comnum1 = request.getParameter("comnum1");
    
	int comnum11 = Integer.parseInt(comnum1);
	
    if (tr5 == null || tr6 == null ) {
        msg = "수정 사항을 모두 적어주세요";
        isValid = false;

    } else {
    
    mgr.updateCompany(tr5,tr6, comnum11);
    
    isValid = true;
    msg = "수정 완료";
    
    }
    
    if(!isValid) {
        msg = "입력 형식이 올바르지 않습니다. 다시 입력해주세요.";
        url = "company.jsp";
    }
	
%>

<script>
alert("<%=msg%>");
location.href = "<%=url%>";
</script>