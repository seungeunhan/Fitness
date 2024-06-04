<!-- QnaReply-->

<%@ page import="java.text.DecimalFormat" %>
<%@page import = "project.LocationBean" %>
<%@page import="project.UserBean"%>
<%@page import="project.TrainerWorkBean"%>
<%@page import="project.ReservationBean"%>
<%@page import="project.QnaBean"%>
<%@page import="java.util.Vector"%>
<%@page import="project.UtilMgr"%>
<%@page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="uMgr" class="project.UserMgr"/>
<jsp:useBean id="lMgr" class="project.LocationMgr"/>
<jsp:useBean id="cMgr" class="project.ChargeMgr"/>
<jsp:useBean id="rMgr" class="project.ReservMgr"/>
<jsp:useBean id="rvMgr" class="project.ReviewMgr"/>

<%
			String nowPage = request.getParameter("nowPage");
			String numPerPage = request.getParameter("numPerPage");
			String keyField = request.getParameter("keyField");
			String keyWord = request.getParameter("keyWord");
			int num = UtilMgr.parseInt(request,"num");
			
			QnaBean bean = rvMgr.getBoard(num);
			
			int num1 = bean.getNum();
			String title = bean.getTitle();
			String content = bean.getContent();
            String reviewdate = bean.getDate();
			int usernum = bean.getUsernum();
			String ip = bean.getIp();
			boolean secret = bean.getSecret();
			int frnum = bean.getFrnum();
			boolean ansflag = bean.getAnsflag();
			
			String  name = uMgr.getUserName(bean.getUsernum());
    
		
%>
<%@include file = "adminHeader.jsp"%>
<%@include file = "adminSideBar.jsp"%>

<script type="text/javascript">
	function list() {
		document.listFrm.action = "qnaBoard.jsp";
		document.listFrm.submit();
	}
	
	function delFn(){
	    var num1 = <%= num1 %>; // num1 변수를 정의
	    document.delFrm.num1.value = num1; // num1 값을 폼 필드에 할당
		document.delFrm.submit();
	}
	
    function fillForm() {
        // 사용자가 입력한 값들을 JavaScript로 가져와서 폼에 할당
        var nameValue = document.getElementById("nameInput").value;
        var titleValue = document.getElementById("titleInput").value;
        var contentValue = document.getElementById("contentInput").value;
	    var num1 = <%= num1 %>; // num1 변수를 정의
	    
	    document.qnaReplyForm.num1.value = num1;
        document.qnaReplyForm.name.value = nameValue;
        document.qnaReplyForm.title.value = titleValue;
        document.qnaReplyForm.content.value = contentValue;

        // 폼 제출
        document.qnaReplyForm.submit();
    }
	
	

