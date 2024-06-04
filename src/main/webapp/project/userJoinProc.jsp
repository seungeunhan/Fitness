<!-- userJoinProc.jsp-->

<%@ page import="java.text.DecimalFormat" %>
<%@page import = "project.LocationBean" %>
<%@page import="project.UserBean"%>
<%@page import="project.TrainerWorkBean"%>
<%@page import="project.ReservationBean"%>
<%@page import="project.QnaBean"%>
<%@page import="java.util.Vector"%>
<%@page import="project.UtilMgr"%>
<%@page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="uMgr" class="project.UserMgr"/>
<jsp:useBean id="lMgr" class="project.LocationMgr"/>
<jsp:useBean id="cMgr" class="project.ChargeMgr"/>
<jsp:useBean id="rMgr" class="project.ReservMgr"/>
<jsp:useBean id="rvMgr" class="project.ReviewMgr"/>

<%
String msg = "회원이 등록되었습니다.";
String url = "userManage.jsp";

String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String name = request.getParameter("name");
String birth = request.getParameter("birth");
String email = request.getParameter("email");
String phone = request.getParameter("phone");


uMgr.userJoin(id, pwd, name, birth, email, phone);

%>

<script>
alert("<%=msg%>");
location.href = "<%=url%>";
</script>