<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String path=request.getContextPath() + "/jeongJiYoon/HomePage.jsp";
	String joinPath=request.getContextPath() + "/hanSeungEun/join.jsp";	
%>
      
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="login.css">
    <title>로그인</title>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>

<body class="allstyles">
    <div class="wrap vertical_center">
        <div class="logo_wrap">
            <a href="<%=path%>"><img src="../img/logo.png" alt="로고" class="img_logo"></a>
        </div><!--logo_wrap-->

        <div class="input_wrap">
            <div class="login_wrap" style="padding-top:20px">
                <form method="post" action="loginProc.jsp">
                    <input type="text" name="id" class="login_box" placeholder="아이디" style="width:99%">
                    <input type="password" name="pwd" class="border_radius_1 login_box"  placeholder="비밀번호" style="width:99%">
                
	                <a href="findId.jsp" class="find_text">아이디/비번찾기</a>
	                <div style="clear: both;"></div>
					<input type = "submit" class="allcenter btn_login" value = "로그인">
				</form>
					<button class="allcenter btn_join" onclick="window.location.href = '<%=joinPath%>'">회원가입</button>
	                
	            
	                <p class="social_text">개인정보 보호를 위해 공용 PC에서 사용 후 SNS 계정의 로그아웃 상태를 반드시 확인해주세요.</p>
	            
	                
	                
	                <!-- 네이버로그인 -->
				    <div id="naver_id_login"></div>
				    <script>
					var naver_id_login = new naver_id_login("3fXK1KDyGI_dypgwa3gs", "http://localhost/teamProject_jsp/jeongJiYoon/Header.jsp");
				  	var state = naver_id_login.getUniqState();
				  	naver_id_login.setButton("green", 3,50);
				  	naver_id_login.setDomain("http://localhost/teamProject_jsp/hanSeungEun/login/login.jsp");
				  	naver_id_login.setState(state);
				  	//naver_id_login.setPopup();
				  	naver_id_login.init_naver_id_login();
				  	
				  	// 네이버 접근 토큰 삭제 요청
					//https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=d5LTGWv1q9MJSH1J27mw&client_secret=36CqL7njdb&access_token=AAAAOXxzzaM4J02mVMleplPUzENeNiEcB58TxTJb-v6Hi4BCuzIXrN6-Af5yo_cWTTEYcRZRyhlx8NhTi_ij2NxDJrI&service_provider=NAVER
				  </script>

            </div><!--login_wrap-->
        </div><!--input_wrap-->
    </div><!--wrap-->
    
</body>
</html>