</script>

 <style>
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
						        color: black; /* .datatable-title 클래스를 가진 요소의 텍스트 색상을 하얀색으로 변경 */
						        
						        }
						        
						    /* 테이블의 전체적인 스타일 */
						    #datatable2 {
						        width: 100%;
						        border-collapse: collapse;
						        font-family: 'Dongle' , serif; 
						        font-size: 22px;
						        border: none;
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
						        border: 1px solid white; /* 오른쪽에 검은색 선 추가 */
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
							    
							    
									.search-form {
									    width: auto; /* 너비를 자동으로 조정하도록 변경 */
									    text-align: center;
									    margin-bottom: 20px;
									    position: relative; /* 상대적 위치 지정 */
									}
									
									.search-input {
									    display: inline-block;
									    margin-right: 5px;
									}
									
									.search-select,
									.search-text {
									    font-size: 20px;
									    padding: 6px;
									}
									
									.search-button,
									.register-button,
									.refresh-btn,
									.b-btn {
									    background-color: #4CAF50;
									    color: white;
									    border: none;
									    padding: 10px 20px;
									    text-align: center;
									    text-decoration: none;
									    display: inline-block;
									    font-size: 20px;
									    cursor: pointer;
									    border-radius: 5px;
									    margin-left: 10px; /* 요소들 간의 간격 조정 */
									    font-family:  'Dongle' , serif;
									}
									
									/* 호버 효과 */
									.search-button:hover,
									.register-button:hover,
									.refresh-btn:hover,
									.b-btn:hover {
									    background-color: #45a049;
									}
									
									.register-button {
									    background-color: #008CBA; /* 회원 등록 버튼의 배경색 조정 */
									}
									
									.register-button:hover {
									    background-color: #005f7f;
									}
									
									.refresh-btn {
									    background-color: lime; /* 새로 고침 버튼의 배경색 조정 */
									    margin-left: 0; /* 왼쪽 여백을 0으로 조정 */
									}
									
									.b-btn {
									    background-color: teal; /* 새로 고침 버튼의 배경색 조정 */
									    margin-left: 0; /* 왼쪽 여백을 0으로 조정 */
									}
									
													
									.paging-container {
									    text-align: center;
									    margin-top: 20px;
									}
									
									.paging-container a {
									    display: inline-block;
									    padding: 1px 5px;
									    margin: 0 3px;
									    border: 1px solid #ccc;
									    text-decoration: none;
									    color: #333;
									    border-radius: 10px;
									}
									
									.paging-container a.active {
									    background-color: #4CAF50;
									    color: white;
									    border: 1px solid #4CAF50;
									}
									
									.paging-container a:hover {
									    background-color: #f2f2f2;
									}
									
									.paging-container span {
									    display: inline-block;
									    padding: 5px 10px;
									    margin: 0 3px;
									    color: #666;
									}
							    
							    
							    
					</style>



<div id="layoutSidenav_content">
    <main>
        <div class="card">
            <div class="card-header bg-blue dongle-regular">
                <span class="font">QnA 답변</span>
            </div>
            <div class="card-body">
                <table border="1" id="datatable2">
					<tr>
					     <td width="20%">성 명</td>
					     <td width="80%">
						  <input name="name"  id="nameInput"  value= "관리자" size="30" maxlength="20"></td>
					    </tr>
					    <tr>
					     <td>제 목</td>
					     <td>
						  <input name="subject" id="titleInput" size="50" value="답변 : " maxlength="50"></td> 
					    </tr>
						<tr>
					     <td>내 용</td>
					     <td>
						  <textarea name="content"  id="contentInput" rows="12" cols="50">
					      	<%=content %>
					      	</textarea>
					      </td>
					     <td colspan="2" height="5"><hr/></td>
					    </tr>
						<tr> 
					     <td colspan="2">
						  <input type="submit" value="답변등록"  onClick = "fillForm()">
					      <input type="button" value="뒤로" onClick="history.back()"></td>
					    </tr>          
                </table>
            </div>
           </div>
    </main>




<form name="listFrm">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
	<input type="hidden" name="numPerPage" value="<%=numPerPage%>">
	<%if(!(keyWord==null||keyWord.equals(""))){%>
	<input type="hidden" name="keyField" value="<%=keyField%>">
	<input type="hidden" name="keyWord" value="<%=keyWord%>">
	<%}%>
</form>

<form name="delFrm" action="QnaDelProc.jsp" method="post">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
	<input type="hidden" name="numPerPage" value="<%=numPerPage%>">
	<input type="hidden" name="keyField" value="<%=keyField%>">
	<input type="hidden" name="keyWord" value="<%=keyWord%>">
	<input type="hidden" name="num1">
	<input type="hidden" name="pass">
</form>

<form name="qnaReplyForm" action="QnaReplyProc.jsp" method="post">
	<input type="hidden" name="name" >
	<input type="hidden" name="title" >
	<input type="hidden" name="content" >
	<input type="hidden" name="num1">
	<input type="hidden" name="pass">
</form>


<%@include file = "adminFooter.jsp"%>
</div>
