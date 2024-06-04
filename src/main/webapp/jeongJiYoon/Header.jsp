<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="uMgr" class="hanSeungEun.UserMgr" />
<%
	String id = (String)session.getAttribute("idKey");
	String homePath = request.getContextPath() + "/jeongJiYoon/HomePage.jsp";
	String programPath = request.getContextPath() + "/jeongJiYoon/ProgramPage.jsp";
	String membershipPath = request.getContextPath() + "/hanSeungEun/membership/membership.jsp";
	String reviewPath = request.getContextPath() + "/jeongJiYoon/ReviewPage.jsp";
	String qnaPath = request.getContextPath() + "/jeongJiYoon/QnaPage.jsp";
	String imgPath = request.getContextPath() + "/jeongJiYoon/img/logo.png";
	String Path = request.getContextPath() + "/hanSeungEun/login/snsLoginProc.jsp";
	//System.out.print("*********************************");
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>헬스장 홈페이지</title>
    <style>
        header {
            background-color: #ffffff; /* 네비게이션 바 배경색 */
            padding: 20px 0; /* 상단 여백과 하단 여백 */
        }

        nav {
            display: flex;
            justify-content: space-between; /* 요소 사이의 여백을 최대화하여 요소를 정렬 */
            align-items: center; /* 세로 방향으로 요소들을 중앙 정렬 */
        }

        nav ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center; /* 세로 방향으로 요소들을 중앙 정렬 */
        }	

        nav ul li {
            margin:	0 20px; /* 각 메뉴 아이템 사이의 여백 조정 */
        }

        nav ul li a {
            text-decoration: none;
            color: #333; /* 메뉴 텍스트 색상 */
            font-size: 20px; /* 글자 크기 설정 */
            font-weight: bold; /* 굵은 글꼴 설정 */
        }

        .login {
            background-color: #8B4513; /* 로그인 버튼 배경색 (갈색) */
            color: #fff; /* 로그인 버튼 텍스트 색상 */
            padding: 10px 25px; /* 메뉴 간격 */
            border-radius: 5px; /* 버튼 모서리 둥글게 */
            text-decoration: none;
            margin-right: 150px; /* 오른쪽 여백 추가 */
            font-weight: normal;
        }

        .login a:hover {
            color: #4C4B4B; /* 마우스 오버 시 텍스트 색상 */
        }

        .logo img {
            width: 200px; /* 로고 이미지 너비 설정 */
            height: 100px; /* 높이 자동으로 조정 */
            margin-left: 130px; /* 왼쪽 여백 추가 */
            cursor: pointer; /* 클릭 가능한 커서 설정 */
        }

        .navbar-toggle {
		    display: none; /* 작은 화면에서만 햄버거 아이콘을 보이도록 합니다. */
		    border: none; /* 테두리를 없앱니다. */
		    font-size: 30px; /* 아이콘의 크기를 키웁니다. */
		    background: none; /* 배경을 없앱니다. */
		    cursor: pointer;
		}
		
		.close-btn {
        	display: none; /* 초기에는 닫기 버튼을 숨깁니다. */
            position: absolute;
            top: 50px;
            right: 30px;
            font-size: 24px;
            cursor: pointer;
        }

        /* 작은 화면에서만 햄버거 아이콘을 보이도록 설정합니다. */
        @media screen and (max-width: 768px) {
            .menu-collapse {
                position: fixed;
                top: 0;
                right: -100%; /* 초기에는 화면 오른쪽에 보이지 않습니다. */
                width: 50%;
                height: 100vh;
                background-color: #f9f9f9;
                padding: 40px;
                box-shadow: -4px 0 8px rgba(0, 0, 0, 0.1);
                transition: right 0.3s ease-in-out; /* 트랜지션 효과를 추가하여 부드러운 이동 효과를 만듭니다. */
            }

            .menu-collapse.show {
                right: 0; /* 햄버거 아이콘을 클릭했을 때 메뉴가 화면 오른쪽에서 나타납니다. */
            }

            .menu-collapse ul {
            	flex-direction: column; /* 메뉴 아이템을 세로로 정렬합니다. */
            	align-items: flex-start; /* 메뉴 아이템을 왼쪽으로 정렬합니다. */
                list-style-type: none;
                padding: 0;
            }

            .menu-collapse li {
                margin: 10px 0;
            }

            .navbar-toggle {
                display: block; /* 작은 화면에서만 햄버거 아이콘을 보이도록 합니다. */
            }
            
            .menu-collapse.show .close-btn {
                display: block; /* 메뉴가 펼쳐질 때 닫기 버튼을 보이도록 합니다. */
            }
            
            .menu-collapse .login a {
                background-color: transparent;
                color: #333;
                font-weight: bold;
                padding: 10px 0;
                width: 100%;
                text-align: center;
            }
        }
    </style>
