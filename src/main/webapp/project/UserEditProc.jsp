<!-- UserEditProc.jsp -->

<%@page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id = "mgr" class ="project.UserMgr"/>
<jsp:useBean id="lMgr" class="project.LocationMgr"/>
<jsp:useBean id = "bean" class ="project.UserBean"/>
<jsp:useBean id = "lbean" class ="project.LocationBean"/>
<jsp:setProperty property="*" name="bean"/>


<%
	String msg = "";
	String url = "userManage.jsp";
    String dateFormatRegex = "\\d{4}-\\d{2}-\\d{2}";
    boolean isValid = false; // 유효성 검사 결과를 저장하는 변수 (예시로 false 설정)

    String tr1 = request.getParameter("tr1");
    String tr2 = request.getParameter("tr2");
    String tr3 = request.getParameter("tr3");
    String tr8 = request.getParameter("tr8");
    String nextTr1 = request.getParameter("nextTr1");
    String nextTr4 = request.getParameter("nextTr4");
    String userId1 = request.getParameter("userId1");
    String groupId1 = request.getParameter("groupId1");
    String usernum1 = request.getParameter("usernum1");
    
    
    int tr22 = 0;
    int tr88 = 0;
    int nextTr44 = 0;
    int usernum11 = Integer.parseInt(usernum1);
    
    if(tr2.equals("남") ){
    	tr22 = 1;
    } else{
    	tr22 = 2;
    }
    
    if(tr8.equals("비회원")){
        tr88 = 0;
    } else if (tr8.equals("회원")){
        tr88 = 1;
    } else if (tr8.equals("강사")){
        tr88 = 2;
        mgr.setTrainerTable(usernum11);
    } else{
        tr88 = 3;
    }
    
    nextTr44 = lMgr.getHnum(nextTr4);
    
    
    if (tr1 == null || tr2 == null || tr3 == null || tr8 == null || nextTr1 == null || nextTr4 == null || userId1 == null || groupId1 == null) {
        msg = "수정 사항을 모두 적어주세요";
        isValid = false;

    } else {
    
    mgr.updateUser(tr1, tr22, tr3, tr88, nextTr1, nextTr44, userId1);
    
    isValid = true;
    msg = "수정 완료";
    
    }
    
    if(!isValid) {
        msg = "입력 형식이 올바르지 않습니다. 다시 입력해주세요.";
        url = "userManage.jsp";
    }
	
    
%>

<script>
		alert("<%=msg%>");
		location.href = "<%=url%>";
</script>
