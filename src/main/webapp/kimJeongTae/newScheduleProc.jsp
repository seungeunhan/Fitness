<%@page import="kimJeongTae.TrainScheduleBean"%>
<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="mgr" class="kimJeongTae.TrainScheduleMgr" />
<jsp:useBean id="mgrBean" class="kimJeongTae.TrainScheduleBean" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../../jeongJiYoon/Header.jsp"%>
	<%
	//받아온 날짜와 시간을 기본정보로 입력받고  나머지 빈칸을 입력받은뒤 유효성 검사이후 스케줄 추가를 진행한다 그뒤에 마이페이지로 이동.
	String date = request.getParameter("content1-date");
	//입력해야할 정보는 3가지 강사이름 강의정보 시간 을 입력받고 스케줄에 추가한다. + 강사번호는 유저번호 기반에서 트레이너테이블에서 검색
	String name = mgr.selectTrainerName(1);
	int trainer = mgr.selectTrainerNum(1);
	%>
	<form id="mainForm">
		<div class="mb-3" style="margin: 30px; border: 1px solid black; border-radius: 10px; padding: 10px;">
		<div class="row">
			<div class="col">수업번호</div>
			<div class="col-md-auto"></div>
			<div class="col">
				<input type="text" class="col" id="content1-num" name="content1-num"
					value="1" aria-label="Recipient's username"
					aria-describedby="basic-addon2" style="pointer-events: none;">
			</div>
		</div>
		<div class="row">
			<div class="col">강사</div>
			<div class="col-md-auto"></div>
			<div class="col">
				<input type="text" class="col" id="content1-trainer"
					name="content1-trainer" value="강사이름"
					aria-label="Recipient's username" aria-describedby="basic-addon2"
					style="pointer-events: none;">
			</div>
			<input type="text" class="col" id="content2-trainer" name="trainer"
				value="강사번호" aria-label="Recipient's username"
				aria-describedby="basic-addon2" style="pointer-events: none;">

		</div>
		<div class="row">
			<div class="col">유형</div>
			<div class="col-md-auto"></div>
			<div class="col">
				<div class="category-check category-switch">
					<input class="category-check-input" type="checkbox" role="switch"
						id="flexSwitchCheckDefault"> <label
						class="category-check-label" for="flexSwitchCheckDefault">pt</label>
				</div>
				<div class="category-check form-switch">
					<input class="category-check-input" type="checkbox" role="switch"
						id="flexSwitchCheckChecked"> <label
						class="category-check-label" for="flexSwitchCheckChecked">gpt</label>
				</div>
				<div class="category-check form-switch">
					<input class="category-check-input" type="checkbox" role="switch"
						id="flexSwitchCheckChecked" checked> <label
						class="category-check-label" for="flexSwitchCheckChecked">gx</label>
				</div>
				<input type="text" class="col" id="content1-Lcontent"
					name="lcontent" value="수업번호" aria-label="Recipient's username"
					aria-describedby="basic-addon2" style="pointer-events: none;">
			</div>
		</div>
        </div>
		<div class="mb-3" style="margin: 30px; border: 1px solid black; border-radius: 10px; padding: 10px;">
              <div class="row">
			<div class="col">날짜</div>
			<div class="col-md-auto"></div>
			<div class="col">
				<input type="text" class="col" id="content1-date" name="date"
					value="날짜" aria-label="Recipient's username"
					aria-describedby="basic-addon2" style="pointer-events: none;">
			</div>
		</div>
		<div class="row">
			<div class="col">시간</div>
			<div class="col-md-auto"></div>
			<div class="col">
				<div class="time-check time-switch">
					<input class="time-check-input" type="checkbox" role="switch"
						id="flexSwitchCheckDefault" value="09:00:00"> <label
						class="time-check-label" for="flexSwitchCheckDefault"
						id="time-label-9">09:00:00</label>
				</div>
				<div class="time-check time-switch">
					<input class="time-check-input" type="checkbox" role="switch"
						id="flexSwitchCheckChecked" value="10:00:00"> <label
						class="time-check-label" for="flexSwitchCheckChecked">10:00:00</label>
				</div>
				<div class="time-check time-switch">
					<input class="time-check-input" type="checkbox" role="switch"
						id="flexSwitchCheckChecked" value="11:00:00"> <label
						class="time-check-label" for="flexSwitchCheckChecked">11:00:00</label>
				</div>
				<div class="time-check time-switch">
					<input class="time-check-input" type="checkbox" role="switch"
						id="flexSwitchCheckChecked" value="12:00:00"> <label
						class="time-check-label" for="flexSwitchCheckChecked">12:00:00</label>
				</div>
				<div class="time-check time-switch">
					<input class="time-check-input" type="checkbox" role="switch"
						id="flexSwitchCheckChecked" value="13:00:00"> <label
						class="time-check-label" for="flexSwitchCheckChecked">13:00:00</label>
				</div>
				<div class="time-check time-switch">
					<input class="time-check-input" type="checkbox" role="switch"
						id="flexSwitchCheckChecked" value="14:00:00"> <label
						class="time-check-label" for="flexSwitchCheckChecked">14:00:00</label>
				</div>
				<div class="time-check time-switch">
					<input class="time-check-input" type="checkbox" role="switch"
						id="flexSwitchCheckChecked" value="15:00:00"> <label
						class="time-check-label" for="flexSwitchCheckChecked">15:00:00</label>
				</div>
				<div class="time-check time-switch">
					<input class="time-check-input" type="checkbox" role="switch"
						id="flexSwitchCheckChecked" value="16:00:00"> <label
						class="time-check-label" for="flexSwitchCheckChecked">16:00:00</label>
				</div>
				<div class="time-check time-switch">
					<input class="time-check-input" type="checkbox" role="switch"
						id="flexSwitchCheckChecked" value="17:00:00"> <label
						class="time-check-label" for="flexSwitchCheckChecked">17:00:00</label>
				</div>
				<input type="text" class="col" id="content1-time" name="starttime"
					value="시간" aria-label="Recipient's username"
					aria-describedby="basic-addon2" style="pointer-events: none;">
				<input type="text" class="col" id="content2-time" name="endtime"
					value="시간" aria-label="Recipient's username"
					aria-describedby="basic-addon2" style="pointer-events: none;">
			</div>
		</div>
		<div class="row">
			<div class="col">자리</div>
			<div class="col-md-auto"></div>
			<div class="col">
				<input type="text" class="col" id="content1-user"
					name="content1-user" value="자리" aria-label="Recipient's username"
					aria-describedby="basic-addon2" style="pointer-events: none;">
			</div>
		</div>

		<div class="row">
			<div class="col"></div>
			<button type="button" class="btn btn-warning col"
				onclick="insertSchedule()">입력</button>
		</div>          
        </div>
