<%@page contentType="text/html;charset=UTF-8"%>
<%
	String mode = request.getParameter("mode");
	String msg = "";
	if (mode.equals("0")) {
		msg = " 아이디 또는 비밀번호를 잘못 입력했습니다.";
	} else if (mode.equals("1")) {
		msg = "아이디는 맞지만 비밀번호는 다시 확인하시기 바랍니다.";
	}
%>
<script>
	var msg = "<%= msg %>";
	alert(msg);
	location.href="login.jsp";
</script>

