<%@page import="java.util.Calendar"%>
<%@ page import="hanSeungEun.ReservationMgr" %>
<%@ page import="hanSeungEun.UserMgr" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<jsp:useBean id="rMgr" class="hanSeungEun.ReservationMgr" />


<%
request.setCharacterEncoding("utf-8");
Calendar cal = Calendar.getInstance();

// 시스템 오늘날짜
int ty = cal.get(Calendar.YEAR);
int tm = cal.get(Calendar.MONTH) + 1;
int td = cal.get(Calendar.DATE);

int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH) + 1;

// 파라미터 받기
String sy = request.getParameter("year");
String sm = request.getParameter("month");

if (sy != null) { // 넘어온 파라미터가 있으면
	year = Integer.parseInt(sy);
}
if (sm != null) {
	month = Integer.parseInt(sm);
}

cal.set(year, month - 1, 1);
year = cal.get(Calendar.YEAR);
month = cal.get(Calendar.MONTH) + 1;

int week = cal.get(Calendar.DAY_OF_WEEK); // 1(일)~7(토)
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 예약</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="reservation.css">
<link rel="stylesheet" href="calendar.css">


<script type="text/javascript">
	function change() {
		var f = document.frm;
		f.action = "reservation1.jsp";
		f.submit();
	}
	
	function showSelectedDate(day) {
	    var year = document.getElementById("yearSelect").value;
	    var month = document.getElementById("monthSelect").value;
	    document.getElementById("selectDate").value = year + "-" + month + "-" + day;
	}
</script>

</head>
<body onload="showSelectedYearMonth()">
	<%@ include file="../../jeongJiYoon/Header.jsp" %> <!-- 헤더 include -->
	
	<div class="wrap allwrap">
		<div class="main_bg">
			<div class="res_introduce">
				<p class="res_text">Visit</p>
				<p class="res_text_1">
					첫 상담 후 체험 1시간도 무료로 제공하오니 편안하고 여유로운<br>시간에 방문하는 것을 추천드립니다.
				</p>
			</div>
			<!--res_introduce-->
		</div>
		<!--main_bg-->

		<div class="allcenter res_title_wrap">
			<p class="res_text_2">Reservation</p>
			<div class="allcenter line"></div>
		</div>
		<!--res_title_wrap-->

		<div class="res_cnt_wrap">
			<div class="res_cnt allcenter " style="height:500px">
				<div class="allwrap allstyles">
					<p class=cnt_text>날짜 및 시간 선택</p>
					<p class=cnt_text style="margin-left: 525px;">예약 상세내역</p>
					<div style="clear: both;"></div>
					<div class="line_all line_1"></div>
					<div class="line_all line_2"></div>
					<div style="clear: both;"></div>
				</div>
				<!--res_cnt_title-->
				<div class="allstyles left_cnt">
					<p class="left_cnt_text">예약 가능한 시간대를 확인하고 날짜 및 시간을 선택하세요.</p>


					<div class="calendar">
						<div class="title">
							<form name="frm" method="post">
								<select name="year" class="selectField" id="yearSelect" 
									onchange="change(); showSelectedYearMonth();">
									<%
									for (int i = year - 5; i <= year + 5; i++) {
									%>
									<option value="<%=i%>" <%=year == i ? "selected='selected'" : ""%>><%=i%>년
									</option>
									<%
									}
									%>
								</select> <select name="month" class="selectField" id="monthSelect" onchange="change()">
									<%
									for (int i = 1; i <= 12; i++) {
									%>
									<option value="<%=i%>" <%=month == i ? "selected='selected'" : ""%>><%=i%>월
									</option>
									<%
									}
									%>
								</select>
							</form>
						</div> <!-- title -->

						<table>
							<thead>
								<tr>
									<td>일</td>
									<td>월</td>
									<td>화</td>
									<td>수</td>
									<td>목</td>
									<td>금</td>
									<td>토</td>
								</tr>
							</thead>
							<tbody>
								<%
								// 1일 앞 달
								Calendar preCal = (Calendar) cal.clone();
								preCal.add(Calendar.DATE, -(week - 1));
								int preDate = preCal.get(Calendar.DATE);

								out.print("<tr>");
								// 1일 앞 부분
								for (int i = 1; i < week; i++) {
									//out.print("<td>&nbsp;</td>");
									out.print("<td class='gray'>" + (preDate++) + "</td>");
								}

								// 1일부터 말일까지 출력
								int lastDay = cal.getActualMaximum(Calendar.DATE);
								String cls;
								for (int i = 1; i <= lastDay; i++) {
									cls = year == ty && month == tm && i == td ? "today" : "";

									out.print("<td class='" + cls + "'onclick='showSelectedDate(" + i + ")'>" + i + "</td>");
									if (lastDay != i && (++week) % 7 == 1) {
										out.print("</tr><tr>");
									}
								}

								// 마지막 주 마지막 일자 다음 처리
								int n = 1;
								for (int i = (week - 1) % 7; i < 6; i++) {
									// out.print("<td>&nbsp;</td>");
									out.print("<td class='gray'>" + (n++) + "</td>");
								}
								out.print("</tr>");
								%>
							</tbody>
						</table>

						<div class="footer">
							<a href="reservation1.jsp">Today</a>
						</div><!--footer-->
					</div> <!--calendar-->

					<div class="time">
						<p>오전</p>
						<div class="select">
							<input type="radio" value="09:00" name="time" id="time9" onclick="showSelectedTime(this.value)">
							<label for="time9">09:00</label>
							<input type="radio" value="10:00" name="time" id="time10" onclick="showSelectedTime(this.value)">
							<label for="time10">10:00</label>
							<input type="radio" value="11:00" name="time" id="time11" onclick="showSelectedTime(this.value)">
							<label for="time11">11:00</label>
						</div>

						<p>오후</p>
						<div class="select">
							<input type="radio" value="13:00" name="time" id="time13" onclick="showSelectedTime(this.value)">
							<label for="time13">13:00</label>
							<input type="radio" value="14:00" name="time" id="time14" onclick="showSelectedTime(this.value)">
							<label for="time14">14:00</label>
							<input type="radio" value="15:00" name="time" id="time15" onclick="showSelectedTime(this.value)">
							<label for="time15">15:00</label>
							<input type="radio" value="16:00" name="time" id="time16" onclick="showSelectedTime(this.value)">
							<label for="time16">16:00</label>
							<input type="radio" value="17:00" name="time" id="time17" onclick="showSelectedTime(this.value)">
							<label for="time17">17:00</label>
						</div>
					</div>
				</div>
				<!--left_cnt-->
				<form name="insertRes_user" method="post" action="res1Proc.jsp">
					<div class="right_cnt">
						<label class="right_cnt_text1">날짜</label>
						<input id="selectDate" name="reservdate">
						<label class="right_cnt_text1">시간</label>
						<input id="selectTime" name="time">
						<p class="right_cnt_text2">예상 상담 시간 1시간 정도<br>소요</p>
						<button class="btn_rev1">예약하기</button>
					
					</div><!--right_cnt-->
				</form>
				<div style="clear: both;"></div>
			</div>
			<!--res_cnt-->

		</div>
		<!--res_cnt_wrap-->
	</div>
	<!--wrap-->
	
	<script>
	    function showSelectedTime(value) {
	        document.getElementById("selectTime").value = value;
	    }
	</script>
	<%@ include file="../../jeongJiYoon/Footer.jsp" %> <!-- 풋터 include -->
</body>
</html>
