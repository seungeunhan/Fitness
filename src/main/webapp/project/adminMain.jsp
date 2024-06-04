<!-- adminMain.jsp -->
<!-- 완성 -->

<%@page import="project.UserBean"%>
<%@page import="project.ReviewBean"%>
<%@page import="project.QnaBean"%>
<%@page import="project.ReservationBean"%>
<%@page import="project.ChargeInfoBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="uMgr" class="project.UserMgr"/>
<jsp:useBean id="qaMgr" class="project.QnaMgr"/>
<jsp:useBean id="chMgr" class="project.ChargeMgr"/>
<jsp:useBean id="rsMgr" class="project.ReservMgr"/>
<jsp:useBean id="rvMgr" class="project.ReviewMgr"/>

<%
		String payback = "";
		String carflag = "";
		String ansflag = "";
%>
 <%@ include file="adminHeader.jsp" %>
 <%@ include file="adminSideBar.jsp" %>
        		
	        		<script>
	        		
	        		
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
							        background-color:#ced4da; /* 배경색 */
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
							       
							    
					</style>





					<!--  몸통 -->
					 
					 <div id="layoutSidenav_content">
					<main>
								
								
						<!-- 1 -->
						<h1 class="mt-4  dongle-title">&nbsp;&nbsp;  Administrator Main </h1>
						<hr>
					
                        <div class="card">
                            <div class="card-header bg-secondary dongle-regular">
                                 <span class="font">신규 가입자</span>
                            </div>
                            <div class="card-body">
                                <table id="datatable">
                                    <thead>
                                        <tr>
                                            <th>이름</th>
                                            <th>생년월일</th>
                                            <th>성별</th>
                                            <th>지점번호</th>
                                            <th>가입일자</th>
                                        </tr>
                                        
                                    </thead>
                                    <tbody>
                                    		<%
													Vector<UserBean> uvlist = uMgr.getListUser();
													if(uvlist.isEmpty()){
											%>
											<tr>
												<td colspan="5" align="center">
													최근 1달이내 신규 가입자가 없습니다.
												</td>
											</tr>
										<%
												}else{							          
											for(int i = 0; i <Math.min(uvlist.size(),3); i++){
												UserBean uBean = uvlist.get(i);
										%>		
                                    <tr>
                                        <td><%=uBean.getName()%></td>
                                        <td><%=uBean.getBirth()%></td>
                                        <td><%=uBean.getGender()%></td>
                                        <td><%=uBean.getFrnum()%></td>
                                        <td><%=uBean.getJoindate()%></td>
                                    </tr>
                                   <% }%>
                                  <% }%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <a href="userManage.jsp" class="morebtn dongle-regular">더보기</a>
                        
                        
                         <!-- 2 -->
                        <ol class="breadcrumb mb-5">
                        </ol>
					
                        <div class="card">
                            <div class="card-header bg-danger dongle-regular">
                                 <span class="font">최근 QnA</span>
                            </div>
                            <div class="card-body">
                                <table id="datatable">
                                    <thead>
                                        <tr>
                                            <th>글번호</th>
                                            <th>글제목</th>
                                            <th>작성날짜</th>
                                            <th>작성자</th>
                                            <th>ip</th>
                                            <th>답변여부</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    		<%
													Vector<QnaBean> qvlist = qaMgr.getListQna();
													if(qvlist.isEmpty()){
											%>
											<tr>
												<td colspan="6" align="center">
													최근 1달이내 신규 QnA가 없습니다.
												</td>
											</tr>
										<%
												}else{							          
											for(int i = 0; i <Math.min(qvlist.size(),3); i++){
												QnaBean qBean = qvlist.get(i);
												
												if(qBean.getAnsflag()==true){
													ansflag = "완료";
												}else{
													ansflag = "X";
												}
										%>		
                                    <tr>
                                        <td><%=qBean.getNum()%></td>
                                        <td><%=qBean.getTitle()%></td>
                                        <td><%=qBean.getDate()%></td>
                                        <td><%=qBean.getUsernum()%></td>
                                        <td><%=qBean.getIp()%></td>
                                        <td><%=ansflag%></td>
                                    </tr>
                                   <% }%>
                                  <% }%>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <a href="qnaBoard.jsp" class="morebtn dongle-regular">더보기</a>
                        
                        <!-- 3 -->
                        <ol class="breadcrumb mb-5">
                        </ol>
					
                        <div class="card">
                            <div class="card-header bg-warning dongle-regular">
                                 <span class="font">최신 상담신청</span>
                            </div>
                            <div class="card-body">
                                <table id="datatable">
                                    <thead>
                                        <tr>
                                            <th>이름</th>
                                            <th>전화번호</th>
                                            <th>인원수</th>
                                            <th>날짜</th>
                                            <th>지점</th>
                                            <th>차량여부</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    		<%
													Vector<ReservationBean> rsvlist = rsMgr.getListReserv();
													if(rsvlist.isEmpty()){
											%>
											<tr>
												<td colspan="6" align="center">
													최근 1달이내 신규 상담이 없습니다.
												</td>
											</tr>
										<%
												}else{							          
											for(int i = 0; i <Math.min(rsvlist.size(),3); i++){
												ReservationBean rsBean = rsvlist.get(i);
												
												if(rsBean.getCarflag()==false){
													carflag = "대중 교통";
												}else{
													carflag = "자차 이용";
												}
										%>		
                                    <tr>
                                        <td><%=rsBean.getName()%></td>
                                        <td><%=rsBean.getPhonenum()%></td>
                                        <td><%=rsBean.getPopulation()%></td>
                                        <td><%=rsBean.getReservdate()%></td>
                                        <td><%=rsBean.getFrnum()%></td>
                                        <td><%=carflag%></td>
                                    </tr>
                                   <% }%>
                                  <% }%>

                                    </tbody>
                                </table>
                            </div>
                        </div>
						<a href="userReserv.jsp" class="morebtn dongle-regular">더보기</a>
                        
                        
                                                 <!-- 4 -->
                        <ol class="breadcrumb mb-5">
                        </ol>
					
                        <div class="card">
                            <div class="card-header bg-info dongle-regular">
                                 <span class="font">결제 내역</span>
                            </div>
                            <div class="card-body">
                                <table id="datatable">
                                    <thead>
                                        <tr>
                                            <th>구매자</th>
                                            <th>상품명</th>
                                            <th>가격</th>
                                            <th>날짜</th>
                                            <th>결제방법</th>
                                            <th>환불여부</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    		<%
													Vector<ChargeInfoBean> chvlist = chMgr.getListCharge();
													if(chvlist.isEmpty()){
											%>
											<tr>
												<td colspan="6" align="center">
													최근 1달이내 신규 결제내역이 없습니다.
												</td>
											</tr>
										<%
												}else{							          
											for(int i = 0; i <Math.min(chvlist.size(),3); i++){
												ChargeInfoBean chBean = chvlist.get(i);
												
												if(chBean.getCcflag()==false){
													payback = "X";
												}else{
													payback = "완료";
												}
										%>		
                                    <tr>
                                        <td><%=chBean.getUser()%></td>
                                        <td><%=chBean.getItem()%></td>
                                        <td><%=chBean.getPrice()%></td>
                                        <td><%=chBean.getDate()%></td>
                                        <td><%=chBean.getChamet()%></td>
                                        <td><%=payback%></td>
                                    </tr>
                                   <% }%>
                                  <% }%>

                                    </tbody>
                                </table>
                            </div>
                        </div>
						<a href="userPay.jsp" class="morebtn dongle-regular">더보기</a>
                        
                        
                        
                                                <!-- 5 -->
                        <ol class="breadcrumb mb-5">
                        </ol>
					
                        <div class="card">
                            <div class="card-header bg-primary dongle-regular">
                                 <span class="font">최신 후기</span>
                            </div>
                            <div class="card-body">
                                <table id="datatable">
                                    <thead>
                                        <tr>
                                            <th>글번호</th>
                                            <th>제목</th>
                                            <th>날짜</th>
                                            <th>작성자</th>
                                            <th>IP</th>
                                            <th>지점번호</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    		<%
													Vector<ReviewBean> rvvlist = rvMgr.getListReview();
													if(rvvlist.isEmpty()){
											%>
											<tr>
												<td colspan="6" align="center">
													최근 1달이내 신규 후기가 없습니다.
												</td>
											</tr>
										<%
												}else{							          
											for(int i = 0; i <Math.min(uvlist.size(),3); i++){
												ReviewBean rvBean = rvvlist.get(i);
										%>		
                                    <tr>
                                        <td><%=rvBean.getNum()%></td>
                                        <td><%=rvBean.getTitle()%></td>
                                        <td><%=rvBean.getDate()%></td>
                                        <td><%=rvBean.getUsernum()%></td>
                                        <td><%=rvBean.getIp()%></td>
                                        <td><%=rvBean.getFrnum()%></td>
                                    </tr>
                                   <% }%>
                                  <% }%>

                                    </tbody>
                                </table>
                            </div>
                        </div>
						<a href="notice.jsp" class="morebtn dongle-regular">더보기</a>
                        
                        
						</main>


                
<%@ include file="adminFooter.jsp" %>
</div>
            
            
            
            
            

            
            
            
            
            
            
            
            
            