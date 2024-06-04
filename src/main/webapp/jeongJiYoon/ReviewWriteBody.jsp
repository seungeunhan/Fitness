<!-- ReviewWriteBody.jsp -->
<!-- 리뷰작성 페이지 바디 -->
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
	            margin-bottom: -50px;
	        }
	        
	        table {
	            width: 50%;
	            height: 50%;
	            margin: 100px auto; /* 가운데 정렬 */
	            border-collapse: collapse;
	        }
	        
	        th, td {
	            padding: 8px;
	            text-align: left;
	            border-bottom: 1px solid #ddd;
	        }
	        
	        th {
	            background-color: #f2f2f2;
	        }
	        
	        input[type="text"] {
	            width: calc(100% - 20px); /* 부모 요소 크기에서 여백을 뺀 값으로 설정 */
	            height: 50px; /* 높이를 고정값으로 설정 */
	            white-space: pre-wrap; /* 자동 줄 바꿈 설정 */
	            resize: none; /* 사용자가 크기를 조절할 수 없도록 설정 */
	        }
	        
	        textarea {
	            width: calc(100% - 20px); /* 부모 요소 크기에서 여백을 뺀 값으로 설정 */
	            height: 200px; /* 높이를 고정값으로 설정 */
	            resize: none; /* 사용자가 크기를 조절할 수 없도록 설정 */
	        }
	        
	        .button-container {
	            display: flex;
	            justify-content: center;
	            margin-top: -50px;
	            margin-bottom: 300px;
	        }
	        
	        .submit-button, .cancel-button {
	            width: 15%;
	            padding: 20px;
	            margin: 0 5px;
	            border: none;
	            border-radius: 5px;
	            cursor: pointer;
	        }
	        
	        .submit-button {
	            background-color: #887159;
	            color: white;
	        }
	        
	        .submit-button:hover {
	            background-color: #5D4D3D;
	        }
	        
	        .cancel-button {
	            background-color: #EAEAEA;
	            color: black;
	            margin-left: 50px;
	        }
	        
	        .cancel-button:hover {
	            background-color: #A5A5A5;
	        }
	    </style>
	</head>
	
	<body>
		<!-- REVIEW 텍스트 -->
	    <div class="text1">
	        REVIEW
	    </div>
	    
	    <div class="divider1"></div>
		<form id="reviewForm" action="reviewPost" method="post"> <!-- 수정: action을 ReviewPost 서블릿으로 변경 -->
		    <table>
		        <tbody>
		        <tr style="height: 15%;">
		            <th style="text-align: center; width: 15%;">이름</th>
		            <td><input type="text" name="name" style="width: 40%; height: 50%;"></td>
		        </tr>
		        <tr style="height: 15%;">
		            <th style="text-align: center;">제목</th>
		            <td>
		                <!-- title 입력란에 ID 추가 -->
		                <input type="text" id="title" name="title" style="width: 40%; height: 50%; margin-right: 200px;">
		                <label for="public">공개 :</label>
		                <input type="radio" id="public" name="publicity" value="public" style="margin-right: 50px;"> <!-- 수정: name 속성 값 변경 -->
		                <label for="public">비공개 :</label>
		                <input type="radio" id="private" name="publicity" value="private" style="margin-right: 50px;"> <!-- 수정: name 속성 값 변경 -->
		            </td>
		        </tr>
		        <tr>
		            <th style="text-align: center;">내용</th>
		            <!-- content 입력란에 ID 추가 -->
		            <td><textarea id="content" name="content"></textarea></td>
		        </tr>
		        </tbody>
		    </table>
		    <div class="button-container">
		        <button type="submit" class="submit-button">등록</button> <!-- 수정: type을 submit으로 변경 -->
		        <button type="button" class="cancel-button" onclick="goBack()">취소</button>
		    </div>
		</form>
	    
	    <script>
	        function goBack() {
	            window.history.back();
	        }
	    </script>
	</body>
</html>