</head>
<body>
    <header>
        <nav>
            <div class="logo" onclick="window.location.href='../index.jsp'">
                <a href="<%=homePath%>"><img src="<%=imgPath%>" alt="로고 이미지"></a>
            </div>
            <button class="navbar-toggle">&#9776;</button>
            <div class="menu-collapse">
                <button class="close-btn">&times;</button>
                <ul>
                    <li><a href="<%=programPath%>">Program</a></li>
                    <%
						String log1="";
						if(id == null) log1 =request.getContextPath() + "/hanSeungEun/reservation/reservation2.jsp";
						else log1 = request.getContextPath() + "/hanSeungEun/reservation/reservation1.jsp";
					%>
                    <li><a href="<%=log1%>">Reservation</a></li>
                    <li><a href="<%=membershipPath%>">Membership</a></li>
                    <li><a href="<%=reviewPath%>">Review</a></li>
                    <li><a href="<%=qnaPath%>" style="margin-right:30px;">Q&A</a></li>
                    <%
						String log="";
						if(id == null) log ="<a href=" + request.getContextPath() + "/hanSeungEun/login/login.jsp class='login'>" + "로그인</a>";
						else log = "<li><a href=" + request.getContextPath() + "/hanSeungEun/login/login.jsp  style='margin-left:200px'>" + id + "님</a></li>" +
						"<a href=" + request.getContextPath() + "/hanSeungEun/login/logout.jsp class='login'>" + "로그아웃</a>";
					%>
					
					<!-- 로그인된 아이디 출력 -->
                    <%=log%>    
                </ul> 
            </div>
        </nav>
    </header>

    <script>
	    document.querySelector('.navbar-toggle').addEventListener('click', function () {
	        document.querySelector('.menu-collapse').classList.toggle('show');
	        // 메뉴바가 표시될 때 z-index를 높여 다른 요소 위에 깔리도록 설정합니다.
	        document.querySelector('.menu-collapse').style.zIndex = '999';
	    });
	
	    document.querySelector('.close-btn').addEventListener('click', function () {
	        document.querySelector('.menu-collapse').classList.remove('show');
	        // 메뉴바가 닫힐 때 z-index를 초기값으로 설정하여 다른 요소 위에 가려지지 않도록 합니다.
	        document.querySelector('.menu-collapse').style.zIndex = '1';
	    });
	</script>
	
	<!-- 네이버 로그인 -->
	<script type="text/javascript">
			var naver_id_login = new naver_id_login("3fXK1KDyGI_dypgwa3gs", "http://localhost/teamProject_jsp/jeongJiYoon/Header.jsp");
		  // 접근 토큰 값 출력
		  //alert(naver_id_login.oauthParams.access_token);
		  // 네이버 사용자 프로필 조회
		  naver_id_login.get_naver_userprofile("naverSignInCallback()");
		  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		  function naverSignInCallback() {
		    //alert(naver_id_login.getProfileData('email'));
		    //alert(naver_id_login.getProfileData('nickname'));
		    document.frm.email.value=naver_id_login.getProfileData('email');
			document.frm.nickname.value=naver_id_login.getProfileData('nickname');
			document.frm.submit();
		  }
	</script>
	
	<!-- snsLoginProc 서버 스크립트로 이메일과 닉네임을 전송하기
		 위해 폼을 생성한다. -->
	<form name="frm" action="<%=Path%>">
		<input type="hidden" name="email">
		<input type="hidden" name="nickname">
	</form>
</body>
</html>
