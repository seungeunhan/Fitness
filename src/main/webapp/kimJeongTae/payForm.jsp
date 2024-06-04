<%@page import="kimJeongTae.UserBean"%>
<%@page import="kimJeongTae.healthitemBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="mgr" class="kimJeongTae.PayMgr"/>
<%
Vector<healthitemBean> vlist = mgr.ItemListSelect();
UserBean user = mgr.UserSelect("aaa");
boolean flag = mgr.CheckUserItem("aaa");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous" />
<!-- 부트스트랩 자바스크립트 및 의존성 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
<%@ include file="../../jeongJiYoon/Header.jsp" %>
	<main>
		<style>
main {
	align-items: center;
	background-size: 100% 400px;
	background-repeat: no-repeat;
	padding-top: 350px;
	padding-left: 100px;
	padding-right: 100px;
	margin: 0;
	height: 2000px;
}

#review_title {
	padding-top: 100px;
	font-size: 40pt;
	justify-content: center;
	align-items: center;
	text-align: center;
	max-width: 250px;
}
</style>
		<div class="container border-bottom border-danger" id="review_title">
			결제</div>
		<div style="height: 60px;"></div>
		<!--상품선택-->
		<div class="mb-3"
			style="margin: 30px; border: 1px solid black; border-radius: 10px; padding: 10px;">
			<div class="row" style="margin-block: 30px;">
				<div class="col" style="max-width: 100px; align-content: center;">상품
					선택</div>
				<div class="col" style="position: relative;">
					<select class="form-select form-select-lg mb-3"
						aria-label="Large select example"
						style="position: absolute; top: 50%; transform: translateY(-50%); width: 90%;">
						<option selected>상품을 선택해 주세요</option>
					</select>
				</div>
			</div>
		</div>
		<!--컨탠츠 2-->
		<div class="mb-3"
			style="margin: 30px; border: 1px solid black; border-radius: 10px; padding: 10px;">
			<form action="payProc.jsp" method="post">
			<div class="row" style="margin-block: 30px;">
				<div class="col"
					style="max-width: 100px; width: auto; align-content: center;">보유중인
					포인트</div>
				<div class="col" style="position: relative;">
					<input type="text" class="col" value="1000pt" id="pointInput"
						name="name"
						style="pointer-events: none; display: block; width: 100%;">
				</div>
			</div>
			<!--현재 선택중인 상품출력-->
			<div class="row" style="margin-block: 30px;">
				<!--보유 포인트-->
				<div class="col"
					style="max-width: 100px; width: auto; align-content: center;">상품
					이름</div>
				<div class="col" style="position: relative;">
					<input type="text" class="col" value="1000pt" id="productNameInput"
						name="name"
						style="pointer-events: none; display: block; width: 100%;">
				</div>
			</div>
			<div class="row" style="margin-block: 30px;">
				<!--보유 포인트-->
				<div class="col"
					style="max-width: 100px; width: auto; align-content: center;">유효
					기간</div>
				<div class="col" style="position: relative;">
					<input type="text" class="col" value="1000pt"
						id="expirationDateInput" name="name"
						style="pointer-events: none; display: block; width: 100%;">
				</div>
			</div>
			<div class="row" style="margin-block: 30px;">
				<!--보유 포인트-->
				<div class="col"
					style="max-width: 100px; width: auto; align-content: center;">시설
					이용 기간</div>
				<div class="col" style="position: relative;">
					<input type="text" class="col" value="1000pt"
						id="facilityUsagePeriodInput" name="name"
						style="pointer-events: none; display: block; width: 100%;">
				</div>
			</div>
			<div class="row" style="margin-block: 30px;">
				<!--보유 포인트-->
				<div class="col"
					style="max-width: 100px; width: auto; align-content: center;">pt
					횟수</div>
				<div class="col" style="position: relative;">
					<input type="text" class="col" value="1000pt" id="ptCountInput"
						name="name"
						style="pointer-events: none; display: block; width: 100%;">
				</div>
			</div>
			<div class="row" style="margin-block: 30px;">
				<!--보유 포인트-->
				<div class="col"
					style="max-width: 100px; width: auto; align-content: center;">gx
					횟수</div>
				<div class="col" style="position: relative;">
					<input type="text" class="col" value="1000pt" id="gxCountInput"
						name="name"
						style="pointer-events: none; display: block; width: 100%;">
				</div>
			</div>
			<div class="row" style="margin-block: 30px;">
				<!--보유 포인트-->
				<div class="col"
					style="max-width: 100px; width: auto; align-content: center;">가격</div>
				<div class="col" style="position: relative;">
					<input type="text" class="col" value="1000pt" id="priceInput"
						name="name"
						style="pointer-events: none; display: block; width: 100%;">
				</div>
			</div>
			<div class="row" style="margin-block: 30px;">
				<!--보유 포인트-->
				<div class="col"
					style="max-width: 100px; width: auto; align-content: center;">사용
					포인트</div>
				<div class="col" style="position: relative;">
					<input type="text" class="col" value="1000pt" id="usedPointsInput"
						name="name" style="display: block; width: 100%;">
				</div>
			</div>
			<div class="row" style="margin-block: 30px;">
				<!--보유 포인트-->
				<div class="col"
					style="max-width: 100px; width: auto; align-content: center;">결제
					금액</div>
				<div class="col" style="position: relative;">
					<input type="text" class="col" value="1000pt"
						id="paymentAmountInput" name="totalPrice"
						style="pointer-events: none; display: block; width: 100%;">
				</div>
			</div>
			<input type="submit" value="결제하기" onclick="return checkUserItem();">
			</form>
		</div>
		<script>
                        // 옵션 정보를 가지고 있는 배열
                        var options = [
                        	
                        	<%for(int i=0;i<vlist.size();i++) {%>
                            { value: "<%=i%>", text: "<%=vlist.get(i).getItemname()%>" },
                            <%}%>
                        ];
						var vlist =[
							<%for(int i=0;i<vlist.size();i++) {%>
                            { 	num: "<%=i%>", 
                            	itemname: "<%=vlist.get(i).getItemname()%>", 
                            	hcontent: "<%=vlist.get(i).getHcontent()%>", 
                            	fcperiod: "<%=vlist.get(i).getFcperiod()%>", 
                            	deadlinedate: "<%=vlist.get(i).getDeadlinedate()%>", 
                            	ptnum: "<%=vlist.get(i).getPtnum()%>", 
                            	gxnum: "<%=vlist.get(i).getGxnum()%>", 
                            	frnum: "<%=vlist.get(i).getFrnum()%>", 
                            	sellperiod: "<%=vlist.get(i).getSellperiod()%>", 
                            	price: "<%=vlist.get(i).getPrice()%>", 
                            	sellflag: "<%=vlist.get(i).getSellflag()%>",
                            },
                            <%}%>
						];
                        // 선택상자 요소를 가져옴
                        var selectBox = document.querySelector(".form-select");

                        // 옵션을 선택상자에 추가
                        options.forEach(function(option) {
                            var optionElement = document.createElement("option");
                            optionElement.value = option.value;
                            optionElement.text = option.text;
                            selectBox.appendChild(optionElement);
                        });
                        // 선택상자 요소를 가져옴
                            var selectBox = document.querySelector(".form-select");

                        // 선택된 옵션의 값을 가져오는 함수
                        function getSelectedOptionValue() {
                            var selectedOption = selectBox.options[selectBox.selectedIndex];
                            return settingInput(selectedOption.value);
                        }
                        //선택된 상품에 따라 인풋태그 내용 설정해주는 함수
                        function settingInput(select){
                        	
                        	var idx = vlist[select];
                            document.getElementById('productNameInput').value = idx.itemname;
                            document.getElementById('expirationDateInput').value = idx.deadlinedate;
                            document.getElementById('facilityUsagePeriodInput').value = idx.fcperiod;
                            document.getElementById('ptCountInput').value = idx.ptnum;
                            document.getElementById('gxCountInput').value = idx.gxnum;
                            document.getElementById('priceInput').value = idx.price;
                            document.getElementById('paymentAmountInput').value = idx.price-document.getElementById('usedPointsInput').value;
                        }
                        

                        // 예시: 버튼 클릭 시 선택된 옵션의 값을 콘솔에 출력
                        selectBox.addEventListener("change", function() {
                            var selectedValue = getSelectedOptionValue();
                            console.log("Selected option value:", selectedValue);
                        });
                        //결제 버튼
                        function checkUserItem() {
                        	var flag = <%=flag%>;
						    if (flag == false) {
						        alert("일정 조건이 충족되지 않아 결제를 진행할 수 없습니다.");
						        return false;
						    } else if(flag == true){
						        // 조건을 만족하지 않으면 폼을 제출합니다.
						        alert("결제를 진행합니다.");
						        return true;
						    }
						}
                        
                        //================================================================
                        // 자바스크립트 변수에 값을 설정
                        var currentPoint = <%=user.getPoint()%>;
                        var productName = "상품 이름";
                        var expirationDate = "유효 기간";
                        var facilityUsagePeriod = "시설 이용 기간";
                        var ptCount = "pt 횟수";
                        var gxCount = "gx 횟수";
                        var price = "가격";
                        var usedPoints = "0";
                        var paymentAmount = "결제 금액";
            
                        // 각 input 요소에 값을 설정
                        document.getElementById('pointInput').value = currentPoint;
                        document.getElementById('productNameInput').value = productName;
                        document.getElementById('expirationDateInput').value = expirationDate;
                        document.getElementById('facilityUsagePeriodInput').value = facilityUsagePeriod;
                        document.getElementById('ptCountInput').value = ptCount;
                        document.getElementById('gxCountInput').value = gxCount;
                        document.getElementById('priceInput').value = price;
                        document.getElementById('usedPointsInput').value = usedPoints;
                        document.getElementById('paymentAmountInput').value = paymentAmount;

                        var pointInput = document.getElementById('pointInput');
                        var usedPointsInput = document.getElementById('usedPointsInput');
                        
                        usedPointsInput.addEventListener('input', function() {
                            // 입력된 값이 숫자인지 확인
                            if (!(/^\d*$/.test(this.value))) {
                                alert('숫자만 입력하세요.');
                                this.value = '';
                                return;
                            }
                            // 사용 포인트가 보유 포인트보다 큰지 확인
                            if (parseInt(this.value) > currentPoint) {
                                alert('보유 포인트보다 큰 값을 입력할 수 없습니다.');
                                this.value = ''; // 사용 포인트를 null로 설정
                            }
                            document.getElementById('paymentAmountInput').value = document.getElementById('priceInput').value - document.getElementById('usedPointsInput').value;
                        });
                    </script>
	</main>
	<%@ include file="../../jeongJiYoon/Footer.jsp" %>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
	crossorigin="anonymous"></script>
<script src="assets/demo/chart-area-demo.js"></script>
<script src="assets/demo/chart-bar-demo.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
	crossorigin="anonymous"></script>
<script src="js/datatables-simple-demo.js"></script>
</html>