<!--hitemEditProc -->

<%@page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id = "mgr" class ="project.UserMgr"/>
<jsp:useBean id="lMgr" class="project.LocationMgr"/>
<jsp:useBean id = "bean" class ="project.UserBean"/>
<jsp:useBean id = "lbean" class ="project.LocationBean"/>
<jsp:setProperty property="*" name="bean"/>


<%
	String msg = "";
	String url = "hitem.jsp";
    String dateFormatRegex = "\\d{4}-\\d{2}-\\d{2}";
    boolean isValid = false; // 유효성 검사 결과를 저장하는 변수 (예시로 false 설정)

    String tr3 = request.getParameter("tr3");
    String tr4 = request.getParameter("tr4");
    String hnum1 = request.getParameter("hnum1");
    boolean tr44 = false;
   
    int hnum11 = Integer.parseInt(hnum1);
    
	if(tr4.equals("판매중")){
		tr44 = true;
	}else if(tr4.equals("판매종료")){
		tr44 = false;
	}
    
    if (tr3 == null || tr4 == null  || (!tr3.matches(dateFormatRegex))) {
        msg = "수정 사항을 올바르게 적어주세요. 날짜의 경우 YYYY-MM-DD 형식으로 입력해야합니다.";
        isValid = false;

    } else {
    
    mgr.updateHitem(tr3, tr44, hnum11);
    
    isValid = true;
    msg = "수정 완료";
    
    }
    
%>

<script>
		alert("<%=msg%>");
		location.href = "<%=url%>";
</script>