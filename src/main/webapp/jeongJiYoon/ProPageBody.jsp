<!-- ProPageBody.jsp -->
<!-- 프로그램페이지의 바디 부분 -->
<%@page import="jeongJiYoon.UserMgr"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="jeongJiYoon.TrainerMgr, jeongJiYoon.TrainerBean" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>헬스장 홈페이지</title>
    
    <!-- 부트스트랩 CDN 추가 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body, html {
            margin: 0; /* body와 html 요소의 기본 마진을 제거 */
            padding: 0; /* body와 html 요소의 기본 패딩을 제거 */
            height: 100%; /* body와 html 요소의 높이를 100%로 설정 */
        }
        
        .image-container {
            display: flex; /* 이미지 컨테이너를 가로로 나열하기 위해 flex 사용 */
            justify-content: center; /* 가로 중앙 정렬 */
            margin-top: 50px; /* 이미지와 텍스트 사이 여백 조정 */
        }
        
        .image-container img {
            width: calc(80% / 3); /* 가로 스크롤이 없도록 3개의 이미지를 가로로 배치하고 각각의 너비를 1/3로 설정 */
            height: 600px; /* 이미지 높이 조정 */
            margin: 0 20px; /* 이미지 간격 조정 */
        }
        
        .text1 {
            text-align: center; /* 텍스트를 가운데 정렬 */
            font-size: 30px; /* 글자 크기 설정 */
            margin-top: 20px; /* 글 상단 여백 설정 */
        }
        
        .text2 {
		    text-align: center;
		    font-size: 20px;
		    margin-top: 20px;
		    white-space: nowrap; /* 텍스트가 줄바꿈되지 않도록 설정 */
		}
		
		.text2 span {
		    margin: 0 10px; /* 좌우 여백 조정 */
		}
        
        .text3 {
            text-align: center; /* 텍스트를 가운데 정렬 */
            font-size: 15px; /* 글자 크기 설정 */
            margin-top: 20px; /* 글 상단 여백 설정 */
        }
        
        .text4 {
            text-align: center; /* 텍스트를 가운데 정렬 */
            font-size: 15px; /* 글자 크기 설정 */
            margin-top: 20px; /* 글 상단 여백 설정 */
        }
		
		.divider1 {
            width: 9%; /* 구분선의 너비 조정 */
            margin: 10px auto; /* 가운데 정렬 및 위아래 여백 설정 */
            border-top: 6px solid #EBDAC3; /* 갈색의 선을 위한 스타일 지정 */
        }
        
        /* 각 그룹에 대한 스타일 */
        .trainer-group {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 20px; /* 사진과 Program 텍스트 사이의 상단 간격 */
            margin-bottom: 100px; /* 사진과 이름 텍스트 사이의 하단 간격 */
        }
        
        /* 버튼 스타일 */
        .btn {
            display: inline-block;
            background-color: #887159; /*버튼 색깔*/
            color: white; /*버튼의 글자 색깔*/
            padding: 20px 120px;
            text-align: center;
            text-decoration: none;
            font-size: 16px;
            margin-top: 0px;
            margin-bottom: 100px;
            cursor: pointer;
            border-radius: 10px;
        }

        .btn:hover { /*마우스를 올렸을 때 바뀌는 색깔*/
            background-color: #AF9B87;
        }
        
    </style>
</head>

<body> 
    <!-- Program 텍스트 -->
    <div style="text-align: center; font-weight: bold; font-size: 50px;" class="text1">
        Program
    </div>
    
    <div class="divider1"></div> 
    
    <!-- 드롭다운 메뉴 -->
	<div style="margin-top: 20px; margin-left: 200px; margin-bottom: 100px;">
	    <select name="DropdownBox" onchange="handleChange(this.value)">
	        <option value="1">서울 ㅇㅇ피트니스 ㄱㄱ점</option>
	        <option value="2">서울 ㅇㅇ피트니스 ㄴㄴ점</option>
	        <option value="3">부산 ㅇㅇ피트니스 ㄷㄷ점</option>
	    </select>
	</div>
    
	<div class="row justify-content-md-center" style=" justify-content: space-between; width: 80%; margin: 0 auto;">
	    <% 
	        TrainerMgr trainerMgr = new TrainerMgr();
	        List<TrainerBean> trainers = trainerMgr.getAllTrainers();
	        UserMgr userMgr = new UserMgr();
	        for (int i = 0; i < trainers.size(); i++) {
	            TrainerBean trainer = trainers.get(i);
	            String trainerName = userMgr.getUserName(trainer.getUser());
	            String trainerCareer = trainerMgr.getTrainerCareer(trainer.getNum());
	            String displayStyle = i < 3 ? "flex" : "none"; // 첫 3개는 첫 번째 줄에 표시, 그 외는 숨김
	            int frnum = trainerMgr.getTrainerFrnum(trainer.getNum()); // 트레이너가 속한 지점 번호
	    %>
	        <div class="col trainer-group" id="trainer-group<%=i+1%>" style="display: <%=displayStyle%>;" data-frnum="<%=trainerMgr.getTrainerFrnum(trainer.getNum())%>">
	            <img src="<%=trainer.getImgpath()%>" alt="Trainer Image" style="width: 450px; height: 600px; margin-bottom: 30px;">
	            <div style="display: inline-block;">
	                <span style="font-size: 40px; font-weight: bold;"><%=trainerName%></span> <!-- 트레이너 이름 출력 및 스타일 -->
	                <span style="font-size: 30px;">트레이너</span>
	            </div>
	            <br></br>
	            <span style="font-size: 20px;"><%=trainerCareer%></span> <!-- 트레이너 경력 출력 및 스타일 -->
	        </div>
	    <%}%>
	</div>
	
		<!-- 상담예약 버튼 -->
	    <div style="text-align: center;">
	        <a href="#" class="btn">상담예약</a>
	    </div>
	
	    <script>
	 	// 페이지가 로드될 때 초기 선택값 설정
	    document.addEventListener("DOMContentLoaded", function() {
	        var dropdown = document.querySelector('select[name="DropdownBox"]');
	        dropdown.value = "1";
	        handleChange("1");
	    });
	
	 	// 드롭다운 메뉴에서 옵션 변경 시 해당 그룹 이미지만 표시
	    function handleChange(selectedValue) {
	        var groups = document.querySelectorAll('.trainer-group');
	        for (var i = 0; i < groups.length; i++) {
	            var frnum = parseInt(groups[i].getAttribute('data-frnum')); // 트레이너가 속한 지점 번호
	            if (frnum == selectedValue) {
	                groups[i].style.display = 'flex';
	            } else {
	                groups[i].style.display = 'none';
	            }
	        }
	    }
		</script>
	</body>
</html>
