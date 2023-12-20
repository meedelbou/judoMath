<%-- 
    Document   : accuiel
    Created on : 31 mai 2023, 09:29:10
    Author     : medel
--%>

<%@page import="Models.skill"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.util.Base64" %>
<%@ page import ="Models.Student" %>
<%@ page import ="Models.Exercise" %>
<%@ page import ="Models.Lesson" %>
<%@ page import="org.apache.jena.query.*" %>
<%@ page import="org.apache.jena.rdf.model.*" %>
<%@ page import ="java.util.List" %>
<%@ page import = "java.util.regex.Matcher" %>
<%@ page import ="java.util.regex.Pattern" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="keywords" content="">
        <meta name="author" content="">
        <meta name="robots" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="W3crm:Customer Relationship Management Admin Bootstrap 5 Template">
        <meta property="og:title" content="W3crm:Customer Relationship Management Admin Bootstrap 5 Template">
        <meta property="og:description" content="W3crm:Customer Relationship Management Admin Bootstrap 5 Template">
        <meta property="og:image" content="https://w3crm.dexignzone.com/xhtml/social-image.png">
        <meta name="format-detection" content="telephone=no">

        <!-- PAGE TITLE HERE -->
        <title>JudoMath</title>

        <!-- FAVICONS ICON -->
        <link rel="shortcut icon" type="image/png" href="images/JM_icon.png">
        <link href="https://fonts.googleapis.com/css2?family=Material+Icons" rel="stylesheet">
        <link href="./vendor/jquery-smartwizard/dist/css/smart_wizard.min.css" rel="stylesheet">
        <link href="./vendor/sweetalert2/dist/sweetalert2.min.css" rel="stylesheet">
        <link href="./vendor/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">
        <link href="./css/style.css" rel="stylesheet">

        <style>
            #animation-container {
                display: none; /* Cache l'animation par défaut */
            }
        </style>

    </head>
    <body>





        <!--*******************
            Preloader start
        ********************-->
        <div id="preloader">
            <div class="lds-ripple">
                <div></div>
                <div></div>
            </div>
        </div>
        <!--*******************
            Preloader end
        ********************-->

        <!--**********************************
            Main wrapper start
        ***********************************-->
        <div id="main-wrapper">

            <!--**********************************
                Nav header start
            ***********************************-->
            <div class="nav-header">
                <a href="choisirComp" class="brand-logo">
                    <img src="images/logo/JM_Full2.png" alt="" style="width : 50%">
                </a>
                <div class="nav-control">
                    <div class="hamburger">
                        <span class="line"></span>
                        <span class="line"></span>
                        <span class="line"></span>
                    </div>
                </div>
            </div>
            <!--**********************************
                Nav header end
            ***********************************-->



            <!--**********************************
        Header start
    ***********************************-->
            <div class="header">
                <div class="header-content">
                    <nav class="navbar navbar-expand">
                        <div class="collapse navbar-collapse justify-content-between">
                            <div class="header-left">
                            </div>
                            <ul class="navbar-nav header-right">
                                	
                                <li class="nav-item align-items-center header-border"><a href="logout" class="btn btn-primary btn-sm">Logout</a></li>	
                                <li class="nav-item ps-3">
                                    <div class="dropdown header-profile2">
                                        <a class="nav-link" href="javascript:void(0);" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            <div class="header-info2 d-flex align-items-center">
                                                <div class="header-media">
                                                    <%
                                                        Student user = (Student) session.getAttribute("user");

                                                        String base64Im = Base64.getEncoder().encodeToString(user.getProfilePicture());

                                                    %>

                                                    <img src="data:image/png;base64,<%=base64Im%>" alt="" id="img_user">
                                                </div>
                                                <div class="header-info">
                                                    <h6>${user.prenom} ${user.nom}</h6>
                                                    <p id="userLog">${user.email}</p>
                                                </div>

                                            </div>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-end" style="">
                                            <div class="card border-0 mb-0">
                                                <div class="card-header py-2">
                                                    <div class="products">
                                                        <img src="data:image/png;base64,<%=base64Im%>" class="avatar avatar-md" alt="">
                                                        <div>
                                                            <h6>${user.prenom} ${user.nom}</h6>
                                                            <span>${user.role}</span>	
                                                        </div>	
                                                    </div>
                                                </div>
                                                <div class="card-body px-0 py-2">
                                                    <a href="javascript:void(0);" class="dropdown-item ai-icon ">
                                                        <svg  width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M11.9848 15.3462C8.11714 15.3462 4.81429 15.931 4.81429 18.2729C4.81429 20.6148 8.09619 21.2205 11.9848 21.2205C15.8524 21.2205 19.1543 20.6348 19.1543 18.2938C19.1543 15.9529 15.8733 15.3462 11.9848 15.3462Z" stroke="var(--primary)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M11.9848 12.0059C14.5229 12.0059 16.58 9.94779 16.58 7.40969C16.58 4.8716 14.5229 2.81445 11.9848 2.81445C9.44667 2.81445 7.38857 4.8716 7.38857 7.40969C7.38 9.93922 9.42381 11.9973 11.9524 12.0059H11.9848Z" stroke="var(--primary)" stroke-width="1.42857" stroke-linecap="round" stroke-linejoin="round"/>
                                                        </svg>

                                                        <span class="ms-2">Profil </span>
                                                    </a>
                                                    <a href="javascript:void(0);" class="dropdown-item ai-icon ">
                                                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path d="M17.9026 8.85114L13.4593 12.4642C12.6198 13.1302 11.4387 13.1302 10.5992 12.4642L6.11844 8.85114" stroke="var(--primary)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M16.9089 21C19.9502 21.0084 22 18.5095 22 15.4384V8.57001C22 5.49883 19.9502 3 16.9089 3H7.09114C4.04979 3 2 5.49883 2 8.57001V15.4384C2 18.5095 4.04979 21.0084 7.09114 21H16.9089Z" stroke="var(--primary)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                                        </svg>

                                                        <span class="ms-2">Messagerie </span>
                                                    </a>
                                                    <a href="javascript:void(0);" class="dropdown-item ai-icon ">
                                                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M12 17.8476C17.6392 17.8476 20.2481 17.1242 20.5 14.2205C20.5 11.3188 18.6812 11.5054 18.6812 7.94511C18.6812 5.16414 16.0452 2 12 2C7.95477 2 5.31885 5.16414 5.31885 7.94511C5.31885 11.5054 3.5 11.3188 3.5 14.2205C3.75295 17.1352 6.36177 17.8476 12 17.8476Z" stroke="var(--primary)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                                        <path d="M14.3888 20.8572C13.0247 22.372 10.8967 22.3899 9.51947 20.8572" stroke="var(--primary)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                                        </svg>

                                                        <span class="ms-2">Notifications </span>
                                                    </a>
                                                </div>
                                                <div class="card-footer px-0 py-2">
                                                    <a href="javascript:void(0);" class="dropdown-item ai-icon ">
                                                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M20.8066 7.62355L20.1842 6.54346C19.6576 5.62954 18.4907 5.31426 17.5755 5.83866V5.83866C17.1399 6.09528 16.6201 6.16809 16.1307 6.04103C15.6413 5.91396 15.2226 5.59746 14.9668 5.16131C14.8023 4.88409 14.7139 4.56833 14.7105 4.24598V4.24598C14.7254 3.72916 14.5304 3.22834 14.17 2.85761C13.8096 2.48688 13.3145 2.2778 12.7975 2.27802H11.5435C11.0369 2.27801 10.5513 2.47985 10.194 2.83888C9.83666 3.19791 9.63714 3.68453 9.63958 4.19106V4.19106C9.62457 5.23686 8.77245 6.07675 7.72654 6.07664C7.40418 6.07329 7.08843 5.98488 6.8112 5.82035V5.82035C5.89603 5.29595 4.72908 5.61123 4.20251 6.52516L3.53432 7.62355C3.00838 8.53633 3.31937 9.70255 4.22997 10.2322V10.2322C4.82187 10.574 5.1865 11.2055 5.1865 11.889C5.1865 12.5725 4.82187 13.204 4.22997 13.5457V13.5457C3.32053 14.0719 3.0092 15.2353 3.53432 16.1453V16.1453L4.16589 17.2345C4.41262 17.6797 4.82657 18.0082 5.31616 18.1474C5.80575 18.2865 6.33061 18.2248 6.77459 17.976V17.976C7.21105 17.7213 7.73116 17.6515 8.21931 17.7821C8.70746 17.9128 9.12321 18.233 9.37413 18.6716C9.53867 18.9488 9.62708 19.2646 9.63043 19.5869V19.5869C9.63043 20.6435 10.4869 21.5 11.5435 21.5H12.7975C13.8505 21.5 14.7055 20.6491 14.7105 19.5961V19.5961C14.7081 19.088 14.9088 18.6 15.2681 18.2407C15.6274 17.8814 16.1154 17.6806 16.6236 17.6831C16.9451 17.6917 17.2596 17.7797 17.5389 17.9393V17.9393C18.4517 18.4653 19.6179 18.1543 20.1476 17.2437V17.2437L20.8066 16.1453C21.0617 15.7074 21.1317 15.1859 21.0012 14.6963C20.8706 14.2067 20.5502 13.7893 20.111 13.5366V13.5366C19.6717 13.2839 19.3514 12.8665 19.2208 12.3769C19.0902 11.8872 19.1602 11.3658 19.4153 10.9279C19.5812 10.6383 19.8213 10.3981 20.111 10.2322V10.2322C21.0161 9.70283 21.3264 8.54343 20.8066 7.63271V7.63271V7.62355Z" stroke="var(--primary)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                                        <circle cx="12.175" cy="11.889" r="2.63616" stroke="var(--primary)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                                        </svg>

                                                        <span class="ms-2">Options </span>
                                                    </a>
                                                    <a href="logout" class="dropdown-item ai-icon">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="var(--primary)" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path><polyline points="16 17 21 12 16 7"></polyline><line x1="21" y1="12" x2="9" y2="12"></line></svg>
                                                        <span class="ms-2">Logout </span>
                                                    </a>
                                                   </div>
                                                    
                                                <div class="card-footer px-0 py-2">                                                 
                                                    <a href="javascript:void(0)" class="dropdown-item ai-icon"id="muteButton">
                                                        <svg width="20" height="20" viewBox="0 0 24 24" fill="lightgrey" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M12 17.8476C17.6392 17.8476 20.2481 17.1242 20.5 14.2205C20.5 11.3188 18.6812 11.5054 18.6812 7.94511C18.6812 5.16414 16.0452 2 12 2C7.95477 2 5.31885 5.16414 5.31885 7.94511C5.31885 11.5054 3.5 11.3188 3.5 14.2205C3.75295 17.1352 6.36177 17.8476 12 17.8476Z" stroke="var(--primary)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                                        <path d="M14.3888 20.8572C13.0247 22.372 10.8967 22.3899 9.51947 20.8572" stroke="var(--primary)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                                        </svg>
                                                        <span id="muteField" class="ms-2"> Arrêter la musique </span>
                                                    </a>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>

            <!--**********************************
                Header end ti-comment-alt
            ***********************************-->

            <!--**********************************
                Sidebar start
            ***********************************-->
            <div class="deznav">
                <div class="deznav-scroll">
                    <ul class="metismenu" id="menu">
                        <li class="menu-title">JudoMath</li>
                        

                        <li class = "mm-active">
                            <a href="ApprentissageAdaptatif"  aria-expanded="false">
                                <div class="menu-icon">
                                    <i class="fa-solid fa-person-chalkboard" ></i>
                                </div>	&nbsp;&nbsp;
                                <span class="nav-text">S'entraîner</span>
                            </a>
                        </li>

                        
                        
                        <li>
                            <a  href="challenges" aria-expanded="false">
                                <div class="menu-icon">
                                    <i class="fa fa-bolt" aria-hidden="true"></i>
                                </div>	&nbsp;&nbsp;
                                <span class="nav-text">Challenges</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            
            <%
                List<QuerySolution> solutions = (List<QuerySolution>) session.getAttribute("solutions");
                List<skill> competences = (List<skill>) session.getAttribute("skillsRecommended");
            %>
            <!--**********************************
                Sidebar end
            ***********************************-->

            <!--**********************************
        Content body start
    ***********************************-->


            <div class="content-body">
                <audio id="myAudio" style="display:none">
                    <source src="">
                    Votre navigateur ne prend pas en charge l'élément audio.
                </audio>    
                <div class="page-titles">
                    <ol class="breadcrumb">
                        <li><h5 class="bc-title">S'entraîner</h5></li>
                        <li class="breadcrumb-item"><a href="choisirComp">
                                <i class="fa-solid fa-person-chalkboard" ></i>
                                Judomath </a>
                        </li>    
                        <li class="breadcrumb-item  active"><a href="choisirComp">S'entraîner</a></li>


                    </ol>

                </div>
                <!-- row -->
                <div class="container-fluid">
                    <div class="row">

                        <div class="col-xl-3 col-xxl-3">

                            <div  style="padding:1.5% 6% 6% 0%  ;text-align: left; ">   <!--that could be a card class-->


                                    <div class="products">
                                        <%
                                            String base64Image = Base64.getEncoder().encodeToString(user.getProfilePicture());
                                            if (!base64Image.equals("")) {%>
                                        <img src="data:image/jpeg;base64,<%=base64Image%>" style="display:inline ; height:15%; width: 15%;  " class="avatar avatar-md"  alt="" >
                                        <% } else {%>
                                        <img src="images/contacts/pic1.jpg" class="avatar avatar-md" alt="" style="display:inline; height:15%; width: 15%;">


                                        <% }%>
                                        <div>
                                            <h3 style="position: relative; top:8px"><strong>Bonjour ${user.prenom} ! </strong></h3>
                                            <span style="font-size:12px" class="has-arrow">En route pour un nouveau défi :)</span>	
                                        </div>	
                                    </div>
                                </div>

                        </div>
                        <div class="col-xl-3 col-xxl-3">

                        </div>

                        <div class="col-xl-6 col-xxl-6" align="right" >
                            <div class="badge badge-rounded badge-outline-light" style="padding:1.5% ; background-color: white">
                                <svg style="display:inline;" height="38px" version="1.1" viewBox="0 0 34 34" width="38px" xmlns="https://www.w3.org/2000/svg">
                                <g fill="none" fill-rule="evenodd" id="Streaks-in-Campus" stroke="none" stroke-width="1">
                                <g id="Coding-Exercise-Copy-28" transform="translate(-1215.000000, -7.000000)">
                                <g id="Group" transform="translate(1216.000000, 8.000000)">
                                <circle cx="16" cy="16" id="Oval" r="16" stroke="#05192D"></circle>
                                <circle cx="16" cy="16" fill="#05192D" id="Oval" r="14"></circle>
                                <path d="M21.9567937,13.9639884 C21.8813316,13.8253429 21.719553,13.7368017 21.5417485,13.7368349 L17.2419313,13.7368349 L19.6572019,9.57144161 C19.7281565,9.44950485 19.7209697,9.30466029 19.6381955,9.18838027 C19.5554212,9.07210024 19.4087939,9.00086921 19.2504195,9 L15.5836574,9 C15.4063743,9 15.2449804,9.08801912 15.1692478,9.2260588 L11.0442199,16.7248614 C10.9768487,16.8471743 10.9869791,16.9906891 11.0710583,17.1050737 C11.1551376,17.2194583 11.3014301,17.2887472 11.4586295,17.28864 L15.2220024,17.28864 L11.95376,23.4535316 C11.8664604,23.6339406 11.9456496,23.8422018 12.1399522,23.9432013 C12.3342547,24.0442009 12.585133,24.0075107 12.7298246,23.8569343 L21.8938695,14.3838119 C22.0075933,14.2662147 22.0321164,14.1025991 21.9567937,13.9639884 Z" fill="#FCCE0D" fill-rule="nonzero" id="Shape"></path>
                                </g></g></g>
                                </svg>
                                <h3 style="display:inline; position: relative; top:3px" >Total XP </h3>

                                <h3  style="display:inline" class="badge badge-sm badge-secondary"><%= user.getExperiencePoints()%> XP</h3>
                            </div>

                            <div class="badge badge-rounded badge-outline-light" style="padding:1.5% ; background-color: white">
                                <h3 style="display:inline; position: relative; top:3px" >Ceinture  </h3>                         
                                
                                <img
                                  id = "img_ceinture"
                                  src=""
                                  height="38px"
                                />
                                
                            </div>
                        </div>
                    </div>
                    <br>
                    <%
                        skill nextSkill = (skill) session.getAttribute("nextSkill");

                        if (nextSkill != null) {
                    %>

                    <div class="row">
                        <div class="col-xl-12 col-xxl-12">


                            <div class="card" style="padding:2% 2% 2% 2%">

                                <table>
                                    <tbody>
                                        <tr>
                                            <td ><h1>
                                                    <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="120" height="120" viewBox="0,0,256,256">
                                                    <g transform="translate(66.56,66.56) scale(0.48,0.48)"><g fill="#2dd85a" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M128,314.66667c-103.09315,0 -186.66667,-83.57351 -186.66667,-186.66667v0c0,-103.09315 83.57351,-186.66667 186.66667,-186.66667v0c103.09315,0 186.66667,83.57351 186.66667,186.66667v0c0,103.09315 -83.57351,186.66667 -186.66667,186.66667z" id="shape"></path></g><g fill="#000000" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><g transform="scale(8.53333,8.53333)"><path d="M6.5293,2.51563c-0.26993,-0.00363 -0.52986,0.10204 -0.7207,0.29297c-0.39042,0.39051 -0.39042,1.02356 0,1.41406c0.39051,0.39042 1.02356,0.39042 1.41406,0c0.39042,-0.39051 0.39042,-1.02356 0,-1.41406c-0.18414,-0.18423 -0.4329,-0.28934 -0.69336,-0.29297zM23.5,2.51563c-0.2706,-0.00416 -0.53134,0.10155 -0.72266,0.29297c-0.39042,0.39051 -0.39042,1.02356 0,1.41406c0.39051,0.39042 1.02356,0.39042 1.41406,0c0.39042,-0.39051 0.39042,-1.02356 0,-1.41406c-0.18366,-0.18377 -0.43163,-0.28884 -0.69141,-0.29297zM15,3c-4.971,0 -9,4.029 -9,9c0,5 4,7 6,11h6c2,-4 6,-6 6,-11c0,-4.971 -4.029,-9 -9,-9zM15,6v5h4l-4,7v-5h-4zM3,11c-0.55228,0 -1,0.44772 -1,1c0,0.55228 0.44772,1 1,1c0.55228,0 1,-0.44772 1,-1c0,-0.55228 -0.44772,-1 -1,-1zM27,11c-0.55228,0 -1,0.44772 -1,1c0,0.55228 0.44772,1 1,1c0.55228,0 1,-0.44772 1,-1c0,-0.55228 -0.44772,-1 -1,-1zM6.5293,19.48438c-0.27061,-0.00416 -0.53134,0.10155 -0.72266,0.29297c-0.39042,0.39051 -0.39042,1.02356 0,1.41406c0.18761,0.18809 0.44235,0.2938 0.70801,0.2938c0.26566,0 0.5204,-0.10571 0.70801,-0.2938c0.39042,-0.39051 0.39042,-1.02356 0,-1.41406c-0.18414,-0.18423 -0.4329,-0.28934 -0.69336,-0.29297zM23.49805,19.48633c-0.26965,-0.00414 -0.52954,0.1008 -0.7207,0.29102c-0.18809,0.18761 -0.2938,0.44235 -0.2938,0.70801c0,0.26566 0.10571,0.5204 0.2938,0.70801c0.39051,0.39042 1.02356,0.39042 1.41406,0c0.18809,-0.18761 0.2938,-0.44235 0.2938,-0.70801c0,-0.26566 -0.10571,-0.5204 -0.2938,-0.70801c-0.18446,-0.18352 -0.43318,-0.28791 -0.69336,-0.29102zM12,25v1c0,1.105 0.895,2 2,2c0,0.55228 0.44772,1 1,1c0.55228,0 1,-0.44772 1,-1c1.105,0 2,-0.895 2,-2v-1z"></path></g></g></g>
                                                    </svg>
                                                </h1>
                                            </td>
                                            <td>


                                                <h5>En cours d'apprentissage</h5>      
                                                <h2 >
                                                    ${nextSkill.name}
                                                    <div id="palier" style="display:inline-block"></div>
                                                </h2>
                                                <div style="width: 80%"> ${nextSkill.progress}%
                                                    <div class="progress" width="80%" >
                                                        <div class="progress-bar  " style=" height:5px; border-radius:4px; width: ${nextSkill.progress}%" role="progressbar"></div>
                                                    </div></div>
                                            </td>
                                            <td>
                                                <div class=" bg-transparent border-0 ">
                                                    <a href="ApprentissageAdaptatif" class="btn  btn-lg btn-success">Continuer à s'entraîner</a>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>
                        </div>

                    </div>
                    <%}%>

                    <div class='row'>
                        <div class='col-xl-12 col-xxl-12' style="padding:1%">

                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-bs-toggle="tab" href="#home8">
                                        <h4><svg class='me-2' xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="30" height="30" viewBox="0 0 68 68">
                                            <path d="M 47.402344 2.1347656 C 39.552246 2.1347656 33.171875 8.5151357 33.171875 16.355469 C 33.171875 20.035645 34.561768 23.515625 37.091797 26.166016 C 38.081787 27.206055 38.762329 28.435059 39.072266 29.724609 C 37.729858 31.089584 37.755775 33.272255 39.132812 34.585938 C 38.482788 35.21582 38.082031 36.084961 38.082031 37.044922 C 38.082031 38.935059 39.612183 40.464844 41.492188 40.464844 L 42.693359 40.464844 C 43.053223 42.234863 44.622192 43.576172 46.492188 43.576172 L 48.292969 43.576172 C 50.163086 43.576172 51.731812 42.234863 52.091797 40.464844 L 53.302734 40.464844 C 55.182861 40.464844 56.712891 38.935059 56.712891 37.044922 C 56.712891 36.084961 56.312012 35.21582 55.662109 34.585938 C 56.312012 33.96582 56.712891 33.094727 56.712891 32.134766 C 56.712891 31.194824 56.332642 30.344727 55.722656 29.724609 C 56.022705 28.435059 56.703369 27.206055 57.693359 26.166016 C 60.223266 23.515625 61.613281 20.035645 61.613281 16.355469 C 61.613281 8.5151357 55.24231 2.1347656 47.402344 2.1347656 z M 47.402344 4.1347656 C 54.132324 4.1347656 59.613281 9.6152334 59.613281 16.355469 C 59.613281 19.515137 58.422241 22.504883 56.242188 24.785156 C 55.122192 25.964844 54.32251 27.335449 53.892578 28.775391 C 53.702637 28.735352 53.502808 28.714844 53.302734 28.714844 L 41.492188 28.714844 C 41.292114 28.714844 41.092529 28.735352 40.892578 28.775391 C 40.462647 27.335449 39.663086 25.964844 38.542969 24.785156 C 36.373047 22.504883 35.171875 19.515137 35.171875 16.355469 C 35.171875 9.6152335 40.652344 4.1347656 47.402344 4.1347656 z M 46.841797 7.2363281 C 46.481811 7.2363281 46.203125 7.5249024 46.203125 7.875 L 46.203125 8.9746094 C 45.312988 9.1547852 44.481934 9.5058594 43.751953 9.9960938 L 42.982422 9.2148438 C 42.732422 8.9648438 42.3125 8.9648438 42.0625 9.2148438 L 41.0625 10.214844 C 40.8125 10.464844 40.8125 10.875 41.0625 11.125 L 41.841797 11.90625 C 41.351807 12.63623 41.002075 13.465332 40.832031 14.355469 L 39.732422 14.355469 C 39.372436 14.355469 39.082031 14.635742 39.082031 14.996094 L 39.082031 16.40625 C 39.082031 16.766113 39.372437 17.054688 39.732422 17.054688 L 40.832031 17.054688 C 41.002075 17.944824 41.351807 18.765625 41.841797 19.496094 L 41.0625 20.275391 C 40.8125 20.525391 40.8125 20.935547 41.0625 21.185547 L 42.0625 22.185547 C 42.3125 22.435547 42.732422 22.435547 42.982422 22.185547 L 43.751953 21.40625 C 44.481934 21.896484 45.312988 22.246094 46.203125 22.425781 L 46.203125 23.525391 C 46.203125 23.875488 46.481811 24.166016 46.841797 24.166016 L 48.261719 24.166016 C 48.611694 24.166016 48.902344 23.875488 48.902344 23.525391 L 48.902344 22.425781 C 49.792236 22.246094 50.611816 21.896484 51.341797 21.40625 L 52.132812 22.185547 C 52.382812 22.435547 52.783081 22.435547 53.042969 22.185547 L 54.033203 21.185547 C 54.283203 20.935547 54.283203 20.525391 54.033203 20.275391 L 53.251953 19.496094 C 53.741943 18.765625 54.093384 17.944824 54.273438 17.054688 L 55.373047 17.054688 C 55.723022 17.054688 56.011719 16.766113 56.011719 16.40625 L 56.011719 14.996094 C 56.011719 14.635742 55.723022 14.355469 55.373047 14.355469 L 54.273438 14.355469 C 54.093384 13.465332 53.741943 12.63623 53.251953 11.90625 L 54.033203 11.125 C 54.283203 10.875 54.283203 10.464844 54.033203 10.214844 L 53.042969 9.2148438 C 52.783081 8.9648438 52.382812 8.9648438 52.132812 9.2148438 L 51.341797 9.9960938 C 50.611816 9.5058593 49.792236 9.1547852 48.902344 8.9746094 L 48.902344 7.875 C 48.902344 7.5249023 48.611694 7.2363281 48.261719 7.2363281 L 46.841797 7.2363281 z M 47.552734 12.335938 C 49.412842 12.335938 50.921875 13.844727 50.921875 15.705078 C 50.921875 17.554688 49.412842 19.066406 47.552734 19.066406 C 45.692871 19.066406 44.181641 17.554688 44.181641 15.705078 C 44.181641 13.844727 45.692871 12.335938 47.552734 12.335938 z M 4.8027344 39.785156 C 3.5427246 39.785156 2.5117188 40.806152 2.5117188 42.066406 L 2.5117188 63.335938 C 2.5117188 64.595699 3.5427246 65.625 4.8027344 65.625 L 14.623047 65.625 C 15.743042 65.625 16.673096 64.80566 16.873047 63.746094 L 23.472656 65.076172 C 32.553238 66.921089 42.033512 65.502407 50.212891 61.125 L 63.351562 54.095703 C 65.173485 53.117195 65.885071 50.979588 65.273438 49.265625 C 64.593384 47.186035 62.332397 46.025879 60.232422 46.675781 L 44.332031 51.634766 L 44.261719 50.996094 C 43.821655 46.956055 40.172852 44.036621 36.132812 44.486328 L 29.591797 45.304688 L 28.251953 44.335938 C 25.321899 42.195801 21.713379 41.245117 18.113281 41.634766 L 16.892578 41.746094 C 16.732544 40.645996 15.773071 39.785156 14.623047 39.785156 L 4.8027344 39.785156 z M 19.486328 43.578125 C 22.1978 43.525887 24.848831 44.356201 27.0625 45.974609 L 28.722656 47.185547 C 28.932739 47.335449 29.203125 47.404785 29.453125 47.375 L 36.363281 46.496094 C 39.283325 46.175781 41.921997 48.294922 42.251953 51.224609 L 42.332031 51.964844 C 42.352051 52.114746 42.283325 52.224609 42.193359 52.285156 L 34.892578 54.005859 C 34.342529 54.135742 34.012817 54.685059 34.132812 55.224609 C 34.242798 55.685059 34.66333 56.015625 35.113281 56.015625 C 35.193359 56.015625 35.271606 56.006348 35.351562 55.986328 L 42.742188 54.236328 C 67.546776 46.522079 58.991573 49.182709 60.841797 48.605469 C 61.871826 48.285645 63.001587 48.856445 63.351562 49.90625 C 63.651611 50.836426 63.252563 51.844727 62.392578 52.304688 L 49.251953 59.345703 C 41.511963 63.496094 32.493042 64.82568 23.873047 63.095703 L 16.912109 61.685547 L 16.912109 43.785156 L 18.322266 43.65625 C 18.711029 43.612488 19.098975 43.585588 19.486328 43.578125 z M 10.412109 58.005859 C 11.557493 58.005859 12.572266 58.943096 12.572266 60.175781 C 12.572266 61.387768 11.571153 62.326172 10.412109 62.326172 C 9.1899252 62.326172 8.2519531 61.349049 8.2519531 60.175781 C 8.2519531 58.968273 9.2419691 58.005859 10.412109 58.005859 z"></path>
                                            </svg> Recommendé</h4>
                                    </a>
                                </li>
                                <%
                                    if (nextSkill != null) {
                                %>
                                <li class="nav-item">
                                    <a class="nav-link" data-bs-toggle="tab" href="#profile8">
                                        <h4><svg class='me-2' xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="30" height="30" viewBox="0 0 50 50">
                                            <path d="M 25 2 C 24.115223 2 23.258045 2.0586739 22.425781 2.1523438 L 22.873047 6.1269531 C 23.586783 6.0466231 24.292777 6 25 6 C 35.517124 6 44 14.482876 44 25 C 44 35.517124 35.517124 44 25 44 C 24.296653 44 23.594813 43.95359 22.884766 43.875 L 22.443359 47.851562 C 23.269312 47.942977 24.121347 48 25 48 C 37.678876 48 48 37.678876 48 25 C 48 12.321124 37.678876 2 25 2 z M 17.40625 3.3066406 C 15.768141 3.8804166 14.215682 4.6325511 12.769531 5.5429688 L 14.900391 8.9277344 C 16.09424 8.176152 17.374624 7.5562554 18.728516 7.0820312 L 17.40625 3.3066406 z M 8.734375 8.7382812 C 7.5072051 9.9654513 6.4488687 11.330532 5.5390625 12.775391 L 8.9238281 14.90625 C 9.6940219 13.683109 10.57167 12.557236 11.5625 11.566406 L 8.734375 8.7382812 z M 33.335938 13.890625 L 22.611328 29.978516 L 15.328125 23.505859 L 12.671875 26.494141 L 23.388672 36.021484 L 36.664062 16.109375 L 33.335938 13.890625 z M 3.3046875 17.414062 C 2.7471858 19.005992 2.3453333 20.684367 2.1503906 22.435547 L 6.125 22.876953 C 6.2840574 21.448133 6.6135798 20.068399 7.0800781 18.736328 L 3.3046875 17.414062 z M 6.1289062 27.134766 L 2.1542969 27.580078 C 2.350351 29.331348 2.7534077 31.008716 3.3105469 32.599609 L 7.0859375 31.277344 C 6.6190767 29.944237 6.2888521 28.563496 6.1289062 27.134766 z M 8.9316406 35.103516 L 5.5488281 37.238281 C 6.460153 38.683831 7.5187755 40.045272 8.7460938 41.271484 L 11.572266 38.441406 C 10.579584 37.449619 9.7023158 36.325966 8.9316406 35.103516 z M 14.912109 41.078125 L 12.783203 44.464844 C 14.229438 45.374219 15.782533 46.124536 17.421875 46.697266 L 18.742188 42.921875 C 17.387528 42.448604 16.105874 41.82875 14.912109 41.078125 z"></path>
                                            </svg> En Cours </h4>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-bs-toggle="tab" href="#messages8">
                                        <h4><svg class='me-2' xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="30" height="30" viewBox="0 0 24 24">
                                            <path d="M12,0C5.383,0,0,5.383,0,12s5.383,12,12,12s12-5.383,12-12S18.617,0,12,0z M18.082,9.457l-6.5,6.5	c-0.195,0.195-0.451,0.293-0.707,0.293s-0.512-0.098-0.707-0.293l-3.25-3.25c-0.391-0.391-0.391-1.023,0-1.414s1.023-0.391,1.414,0	l2.543,2.543l5.793-5.793c0.391-0.391,1.023-0.391,1.414,0S18.473,9.066,18.082,9.457z"></path>
                                            </svg>  Terminé</h4>
                                    </a>
                                </li>

                                <%
                                    }
                                %>
                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-content tabcontent-border">
                                <div class="tab-pane fade show active" id="home8" role="tabpanel">
                                    <div class="pt-4">


                                        <h4>Compétences recommendées</h4>
                                        <div class="col-lg-12">


                                            <div class="card-body pb-1">
                                                <div id="lightgallery" class="row">
                                                    <%
                                                        int k = 0;

                                                        for (skill comp : competences) {
//                                                            RDFNode Class2 = solution.get("?recommendedSkill");
//                                                            RDFNode name = solution.get("?name");

//                                                            if( !user.getSkillsInProgress().contains(comp)) {

                                                    %>

                                                    <div class="col-lg-3 col-md-6 mb-4">
                                                        <div class="card">
                                                            <div class="card-body text-center   text-primary" style="min-height:60%;position:relative">
                                                                <div style="min-height:65%;margin-bottom: 20%;"> 
                                                                    <h3 class="my-2"> <%= comp.getName()%></h3>
                                                                </div>
                                                                <div style=" position: absolute; bottom: 10%;width: 90%;height:10%;" >
                                                                    <div >  <%= comp.getProgress()%>%
                                                                        <div class="progress" >
                                                                            <div class="progress-bar bg-green" style=" height:6px; border-radius:4px; width: <%= comp.getProgress()%>%" role="progressbar"></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="card-footer" style="text-align:center" style="max-height:40%">
                                                                <a id="continueLearningLink<%=k%>" class="btn my-2 btn-success btn-lg px-4" href="#">Commencer</a>
                                                            </div>
                                                        </div>
                                                    </div>
              
                                                    
                                                    <%
//                                                        }
                                                            k++;
                                                        }
                                                        if (competences.isEmpty()) {
                                                    %>

                                                    <p>
                                                        <i class="fa fa-info-circle" aria-hidden="true"></i> Aucune compétence supplémentaire recommandée (pour le moment !)
                                                    </p>

                                                    <%}%>



                                                </div>
                                            </div>

                                            <!-- /# card -->
                                        </div>

                                    </div>
                                </div>
                                <div class="tab-pane fade" id="profile8" role="tabpanel">
                                    <div class="pt-4">
                                        <h4>Compétences en cours</h4>
                                        <div class="col-lg-12">


                                            <div class="card-body pb-1">
                                                <div id="lightgallery" class="row">
                                                    <%
                                                        int numberOfDisplayedSkills = 0;
                                                        k = 0;
                                                        for (skill skill : user.getSkillsInProgress()) {

                                                            if (!(skill.getProgress() > 0 && skill.getProgress() < 100)) {
                                                                continue;
                                                            } else {

                                                    %>
                                                    <div class="col-lg-3 col-md-6 mb-4">
                                                        <div class="card">
                                                            <div class="card-body text-center   text-primary" style="min-height:60%;position:relative">
                                                                <div style="min-height:65%;margin-bottom: 20%;"> 
                                                                    <h3 class="my-2"> <%= skill.getName()%></h3>
                                                                </div>
                                                                <div style=" position: absolute; bottom: 10%;width: 90%;height:10%;" >
                                                                    <div >  <%= skill.getProgress()%>%
                                                                        <div class="progress" >
                                                                            <div class="progress-bar bg-green" style=" height:6px; border-radius:4px; width: <%= skill.getProgress()%>%" role="progressbar"></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="card-footer" style="text-align:center" style="max-height:40%">
                                                                <a id="continueLearningLink2<%=k%>" class="btn my-2 btn-success btn-lg px-4" href="#">Continuer à s'entraîner</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <%
                                                                numberOfDisplayedSkills++;
                                                            }
                                                            k++;
                                                        }

                                                        if (numberOfDisplayedSkills == 0) {
                                                    %>

                                                    <p>
                                                        <i class="fa fa-info-circle" aria-hidden="true"></i> Aucune compétence en cours d'apprentissage
                                                    </p>

                                                    <% }%>


                                                </div>
                                            </div>

                                            <!-- /# card -->
                                        </div>

                                    </div>
                                </div>
                                <div class="tab-pane fade" id="messages8" role="tabpanel">
                                    <div class="pt-4">
                                        <h4>Compétences validées</h4>
                                        <div class="col-lg-12">


                                            <div class="card-body pb-1">
                                                <div id="lightgallery" class="row">
                                                    <%
                                                        numberOfDisplayedSkills = 0;
                                                        k = 0;
                                                        for (skill skill2 : user.getSkillsInProgress()) {

                                                            if (skill2.getProgress().equals(100)) {

                                                    %>
                                                    <div class="col-lg-3 col-md-6 mb-4">
                                                        <div class="card">
                                                            <div class="card-body text-center   text-primary" style="min-height:60%;position:relative">
                                                                <div class="validated-skill" style="min-height:65%;margin-bottom: 20%;"> 
                                                                    <h3 class="my-2"> <%= skill2.getName()%></h3>

                                                                </div>
                                                                <div style=" position: absolute; bottom: 10%;width: 90%;height:10%" >
                                                                    <div >  <%= skill2.getProgress()%>%
                                                                        <div class="progress" >
                                                                            <div class="progress-bar bg-green" style=" height:6px; border-radius:4px; width: <%= skill2.getProgress()%>%" role="progressbar"></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <%
                                                                numberOfDisplayedSkills++;
                                                            }
                                                            k++;
                                                        }
                                                        if (numberOfDisplayedSkills == 0) {
                                                    %>
                                                    <p>
                                                        <i class="fa fa-info-circle" aria-hidden="true"></i> Tu n'as pas encore validé de compétences ! 
                                                    </p>

                                                    <% }%>


                                                </div>
                                            </div>


                                        </div>

                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>





                </div>











            </div>

        </div>
        <!--**********************************
            Content body end
        ***********************************-->


        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer out-footer">
            <div class="copyright">
                <p>© ELLIADD, Mohamed & Clément. All rights reserved.</p>
            </div>
        </div>
        <!--**********************************
            Footer end
        ***********************************-->

        <!-- Button trigger modal -->
        <button type="button" id="choice" class="btn btn-primary mb-2" data-bs-toggle="modal" style="display: none" data-bs-target="#exampleModalpopover">Modal with tooltip</button>
        <!-- Modal -->
        <div class="modal fade" id="exampleModalpopover">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Choisir une compétence </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal">
                        </button>
                    </div>
                    <div class="modal-body">
                        <%  int i = 0;
                            for (QuerySolution solution : solutions) {
                                RDFNode Class2 = solution.get("?recommendedSkill");
                                RDFNode name = solution.get("?name");
                        %>
                        <h5><a id="continueLearningLink<%=i%>" href="#"><%= name.toString()%></a></h5>                                    <div class="country-list">

                            <div class="progress-box mt-0">
                                <div class="d-flex justify-content-between">
                                    <p class="mb-0 c-name"></p>
                                    <p class="mb-0">50%</p>
                                </div>
                                <div class="progress">
                                    <div class="progress-bar bg-primary" style="width:60%; height:5px; border-radius:4px;" role="progressbar"></div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <%
                                i++;
                            }
                        %>     

                    </div>
                    <div class="modal-footer">
                        <div class="card-footer bg-transparent border-0 "><a href="ApprentissageAdaptatif" class="btn btn-outline-success light btn-card">Continuer de s'entraîner</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!--**********************************
        Support ticket button start
        ***********************************-->

        <!--**********************************
           Support ticket button end
        ***********************************-->




        <!--**********************************
            Main wrapper end
        ***********************************-->

        <!--**********************************
            Scripts
        ***********************************-->

        <script src="./js/photo_user.js"></script>


        <!-- Required vendors -->
        <script src="./vendor/global/global.min.js"></script>

        <script src="./vendor/jquery-steps/build/jquery.steps.min.js"></script>
        <script src="./vendor/jquery-validation/jquery.validate.min.js"></script>

        <script src="./vendor/sweetalert2/dist/sweetalert2.min.js"></script>

        <!-- Form validate init -->
        <script src="./js/plugins-init/jquery.validate-init.js"></script>

        <script src="./vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>

        <script src="./vendor/jquery-smartwizard/dist/js/jquery.smartWizard.js"></script>
        <script src="./vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>

        <script src="./vendor/chart.js/Chart.bundle.min.js"></script>
        <!-- Apex Chart -->
        <script src="./vendor/apexchart/apexchart.js"></script>

        <script src="./vendor/flot/jquery.flot.js"></script>
        <script src="./vendor/flot/jquery.flot.pie.js"></script>
        <script src="./vendor/flot/jquery.flot.resize.js"></script>
        <script src="./vendor/flot-spline/jquery.flot.spline.min.js"></script>
        <script>
            var names = [];
            var timeSpent = [];
            <% for (skill skil : user.getSkillsInProgress()) {%>
            names.push("<%= skil.getName()%>");
            // Convert the timeSpent value from milliseconds to minutes
            var timeSpentInMinutes = <%= skil.getTimeSpent()%>;
            timeSpent.push(timeSpentInMinutes);
            <% } %>

            // Display the final list in the console
            console.log(names);
            console.log(timeSpent);
        </script>

        <script src="./js/custom.js"></script>
        <script src="./js/deznav-init.js"></script>

        <script>
            (function ($) {
                "use strict"


                /* function draw() {
                 
                 } */

                var dlabSparkLine = function () {
                    let draw = Chart.controllers.line.__super__.draw; //draw shadow

                    var screenWidth = $(window).width();
                    var barChart1 = function () {
                        if (jQuery('#barChart_1').length > 0) {
                            const barChart_1 = document.getElementById("barChart_1").getContext('2d');
                            barChart_1.height = 100;
                            new Chart(barChart_1, {
                                type: 'bar',
                                data: {
                                    defaultFontFamily: 'Poppins',
                                    labels: names,
                                    datasets: [
                                        {
                                            label: "Temps passé par secondes ",
                                            data: timeSpent,
                                            borderColor: '#fff',
                                            borderWidth: "0",
                                            colors: '#fff',
                                            backgroundColor: 'rgba(44, 44, 44, 1)'
                                        }
                                    ]
                                },
                                options: {
                                    legend: false,
                                    scales: {
                                        yAxes: [{
                                                //show: false,
                                                //labelFontColor: '#fff',
                                                ticks: {
                                                    beginAtZero: true,
                                                    //color: '#fff'

                                                    fontColor: '#fff',
                                                },
                                                gridLines: {
                                                    color: "rgba(255, 255, 255, 0.1)"
                                                }


                                            }],
                                        xAxes: [{
                                                // Change here
                                                barPercentage: 0.5,
                                                ticks: {
                                                    fontColor: '#ffffff',
                                                },
                                                gridLines: {
                                                    color: "rgba(255, 255, 255, 0.1)"
                                                }
                                            }]
                                    },
                                    tooltips: {
                                        callbacks: {
                                            label: function (tooltipItem, data) {
                                                // Get the time spent value from the tooltipItem
                                                var timeSpentInSeconds = tooltipItem.yLabel;
                                                // Convert timeSpent to the "h m s" format


                                                var totalSeconds = Math.floor(timeSpentInSeconds / 1000);
                                                var hours = Math.floor(totalSeconds / 3600);
                                                var minutes = Math.floor((totalSeconds % 3600) / 60);
                                                var seconds = totalSeconds % 60;
                                                return "Temps passé : " + hours + "h " + minutes + "m " + seconds + "s";
                                            }
                                        }
                                    }
                                }
                            });
                        }
                    }
                    var barChart2 = function () {
                        if (jQuery('#barChart_2').length > 0) {

                            //gradient bar chart
                            const barChart_2 = document.getElementById("barChart_2").getContext('2d');
                            //generate gradient
                            const barChart_2gradientStroke = barChart_2.createLinearGradient(0, 0, 0, 250);
                            barChart_2gradientStroke.addColorStop(0, "rgba(44, 44, 44, 1)");
                            barChart_2gradientStroke.addColorStop(1, "rgba(44, 44, 44, 0.5)");
                            barChart_2.height = 100;
                            new Chart(barChart_2, {
                                type: 'bar',
                                data: {
                                    defaultFontFamily: 'Poppins',
                                    labels: names,
                                    datasets: [
                                        {
                                            label: "My First dataset",
                                            data: timeSpent,
                                            borderColor: barChart_2gradientStroke,
                                            borderWidth: "0",
                                            backgroundColor: barChart_2gradientStroke,
                                            hoverBackgroundColor: barChart_2gradientStroke
                                        }
                                    ]
                                },
                                options: {
                                    legend: false,
                                    scales: {
                                        yAxes: [{
                                                ticks: {
                                                    beginAtZero: true,
                                                    fontColor: '#ffffff',
                                                },
                                                gridLines: {
                                                    color: "rgba(255, 255, 255, 0.1)"
                                                }
                                            }],
                                        xAxes: [{
                                                // Change here
                                                barPercentage: 0.5,
                                                ticks: {
                                                    fontColor: '#ffffff',
                                                },
                                                gridLines: {
                                                    color: "rgba(255, 255, 255, 0.1)"
                                                }
                                            }]
                                    },
                                    tooltips: {
                                        callbacks: {
                                            label: function (tooltipItem, data) {
                                                // Get the time spent value from the tooltipItem
                                                var timeSpentInSeconds = tooltipItem.yLabel;
                                                // Convert timeSpent to the "h m s" format


                                                var totalSeconds = Math.floor(timeSpentInSeconds / 1000);
                                                var hours = Math.floor(totalSeconds / 3600);
                                                var minutes = Math.floor((totalSeconds % 3600) / 60);
                                                var seconds = totalSeconds % 60;
                                                return "Temps passé : " + hours + "h " + minutes + "m " + seconds + "s";
                                            }
                                        }
                                    }
                                }
                            });
                        }
                    }

                    var barChart3 = function () {
                        //stalked bar chart
                        if (jQuery('#barChart_3').length > 0) {
                            const barChart_3 = document.getElementById("barChart_3").getContext('2d');
                            //generate gradient
                            const barChart_3gradientStroke = barChart_3.createLinearGradient(50, 100, 50, 50);
                            barChart_3gradientStroke.addColorStop(0, "rgba(44, 44, 44, 1)");
                            barChart_3gradientStroke.addColorStop(1, "rgba(44, 44, 44, 0.5)");
                            const barChart_3gradientStroke2 = barChart_3.createLinearGradient(50, 100, 50, 50);
                            barChart_3gradientStroke2.addColorStop(0, "rgba(98, 126, 234, 1)");
                            barChart_3gradientStroke2.addColorStop(1, "rgba(98, 126, 234, 1)");
                            const barChart_3gradientStroke3 = barChart_3.createLinearGradient(50, 100, 50, 50);
                            barChart_3gradientStroke3.addColorStop(0, "rgba(238, 60, 60, 1)");
                            barChart_3gradientStroke3.addColorStop(1, "rgba(238, 60, 60, 1)");
                            barChart_3.height = 100;
                            let barChartData = {
                                defaultFontFamily: 'Poppins',
                                labels: ['Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat', 'Sun'],
                                datasets: [{
                                        label: 'Red',
                                        backgroundColor: barChart_3gradientStroke,
                                        hoverBackgroundColor: barChart_3gradientStroke,
                                        data: [
                                            '12',
                                            '12',
                                            '12',
                                            '12',
                                            '12',
                                            '12',
                                            '12'
                                        ]
                                    }, {
                                        label: 'Green',
                                        backgroundColor: barChart_3gradientStroke2,
                                        hoverBackgroundColor: barChart_3gradientStroke2,
                                        data: [
                                            '12',
                                            '12',
                                            '12',
                                            '12',
                                            '12',
                                            '12',
                                            '12'
                                        ]
                                    }, {
                                        label: 'Blue',
                                        backgroundColor: barChart_3gradientStroke3,
                                        hoverBackgroundColor: barChart_3gradientStroke3,
                                        data: [
                                            '12',
                                            '12',
                                            '12',
                                            '12',
                                            '12',
                                            '12',
                                            '12'
                                        ]
                                    }]

                            };
                            new Chart(barChart_3, {
                                type: 'bar',
                                data: barChartData,
                                options: {
                                    legend: {
                                        display: false
                                    },
                                    title: {
                                        display: false
                                    },
                                    tooltips: {
                                        mode: 'index',
                                        intersect: false
                                    },
                                    responsive: true,
                                    scales: {
                                        xAxes: [{
                                                stacked: true,
                                                ticks: {
                                                    fontColor: '#ffffff',
                                                },
                                                gridLines: {
                                                    color: "rgba(255, 255, 255, 0.1)"
                                                }
                                            }],
                                        yAxes: [{
                                                stacked: true,
                                                ticks: {
                                                    fontColor: '#ffffff',
                                                },
                                                gridLines: {
                                                    color: "rgba(255, 255, 255, 0.1)"
                                                }
                                            }]
                                    }
                                }
                            });
                        }
                    }
                    var lineChart1 = function () {


                        if (jQuery('#lineChart_1').length > 0) {


                            //basic line chart
                            const lineChart_1 = document.getElementById("lineChart_1").getContext('2d');
                            Chart.controllers.line = Chart.controllers.line.extend({
                                draw: function () {
                                    draw.apply(this, arguments);
                                    let nk = this.chart.chart.ctx;
                                    let _stroke = nk.stroke;
                                    nk.stroke = function () {
                                        nk.save();
                                        nk.shadowColor = 'rgba(255, 0, 0, .2)';
                                        nk.shadowBlur = 10;
                                        nk.shadowOffsetX = 0;
                                        nk.shadowOffsetY = 10;
                                        _stroke.apply(this, arguments)
                                        nk.restore();
                                    }
                                }
                            });
                            lineChart_1.height = 100;
                            new Chart(lineChart_1, {
                                type: 'line',
                                data: {
                                    defaultFontFamily: 'Poppins',
                                    labels: ["Jan", "Febr", "Mar", "Apr", "May", "Jun", "Jul"],
                                    datasets: [
                                        {
                                            label: "My First dataset",
                                            data: [25, 20, 60, 41, 66, 45, 80],
                                            borderColor: 'rgba(44, 44, 44, 1)',
                                            borderWidth: "2",
                                            backgroundColor: 'transparent',
                                            pointBackgroundColor: 'rgba(44, 44, 44, 1)'
                                        }
                                    ]
                                },
                                options: {
                                    legend: false,
                                    scales: {
                                        yAxes: [{
                                                ticks: {
                                                    beginAtZero: true,
                                                    max: 100,
                                                    min: 0,
                                                    stepSize: 20,
                                                    padding: 10,
                                                    fontColor: '#ffffff',
                                                },
                                                gridLines: {
                                                    color: "rgba(255, 255, 255, 0.1)"
                                                }
                                            }],
                                        xAxes: [{
                                                ticks: {
                                                    padding: 5,
                                                    fontColor: '#ffffff',
                                                },
                                                gridLines: {
                                                    color: "rgba(255, 255, 255, 0.1)"
                                                }
                                            }]
                                    }
                                }
                            });
                        }
                    }

                    var lineChart2 = function () {
                        //gradient line chart
                        if (jQuery('#lineChart_2').length > 0) {

                            const lineChart_2 = document.getElementById("lineChart_2").getContext('2d');
                            //generate gradient
                            const lineChart_2gradientStroke = lineChart_2.createLinearGradient(500, 0, 100, 0);
                            lineChart_2gradientStroke.addColorStop(0, "rgba(44, 44, 44, 1)");
                            lineChart_2gradientStroke.addColorStop(1, "rgba(44, 44, 44, 0.5)");
                            Chart.controllers.line = Chart.controllers.line.extend({
                                draw: function () {
                                    draw.apply(this, arguments);
                                    let nk = this.chart.chart.ctx;
                                    let _stroke = nk.stroke;
                                    nk.stroke = function () {
                                        nk.save();
                                        nk.shadowColor = 'rgba(0, 0, 128, .2)';
                                        nk.shadowBlur = 10;
                                        nk.shadowOffsetX = 0;
                                        nk.shadowOffsetY = 10;
                                        _stroke.apply(this, arguments)
                                        nk.restore();
                                    }
                                }
                            });
                            lineChart_2.height = 100;
                            new Chart(lineChart_2, {
                                type: 'line',
                                data: {
                                    defaultFontFamily: 'Poppins',
                                    labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"],
                                    datasets: [
                                        {
                                            label: "My First dataset",
                                            data: [25, 20, 60, 41, 66, 45, 80],
                                            borderColor: lineChart_2gradientStroke,
                                            borderWidth: "2",
                                            backgroundColor: 'transparent',
                                            pointBackgroundColor: 'rgba(44, 44, 44, 0.5)'
                                        }
                                    ]
                                },
                                options: {
                                    legend: false,
                                    scales: {
                                        yAxes: [{
                                                ticks: {
                                                    beginAtZero: true,
                                                    max: 100,
                                                    min: 0,
                                                    stepSize: 20,
                                                    padding: 10,
                                                    fontColor: '#ffffff',
                                                },
                                                gridLines: {
                                                    color: "rgba(255, 255, 255, 0.1)"
                                                }
                                            }],
                                        xAxes: [{
                                                ticks: {
                                                    padding: 5,
                                                    fontColor: '#ffffff',
                                                },
                                                gridLines: {
                                                    color: "rgba(255, 255, 255, 0.1)"
                                                }
                                            }]
                                    }
                                }
                            });
                        }
                    }
                    var lineChart3 = function () {
                        //dual line chart
                        if (jQuery('#lineChart_3').length > 0) {
                            const lineChart_3 = document.getElementById("lineChart_3").getContext('2d');
                            //generate gradient
                            const lineChart_3gradientStroke1 = lineChart_3.createLinearGradient(500, 0, 100, 0);
                            lineChart_3gradientStroke1.addColorStop(0, "rgba(44, 44, 44, 1)");
                            lineChart_3gradientStroke1.addColorStop(1, "rgba(44, 44, 44, 0.5)");
                            const lineChart_3gradientStroke2 = lineChart_3.createLinearGradient(500, 0, 100, 0);
                            lineChart_3gradientStroke2.addColorStop(0, "rgba(255, 92, 0, 1)");
                            lineChart_3gradientStroke2.addColorStop(1, "rgba(255, 92, 0, 1)");
                            Chart.controllers.line = Chart.controllers.line.extend({
                                draw: function () {
                                    draw.apply(this, arguments);
                                    let nk = this.chart.chart.ctx;
                                    let _stroke = nk.stroke;
                                    nk.stroke = function () {
                                        nk.save();
                                        nk.shadowColor = 'rgba(0, 0, 0, 0)';
                                        nk.shadowBlur = 10;
                                        nk.shadowOffsetX = 0;
                                        nk.shadowOffsetY = 10;
                                        _stroke.apply(this, arguments)
                                        nk.restore();
                                    }
                                }
                            });
                            lineChart_3.height = 100;
                            new Chart(lineChart_3, {
                                type: 'line',
                                data: {
                                    defaultFontFamily: 'Poppins',
                                    labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"],
                                    datasets: [
                                        {
                                            label: "My First dataset",
                                            data: [25, 20, 60, 41, 66, 45, 80],
                                            borderColor: lineChart_3gradientStroke1,
                                            borderWidth: "2",
                                            backgroundColor: 'transparent',
                                            pointBackgroundColor: 'rgba(44, 44, 44, 0.5)'
                                        }, {
                                            label: "My First dataset",
                                            data: [5, 20, 15, 41, 35, 65, 80],
                                            borderColor: lineChart_3gradientStroke2,
                                            borderWidth: "2",
                                            backgroundColor: 'transparent',
                                            pointBackgroundColor: 'rgba(254, 176, 25, 1)'
                                        }
                                    ]
                                },
                                options: {
                                    legend: false,
                                    scales: {
                                        yAxes: [{
                                                ticks: {
                                                    beginAtZero: true,
                                                    max: 100,
                                                    min: 0,
                                                    stepSize: 20,
                                                    padding: 10,
                                                    fontColor: '#ffffff',
                                                },
                                                gridLines: {
                                                    color: "rgba(255, 255, 255, 0.1)"
                                                }
                                            }],
                                        xAxes: [{
                                                ticks: {
                                                    padding: 5,
                                                    fontColor: '#ffffff',
                                                },
                                                gridLines: {
                                                    color: "rgba(255, 255, 255, 0.1)"
                                                }
                                            }]
                                    }
                                }
                            });
                        }
                    }
                    var lineChart03 = function () {
                        //dual line chart
                        if (jQuery('#lineChart_3Kk').length > 0) {
                            const lineChart_3Kk = document.getElementById("lineChart_3Kk").getContext('2d');
                            //generate gradient

                            Chart.controllers.line = Chart.controllers.line.extend({
                                draw: function () {
                                    draw.apply(this, arguments);
                                    let nk = this.chart.chart.ctx;
                                    let _stroke = nk.stroke;
                                    nk.stroke = function () {
                                        nk.save();
                                        nk.shadowColor = 'rgba(0, 0, 0, 0)';
                                        nk.shadowBlur = 10;
                                        nk.shadowOffsetX = 0;
                                        nk.shadowOffsetY = 10;
                                        _stroke.apply(this, arguments)
                                        nk.restore();
                                    }
                                }
                            });
                            lineChart_3Kk.height = 100;
                            new Chart(lineChart_3Kk, {
                                type: 'line',
                                data: {
                                    defaultFontFamily: 'Poppins',
                                    labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"],
                                    datasets: [
                                        {
                                            label: "My First dataset",
                                            data: [90, 60, 80, 50, 60, 55, 80],
                                            borderColor: 'rgba(58,122,254,1)',
                                            borderWidth: "3",
                                            backgroundColor: 'rgba(0,0,0,0)',
                                            pointBackgroundColor: 'rgba(0, 0, 0, 0)'
                                        }
                                    ]
                                },
                                options: {
                                    legend: false,
                                    elements: {
                                        point: {
                                            radius: 0
                                        }
                                    },
                                    scales: {
                                        yAxes: [{
                                                ticks: {
                                                    beginAtZero: true,
                                                    max: 100,
                                                    min: 0,
                                                    stepSize: 20,
                                                    padding: 10,
                                                    fontColor: '#ffffff',
                                                },
                                                gridLines: {
                                                    color: "rgba(255, 255, 255, 0.1)"
                                                },
                                                borderWidth: 3,
                                                display: false,
                                                lineTension: 0.4,
                                            }],
                                        xAxes: [{
                                                ticks: {
                                                    padding: 5,
                                                    fontColor: '#ffffff',
                                                },
                                                gridLines: {
                                                    color: "rgba(255, 255, 255, 0.1)"
                                                }

                                            }]
                                    }
                                }
                            });
                        }

                    }
                    var areaChart1 = function () {
                        //basic area chart
                        if (jQuery('#areaChart_1').length > 0) {
                            const areaChart_1 = document.getElementById("areaChart_1").getContext('2d');
                            areaChart_1.height = 100;
                            new Chart(areaChart_1, {
                                type: 'line',
                                data: {
                                    defaultFontFamily: 'Poppins',
                                    labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"],
                                    datasets: [
                                        {
                                            label: "My First dataset",
                                            data: [25, 20, 60, 41, 66, 45, 80],
                                            borderColor: 'rgba(0, 0, 1128, .3)',
                                            borderWidth: "1",
                                            backgroundColor: 'rgba(44, 44, 44,1)',
                                            pointBackgroundColor: 'rgba(0, 0, 1128, .3)'
                                        }
                                    ]
                                },
                                options: {
                                    legend: false,
                                    scales: {
                                        yAxes: [{
                                                ticks: {
                                                    beginAtZero: true,
                                                    max: 100,
                                                    min: 0,
                                                    stepSize: 20,
                                                    padding: 10,
                                                    fontColor: '#ffffff',
                                                },
                                                gridLines: {
                                                    color: "rgba(255, 255, 255, 0.1)"
                                                }
                                            }],
                                        xAxes: [{
                                                ticks: {
                                                    padding: 5,
                                                    fontColor: '#ffffff',
                                                },
                                                gridLines: {
                                                    color: "rgba(255, 255, 255, 0.1)"
                                                }
                                            }]
                                    }
                                }
                            });
                        }
                    }
                    var areaChart2 = function () {
                        //gradient area chart
                        if (jQuery('#areaChart_2').length > 0) {
                            const areaChart_2 = document.getElementById("areaChart_2").getContext('2d');
                            //generate gradient
                            const areaChart_2gradientStroke = areaChart_2.createLinearGradient(0, 1, 0, 500);
                            areaChart_2gradientStroke.addColorStop(0, "rgba(238, 60, 60, 0.2)");
                            areaChart_2gradientStroke.addColorStop(1, "rgba(238, 60, 60, 0)");
                            areaChart_2.height = 100;
                            new Chart(areaChart_2, {
                                type: 'line',
                                data: {
                                    defaultFontFamily: 'Poppins',
                                    labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"],
                                    datasets: [
                                        {
                                            label: "My First dataset",
                                            data: [25, 20, 60, 41, 66, 45, 80],
                                            borderColor: "#ff2625",
                                            borderWidth: "4",
                                            backgroundColor: areaChart_2gradientStroke
                                        }
                                    ]
                                },
                                options: {
                                    legend: false,
                                    scales: {
                                        yAxes: [{
                                                ticks: {
                                                    beginAtZero: true,
                                                    max: 100,
                                                    min: 0,
                                                    stepSize: 20,
                                                    padding: 5,
                                                    fontColor: '#ffffff',
                                                },
                                                gridLines: {
                                                    color: "rgba(255, 255, 255, 0.1)"
                                                }
                                            }],
                                        xAxes: [{
                                                ticks: {
                                                    padding: 5,
                                                    fontColor: '#ffffff',
                                                },
                                                gridLines: {
                                                    color: "rgba(255, 255, 255, 0.1)"
                                                }
                                            }]
                                    }
                                }
                            });
                        }
                    }

                    var areaChart3 = function () {
                        //gradient area chart
                        if (jQuery('#areaChart_3').length > 0) {
                            const areaChart_3 = document.getElementById("areaChart_3").getContext('2d');
                            areaChart_3.height = 100;
                            new Chart(areaChart_3, {
                                type: 'line',
                                data: {
                                    defaultFontFamily: 'Poppins',
                                    labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"],
                                    datasets: [
                                        {
                                            label: "My First dataset",
                                            data: [25, 20, 60, 41, 66, 45, 80],
                                            borderColor: 'rgb(44, 44, 44)',
                                            borderWidth: "1",
                                            backgroundColor: 'rgba(44, 44, 44,1)'
                                        },
                                        {
                                            label: "My First dataset",
                                            data: [5, 25, 20, 41, 36, 75, 70],
                                            borderColor: 'rgb(255, 92, 0)',
                                            borderWidth: "1",
                                            backgroundColor: 'rgba(255, 92, 0, .5)'
                                        }
                                    ]
                                },
                                options: {
                                    legend: false,
                                    scales: {
                                        yAxes: [{
                                                ticks: {
                                                    beginAtZero: true,
                                                    max: 100,
                                                    min: 0,
                                                    stepSize: 20,
                                                    padding: 10,
                                                    fontColor: '#ffffff',
                                                },
                                                gridLines: {
                                                    color: "rgba(255, 255, 255, 0.1)"
                                                }
                                            }],
                                        xAxes: [{
                                                ticks: {
                                                    padding: 5,
                                                    fontColor: '#ffffff',
                                                },
                                                gridLines: {
                                                    color: "rgba(255, 255, 255, 0.1)"
                                                }
                                            }]
                                    }
                                }
                            });
                        }
                    }

                    var radarChart = function () {
                        if (jQuery('#radar_chart').length > 0) {
                            //radar chart
                            const radar_chart = document.getElementById("radar_chart").getContext('2d');
                            const radar_chartgradientStroke1 = radar_chart.createLinearGradient(500, 0, 100, 0);
                            radar_chartgradientStroke1.addColorStop(0, "rgba(54, 185, 216, .5)");
                            radar_chartgradientStroke1.addColorStop(1, "rgba(75, 255, 162, .5)");
                            const radar_chartgradientStroke2 = radar_chart.createLinearGradient(500, 0, 100, 0);
                            radar_chartgradientStroke2.addColorStop(0, "rgba(68, 0, 235, .5");
                            radar_chartgradientStroke2.addColorStop(1, "rgba(68, 236, 245, .5");
                            // radar_chart.height = 100;
                            new Chart(radar_chart, {
                                type: 'radar',
                                data: {
                                    defaultFontFamily: 'Poppins',
                                    labels: [["Eating", "Dinner"], ["Drinking", "Water"], "Sleeping", ["Designing", "Graphics"], "Coding", "Cycling", "Running"],
                                    datasets: [
                                        {
                                            label: "My azaz dataset",
                                            data: [65, 59, 66, 45, 56, 55, 25],
                                            borderColor: '#ffff',
                                            borderWidth: "1",
                                            backgroundColor: radar_chartgradientStroke2
                                        },
                                        {
                                            label: "My Second dataset",
                                            data: [28, 12, 40, 19, 63, 27, 87],
                                            borderColor: '#ffff',
                                            borderWidth: "1",
                                            backgroundColor: radar_chartgradientStroke1
                                        }
                                    ]
                                },
                                options: {
                                    legend: false,
                                    //maintainAspectRatio: false, 
                                    scale: {
                                        ticks: {
                                            beginAtZero: true,
                                            fontColor: '#ffffff',
                                        },
                                        gridLines: {
                                            color: "rgba(255, 255, 255, 0.1)"
                                        }
                                    }
                                }
                            });
                        }
                    }
                    var pieChart = function () {
                        //pie chart
                        if (jQuery('#pie_chart').length > 0) {
                            //pie chart
                            const pie_chart = document.getElementById("pie_chart").getContext('2d');
                            // pie_chart.height = 100;
                            new Chart(pie_chart, {
                                type: 'pie',
                                data: {
                                    defaultFontFamily: 'Poppins',
                                    datasets: [{
                                            data: [45, 25, 20, 10],
                                            borderWidth: 0,
                                            backgroundColor: [
                                                "rgba(44, 44, 44, .9)",
                                                "rgba(44, 44, 44, .7)",
                                                "rgba(44, 44, 44,1)",
                                                "rgba(0,0,0,0.07)"
                                            ],
                                            hoverBackgroundColor: [
                                                "rgba(44, 44, 44, .9)",
                                                "rgba(44, 44, 44, .7)",
                                                "rgba(44, 44, 44,1)",
                                                "rgba(0,0,0,0.07)"
                                            ]

                                        }],
                                    labels: [
                                        "one",
                                        "two",
                                        "three",
                                        "four"
                                    ]
                                },
                                options: {
                                    responsive: true,
                                    legend: false,
                                    //maintainAspectRatio: false
                                }
                            });
                        }
                    }
                    var doughnutChart = function () {
                        if (jQuery('#doughnut_chart').length > 0) {
                            //doughut chart
                            const doughnut_chart = document.getElementById("doughnut_chart").getContext('2d');
                            // doughnut_chart.height = 100;
                            new Chart(doughnut_chart, {
                                type: 'doughnut',
                                data: {
                                    weight: 5,
                                    defaultFontFamily: 'Poppins',
                                    datasets: [{
                                            data: [45, 25, 20],
                                            borderWidth: 3,
                                            borderColor: "rgba(255,255,255,1)",
                                            backgroundColor: [
                                                "rgba(44, 44, 44, 1)",
                                                "rgba(98, 126, 234, 1)",
                                                "rgba(238, 60, 60, 1)"
                                            ],
                                            hoverBackgroundColor: [
                                                "rgba(44, 44, 44, 0.9)",
                                                "rgba(98, 126, 234, .9)",
                                                "rgba(238, 60, 60, .9)"
                                            ]

                                        }],
                                    // labels: [
                                    //     "green",
                                    //     "green",
                                    //     "green",
                                    //     "green"
                                    // ]
                                },
                                options: {
                                    weight: 1,
                                    cutoutPercentage: 70,
                                    responsive: true,
                                    maintainAspectRatio: false
                                }
                            });
                        }
                    }
                    var polarChart = function () {
                        if (jQuery('#polar_chart').length > 0) {
                            //polar chart
                            const polar_chart = document.getElementById("polar_chart").getContext('2d');
                            // polar_chart.height = 100;
                            new Chart(polar_chart, {
                                type: 'polarArea',
                                data: {
                                    defaultFontFamily: 'Poppins',
                                    datasets: [{
                                            data: [15, 18, 9, 6, 19],
                                            borderWidth: 0,
                                            backgroundColor: [
                                                "rgba(44, 44, 44, 1)",
                                                "rgba(98, 126, 234, 1)",
                                                "rgba(238, 60, 60, 1)",
                                                "rgba(54, 147, 255, 1)",
                                                "rgba(255, 92, 0, 1)"
                                            ]

                                        }]
                                },
                                options: {
                                    responsive: true,
                                    //maintainAspectRatio: false
                                }
                            });
                        }
                    }



                    /* Function ============ */
                    return {
                        init: function () {
                        },
                        load: function () {
                            barChart1();
                            barChart2();
                            barChart3();
                            lineChart1();
                            lineChart2();
                            lineChart3();
                            lineChart03();
                            areaChart1();
                            areaChart2();
                            areaChart3();
                            radarChart();
                            pieChart();
                            doughnutChart();
                            polarChart();
                        },
                        resize: function () {
                            // barChart1();	
                            // barChart2();
                            // barChart3();	
                            // lineChart1();	
                            // lineChart2();		
                            // lineChart3();
                            // lineChart03();
                            // areaChart1();
                            // areaChart2();
                            // areaChart3();
                            // radarChart();
                            // pieChart();
                            // doughnutChart(); 
                            // polarChart(); 
                        }
                    }

                }();
                jQuery(document).ready(function () {
                });
                jQuery(window).on('load', function () {
                    dlabSparkLine.load();
                });
                jQuery(window).on('resize', function () {
                    //dlabSparkLine.resize();
                    setTimeout(function () {
                        dlabSparkLine.resize();
                    }, 1000);
                });
            })(jQuery);
        </script>

        <script>
            $(document).ready(function () {

                $('#choice').hide();
            });
        </script>
        <script>


            <%
                int j = 0;
                for (skill comp : competences) {
            %>
            var encodedURL = encodeURIComponent('<%= comp.getUrl()%>');
            // Construct the new URL with the updated parameter
            var newURL = 'choiceMade?nextSkill=' + encodeURIComponent('<%= comp.getName()%>') + '&nextSkillURL=' + encodedURL;
            // Update the href attribute of the anchor tag
            document.getElementById('continueLearningLink<%=j%>').href = newURL;
            <%
                    j++;
                }

            %>
            <%                j = 0;
                for (skill skill : user.getSkillsInProgress()) {

                    if (!(skill.getProgress() > 0 && skill.getProgress() < 100)) {
                        continue;
                    } else {
            %>

            var encodedURL2 = encodeURIComponent(
                    '<%= skill.getUrl()%>');
            // Construct the new URL with the updated parameter
            var newURL2 = 'choiceMade?nextSkill=' + encodeURIComponent('<%= skill.getName()%>') + '&nextSkillURL=' + encodedURL2;
            // Update the href attribute of the anchor tag
            document.getElementById('continueLearningLink2<%=j%>').href = newURL2;
            <%
                    }
                    j++;
                }

            %>

            <%                j = 0;
                for (skill skill : user.getSkillsInProgress()) {

                    if (skill.getProgress().equals(100)) {

            %>

            var encodedURL3 = encodeURIComponent(
                    '<%= skill.getUrl()%>');
            // Construct the new URL with the updated parameter
            var newURL3 = 'choiceMade?nextSkill=' + encodeURIComponent('<%= skill.getName()%>') + '&nextSkillURL=' + encodedURL3;
            // Update the href attribute of the anchor tag
            document.getElementById('continueLearningLink3<%=j%>').href = newURL3;
            <%
                    }
                    j++;
                }

            %>








            <%                       Integer palier = (Integer) session.getAttribute("palier");

            %>



            var palierDiv = document.querySelector("#palier");
            var palier = parseInt("<%= palier%>", 10);
            var htmlCode = '';
            var i = 3;
            console.log(i, palier);
            while (i > 0 || palier > 0) {
                console.log(i, palier);
                if (palier !== 0 && i !== 0) {
                    htmlCode += '<i class="fa-sharp fa-solid fa-star text-orange"></i>';
                    palier--;
                } else if (palier === 0 && i !== 0) {
                    htmlCode += '<i class="fa fa-star fa-fw"></i>';
                }
                i--;
            }

            palierDiv.innerHTML = htmlCode;
        </script>


