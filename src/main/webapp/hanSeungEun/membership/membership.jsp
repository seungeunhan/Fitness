<%@ page contentType="text/html; charset=UTF-8"%>
<%
String path="..";
%>

<!doctype html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="membership.css">
    <title>멤버쉽</title>
</head>
<body class="allstyles">
<%@ include file="../../jeongJiYoon/Header.jsp" %> <!-- 헤더 include -->

    <div class="wrap">
    	<div class="main_bg">
            <div class="res_introduce">
                <p class="res_text">Membership</p>
                <p class="res_text_1">상담 전 원하시는 상품을 미리 말씀해주시면 더욱더 빠르고<br>정확한 상담이 가능합니다.</p>
        	</div><!--res_introduce-->
        </div><!--main_bg-->
    
        <div class="line center"></div>
        <div class="content1 center">
            <h3>정기결제권</h3>
            <div class="title_line center"></div>
            <p>*상품을 선택 시 구매 페이지로 이동합니다.</p>
            <div class="category center">
                <span>개인</span>
                <span>법인</span>
            </div><!--category-->
            
            <div class="card" id="card">
                <a href="#"><img src="../img/membership2.png" alt="이미지" id="img_card"></a>
            </div><!--card-->
            <div class="card">
                <a href="#"><img src="../img/membership1.png" alt="이미지" id="img_card"></a>
            </div><!--card-->
            <div style="clear: both;"></div>
        </div><!--content1-->

        <div class="line center"></div>
        <div class="content2 center">
            <h3>일반 이용권</h3>
            <div class="title_line center"></div>
            <p>*상품을 선택 시 구매 페이지로 이동합니다.</p>
            <a href="#"><img src="../img/product1.png" alt="이미지" id="product"></a>
            <a href="#"><img src="../img/product2.png" alt="이미지" id="product"></a>
            <a href="#"><img src="../img/product3.png" alt="이미지" id="product"></a>
            <a href="#"><img src="../img/product4.png" alt="이미지" id="product"></a>
        </div><!--content2-->

        <div class="line center"></div>
        <div class="content3">
            <div class="text">
                <h2>참고 사항</h2>
                <p>1. 운동복, 수건, 샤워실, 공용락커는 무료이며, 연간 회원권 구매 고객에게는 개인 락커룸을 제공합니다.</p>
                <p>2. 실내용 운동화, 샤워 용품 등 개인용 물품은 제공하지 않습니다.</p>
                <p>3. 주차장은 5시간 무료 이용 가능합니다.</p>
                <p>4. 자세한 이용 사항은 상담을 통해 도와드리겠습니다.</p>
            </div>
        </div><!--content3-->
        
        <div class="line center"></div>
        <div class="content4" style="padding-bottom : 200px;">
            <div class="text">
                <h2>편의시설</h2>
                <img src="../img/cm.PNG" alt="이미지">
            </div>
        </div><!--content4-->
    </div><!--wrap-->
    <%@ include file="../../jeongJiYoon/Footer.jsp" %> <!-- 풋터 include -->
</body>
</html>