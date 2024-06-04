<!-- adminSideBar.jsp -->
<%@page contentType="text/html; charset=UTF-8" %>
        <!-- 왼쪽 사이드 바 -->
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark dongle-regular" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">메인</div>
                            <a class="nav-link" href="adminMain.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                관리자 메인
                            </a>
                            
                            <div class="sb-sidenav-menu-heading">사용자 관리</div>
                            
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#User" aria-expanded="false" aria-controls="User">               
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                회원 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            
                            <div class="collapse" id="User" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="userManage.jsp">등록 회원 관리</a>
                                    <a class="nav-link" href="userPay.jsp">회원 결제 내역</a>
                                    <a class="nav-link" href="userReserv.jsp">상담 신청 내역</a>
                                </nav>
                            </div>
                            
                            
                          <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#Trainer" aria-expanded="false" aria-controls="Trainer">               
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                강사 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            
                            <div class="collapse" id="Trainer" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="trainerManage.jsp">강사 등록 관리</a>
                      <!--              <a class="nav-link" href="trainerSchedule.jsp">강사 스케쥴 보기</a> -->
                                    <a class="nav-link" href="trainerWork.jsp">강사 근태 확인</a>
                                </nav>
                            </div>
                            
                       		<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#Company" aria-expanded="false" aria-controls="Company">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                외상 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="Company" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        회사
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="company.jsp">등록 회사</a>
                                            <a class="nav-link" href="companyUser.jsp">외상 고객</a>
                                            <a class="nav-link" href="cBillLetter.jsp"> 외상 청구서  </a>
                                        </nav>
                                    </div>
                                    
                                    
                                    
                                </nav>
                            </div>
                            
                            
                            
                            <div class="sb-sidenav-menu-heading">매출 및 게시판</div>
                            
                          <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#sales" aria-expanded="false" aria-controls="sales">               
                                 <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                매출
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            
                            <div class="collapse" id="sales" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="sales.jsp">통계</a>
                                    <a class="nav-link" href="hitem.jsp">상품 관리</a>
                                </nav>
                            </div>
                            
                            
                            <a class="nav-link" href="notice.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                게시판
                            </a>
                        </div>
                    </div>
                    
                    
                    <!-- 왼쪽 아래 -->
                    <div class="sb-sidenav-footer dongle-regular">
                        <div class="small">made by:</div>
                       ldh
                    </div>
                </nav>
            </div>