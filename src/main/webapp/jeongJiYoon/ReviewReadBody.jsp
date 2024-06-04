<!-- ReviewReadBody.jsp -->
<!-- 리뷰글 읽는 페이지의 바디 -->
<%@page import="jeongJiYoon.ReviewBean"%>
<%@page import="jeongJiYoon.ReviewMgr"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>헬스장 홈페이지</title>
    
    <style>
	    .text1 {
	        	font-weight: normal;
	            text-align: center; /* 텍스트를 가운데 정렬 */
	            font-size: 50px; /* 글자 크기 설정 */
	            margin-top: 50px; /* 글 상단 여백 설정 */
	    }
        
        .divider1 {
            width: 7%; /* 구분선의 너비 조정 */
            margin: 10px auto; /* 가운데 정렬 및 위아래 여백 설정 */
            border-top: 6px solid #EBDAC3; /* 갈색의 선을 위한 스타일 지정 */
        }
        
        .divider2 {
            width: 90%; /* 구분선의 너비 조정 */
            margin: 100px auto; /* 가운데 정렬 */
            border-top: 1px solid #A5A5A5; /* 갈색의 선을 위한 스타일 지정 */
        }
        
        .container {
            width: 1200px; /* 컨테이너의 가로 크기 설정 */
            height: 500px; /* 상자의 세로 크기 설정 */
            margin: 0 auto; /* 가운데 정렬 */
            border: 1px solid #ccc; /* 테두리 설정 */
            border-radius: 5px; /* 테두리 모서리 둥글게 만들기 */
            background-color: #ffffff; /* 배경색 설정 */
            margin-top: 100px; /* 글 상단 여백 설정 */
            margin-bottom: 15	px; /* 글 하단 여백 설정 */
            padding-top: 20px; /* 컨테이너의 상단 여백 설정 */
            padding-bottom: 20px; /* 컨테이너의 하단 여백 설정 */
        }
		
		.list-button {
			margin-right: 10px;
			margin-left: 350px;
			background-color: #ffffff; /* 배경색 설정 */
		    color: gray; /* 글자 색상 설정 */
		    border: 1px solid gray; /* 테두리 설정 */
		    border-radius: 5px; /* 테두리 모서리 둥글게 만들기 */
		    padding: 10px 15px; /* 안쪽 여백 설정 */
		    cursor: pointer; /* 커서 모양 변경 */
		    margin-bottom: 100px;
		}
		
		.previous-button {
		    margin-right: 10px;
		    background-color: #ffffff; /* 배경색 설정 */
		    color: gray; /* 글자 색상 설정 */
		    border: 1px solid gray; /* 테두리 설정 */
		    border-radius: 5px; /* 테두리 모서리 둥글게 만들기 */
		    padding: 10px 20px; /* 안쪽 여백 설정 */
		    cursor: pointer; /* 커서 모양 변경 */
		}
		
		.next-button {
		    margin-right: 0px;
		    background-color: #ffffff; /* 배경색 설정 */
		    color: gray; /* 글자 색상 설정 */
		    border: 1px solid gray; /* 테두리 설정 */
		    border-radius: 5px; /* 테두리 모서리 둥글게 만들기 */
		    padding: 10px 20px; /* 안쪽 여백 설정 */
		    cursor: pointer; /* 커서 모양 변경 */
		}
		
		.edit-button {
		    margin-left: 750px;
		    background-color: #ffffff; /* 배경색 설정 */
		    color: gray; /* 글자 색상 설정 */
		    border: 1px solid gray; /* 테두리 설정 */
		    border-radius: 5px; /* 테두리 모서리 둥글게 만들기 */
		    padding: 10px 20px; /* 안쪽 여백 설정 */
		    cursor: pointer; /* 커서 모양 변경 */
		}
		
		.delete-button {
		    margin-left: 10px;
		    background-color: #ffffff; /* 배경색 설정 */
		    color: gray; /* 글자 색상 설정 */
		    border: 1px solid gray; /* 테두리 설정 */
		    border-radius: 5px; /* 테두리 모서리 둥글게 만들기 */
		    padding: 10px 20px; /* 안쪽 여백 설정 */
		    cursor: pointer; /* 커서 모양 변경 */
		}

    </style>
</head>

