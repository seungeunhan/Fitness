<!-- QnaReadBody.jsp -->
<!-- 질문글 읽는 페이지의 바디 -->
<%@page import="jeongJiYoon.AnswerBean"%>
<%@page import="jeongJiYoon.AnswerMgr"%>
<%@page import="jeongJiYoon.QnaBean"%>
<%@page import="jeongJiYoon.QnaMgr"%>
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
		
		.comment-button {
            background-color: #969696;
            border: none;
            color: white;
            padding: 47px 50px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            cursor: pointer;
        }

    </style>
</head>

<body>
	<% 
        // URL 매개변수로 전달된 질문의 고유 ID 가져오기
        int qnaId = Integer.parseInt(request.getParameter("qnaId"));
	
        // QnaMgr을 사용하여 해당 ID의 질문 정보 가져오기
        QnaMgr qnaMgr = new QnaMgr();
        QnaBean qna = qnaMgr.getQnaById(qnaId);
        
     	// AnswerMgr을 사용하여 해당 질문에 대한 답변 정보 가져오기
        AnswerMgr answerMgr = new AnswerMgr();
        AnswerBean answer = answerMgr.getAnswerByQnaId(qnaId);
        
        if (qna != null) { // 질문 레코드가 존재하는 경우에만 표시
    %>
    
    <!-- REVIEW 텍스트 -->
    <div class="text1">
        Q&A
    </div>
    
    <div class="divider1"></div>
    
    <!-- 컨테이너 추가 -->
    <div class="container">
    	<div style="display: flex;  align-items: flex-start;">
		    <!-- 리뷰 제목 표시 -->
		    <h2 style="margin-left: 80px;"><%= qna.getTitle() %></h2>
		    <!-- 사용자 이름 표시 -->
	        <p style="margin-left: 640px; margin-top: 25px;"><%= qna.getName() %></p>
	        <!-- 구분선 (|) 표시 -->
        	<p style="margin-top: 25px; margin-left: 10px; margin-right: 10px;">|</p>
	        <!-- 글 쓴 날짜 표시 -->
	        <p style="margin-top: 25px;"><%= qna.getDate() %></p>
        </div>
        <div class="divider2" style="margin-top: 10px;"></div>
        
	    <!-- 리뷰 내용 표시 -->
		<%
		    String content = qna.getContent();
		    if (content.length() > 140) {
		        int breakIndex = content.indexOf(' ', 140); // 140자 이후의 첫 번째 공백 인덱스를 찾음
		        if (breakIndex != -1) {
		            content = content.substring(0, breakIndex) + "<br>" + content.substring(breakIndex + 1);
		        }
		    }
		%>
		<p style="margin-left: 80px; margin-top: -50px;"><%= content %></p>
    </div>
    
    
    <!-- 답변 내용 표시 -->
	<div class="divider2" style="width: 63%; margin-top: 100px;">
	    <h3>답변</h3>
	    <% if (answer != null) { %>
	        <p><%= answer.getContent() %></p>
	        <p><%= answer.getDate() %></p>
	    <% } else { %>
	        <p>아직 답변이 등록되지 않았습니다.</p>
	    <% } %>
	</div>

    <!-- 상자에 텍스트 필드 추가 -->
    <div style="background-color: #EBDAC3; padding: 30px; width: 60%; margin-top: 10px; margin-left: 350px;">
        <input type="text" placeholder="답변을 입력하세요..." style="width: 79%; margin-left: -5px; padding: 50px;">
    	<button class="comment-button" onclick="registerComment()">등록</button>
    </div>
    
    <!-- 목록보기, 이전글, 다음글 버튼 추가 -->
    <button class="list-button" style="margin-top: 50px" onclick="goToQnaPage()">목록보기</button>
    <button class="previous-button" onclick="goToPreviousQna()">이전글</button>
    <button class="next-button" onclick="goToNextQna()">다음글</button>

<%
    } else { // 리뷰 레코드가 존재하지 않는 경우에 알림창 표시
%>
    <script>
        alert("해당 리뷰를 찾을 수 없습니다.");
        window.location.href = "QnaPage.jsp"; // 리뷰 목록 페이지로 이동
    </script>
<%
    }
%>

    <script>
        // 목록보기 버튼 클릭 시 ReviewPage.jsp로 이동하는 함수
        function goToQnaPage() {
            window.location.href = "QnaPage.jsp";
        }

     	// 이전글 버튼 클릭 시 이전 글로 이동하는 함수
        function goToPreviousQna() {
            // 현재 리뷰의 ID 가져오기
            var currentId = <%= qnaId %>;
            // 이전 리뷰의 ID 계산
            var previousId = currentId - 1;
            // 이전 리뷰가 존재하는 경우에만 이동
            if (previousId >= 0) {
                window.location.href = "QnaReadBody.jsp?qnaId=" + previousId;
            } else {
                alert("이전 글이 없습니다.");
            }
        }

        // 다음글 버튼 클릭 시 다음 글로 이동하는 함수
        function goToNextQna() {
            // 현재 리뷰의 ID 가져오기
            var currentId = <%= qnaId %>;
            // 다음 리뷰의 ID 계산
            var nextId = currentId + 1;
            // 다음 리뷰가 존재하는 경우에만 이동
            // 실제 데이터베이스와 연동하여 존재 여부를 확인하는 것이 안전합니다.
            window.location.href = "QnaReadBody.jsp?qnaId=" + nextId;
        }
        
     	// 댓글 등록 버튼 클릭 시 동작하는 함수
        function registerComment() {
            // 여기에 댓글 등록 처리 로직을 추가하세요.
            // 예: AJAX를 사용하여 서버로 댓글 데이터를 전송하고, 성공 여부에 따라 적절한 동작을 수행합니다.
            alert("답변이 등록되었습니다.");
        }
    </script>
</body>
</html>