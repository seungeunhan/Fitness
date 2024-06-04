<!-- sales.jsp -->

<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html; charset=UTF-8" %>
<%@page import = "project.LocationBean" %>
<%@page import="project.UserBean"%>
<%@page import="project.TrainerBean"%>
<%@page import="project.ChargeInfoBean"%>
<%@page import="java.util.Vector"%>
<%@page import="project.UtilMgr"%>
<jsp:useBean id="uMgr" class="project.UserMgr"/>
<jsp:useBean id="lMgr" class="project.LocationMgr"/>
<jsp:useBean id="cMgr" class="project.ChargeMgr"/>

<%
			String item = "";
			String fr = "";
			
			Vector<ChargeInfoBean> cvlist = new Vector<ChargeInfoBean>();
			cvlist = cMgr.getTotalPrice();
			String[] priceArray = new String[cvlist.size()];
			
			
			int totalRecord = 0; // 총 게시물수
			int numPerPage = 15; // 페이지당 레코드 개수 (5,10,20,30)
			int pagePerBlock = 10; //블럭당 페이지 개수
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
			
			totalRecord = cMgr.getTotalCharge(keyField, keyWord);
			
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
			
			
			
			int currentYear = LocalDate.now().getYear();
%>

<%@include file = "adminHeader.jsp"%>
<%@include file = "adminSideBar.jsp"%>


        		
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
    }

    /* 테이블 헤더 스타일 */
    #datatable2 thead th {
        background-color: #d63384; /* 배경색 */
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
				.refresh-btn {
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
				    padding: 5px 10px;
				    margin: 0 3px;
				    border: 1px solid #ccc;
				    text-decoration: none;
				    color: #333;
				    border-radius: 3px;
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






					<!--  몸통 -->
					 
				<div id="layoutSidenav_content">
		<main>
					<h1 class="mt-4  dongle-title">&nbsp;&nbsp;  <%=currentYear%>년 월간 매출 현황 </h1>
					<hr>
	    	<canvas id="myAreaChart" width="100%" height="30"></canvas>
					<script>
					
					var priceArray = [
					    <% for(int i = 0; i < cvlist.size(); i++) { %>
					        <% if (i > 0) { %>,<% } %>
					        <% int price = cvlist.get(i) != null ? cvlist.get(i).getPrice() : 0; %>
					        "<%= price %>"
					    <% } %>
					];

					// 남은 횟수만큼 0으로 채워줍니다.
					<% for(int i = cvlist.size(); i < 12; i++) { %>
					    priceArray.push("0");
					<% } %>
					
			        // JavaScript 코드
			      document.addEventListener('DOMContentLoaded', function() {
			    	  
			    	// 이전 차트 인스턴스가 있다면 제거
			    	  if (window.myLineChart) {
			    	      window.myLineChart.destroy();
			    	  }
			    	  
			        Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
			        Chart.defaults.global.defaultFontColor = '#292b2c';

			        var ctx = document.getElementById("myAreaChart");
			        var myLineChart = new Chart(ctx, {
			            type: 'line',
			            data: {
			                labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
			                datasets: [{
			                    label: "월 매출 (원)",
			                    lineTension: 0.3,
			                    backgroundColor: "rgba(2,117,216,0.2)",
			                    borderColor: "rgba(2,117,216,1)",
			                    pointRadius: 5,
			                    pointBackgroundColor: "rgba(2,117,216,1)",
			                    pointBorderColor: "rgba(255,255,255,0.8)",
			                    pointHoverRadius: 5,
			                    pointHoverBackgroundColor: "rgba(2,117,216,1)",
			                    pointHitRadius: 50,
			                    pointBorderWidth: 2,
			                    data: priceArray,
			                }],
			            },
			            options: {
			                scales: {
			                    xAxes: [{
			                        time: {
			                            unit: 'date'
			                        },
			                        gridLines: {
			                            display: false
			                        },
			                        ticks: {
			                            maxTicksLimit: 70
			                        }
			                    }],
			                    yAxes: [{
			                        ticks: {
			                            min: 0,
			                            max: 10000000,
			                            maxTicksLimit: 15
			                        },
			                        gridLines: {
			                            color: "rgba(0, 0, 0, .125)",
			                        }
			                    }],
			                },
			                legend: {
			                    display: false
			                }
			            }
			        });
			      });
			        
			        
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
			     
			        
	        		
	        		</script>
                      
					<div>
					<form name="searchFrm" class="search-form">
					    <div class="search-input">
					        <select name="keyField" class="search-select">
					            <option value="item">상품번호</option>
					            <option value="frnum">지점</option>
					        </select>
					        <input type="text" size="16" name="keyWord" class="search-text" placeholder="검색어 입력">
					    </div>
					    <button type="button" class="search-button" onClick="check()">검색</button>
					    <a href = "sales.jsp" class = "refresh-btn">새로 고침</a>
					    <input type="hidden" name="nowPage" value="1">
					</form>
					</div>

				            <hr>
				            
                        <div class="card">
       								 <table border="2"  id = "datatable2">
                                
                                    <thead>
                                        <tr>
                                            <th>유저번호 </th>
                                            <th>상품 </th>
                                            <th>가격 </th>
                                            <th>날짜</th>
                                            <th>결제 수단</th>
                                            <th>결제 지점</th>
                                        </tr>
                                    </thead>
       						     <tbody>
       						             <%
													Vector<ChargeInfoBean> uvlist = cMgr.getChargeList(keyField, keyWord, start, cnt);
       						             			int listSize = uvlist.size();
       						             			
													if(uvlist.isEmpty()){
										%>
											<tr>
												<td colspan="6" align="center">
													결제내역이 없습니다.
												</td>
											</tr>
										<%
												}else{							          
											for(int i = 0; i <numPerPage; i++){
												
												if(i == listSize) break;
												
												ChargeInfoBean uBean = uvlist.get(i);
												
										        fr = cMgr.getLocToUseItemNum(uBean.getItem());
												item = cMgr.getItemNameToItemNum(uBean.getItem());

										%>	
            							<tr>
                                            <td data-id=<%=uBean.getNum()%>><%=uBean.getUser()%></td>
                                            <td> <%=item%></td>
                                            <td><%=uBean.getPrice()%></td>
                                            <td><%=uBean.getDate()%></td>
                                            <td><%=uBean.getChamet()%></td>
                                            <td><%=fr%></td>
										</tr>

                          			 <% }%>
                                  <% }%>
                                  
                                  </tbody>
                                    
                                    
                                    						<tr >
							<td colspan = "11">
							<div class="paging-container">
										<!-- 이전 블럭 -->
										<%if(nowBlock>1){ %>
										<a href="javascript:block('<%=nowBlock-1%>')">prev...</a>
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
										<a href="javascript:block('<%=nowBlock+1%>')">...next</a>
										<%} %>
							</div>
							</td>
						</tr>
                                    
                                    
                                </table>
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
					

<%@include file = "adminFooter.jsp"%>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="../project/assets/demo/chart-area-demo.js"></script>
        <script src="../project/assets/demo/chart-bar-demo.js"></script>
        <script src="../project/assets/demo/chart-pie-demo.js"></script>
</div>