<body>
	<% 
        // URL 매개변수로 전달된 리뷰의 고유 ID 가져오기
        int reviewId = Integer.parseInt(request.getParameter("id"));
        // ReviewMgr를 사용하여 해당 ID의 리뷰 정보 가져오기
        ReviewMgr reviewMgr = new ReviewMgr();
        ReviewBean review = reviewMgr.getReviewById(reviewId);
        
        if (review != null) { // 리뷰 레코드가 존재하는 경우에만 표시
    %>
	<!-- REVIEW 텍스트 -->
    <div class="text1">
        REVIEW
    </div>
    
    <div class="divider1"></div> 
    
    <!-- 컨테이너 추가 -->
    <div class="container">
    	<div style="display: flex;  align-items: flex-start;">
		    <!-- 리뷰 제목 표시 -->
		    <h2 style="margin-left: 80px;"><%= review.getTitle() %></h2>
		    <!-- 사용자 이름 표시 -->
	        <p style="margin-left: 820px; margin-top: 25px;"><%= review.getName() %></p>
	        <!-- 구분선 (|) 표시 -->
        	<p style="margin-top: 25px; margin-left: 10px; margin-right: 10px;">|</p>
	        <!-- 글 쓴 날짜 표시 -->
	        <p style="margin-top: 25px;"><%= review.getDate() %></p>
        </div>
        <div class="divider2" style="margin-top: 10px;"></div>
        
	    <!-- 리뷰 내용 표시 -->
		<%
		    String content = review.getContent();
		    if (content.length() > 140) {
		        int breakIndex = content.indexOf(' ', 140); // 140자 이후의 첫 번째 공백 인덱스를 찾음
		        if (breakIndex != -1) {
		            content = content.substring(0, breakIndex) + "<br>" + content.substring(breakIndex + 1);
		        }
		    }
		%>
		<p style="margin-left: 80px; margin-top: -50px;"><%= content %></p>
    </div>
    
    <div id="form-container"></div>
    
    <!-- 목록보기, 이전글, 다음글 버튼 추가 -->
    <button class="list-button" style="margin-top: 50px" onclick="goToReviewPage()">목록보기</button>
    <button class="previous-button" onclick="goToPreviousReview()">이전글</button>
    <button class="next-button" onclick="goToNextReview()">다음글</button>

	<!-- 수정, 삭제 버튼 추가 -->
    <button class="edit-button" onclick="editReview(<%= reviewId %>)">수정</button>
    <!-- 삭제 버튼 클릭 시 deleteReview 함수 호출 -->
    <button class="delete-button" onclick="deleteReview(<%= reviewId %>, <%= session.getAttribute("userId") %>)">삭제</button>
<%
    } else { // 리뷰 레코드가 존재하지 않는 경우에 알림창 표시
%>
    <script>
        alert("해당 리뷰를 찾을 수 없습니다.");
        window.location.href = "ReviewPage.jsp"; // 리뷰 목록 페이지로 이동
    </script>
<%
    }
%>

    <script>
        // 목록보기 버튼 클릭 시 ReviewPage.jsp로 이동하는 함수
        function goToReviewPage() {
            window.location.href = "ReviewPage.jsp";
        }

     	// 이전글 버튼 클릭 시 이전 글로 이동하는 함수
        function goToPreviousReview() {
            // 현재 리뷰의 ID 가져오기
            var currentId = <%= reviewId %>;
            // 이전 리뷰의 ID 계산
            var previousId = currentId - 1;
            // 이전 리뷰가 존재하는 경우에만 이동
            if (previousId >= 0) {
                window.location.href = "ReviewReadBody.jsp?id=" + previousId;
            } else {
                alert("이전 글이 없습니다.");
            }
        }

        // 다음글 버튼 클릭 시 다음 글로 이동하는 함수
        function goToNextReview() {
            // 현재 리뷰의 ID 가져오기
            var currentId = <%= reviewId %>;
            // 다음 리뷰의 ID 계산
            var nextId = currentId + 1;
            // 다음 리뷰가 존재하는 경우에만 이동
            // 실제 데이터베이스와 연동하여 존재 여부를 확인하는 것이 안전합니다.
            window.location.href = "ReviewReadBody.jsp?id=" + nextId;
        }
        
     	// 수정 버튼 클릭 시 ReviewModify.jsp로 이동하는 함수
        function editReview(id) {
            window.location.href = "ReviewModify.jsp?id=" + id;
        }

     	// 삭제 버튼 클릭 시 리뷰를 삭제하는 함수
        function deleteReview(reviewId, userId) {
            if (confirm("정말로 삭제하시겠습니까?")) {
                var formContainer = document.getElementById('form-container');
                if (formContainer) {
                    var form = document.createElement('form');
                    form.setAttribute('method', 'post');
                    form.setAttribute('action', '/jeongJiYoon/reviewDelete');

                    var idField = document.createElement('input');
                    idField.setAttribute('type', 'hidden');
                    idField.setAttribute('name', 'id');
                    idField.setAttribute('value', reviewId);

                    // 사용자 ID도 hidden 필드로 추가합니다.
                    var userIdField = document.createElement('input');
                    userIdField.setAttribute('type', 'hidden');
                    userIdField.setAttribute('name', 'userId');
                    userIdField.setAttribute('value', userId);

                    form.appendChild(idField);
                    form.appendChild(userIdField);

                    formContainer.appendChild(form);

                    var xhr = new XMLHttpRequest();
                    xhr.open(form.getAttribute('method'), form.getAttribute('action'), true);
                    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                    xhr.onreadystatechange = function() {
                        if (xhr.readyState === 4) {
                            if (xhr.status === 200) {
                                window.location.href = "ReviewPage.jsp";
                            } else {
                                alert("리뷰 삭제에 실패했습니다.");
                            }
                        }
                    };
                    xhr.send(new FormData(form));
                } else {
                    console.error("폼 컨테이너를 찾을 수 없습니다.");
                }
            }
        }

    </script>
</body>
</html>