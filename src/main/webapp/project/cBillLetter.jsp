<!--  cBillLetter.jsp -->

<%@ page import="java.text.DecimalFormat" %>
<%@page import = "project.LocationBean" %>
<%@page import="project.UserBean"%>
<%@page import="project.TrainerWorkBean"%>
<%@page import="project.PayItemsBean"%>
<%@page import="project.ReservationBean"%>
<%@page import="java.util.Vector"%>
<%@page import="project.UtilMgr"%>
<%@page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="uMgr" class="project.UserMgr"/>
<jsp:useBean id="lMgr" class="project.LocationMgr"/>
<jsp:useBean id="cMgr" class="project.ChargeMgr"/>
<jsp:useBean id="rMgr" class="project.ReservMgr"/>

<%

			String fr = "";
			String price ="";
			String item = "";
			int totalprice = 0;
			String totalprice1 = "";
			String payback = "";
			String ccflag = "";
			int TotalCcflag = 0;
			int TotalPayBack = 0;
			int totalRecord1 = 0;
			int company = 0;
			String company1 = "";
			
			Vector<LocationBean> lvlist = new Vector<LocationBean>();
			lvlist = lMgr.getLocaName();
			String[] idArray = new String[lvlist.size()];
			
			for (int i = 0; i < lvlist.size(); i++) {
			    idArray[i] = lvlist.get(i).getId();
			}
			
			int totalRecord = 0; // 총 게시물수
			int numPerPage = 20; // 페이지당 레코드 개수 (5,10,20,30)
			int pagePerBlock = 5; //블럭당 페이지 개수
			int totalPage = 0; //총 페이지 개수
			int totalBlock = 0; // 총 블럭 개수
			int nowPage = 1; //현재 페이지
			int nowBlock = 1; //현재 블럭
			
			//요청된 numPerPage처리
			
			if(request.getParameter("numPerPage")!=null){
				numPerPage = UtilMgr.parseInt(request, "numPerPage");
			}
			
			//검색에 필요한 변수
				/*name subject content*/
			String keyField = "", keyWord = "";
			if(request.getParameter("keyWord")!=null){
				keyField = request.getParameter("keyField");
				keyWord = request.getParameter("keyWord");
			}	
			
			totalRecord = cMgr.getTotalNoPay(keyField, keyWord);
			
			//최근 한달
			totalRecord1 = cMgr.getTotalNoPay2(keyField, keyWord);
			totalprice = cMgr.getTotalNoPayPrice(keyField, keyWord);
			
	        DecimalFormat formatter = new DecimalFormat("#,###");
	        totalprice1 = formatter.format(totalprice);
			
			
			if(request.getParameter("nowPage")!=null){
					nowPage = UtilMgr.parseInt(request, "nowPage");
				}
			
			//sql에 들어갈 start랑 cnt가 필요
			int start =(nowPage*numPerPage) - numPerPage;
			int cnt = numPerPage;
			
			
			//전체 페이지 개수
			
			totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
			
			// 전체 블럭 개수
			
			totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
			
			//현재 블럭
			
			nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock);

%>

