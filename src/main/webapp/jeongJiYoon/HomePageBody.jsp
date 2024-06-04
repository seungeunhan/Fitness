<!-- HomePageBody.jsp -->
<!-- 홈페이지의 바디 부분 -->
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>헬스장 홈페이지</title>
    
    <!-- 지도 API -->
    <script async src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA3QsnSrouTMV9U0tmrQWP3Q8dweetp4bk&callback=console.debug&libraries=maps,marker&v=beta">
    </script>
    <link rel="stylesheet" href="./style.css"/>
    
    <style>
        body, html {
            margin: 0; /* body와 html 요소의 기본 마진을 제거 */
            padding: 0; /* body와 html 요소의 기본 패딩을 제거 */
            height: 100%; /* body와 html 요소의 높이를 100%로 설정 */
        }
        
        .centered-image {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 50vh; /* 화면 세로 전체 높이를 차지하도록 설정 */
            margin-top: 30px; /* 원하는 만큼의 상단 여백을 설정 */
            margin-bottom: 50px; /* 원하는 만큼의 상단 여백을 설정 */
        }

        .centered-image img {
            width: 100%; /* 이미지 너비를 화면 너비에 맞게 설정 */
            height: auto; /* 이미지 높이 자동 조절 */
            filter: opacity(0.7); /* 0.0부터 1.0까지의 값으로 설정하여 투명도를 조절합니다. */
        }
        
        .text1 {
        	font-weight: bold;
            text-align: center; /* 텍스트를 가운데 정렬 */
            font-size: 50px; /* 글자 크기 설정 */
            margin-top: 200px; /* 글 상단 여백 설정 */
        }
        
        .text2 {
            text-align: center; /* 텍스트를 가운데 정렬 */
            font-size: 20px; /* 글자 크기 설정 */
            margin-top: 50px; /* 글 상단 여백 설정 */
        }
        
        .image-container {
            display: flex; /* 이미지 컨테이너를 가로로 나열하기 위해 flex 사용 */
            justify-content: center; /* 가로 중앙 정렬 */
            margin-top: 200px; /* 이미지와 텍스트 사이 여백 조정 */
            
        }
        
        .image-container img {
            width: calc(100% / 3); /* 가로 스크롤이 없도록 3개의 이미지를 가로로 배치하고 각각의 너비를 1/3로 설정 */
            height: 450px; /* 이미지 높이 조정 */
            margin: 0 0px; /* 이미지 간격 조정 */
        }
        
        .text3 {
            text-align: center; /* 텍스트를 가운데 정렬 */
            font-size: 30px; /* 글자 크기 설정 */
            margin-top: 200px; /* 글 상단 여백 설정 */
        }
        
        .text4 {
            text-align: center; /* 텍스트를 가운데 정렬 */
            font-size: 20px; /* 글자 크기 설정 */
            margin-top: 10px; /* 글 상단 여백 설정 */
        }
        
        .map-container {
		  height: 400px; /* 원하는 높이 설정 */
		  width: 100%; /* 원하는 너비 설정 */
		  margin-top: 100px; /* 상단 여백 설정 */
		  margin-bottom: 50px; /* 하단 여백 설정 */
		}
		
		.divider1 {
            width: 9%; /* 구분선의 너비 조정 */
            margin: 10px auto; /* 가운데 정렬 및 위아래 여백 설정 */
            border-top: 6px solid #EBDAC3; /* 갈색의 선을 위한 스타일 지정 */
        }
        
        .divider2 {
            width: 6%; /* 구분선의 너비 조정 */
            margin: 20px auto; /* 가운데 정렬 및 위아래 여백 설정 */
            border-top: 6px solid #EBDAC3; /* 갈색의 선을 위한 스타일 지정 */
        }
    </style>
</head>
<body>
    <!-- 이미지를 화면 중앙에 표시하는 부분 -->
    <div class="centered-image">
        <img src="img/UI-UW-06.jpg" alt="UI-UW-06">
    </div>
    
    <!-- About Us 텍스트 -->
    <div class="text1">
        About Us
    </div>
    
    <div class="divider1"></div> 
    
    <div class="text2">
        <p>회원제 피트니스 클럽</p>
        <p>회원전용 주차공간과 전용 엘리베이터</p>
        <p>별도의 휴식공간에서의 사교와 비즈니스의 만남</p>
        <p>회원만이 누릴 수 있는 공간</p>
        <p>지금 만나보세요.</p>
    </div>
    
    <!-- 이미지 3개를 가로로 표시하는 부분 -->
    <div class="image-container">
        <img src="img/UI-UW-02(1).jpg" alt="Image 1">
        <img src="img/UI-UW-02(2).jpg" alt="Image 2">
        <img src="img/UI-UW-02(3).jpg" alt="Image 3">
    </div>
    
    <!-- 오시는 길 텍스트 -->
    <div class="text3">
        오시는 길
    </div>
    
    <div class="divider2"></div> 
    
    <div class="text4">
        <br>부산광역시 ㅇㅇ구 1번길</br>
        <br></br>
    </div>
    
    <!-- 지도 API -->
    <div class="map-container">
	  <gmp-map center="37.52925491333008,126.92485046386719" zoom="16" map-id="DEMO_MAP_ID">
	    <gmp-advanced-marker position="37.52925491333008,126.92485046386719" title="location"></gmp-advanced-marker>
	  </gmp-map>
	</div>
</body>
</html>