<script>
        // Sélectionnez l'élément audio
        var audio = document.getElementById('myAudio');
        var muteButton = document.getElementById('muteButton');
        var muteField = document.getElementById('muteField');

        audio.volume = 0.05;        
        
        var audioFiles = [
            'musique/mHome.mp3'            
        ];
        
    var isPlaying = false; // Variable pour suivre si la musique est en cours de lecture

    muteButton.addEventListener('click', function() {
        if (audio.muted) {
            audio.muted = false;
            muteField.textContent = 'Arrêter la musique';
        } else {
            audio.muted = true;
            muteField.textContent = 'Activer la musique';
        }
    });

    document.addEventListener('click', function() {
        if (!isPlaying) {
            var randomIndex = Math.floor(Math.random() * audioFiles.length);
            audio.src = audioFiles[randomIndex];
            audio.play();
            isPlaying = true; // Définissez la variable comme vrai pendant la lecture
        }
    });

// Écouteur d'événement pour détecter la fin de la lecture
    audio.addEventListener('ended', function() {
        isPlaying = false; // Une fois la musique terminée, réinitialisez la variable à faux
    });


    </script>

<script>

function updateBeltColor() {
    
    var validatedSkillsElements = document.querySelectorAll('.validated-skill');
    var validatedSkills = Array.from(validatedSkillsElements).map(el => el.textContent.trim());
    var beltColor = "blanche"; // Couleur par défaut

    // Définissez les compétences requises pour chaque ceinture
    var requirementsForWhiteBelt = ["Additionner un entier à un autre pour obtenir 10", "Connaitre les critères de division par 2", "Connaitre la table des 2", "Multiplier un entier par 10", "Comparer deux entiers", "Décomposer un entier"];
    var requirementsForYellowBelt = ["Connaitre les critères de division par 3", "Connaitre la table des 3", "Multiplier un entier par 100 et par 1000", "Encadrer un entier entre deux entiers"];
    var requirementsForOrangeBelt = ["Connaitre les critères de division par 5", "Connaitre la table des 4", "Connaitre la table des 5", "Additionner un entier à un autre pour obtenir 100", "Additionner deux entiers simples"];
    var requirementsForGreenBelt = ["Connaitre les critères de division par 9", "Connaitre la table des 6", "Connaitre la table des 9", "Diviser un entier par 10", "Soustraire deux entiers simple"];
    var requirementsForBlueBelt = ["Connaitre la table des 7", "Multiplier un entier par 20", "Diviser un entier par 100 et par 1000", "Additionner un entier à un entier particulier"];
    var requirementsForBrownBelt = ["Connaitre la table des 8", "Connaitre les critères de division par 2", "Additionner deux entiers", "Soustraire un entier à un entier particulier"];
    var requirementsForBlackBelt = ["Multiplier deux entiers", "Diviser deux entiers", "Soustraire deux entiers", "Comparer deux grands entiers", "Maitriser les priorités opératoires"];


    // Vérifiez si toutes les compétences requises pour chaque ceinture sont validées
    var hasAllSkillsForWhite = requirementsForWhiteBelt.every(skill => validatedSkills.includes(skill));
    var hasAllSkillsForYellow = requirementsForYellowBelt.every(skill => validatedSkills.includes(skill));
    var hasAllSkillsForOrange = requirementsForOrangeBelt.every(skill => validatedSkills.includes(skill));
    var hasAllSkillsForGreen = requirementsForGreenBelt.every(skill => validatedSkills.includes(skill));
    var hasAllSkillsForBlue = requirementsForBlueBelt.every(skill => validatedSkills.includes(skill));
    var hasAllSkillsForBrown = requirementsForBrownBelt.every(skill => validatedSkills.includes(skill));
    var hasAllSkillsForBlack = requirementsForBlackBelt.every(skill => validatedSkills.includes(skill));

    // Attribuez la couleur de la ceinture en fonction des compétences validées
    if (hasAllSkillsForBlack) {
        beltColor = "noire";
    } else if (hasAllSkillsForBrown) {
        beltColor = "marron";
    } else if (hasAllSkillsForBlue) {
        beltColor = "bleue";
    } else if (hasAllSkillsForGreen) {
        beltColor = "verte";
    } else if (hasAllSkillsForOrange) {
        beltColor = "orange";
    } else if (hasAllSkillsForYellow) {
        beltColor = "jaune";
    } else {
        beltColor = "blanche";
    }

    // Mettez à jour l'image de la ceinture
    var beltImage = document.getElementById('img_ceinture');
    beltImage.src = "images/ceintures/ceinture_" + beltColor + ".svg";
}

// Appel de la fonction au chargement de la page ou lorsqu'il est nécessaire de mettre à jour la ceinture
updateBeltColor();

</script>


    </body>
</html>
