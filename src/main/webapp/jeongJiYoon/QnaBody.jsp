<!-- QnaBody.jsp -->
<!-- QnA 페이지 바디 -->
<%@page import="java.util.List"%>
<%@page import="jeongJiYoon.QnaMgr"%>
<%@page import="jeongJiYoon.QnaBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
		<meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>헬스장 홈페이지</title>
	    
	    <!-- 부트스트랩 CDN 추가 -->
    	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-6gZ4fN1v7uIv29rvojN5K3e5gSu13loJug2/p7sz1FJWjAA2twc1xeJvBny0Vv6K" crossorigin="anonymous">
    
    	<link href="css/styles.css" rel="stylesheet" />
    	
	    <style>
	    	/* Q&A 텍스트 */
	        .text1 {
	        	font-weight: bold;
	            text-align: center; /* 텍스트를 가운데 정렬 */
	            font-size: 50px; /* 글자 크기 설정 */
	            margin-top: 70px;
	        }
	        
	        .divider1 {
	            width: 5%; /* 구분선의 너비 조정 */
	            margin: 10px auto; /* 가운데 정렬 및 위아래 여백 설정 */
	            border-top: 6px solid #EBDAC3; /* 갈색의 선을 위한 스타일 지정 */
	            margin-bottom: 80px; /* 하단 여백 추가 */
	        }
			
			/* 드롭다운 버튼 설정 */
			.dropdown-form {
			    margin-left: 1505px; /* 드롭다운 폼을 표의 오른쪽으로 이동 */
			    margin-bottom: -190px; /* 하단 여백 추가 */
			}
			
			/* 드롭다운 버튼 간격 조정 */
			.page-size-dropdown {
			    margin-left: 0px;
			}
			
			/* 아코디언 스타일 설정 */
	        .accordion {
	        	margin-left: auto; /* 가운데 정렬 및 위아래 여백 설정 */
            	margin-right: auto;
	        	margin-top: 200px;
	            width: 800px;
	        }
	
	        .accordion-item {
	            margin-bottom: -10px; /* 아코디언 아이템 간격 조정 */
	        }
	
	        .accordion-button {
		        text-align: left; /* 버튼 텍스트를 왼쪽 정렬 */
		        background-color: #ffffff; /* 아코디언 배경색을 흰색으로 설정 */
		        padding: 10px; /* 아코디언 버튼 내부 여백 설정 */
		        width: 100%; /* 버튼을 부모 요소에 맞게 확장 */
		    }
		
		    .accordion-body {
		        padding: 50px; /* 아코디언 내용 영역 내부 여백 설정 */
		    }
	    </style>
    </head>
    
    <body>
        <!-- Q&A 텍스트 -->
	    <div class="text1">
	        Q&A
	    </div>
	    <div class="divider1"></div>
	    
	    <!-- 페이지 크기 선택 드롭다운 -->
	    <% 
	        // 페이지 크기 선택 값 받아오기
	        int pageSize = request.getParameter("pageSize") != null ? Integer.parseInt(request.getParameter("pageSize")) : 5;
	        // 현재 페이지 번호 받아오기
	        int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
	    %>
	    
	    <form action="#" method="get" class="dropdown-form">
	        <select id="pageSize" name="pageSize" onchange="changePageSize(this)" class="page-size-dropdown">
	            <option value="5" <%= (pageSize == 5) ? "selected" : "" %>>5개씩 보기</option>
	            <option value="10" <%= (pageSize == 10) ? "selected" : "" %>>10개씩 보기</option>
	            <option value="15" <%= (pageSize == 15) ? "selected" : "" %>>15개씩 보기</option>
	        </select>
	        
	        <!-- 검색어 입력 필드 추가 -->
	        <input type="text" id="searchInput" name="search" placeholder="검색어 입력">
	        <!-- 검색 버튼 추가 -->
	        <button type="submit" class="btn btn-primary">검색</button>
	    </form>
		
		<%
		    // 검색어 파라미터 받아오기
		    String searchKeyword = request.getParameter("search");
		    
			// QnaMgr를 사용하여 해당 페이지의 Q&A 정보를 가져오기
	        QnaMgr qnaMgr = new QnaMgr();
	 		// 선택된 페이지 크기에 따라 데이터 가져오기
	    	List<QnaBean> qnaList = qnaMgr.getQnasByPage(pageSize, currentPage);
	 		
		    if (searchKeyword != null && !searchKeyword.isEmpty()) {
		        // 검색어가 존재하는 경우 해당 검색어를 기반으로 검색을 수행
		        qnaList = qnaMgr.searchQnasByKeyword(searchKeyword, pageSize, currentPage);
		    } else {
		        // 검색어가 없는 경우 전체 데이터를 가져옴
		        qnaList = qnaMgr.getQnasByPage(pageSize, currentPage);
		    }
		%>	    
	    
	    <div class="accordion" id="accordionExample">
		    <% 
		        // Q&A 정보를 표에 반복하여 표시
		        for (QnaBean qna : qnaList) {
		    %>
		        <div class="accordion-item">
		            <h2 class="accordion-header">
		                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse<%= qna.getNum() %>" aria-expanded="true" aria-controls="collapse<%= qna.getNum() %>">
		                    <%= qna.getTitle() %>
		                </button>
		            </h2>
		            <div id="collapse<%= qna.getNum() %>" class="accordion-collapse collapse" aria-labelledby="heading<%= qna.getNum() %>" data-bs-parent="#accordionExample">
		                <div class="accordion-body">
		                    <strong>작성자: <%= qna.getName() %></strong><br>
		                    <strong>작성일: <%= qna.getDate() %></strong><br>
		                    <%= qna.getContent() %>
		                </div>
		            </div>
		        </div>
		    <% } %>
		</div>
    
	    
	    <!-- 페이지네이션 추가 -->
	    <nav aria-label="Page navigation example" class="d-flex justify-content-center" style="margin-bottom: 200px; margin-top: 200px;">
	        <ul class="pagination pagination-sm">
	            <li class="page-item">
	                <a class="page-link" href="?pageSize=<%= pageSize %>&page=1&search=<%= searchKeyword %>" aria-label="First">
	                    <span aria-hidden="true">&lt;&lt;</span>
	                </a>
	            </li>
	            <!-- 페이지 수에 따라 동적으로 페이지네이션 아이템 생성 -->
	            <% 
	                // 검색 결과에 따른 총 게시물 수 가져오기
	                int totalQnaCount;
	                if (searchKeyword != null && !searchKeyword.isEmpty()) {
	                    totalQnaCount = qnaMgr.getTotalQnaCountByKeyword(searchKeyword);
	                } else {
	                    totalQnaCount = qnaMgr.getTotalQnaCount();
	                }
	                int totalPages = (int) Math.ceil((double) totalQnaCount / pageSize);
	                for (int i = 1; i <= totalPages; i++) { 
	            %>
	                <li class="page-item"><a class="page-link" href="?pageSize=<%= pageSize %>&page=<%= i %>&search=<%= searchKeyword %>"><%= i %></a></li>
	            <% } %>
	            <li class="page-item">
	                <a class="page-link" href="?pageSize=<%= pageSize %>&page=<%= totalPages %>&search=<%= searchKeyword %>" aria-label="Last">
	                    <span aria-hidden="true">&gt;&gt;</span>
	                </a>
	            </li>
	        </ul>
	    </nav>
	    
	    <!-- 부트스트랩 JavaScript 파일 불러오기 -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-RRnpKpHpXxUpXmzZf7Fk5XTrJgO2gFOv7I5k3oDFwcT2WA2MM6uX/fn+FsuG/m9r" crossorigin="anonymous"></script>
	    
	    <script>
		    document.addEventListener("DOMContentLoaded", function() {
		        // 아코디언 초기화
		        const collapseElementList = document.querySelectorAll('.collapse');
		        const collapseList = [...collapseElementList].map(collapseEl => new bootstrap.Collapse(collapseEl));
		    });
		</script>

	    <script>
	        function changePageSize(select) {
	            var selectedValue = select.value;
	            var url = window.location.href.split('?')[0]; // 현재 페이지 URL에서 쿼리 문자열 제거
	            var params = new URLSearchParams(window.location.search); // URL의 쿼리 파라미터 가져오기
	            params.set('pageSize', selectedValue); // pageSize 파라미터 설정
	            params.delete('page'); // 페이지 파라미터 삭제
	            window.location.href = url + '?' + params.toString(); // 새로고침
	        }
	    </script>
    </body>
</html>