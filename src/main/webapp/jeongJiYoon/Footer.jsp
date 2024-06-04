<!-- footer.jsp -->
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>헬스장 홈페이지</title>
    <style>
	    body, html {
            margin: 0; /* body와 html 요소의 기본 마진을 제거 */
            padding: 0; /* body와 html 요소의 기본 패딩을 제거 */
            height: 100%; /* body와 html 요소의 높이를 100%로 설정 */
        }
        
	    footer {
            bottom: 0px; /* 화면 아래쪽으로 숨김 */
            width: 100%; /* 화면 전체 너비를 차지 */
            background-color: #4C4B4B; /* Footer 배경색 */
            padding: 40px 0; /* 상단 여백과 하단 여백 */
            text-align: center; /* 텍스트 가운데 정렬 */
            color: #CBCBCB; /* 텍스트 색상 */
            white-space: nowrap; /*줄바꿈 방지*/
        }
	</style>
</head>

<body>
    <footer>
    <div>
        <span style="margin-right: 700px; font-weight: bold; font-size: 22px; color: #ffffff">주식회사 피트니스</span>
        <p></p>
    </div>
    <div>
        <span style="margin-right: 0px; font-size: 15px;">대표자 : 홍길동</span>
        <span style="margin-left: 102px; font-size: 15px;">사업자등록번호 : 000-12-34567</span>
        <span style="margin-left: 100px; font-size: 15px;">주소 : 부산광역시 ㅇㅇ구 1번(ㅇㅇ동, 센터타워)</span>
        <p></p>
    </div>
    <div>
        <span style="margin-right: 240px; font-size: 15px;">문의 전화 : 051-123-4567 / 051-456-7890</span>
        <span style="margin-right: 149px; font-size: 15px;">이메일 : fitness@abc.com</span>
    </div>
	</footer>

    
    <script>
        window.addEventListener('scroll', function() {
            // 스크롤이 맨 아래에 도달했을 때 footer가 나타나도록 함
            if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
                document.body.classList.add('show-footer');
            }
        });
    </script>
</body>
</html>
