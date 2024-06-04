<%@page contentType="text/html;charset=UTF-8"%>
<%
    session.invalidate();
    String path = request.getContextPath() + "/jeongJiYoon/HomePage.jsp";
%>
<script>
    alert("로그아웃 되었습니다.");
    location.href="<%=path%>";
</script>