<%@include file="adminHeader.jsp" %>
<%@include file="adminSideBar.jsp" %>

    
    <script>
					//검색   
				    
					function check() {
						if(document.searchFrm.keyWord.value==""){
							alert("검색어를 입력하세요.");
							document.searchFrm.keyWord.focus();
							return;
						}
						document.searchFrm.submit();
					}
				
					
				   //페이징
				
				   function pageing(page) {
					    document.readnumFrm.nowPage.value = page;
					    document.readnumFrm.submit();
					}
				   
					function block(block){
						document.readnumFrm.nowPage.value = <%=pagePerBlock%>*(block-1)+1;
						document.readnumFrm.submit();
					}
					
					
				      document.addEventListener('DOMContentLoaded', function() {
					
								// 엑셀 파일로 내보내기 함수 
								function exportTableToExcel(tableId, filename = 'exported_table.xlsx') { 
									const wb = XLSX.utils.book_new(); // 테이블 데이터 가져오기 
									
									const wsData = [[]]; 
									const table = document.getElementById(tableId); 
									const rows = table.querySelectorAll('tr');
									
									// 각 행을 순회하면서 데이터 추출
									rows.forEach(row => { 
										const rowData = []; 
										row.querySelectorAll('td').forEach(cell => { 
											rowData.push(cell.innerText); 
											}); 
										wsData.push(rowData); 
										});
									
									// 테이블 데이터를 시트로 추가 
										const ws = XLSX.utils.aoa_to_sheet(wsData); 
										XLSX.utils.book_append_sheet(wb, ws, 'Sheet1'); 
										
										// 엑셀 파일 생성 
										const wbout = XLSX.write(wb, { bookType: 'xlsx', type: 'binary' });
										
										// 파일 내보내기 
										saveAs(new Blob([s2ab(wbout)], { type: 'application/octet-stream' }), filename); }
								
										// 이진 데이터로 변환하는 함수 
										function s2ab(s) { 
											const buf = new ArrayBuffer(s.length); 
											const view = new Uint8Array(buf); 
											for (let i = 0; i < s.length; i++) view[i] = s.charCodeAt(i) & 0xFF; 
											return buf; 
											}
										
										// 엑셀 내보내기 버튼 클릭 시 호출되는 함수 
											document.getElementById('excelDownload').addEventListener('click', function() { 
										exportTableToExcel('datatable2', 'billLetter.xlsx'); 
										});								
							      });
				      
				      
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
						        color: white; /* .datatable-title 클래스를 가진 요소의 텍스트 색상을 하얀색으로 변경 */
						        
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
						        background-color: #212529; /* 배경색 */
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
									.down-btn {
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
									.refresh-btn:hover {
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
									
									.down-btn {
									    background-color: #0d6efd; /* 회원 등록 버튼의 배경색 조정 */
									}
    
									.down-btn:hover {
									    background-color: #0a58ca;
									}
    	
    
    
</style>
    

        
        


					<!--  몸통 -->
					 
					 <div id="layoutSidenav_content">
					<main>
								
								
						<h1 class="mt-4  dongle-title">&nbsp;&nbsp;  청구 내역 </h1>
				             <hr>
									<div>
									<form name="searchFrm" class="search-form">
									    <div class="search-input">
									        <select name="keyField" class="search-select">
									            <option value="company">회사번호</option>
									        </select>
									        <input type="text" size="16" name="keyWord" class="search-text" placeholder="검색어 입력">
									    </div>
									    <button type="button" class="search-button" onClick="check()">검색</button>
									    <a href = "cBillLetter.jsp" class = "refresh-btn">새로 고침</a>
										 <button id ="excelDownload" class="down-btn">액셀 파일 다운로드</button>
									    <input type="hidden" name="nowPage" value="1">
									</form>
									</div>	
							<hr>
                        <div class="card">
                            <div class="card-header bg-dark dongle-regular">
                                 <span class="font"></span>
                       <div class="card">
       								 <table border="1"  id = "datatable2">
                                
                                    <thead>
                                        <tr>
                                            <th>외상 회원 번호 </th>
                                            <th>상품 </th>
                                            <th>가격 </th>
                                            <th>지점</th>
                                            <th>회사명</th>
                                        </tr>
                                    </thead>
     <%
													Vector<PayItemsBean> pvlist = cMgr.getNoPayList(keyField, keyWord, start, cnt);
       						             			int listSize = pvlist.size();
													if(pvlist.isEmpty()){
										%>
											<tr>
												<td colspan="5" align="center">
													외상 정보가 없습니다.
												</td>
											</tr>
										<%
												}else{							          
											for(int i = 0; i <numPerPage; i++){
												
												if(i == listSize) break;
												
												PayItemsBean pBean = pvlist.get(i);
												
										        DecimalFormat formatter1 = new DecimalFormat("#,###");
										        price = formatter1.format(pBean.getPayprice());
							        
										        fr = cMgr.getLocToUseItemNum(pBean.getItemnum());
										        item = cMgr.getItemNameByUserNum(pBean.getUsernum());
										        company = cMgr.getCompany(pBean.getUsernum());
												numPerPage = uMgr.getComUserCount(company);
										        company1 = uMgr.getComName(company);
										%>	
										<tr>
                                            <td><%=pBean.getUsernum()%></td>
                                            <td><%=item%></td>
                                            <td><%=price%>원</td>
                                            <td><%=fr%></td>
                                            <td><%=company1%></td>
                    				     </tr>
                          			 <% }%>
                                  <% }%>  
                                 <tr>
									    <td colspan="2" ><hr style="border-color: red;"></td>
									    <td><font color="red"> 최근 한달&nbsp;---&nbsp; 외상 수: <%=totalRecord1%>개&nbsp;//&nbsp;&nbsp;   외상액수: <%=totalprice1%>원 &nbsp;//&nbsp;&nbsp;</font></td>
									    <td colspan="2"><hr style="border-color: red;"></td>
									</tr>             
            
			            </tbody>
                                    <tr >
											<td colspan = "11">
											<div class="paging-container">
														<!-- 이전 블럭 -->
														<%if(nowBlock>1){ %>
														<a href="javascript:block('<%=nowBlock-1%>')">이전&nbsp;&nbsp;</a>
														<%} %>
														
														<!-- 페이징 -->
														<%
																int pageStart = (nowBlock-1)*pagePerBlock+1;
																int pageEnd = (pageStart+pagePerBlock)<totalPage?pageStart+pagePerBlock:totalPage+1;
																for(;pageStart<pageEnd;pageStart++){
																	%>
																	<a href="javascript:pageing('<%=pageStart%>')">
																	<!-- 현재페이지와 동일한 페이지는 font color = blue 세팅 -->
																	<%if(nowPage==pageStart){ %><font color = "blue"><% }%>
																	[<%=pageStart%>]
																	<%if(nowPage==pageStart){ %></font><%} %>
																	</a>
																	
																<%}
														%>
														
														<!-- 다음 블럭 -->
														<%if(totalBlock>nowBlock){ %>
														<a href="javascript:block('<%=nowBlock+1%>')">&nbsp;&nbsp;다음</a>
														<%} %>
														
															    </div>
															</td>
													</tr>
                                </table>
                            </div>
                   </div>
                        </div>
						</main>



<form name="readnumFrm">
	<input type="hidden" name="totalRecord" value="<%=totalRecord%>">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
	<input type="hidden" name="numPerPage" value="<%=numPerPage%>">
	<input type="hidden" name="keyField" value="<%=keyField%>">
	<input type="hidden" name="keyWord" value="<%=keyWord%>">
</form>

<form name="readFrm">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
	<input type="hidden" name="numPerPage" value="<%=numPerPage%>">
	<input type="hidden" name="keyField" value="<%=keyField%>">
	<input type="hidden" name="keyWord" value="<%=keyWord%>">
	<input type="hidden" name="num" >
</form>


<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>
 <%@ include file="adminFooter.jsp" %>
</div>
            
            
            
            
            
            