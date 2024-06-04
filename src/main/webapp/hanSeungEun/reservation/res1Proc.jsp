<!-- 회원 예약 proc -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="rMgr" class="hanSeungEun.ReservationMgr" />
<jsp:useBean id="bean" class="hanSeungEun.ReservationBean" />
<jsp:useBean id="uMgr" class="hanSeungEun.UserMgr" />
<jsp:useBean id="uBean" class="hanSeungEun.UserBean" />
<jsp:setProperty property="*" name="bean"/>

<% 
	//로그인된 아이디 가져옴
	String id = (String)session.getAttribute("idKey");
	//System.out.print(id);
	request.setCharacterEncoding("EUC-KR");
	boolean result = rMgr.inRes(bean, id);
	String msg = "예약에 실패했습니다." ;
	String location = "reservation1.jsp";
	if(result){
		msg = "예약을 완료했습니다.";
		location = "reservation1.jsp";
	}
%>

<script type = "text/javascript">
	alert("<%=msg%>");
	location.href="<%=location%>";
</script>