<!-- adminHeader.jsp -->

<%@page contentType="text/html; charset=UTF-8" %>
<%
String logoutPath = request.getContextPath() + "/hanSeungEun/login/logoutAdmin.jsp";
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>피트니스 관리자</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <link rel="icon" href="data:;base64,iVBORw0KGgo=">
        		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    </head>
    
            <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark dongle-regular">
        
        
            <!-- 윗줄-->
            <a class="navbar-brand ps-3 dongle-title" href="adminMain.jsp">Fitness Admin</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
            </form>
            
            
            
            <!-- 오른쪽위 사용자 정보-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle dongle-regular" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
<!--                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                                                <li><hr class="dropdown-divider" /></li> --> 
                        <li><a class="dropdown-item" href="<%=logoutPath%>">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    