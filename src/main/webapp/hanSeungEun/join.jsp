<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String imgPath=request.getContextPath() + "/hanSeungEun/img/logo.png";
	String Path=request.getContextPath() + "/jeongJiYoon/HomePage.jsp";
%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="join.css">
    <title>회원가입</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript" src="script.js"></script>
</head>

<body class="allstyles vertical_center" onLoad="joinFrm.id.focus()">
    <div class="wrap center ">
        <div class="logo_wrap">
            <a href="<%=Path%>"><img src="<%=imgPath%>" alt="로고" class="img_logo"></a>
        </div><!--logo_wrap-->
       <form name="joinFrm" method="post" action="userProc.jsp">
            <div class="inner center">
                <label>아이디</label>
                <input name="id" id="input_id" placeholder="아이디">
                <button type="button" id="Check">중복</button>
                <div class="idCheck_alert" id = "checkId">
				</div>
                <label>비밀번호</label>
                <input type="password" name="pwd" placeholder="비밀번호" >
            </div>
		
            <div class="inner center">
                <label>이름</label>
                <input placeholder="이름" name="name" class="position" >
                <div class="select">
                    <label>성별</label>
                    <input type="radio" value="2" name="gender" id="gender2"><label for="gender2">여자</label>
                    <input type="radio" value="1" name="gender" id="gender1"><label for="gender1">남자</label>
                </div>
                <label>생년월일</label>
                <input placeholder="19900101" name="birth">
                <label>이메일</label>
                <input placeholder="이메일" name="email">
                <label>휴대번호</label>
                <input placeholder="'-'빼고 입력" name="phone">
            </div>
            
            <div class="btn_wrap center">
                <input type="button" value="회원가입" class="btn_join" onclick="inputCheck()">
            </div>
       </form>
    </div>
</body>
 <script>
	var $j = jQuery.noConflict();
	$j('#Check').click(function(){
		let id = $j('#input_id').val(); //input_id에 입력되는 값
		
		 // 입력된 아이디 값이 비어있는지 확인
	    if (id.trim() === '') {
	        alert('아이디를 입력해주세요.');
	        document.joinFrm.id.focus();
	        return; // 함수 종료
	    }
		
		$j.ajax({
			url :"idCheck",
			type : "post",
			data : {id:id},
			dataType : 'json',
			success : function(result){
				if(result==0){
					$j("#checkId").html('*사용할 수 없는 아이디입니다.');
				}else{
					$j("#checkId").html('*사용 가능한 아이디입니다.');
				}
			},
			error :  function () {
				alert("서버요청실패");
			}
		})
	})
</script>
</html>