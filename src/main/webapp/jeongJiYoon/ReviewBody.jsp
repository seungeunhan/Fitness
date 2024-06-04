<!-- ReviewBody.jsp -->
<!-- 리뷰페이지 바디 -->
<%@page import="jeongJiYoon.ReviewBean"%>
<%@page import="java.util.List"%>
<%@page import="jeongJiYoon.ReviewMgr"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
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
	        
	        .allcenter {
			    /*가운데 정렬*/
			    display: block;  
			    margin-left: auto;
			    margin-right: auto;
			}
			
			
	        
	        
	        
	        /*콘텐츠 헤더 이미지 및 리뷰 이벤트 알림 텍스트****************/
	        .main_bg{
				position: relative;
			    width: 100%;
			    height: 500px;
			    z-index: 1; /*순번*/
			    
	        }
	        
	        /*배경 투명도를 위한 가상 요소*/
			.main_bg::after {
			    position: absolute;
			    content: "";
			    width: 100%;
			    height: 100%;
			    background-image: url(img/UI-UW-05.jpg);
			    background-position: center; /*이미지는 기본적으로 왼쪽부터 채우며, 어디서부터 채울지 정할 때*/
			    top: 0;  /*가상요소가 원본의 전체를 차지*/
			    left: 0; /*가상요소가 원본의 전체를 차지*/
			    opacity: 0.6; /*이미지 투명하게*/
			    z-index: -1; /*순번*/
			}
			/*리뷰이벤트 소개 박스*/
			.rv_introduce {
			    position: relative;
			    text-align: center;
			    width: 32vw;
			    height: 220px;
			    background-color: white;
			    margin: auto;
			    top: 350px;
			    box-shadow: 0px 5px 4px #d8d7d7;
			    padding-top: 25px;
			    box-sizing: border-box;
			    min-width: 530px;
			}
			
			.rv_title {
			    font-size: 40px;
			    font-weight: 700;
			    margin: 0;
			}

			.rv_text {
			    line-height: 30px;
				font-size: 1.1rem;
				margin-top: 50px;
			}
			
			
			/* Review 텍스트 div */
			.rv_title_wrap {
			    width: 20%;
			    height: auto;
			    margin-top: 200px;
			    text-align: center; 
			}
			
			/*폰트 사이즈*/
			.rv_text_1 {
			    font-size: 2rem;
			    margin: 0;
			}
			
			/*리뷰 텍스트 밑줄*/
			.line {
			    width: 15%;
			    height: 5px;
			    margin-top: 10px;
			    background-color: #EBDAC3;
			}
			/*********************************************/
	        
	       
	        
	        /* Event 텍스트 */
	        .text2 {
	        	font-weight: bold;
	            text-align: center; /* 텍스트를 가운데 정렬 */
	            font-size: 50px; /* 글자 크기 설정 */
	            margin-bottom: 20px; /* 글 상단 여백 설정 */
	        }
	        
	        .divider1 {
	            width: 7%; /* 구분선의 너비 조정 */
	            margin: 10px auto; /* 가운데 정렬 및 위아래 여백 설정 */
	            border-top: 6px solid #EBDAC3; /* 갈색의 선을 위한 스타일 지정 */
	        }
	        
	        .centered-image {
	            display: flex;
	            justify-content: center;
	            align-items: center;
	            height: 100%; /* 화면 세로 전체 높이를 차지하도록 설정 */
	            margin-top: -250px; /* 원하는 만큼의 상단 여백을 설정 */
	        }
	
	        .centered-image img {
	            width: 100%;
	            height: 400px; /* 세로는 300px로 고정 */
	            filter: opacity(0.7); /* 0.0부터 1.0까지의 값으로 설정하여 투명도를 조절합니다. */
	        }
	        
	        .overlay-box {
	            position: absolute;
	            top: 450px;
	            left: 550px;
	            width: 45%;
	            height: 25%;
	            background-color: rgba(255, 255, 255, 1.0); /* 흰색 투명 배경색 */
	            display: flex;
	            justify-content: center;
	            align-items: center;
	            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.3); /* 그림자 효과 */
	        }
	        
	        /* Event 설명 텍스트 */
	        .overlay-text {
	            font-size: 20px;
	            font-weight: normal;
	            text-align: center;
	            margin-top: 30px; /* 원하는 만큼의 상단 여백을 설정 */
	        }
	        
	        /* 카드 스타일 */
	        .card {
	            margin-bottom: 20px;
	            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
	            transition: 0.3s;
	        }
	
	        .card:hover {
	            box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
	        }
	
	        .container {
	            padding: 2px 16px;
	        }
	    </style>
	</head>
	
	<body>
		<!-- 이미지를 화면 중앙에 표시하는 부분 -->
		<div class="main_bg">
			<div class="rv_introduce">
				<p class="rv_title">Event</p>
				<p class="rv_text">
					한달에 한번 추첨을 통해 리뷰를 작성해주신 회원 5분께 PT 1회<br>무료 체험권을 드리오니
	                많은 참여 부탁드립니다.
				</p>
			</div><!--res_introduce-->
		</div><!--main_bg-->
	    
	    <!-- Review 텍스트 -->
	    <div class="allcenter rv_title_wrap">
			<p class="rv_text_1">Review</p>
			<div class="allcenter line"></div>
		</div><!--rv_title_wrap-->
	    
	    <!-- "글쓰기" 버튼 -->
		<div style="position: relative; text-align: center; margin-left: 1000px; margin-bottom: -40px;">
		    <a href="ReviewWrite.jsp" class="btn btn-primary" style="background-color: white; border-color: black; color: black;">글쓰기</a>
		</div>
		
	    <!-- 카드 6개 -->
	    <div class="container mt-5">
	        <div class="row row-cols-1 row-cols-md-3 g-4">
	            <%
	                int currentPage = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1;
	                int reviewsPerPage = 6;
	                ReviewMgr reviewMgr = new ReviewMgr();
	                List<ReviewBean> reviews = reviewMgr.getAllReviews();
	                int startIndex = (currentPage - 1) * reviewsPerPage;
	                int endIndex = Math.min(startIndex + reviewsPerPage, reviews.size());
	                for (int i = startIndex; i < endIndex; i++) {
	                    ReviewBean review = reviews.get(i);
	            %>
	            <div class="col mb-4">
	                <div class="card h-100">
	                    <div class="card-body">
	                        <h5 class="card-title"><a href="ReviewRead.jsp?id=<%= review.getNum() %>"><%= review.getTitle() %></a></h5>
	                        <p class="card-text"><%= review.getName() %> 님이 작성한 리뷰입니다.</p>
	                        <p class="card-text">작성일: <%= review.getDate() %></p>
	                    </div>
	                </div>
	            </div>
	            <% } %>
	        </div>
	    </div>
	
	    <!-- 페이지네이션 -->
	    <nav aria-label="Page navigation example" style="margin-bottom: 300px; margin-top: 20px; margin-left: 650px;">
	        <ul class="pagination justify-content-center pagination-sm">
	            <li class="page-item">
	                <a class="page-link" href="?page=1" aria-label="First">
	                    <span aria-hidden="true">&lt;&lt;</span>
	                </a>
	            </li>
	            <% 
	                int totalPages = (int) Math.ceil((double) reviews.size() / reviewsPerPage);
	                for (int i = 1; i <= totalPages; i++) {
	            %>
	            <li class="page-item"><a class="page-link" href="?page=<%= i %>"><%= i %></a></li>
	            <% } %>
	            <li class="page-item">
	                <a class="page-link" href="?page=<%= totalPages %>" aria-label="Last">
	                    <span aria-hidden="true">&gt;&gt;</span>
	                </a>
	            </li>
	        </ul>
	    </nav>
	</body>
</html>