</form>
	<script type="text/javascript">
                                    		//유형 라디오 스크립트
                                    		document.addEventListener('DOMContentLoaded', function() {
                                    			// 모든 카테고리 체크박스 입력 요소를 가져옴
                                    		    var typeSwitches = document.querySelectorAll('.category-check-input');
                                    		    
                                    		    // 각각의 체크박스에 대해 이벤트 리스너를 추가
                                    		    typeSwitches.forEach(function(switchElement) {
                                    		        switchElement.addEventListener('change', function() {
                                    		            // 모든 체크박스를 반복하면서 현재 체크박스를 제외한 나머지는 체크 해제
                                    		            typeSwitches.forEach(function(otherSwitchElement) {
                                    		                if (otherSwitchElement !== switchElement) {
                                    		                    otherSwitchElement.checked = false;
                                    		                }
                                    		            });
                                    		            
                                    		            // 선택된 체크박스에 따라 반환할 값을 결정
                                    		            var result = "";
                                    		            typeSwitches.forEach(function(otherSwitchElement) {
                                    		                result += otherSwitchElement.checked ? "1" : "0";
                                    		            });
                                    		            console.log(result);
                                    		            document.getElementById('content1-Lcontent').value = result;
                                    		            
                                    		        });
                                    		    });
										    });
                                    		//시간 라디오 스크립트
                                    		// 시간 체크박스 그룹
									        var timeSwitches = document.querySelectorAll('.time-check-input');
									        var content1TimeInput = document.getElementById('content1-time');
									        var content2TimeInput = document.getElementById('content2-time');
									        // 시간 체크박스에 대한 이벤트 리스너를 추가
									        timeSwitches.forEach(function(timeSwitch) {
									            timeSwitch.addEventListener('change', function() {
									                var checkedCount = 0;
									                var selectedTimes = [];
									                var startTime = null;
									                var endTime = null;
									                // 선택된 시간 체크박스 수 계산
									                timeSwitches.forEach(function(switchElement) {
									                    if (switchElement.checked) {
									                        checkedCount++;
									                    }
									                });
									            	
									                // 선택된 시간 체크박스가 2개 이상이면 나머지 비활성화
									                if (checkedCount >= 2) {
									                    timeSwitches.forEach(function(switchElement) {
									                        if (!switchElement.checked) {
									                            switchElement.disabled = true;
									                        }
									                    });
									                    
									                } else {
									                    // 선택된 시간 체크박스가 1개 이하면 모든 체크박스 활성화
									                    timeSwitches.forEach(function(switchElement) {
									                        switchElement.disabled = false;
									                    });
									                }
									                // 선택된 시간 체크박스의 값들을 취합
									                timeSwitches.forEach(function(switchElement) {
									                    if (switchElement.checked) {
									                        selectedTimes.push(switchElement.value);
									                    }
									                });
													
									             	// 선택된 시간 체크박스가 2개 이상인 경우에만 처리
									                if (selectedTimes.length >= 2) {
									                    // 선택된 시간 중 가장 작은 값과 가장 큰 값을 찾아서 시작 시간과 끝 시간으로 설정
									                    startTime = selectedTimes.reduce(function(a, b) {
									                        return a < b ? a : b;
									                    });
									                    endTime = selectedTimes.reduce(function(a, b) {
									                        return a > b ? a : b;
									                    });

									                    // 시작 시간과 끝 시간을 content1-time 인풋태그에 설정
									                    content1TimeInput.value = startTime;
									                    content2TimeInput.value = endTime;
									                } else {
									                    // 선택된 시간 체크박스가 2개 미만이면 인풋태그를 초기화
									                    content1TimeInput.value = "";
									                    content2TimeInput.value = "";
									                }
									            });
									        });
                                    		//유저정보 기반으로 강사 이름 찾아 넣어야 한다.
                                    	 	var date =  JSON.parse(JSON.stringify("<%=date%>"));
                                    	 	document.getElementById('content1-date').value = date;
                                    	 	
                                    	 	var name = JSON.parse(JSON.stringify("<%=name%>"));
                                    	 	document.getElementById('content1-trainer').value = name;
                                    	 	
                                    	 	var trainer = JSON.parse(JSON.stringify("<%=trainer%>"));
                                    	 	document.getElementById('content2-trainer').value = trainer;
                                    	 	
                                    	 	
                                    	 	//스케줄 생성 버튼 이벤트
                                    	 	function insertSchedule(){
                                    	 		//폼태그를 통해 proc2로 보내고 request로 처리한다.
                                    	 		var frm = document.getElementById('mainForm');
													frm.setAttribute("action", "newScheduleProc2.jsp");
													frm.submit();
                                    	 		alert('성공햇습니다. 확인해보세요.');
                                    	 	}
                                    	 	
                                    	</script>
	<%@ include file="../../jeongJiYoon/Footer.jsp"%>
</body>

</html>



