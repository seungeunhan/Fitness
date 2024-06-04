<!-- trainerSchedule.jsp -->

<%@page import="java.util.Date"%>
<%@page import="java.util.Vector"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="project.TrainScheduleMgr"%>
<%@page import="project.TrainScheduleBean"%>
<jsp:useBean id="scheduleMgr" class = "project.TrainScheduleMgr"/>

<%

%>

 <%@ include file="adminHeader.jsp" %>
 <%@ include file="adminSideBar.jsp" %>


    <script src='../project/js/index.global.js'></script>
        <!--달력-->
        <script src='dist/index.global.js'></script>
<script>
	<%
	Vector<TrainScheduleBean> vlist = scheduleMgr.getTrainSchedule(); // 백터 데이터 가져오기
	Vector<String> TrainerNameList = new Vector<String>(); 
	Vector<String> startTimeList = new Vector<String>();
	
	try {
	    //vlist의 각 Trainer를 순회하며 Trainer의 이름을 가져와 TrainerNameList에 추가
	    for (int i = 0; i < vlist.size(); i++) {
	        int trainerNum = vlist.get(i).getTrainer(); // 현재 Trainer의 번호 가져오기
	        String trainerName = scheduleMgr.getTrainerName(trainerNum); // Trainer 번호로 Trainer의 이름 가져오기
	        TrainerNameList.add(trainerName); // TrainerNameList에 Trainer 이름 추가
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	}
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // 날짜 포맷 
	try {
	    //vlist의 각 Trainer를 순회하며 Trainer의 이름을 가져와 TrainerNameList에 추가
	    for (int i = 0; i < vlist.size(); i++) {
	        Date startTime = scheduleMgr.getTrainDate(vlist.get(i).getNum()); // Trainer 번호로 Trainer의 이름 가져오기
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	        String formattedDate = dateFormat.format(startTime);
	        startTimeList.add(formattedDate);
	       
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	}
	%>

	var timeList = JSON.parse(JSON.stringify("<%=startTimeList%>"));
 	document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var events = [
        <% for (int i = 0; i < vlist.size(); i++) {%>
        {
        	title: '<%=TrainerNameList.get(i)%>',
        	start: '<%=startTimeList.get(i)%>',
        	extendedProps:{
        		num: '<%=vlist.get(i).getNum()%>',
	        	trainerName: '<%=TrainerNameList.get(i)%>',
	        	lcontent: '<%=vlist.get(i).getLcontent()%>',
	        	date: '<%=vlist.get(i).getDate()%>',
	        	time: '<%=vlist.get(i).getStarttime() + "~" + vlist.get(i).getEndtime()%>',
        		user: '<%=vlist.get(i).getUser()%>'
        	}
        },
        <% } %>
    ];
	
    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      initialDate: '2024-04-12',
      navLinks: true, // can click day/week names to navigate views
      selectable: false,
      selectMirror: false,
      select: function(arg) {
    	  //이벤트 추가 메소드
      },
      eventClick: function(arg) {
    	  //각각의 요소에 값을 넣고
    	  document.getElementById("content1-num").value = arg.event.extendedProps.num;
    	  document.getElementById("content1-trainer").value = arg.event.extendedProps.trainerName;
          document.getElementById("content1-lcontent").value = arg.event.extendedProps.lcontent;
          document.getElementById("content1-date").value = arg.event.extendedProps.date;
          document.getElementById("content1-time").value = arg.event.extendedProps.time;
          document.getElementById("content1-user").value = arg.event.extendedProps.user;
          
      },
      editable: false,
      dayMaxEvents: false, // allow "more" link when too many events
      events: events
    });
    
    calendar.render();
  });
</script>
    
    
    
    
    
    
					    <style>
					    /* 테이블의 전체적인 스타일 */
					    #datatable {
					        width: 100%;
					        border-collapse: collapse;
					        font-family: 'Dongle' , serif; 
					        font-size: 22px;
					    }
					
					    /* 테이블 헤더 스타일 */
					    #datatable thead th {
					        background-color:RGB(108, 117, 125);
					        color: white; /* 글자색 */
					        padding: 5px; /* 패딩 */
					        text-align: center;
					        border-radius:  calc(0.375rem - 1px);
					    }
					
					    /* 테이블 바디 스타일 */
					    #datatable td {
					        padding: 6px; /* 패딩 */
					        text-align: center; /* 텍스트 정렬 */
					    }
					
					    /* 테이블 행 스타일 */
					    #datatable tr:nth-child(even) {
					        background-color: white; /* 짝수 행 배경색 */
					    }
					
					    
					        /* 호버 효과 */
					    #datatable tr:hover {
					        background-color: #ddd; /* 호버 시 배경색 */
					    }
					    
							    .dongle-regular {
							  font-family: "Dongle", sans-serif;
							  font-weight: 400;
							  font-style: normal;
							  font-size: 22px;
							}
							
							 .dongle-title {
							  font-family: "Dongle", fantasy;
							  font-weight: 500;
							  font-style: normal;
							  font-size: 40px;
							}
					    
					    
					        .font {
					        color: white; /* .datatable-title 클래스를 가진 요소의 텍스트 색상을 하얀색으로 변경 */
					        
					        }
					        
					    /* 테이블의 전체적인 스타일 */
					    #datatable2 {
					        width: 100%;
					        border-collapse: collapse;
					        font-family: 'Dongle' , serif; 
					        font-size: 22px;
					    }
					
					    /* 테이블 헤더 스타일 */
					    #datatable2 thead th {
					        background-color: silver; /* 배경색 */
					        color: white; /* 글자색 */
					        padding: 5px; /* 패딩 */
					        text-align: center;
					    }
					
					    /* 테이블 바디 스타일 */
					    #datatable2 td {
					        padding: 6px; /* 패딩 */
					        text-align: center; /* 텍스트 정렬 */
					    }
					    
					    /* 테이블의 셀에 대한 스타일 */
					    #datatable2 th, #datatable2 td {
					        border: 1px solid gray; /* 오른쪽에 검은색 선 추가 */
					    }
					    
					        /* 짝수 번째 행 스타일 */
					    #datatable2 tr:nth-child(even) {
					        background-color: #f2f2f2; /* 진한 배경색 */
					    }
					    
					            form * {
					            display: inline;
					            margin-right: 10px;
					            font-family:  'Dongle' , serif; 
					            font-size: 26px;
					            position: relative; /* 또는 absolute, fixed 등 */
					    		left: 7%; /* 왼쪽에서 떨어진 위치 */
					    		top: 5px; /* 상단에서 떨어진 위치 */
					            
					        }
					        
					          body {
										    margin: 40px 10px;
										    padding: 0;
										    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
										    font-size: 14px;
										  }

							  #calendar {
													    max-width: 1100px;
													    margin: 0 auto;
													  }
					
					    
					</style>
    
					
					<div id="layoutSidenav_content">
   			 <main>
    
    
    
        <h1 class="mt-2 dongle-title">&nbsp;&nbsp;강사 스케쥴</h1>
        <hr>
        
				    <form id="searchForm">
				        <label for="searchType">검색 유형:</label>
				        <select id="searchType">
				            <option value="name">강사 이름</option>
				            <option value="info">지점명</option>
				        </select>
				        
				        <label for="searchQuery">검색어:</label>
				        <input type="text" id="searchQuery" placeholder="검색어 입력">
				        
				        <button type="submit">검색</button>
				    </form>
				            <hr>
				            
				            
				              <div id='calendar'></div>
				            
				            
				            
				            
				            
						</main>




 <%@ include file="adminFooter.jsp" %>
</div>
            
            
            
            
            