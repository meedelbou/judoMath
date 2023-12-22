<%@page import="java.util.Map"%>
<%@page import="Models.TimeFormatter"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="Models.skill"%>
<%@page import="java.util.Base64"%>
<%@page import="Models.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    
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
        <title>Judomath - Gestion</title>

        <!-- FAVICONS ICON -->
        <link rel="shortcut icon" type="image/png" href="images/JM_icon.png">
        <link href="https://fonts.googleapis.com/css2?family=Material+Icons" rel="stylesheet">
        <link href="./vendor/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">
        <link href="./vendor/lightgallery/css/lightgallery.min.css" rel="stylesheet">
        <link href="./vendor/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">
        <link rel="stylesheet" href="./vendor/chartist/css/chartist.min.css">
        <!-- CSS -->




        <link href="./css/style.css" rel="stylesheet">
        <style>
            .custom-div {
                /*                display: none;  Hide all div elements by default */

            }

            /* Styling for the searchable dropdown */
            .searchable-dropdown {


            }

            #searchInput {
                width: 220px;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            #dropdownOptions {
                list-style: none;
                margin: 0;
                padding: 0;
                display: none;
                position: absolute;
                background-color: #fff;
                border: 1px solid #ccc;
                z-index: 1;
                max-height: 150px;
                overflow-y: auto;
            }

            #dropdownOptions li {
                padding: 8px;
                cursor: pointer;
            }

            #dropdownOptions li:hover {
                background-color: #f1f1f1;
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
                <a href="login" class="brand-logo">
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
                            <div class="header-left"></div>
                            <ul class="navbar-nav header-right">

                                <li class="nav-item align-items-center header-border"><a href="logout" class="btn btn-primary btn-sm">Quitter</a></li>	
                                <li class="nav-item ps-3">
                                    <div class="dropdown header-profile2">
                                        <a class="nav-link" href="javascript:void(0);" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            <div class="header-info2 d-flex align-items-center">
                                                <div class="header-media">

                                                    <img src="images/userImgs/prof.jpg" alt="" class="">
                                                </div>
                                                <div class="header-info">
                                                    <h6></h6>
                                                    <p></p>
                                                </div>

                                            </div>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-end" style="">
                                            <div class="card border-0 mb-0">
                                                <div class="card-header py-2"style="display:none;">
                                                    <div class="products">
                                                        
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
                        <li><a href="login" aria-expanded="false">
                                <div class="menu-icon">
                                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M2.5 7.49999L10 1.66666L17.5 7.49999V16.6667C17.5 17.1087 17.3244 17.5326 17.0118 17.8452C16.6993 18.1577 16.2754 18.3333 15.8333 18.3333H4.16667C3.72464 18.3333 3.30072 18.1577 2.98816 17.8452C2.67559 17.5326 2.5 17.1087 2.5 16.6667V7.49999Z" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M7.5 18.3333V10H12.5V18.3333" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
                                    </svg>
                                </div>	
                                <span class="nav-text">Tableau de bord</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <!--**********************************
                Sidebar end
            ***********************************-->

            <!--**********************************
                Content body start
            ***********************************-->
            <div class="content-body">
                <div class="page-titles">
                    <ol class="breadcrumb">
                        <li><h5 class="bc-title">Tableau de bord</h5></li>
                        <li class="breadcrumb-item">
                            <a href="login">
                                <svg width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M2.125 6.375L8.5 1.41667L14.875 6.375V14.1667C14.875 14.5424 14.7257 14.9027 14.4601 15.1684C14.1944 15.4341 13.8341 15.5833 13.4583 15.5833H3.54167C3.16594 15.5833 2.80561 15.4341 2.53993 15.1684C2.27426 14.9027 2.125 14.5424 2.125 14.1667V6.375Z" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M6.375 15.5833V8.5H10.625V15.5833" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round"/>
                                </svg>
                                <span> Judomath </span>
                                </a>
                        </li>
                        <li class="breadcrumb-item"><a href="login">Tableau de bord</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">Élève</a></li>
                    </ol>
                </div>
                <div class="container-fluid">
                    <%                        Student student = (Student) session.getAttribute("student");
                        String base64Image = Base64.getEncoder().encodeToString(student.getProfilePicture());
                    %>
                    <%
                        SimpleDateFormat inputFormat = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy", Locale.ENGLISH);
                        SimpleDateFormat outputFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm");
                        int nbrCV = 0;
                        for (skill comp
                                : student.getSkillsInProgress()) {
                            if (comp.getProgress().equals(100)) {
                                nbrCV++;
                            }

                        }

                    %>
                    <!-- style="padding-right:10%;padding-left: 10%" -->

                    <div class="col-xl-12 col-xxl-12"   > 

                        <div class="row">
                            <div class="col-xl-7 col-xxl-7">
                                <div class="col-xl-12 col-lg-12 col-sm-12">
                                    <div class="card overflow-hidden">
                                        <div class="card-body">
                                            <div class="text-center">
                                                <div class="profile-photo">
                                                    <% if (!base64Image.equals(
                                                                "")) {%>
                                                    <img src="data:image/jpeg;base64,<%=base64Image%>"  width="100" class="img-fluid rounded-circle" alt="">
                                                    <% } else {%>
                                                    <img src="" width="100" class="img-fluid rounded-circle userImg" alt="">


                                                    <% }%>

                                                </div>
                                                <h3 class="mt-4 mb-1">${student.nom} ${student.prenom}</h3>

                                                <span class="badge light border-0 status-span" data-email="<%= student.getEmail()%>"></span>

                                            </div>
                                        </div>

                                        <div class="card-footer pt-0 pb-0 text-center">
                                            <div class="row">
                                                <div class="col-6 pt-3 pb-3 border-end">

                                                    <div style="display:inline;">
                                                        <h3 class="mb-1" ><%=student.getExperiencePoints()%></h3>
                                                        <span><strong>Points Xp</strong></span>

                                                    </div>





                                                </div>

                                                <div class="col-6 pt-3 pb-3 ">

                                                    <h3 class="mb-1">

                                                        <img id="img_ceinture" src="" width="60" height="25">
                                                    </h3>
                                                    <span><strong>Ceinture</strong></span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-5 col-xxl-5">
                                <div class="card" style="padding:5%; padding-bottom: 0% ">
                                    <div class="card-body">
                                        <div class="profile-personal-info">
                                            <h4 class="text-primary mb-4">Informations Personnelles </h4>
                                            <div class="row mb-2">
                                                <div class="col-sm-5 col-5">
                                                    <h5 class="f-w-500">Identifiant <span class="pull-end">:</span>
                                                    </h5>
                                                </div>
                                                <div class="col-sm-7 col-7"><span class="userLog"><%=  student.getEmail()%></span>
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-sm-5 col-5">
                                                    <h5 class="f-w-500">Date d'inscription <span class="pull-end">:</span>
                                                    </h5>
                                                </div>
                                                <div class="col-sm-7 col-7"><span><%=  outputFormat.format(student.getDateOfSignup())%></span>
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-sm-5 col-5">
                                                    <h5 class="f-w-500">Nombres de visites <span class="pull-end">:</span>
                                                    </h5>
                                                </div>
                                                <div class="col-sm-7 col-7"><span><%= student.getNumberOfVisits()%></span>
                                                </div>
                                            </div>


                                        </div>
                                    </div>



                                </div>
                            </div>


                        </div>

                        <div class="row">
                            <div class="col-xl-12 col-12 col-sm-12">
                                <div class="card" style="padding-left: 5%">
                                    <div class="row" style="padding:3%">


                                        <div  class="col-xl-6 col-sm-12">
                                            <div class=" d-flex align-items-center flex-wrap" style="position:relative; top:31px">
                                                <div>

                                                    <h3>Temps Total : </h3>
                                                </div>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <div >
                                                    <div class="d-inline-block " >
                                                        <span  style="position:relative; top:-3px;left:-25px;font-size: 20px "><strong><%= TimeFormatter.timeFormat(student.getTotalTimeSpent())%> </strong> </span>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div  class="col-xl-6 col-sm-12" >
                                            <div class=" d-flex align-items-center flex-wrap">
                                                <div>

                                                    <h3>Avancement global : </h3>
                                                </div>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <div>
                                                    <div class="d-inline-block position-relative donut-chart-sale ">
                                                        <span class="donut1" data-peity='{ "fill": ["rgb(59, 215, 225)", "rgba(245, 245, 245, 1"],   "innerRadius": 33, "radius": 10}'><%=nbrCV%>/33</span>
                                                        <small><%= (int) (((float) nbrCV / 33) * 100)%>%</small>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class='row'>
                            <div class="col-xl-12 col-xxl-12 col-md-12 flag">
                                <div class="card overflow-hidden">
                                    <div class="card-header border-0">
                                        <h3 class="heading mb-0 text-primary">Avancement </h3>
                                    </div>
                                    <div class="card-body pe-0">

                                        <div class="row">

                                            <div class="col-xl-6 col-sm-12 " style="padding: 2%">
                                                <div id="morris_donught" class="morris_chart_height"></div>
                                            </div>
                                            <div class="col-xl-6 col-sm-12 " style="padding: 2%; position:relative; top:-40px">
                                                <canvas id="radar_chart"></canvas>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="profile-skills mb-5">
                                                <h4 class="text-primary mb-2">Compétences Validées</h4> <br>
                                                <% for (skill comp
                                                            : student.getSkillsInProgress()) {
                                                        if (comp.getProgress().equals(100)) {%>
                                                <a href="javascript:void(0);" class="btn btn-success light btn-xs mb-1 validated-skill" style="margin:0.50%"><%= comp.getName()%></a>
                                                <%}
                                                    }%> <br><br><br>
                                                <h4 class="text-primary mb-2">Compétences en cours</h4> <br>
                                                <% for (skill comp
                                                            : student.getSkillsInProgress()) {
                                                        if (comp.getProgress() < 100) {%>
                                                <a href="javascript:void(0);" class="btn btn-warning light btn-xs mb-1" style="margin:0.50%"><%= comp.getName()%> &nbsp;&nbsp;<strong><%=comp.getProgress()%>% </strong></a>
                                                <%}
                                                    }%>

                                            </div>
                                            <!--active-country dz-scroll-->     


                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>



                        <div class="row">
                            <div class="col-xl-12">
                                <div class="col-xl-12 col-xxl-12 col-lg-12 col-sm-12">
                                    <div class="card" ">
                                        <div class="card-header">

                                            <h4 class="card-title text-primary ">Avancement par compétence</h4> 

                                            <div class="searchable-dropdown">
                                                <input type="text" id="searchInput" placeholder="Selectionner une compétence...">
                                                <ul id="dropdownOptions">
                                                    <%
                                                        int count = 1;
                                                        for (skill comp
                                                                : student.getSkillsInProgress()) {%>
                                                    <li data-value="div<%=count%>"><%= comp.getName()%></li>

                                                    <%
                                                            count++;
                                                        }%>
                                                </ul>
                                            </div>

                                        </div>
                                        <%
                                            count = 1;
                                            for (skill comp
                                                    : student.getSkillsInProgress()) {%>

                                        <div id="div<%=count%>" class="card-body custom-div" style="">

                                            <div class="col-xl-12">
                                                <div class="row">
                                                    <div class="col-6">
                                                        <h3 > 
                                                            <%= comp.getName()%>
                                                        </h3>    
                                                    </div>
                                                    <div class="col-6 ">
                                                        <h6>
                                                            <span class="pull-end"><%=comp.getProgress()%>%</span> &nbsp;&nbsp; Complexion
                                                        </h6>
                                                        <div class="progress " style="width:80%" >
                                                            <div class="progress-bar  progress-animated" style="width: <%=comp.getProgress()%>%; height:6px;" role="progressbar">
                                                                <span class="sr-only"><%=comp.getProgress()%>% Complete</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div> 

                                                <div class="row">
                                                    <div class="col-xl-6 col-sm-12 " style="padding: 2%">

                                                        <div id="horizontal-bar-chart-<%=count%>" class="ct-chart ct-golden-section chartlist-chart"></div>
                                                        <ul style='padding-left:25%'>

                                                            <li style="display:inline;margin: 2%">
                                                                <svg width="10" height="10" viewBox="0 0 10 10" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                                <rect width="10" height="10" rx="3" fill="#3AC977"></rect>
                                                                </svg>
                                                                Nombre d'entrainement(s)
                                                            </li>
                                                            <li style="display:inline; margin: 2%">
                                                                <svg width="10" height="10" viewBox="0 0 10 10" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                                <rect width="10" height="10" rx="3" fill="var(--primary)"></rect>
                                                                </svg>
                                                                Nombre de test(s)
                                                            </li>
                                                        </ul>

                                                    </div>
                                                    <div class="col-xl-6 col-sm-12 " style="padding: 2%;position:relative; top:31px" >
                                                        <div class="row">
                                                            <div class=" d-flex align-items-center flex-wrap" >
                                                                <div>

                                                                    <h3> Temps Passé : </h3>
                                                                </div>
                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                <div >
                                                                    <div class="d-inline-block " >

                                                                        <span  style="position:relative; top:-3px;left:-25px;font-size: 20px "><strong><%= TimeFormatter.timeFormat(comp.getTimeSpent())%> </strong> </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div> <br>
                                                        <div class="row">
                                                            <div class="profile-skills mb-5">
                                                                <h5 class="text-dark mb-2">Compétences Suivantes :</h5> 

                                                                <a href="javascript:void(0);" class="btn btn-dark light btn-xs mb-1" style="margin:0.50%">A venir</a>
                                                                <a href="javascript:void(0);" class="btn btn-dark light btn-xs mb-1" style="margin:0.50%"> A venir</a>
                                                                <!-- <a href="javascript:void(0);" class="btn btn-dark light btn-xs mb-1" style="margin:0.50%"> <%= comp.getName()%></a> -->
                                                                <br>




                                                            </div>

                                                        </div>



                                                    </div>
                                                </div>






                                            </div>
                                        </div>
                                        <%count++;
                                            }%>


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

                <!--**********************************
                   Support ticket button start
                ***********************************-->

                <!--**********************************
                   Support ticket button end
                ***********************************-->


            </div>
            <!--**********************************
                Main wrapper end
            ***********************************-->



            <!--**********************************
                Scripts
            ***********************************-->
            <!-- Required vendors -->

            <script src="./js/photo_user.js"></script>

            <script src="./vendor/global/global.min.js"></script>
            <script src="./vendor/jquery-nice-select/js/jquery.nice-select.min.js"></script>
            <script src="./vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
            <script src="./vendor/lightgallery/js/lightgallery-all.min.js"></script>
            <script src="./js/custom.js"></script>
            <script src="./js/deznav-init.js"></script>
            <script src="./vendor/chart.js/Chart.bundle.min.js"></script>
            <script src="./vendor/chartist/js/chartist.min.js"></script>
            <script src="./vendor/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script>

            <script>
                (function ($) {
                    "use strict";
                    var datasets = [
                <% count = 1;
                    for (skill comp : student.getSkillsInProgress()) {%>
                        {
                            training: [],
                            test: [],
                            chartId: '#horizontal-bar-chart-<%=count%>',
                            divId: '#div<%=count%>',
                            chart: null
                        },

                <% count++;
                    }%>
                    ];


                <% count = 1;
                    for (skill comp : student.getSkillsInProgress()) {%>

                <% for (Map.Entry<String, skill.PalierDetails> entry : comp.getAllPalierDetails().entrySet()) {
                        String palierKey = entry.getKey(); // This will be the "1", "2", "3", etc.
                        skill.PalierDetails palierDetails = entry.getValue(); // The PalierDetails object for the current palierKey

                        // Access the data for the current palier
                        int totalTrainingTrys = palierDetails.getTotalTrainingTrys();
                        int totalTestTrys = palierDetails.getTotalTestTrys();

                %>
                    datasets[<%=count - 1%>].training.push(<%= totalTrainingTrys%>);
                    datasets[<%=count - 1%>].test.push(<%=totalTestTrys%>);
                <% } %>
                <% count++;
                    }%>

                    var createHorizontalBarChart = function (dataset) {
                        var maxVal = Math.max(...dataset.training, ...dataset.test);
                      
                        var chart = new Chartist.Bar(dataset.chartId, {
                            labels: ['Palier 1', 'Palier 2', 'Palier 3'],
                            series: [
                                dataset.training,
                                dataset.test
                            ]
                        }, {
                            seriesBarDistance: 10,
                            reverseData: true,
                            horizontalBars: true,
                            axisY: {
                                offset: 70
                            },
                            axisX: {
                                onlyInteger: true,
                                high: 15, // Set the maximum limit for the x-axis
                                type: Chartist.AutoScaleAxis// Use AutoScaleAxis to handle large values
                               
                            },
                            plugins: [
                                Chartist.plugins.tooltip()
                            ]
                        });
                        dataset.chart = chart;
                    };
                    var dlabChartlist = function () {
                        return {
                            init: function () {
                                console.log("initialized");
                                datasets.forEach(function (dataset) {
                                    if (dataset.chart) {
                                        dataset.chart.update({
                                            labels: ['Palier 1', 'Palier 2', 'Palier 3'],
                                            series: [
                                                dataset.training,
                                                dataset.test
                                            ]
                                        });
                                    } else {
                                        createHorizontalBarChart(dataset);
                                    }


                                });
                            },
                            load: function () {
                                datasets.forEach(function (dataset) {
                                    console.log("loaded");
                                    if ($(dataset.divId).is(':visible')) {
                                        console.log("clickeekfhdjh");
                                        if (dataset.chart) {
                                            dataset.chart.update({
                                                labels: ['Palier 1', 'Palier 2', 'Palier 3'],
                                                series: [
                                                    dataset.training,
                                                    dataset.test
                                                ]
                                            });
                                        } else {
                                            createHorizontalBarChart(dataset);
                                        }

                                    }

                                });
                            },
                            resize: function () {
                                console.log("resized");
                                datasets.forEach(function (dataset) {
                                    if (dataset.chart) {
                                        dataset.chart.update({
                                            labels: ['Palier 1', 'Palier 2', 'Palier 3'],
                                            series: [
                                                dataset.training,
                                                dataset.test
                                            ]
                                        });
                                    } else {
                                        createHorizontalBarChart(dataset);
                                    }

                                });
                            }
                        };
                    }();

                    jQuery(document).ready(function () {
                        dlabChartlist.init();

                        // Function to handle chart resize
                        function handleChartResize() {
                            dlabChartlist.resize();
                        }

                        // Function to show/hide div elements based on the selected option
                        function showSelectedDiv(selectedValue) {
                            $('.custom-div').hide();
                            $('#' + selectedValue).show();
                            handleChartResize(); // Trigger chart resize when displaying a new div
                        }

                        // Show the first div by default
                        $('.custom-div').hide();
                        $('#div1').show();

                        // Show/hide div elements based on the selected option
                        $('#dropdownOptions li').on('click', function () {
                            var selectedValue = $(this).data('value');
                            showSelectedDiv(selectedValue);
                            $('#dropdownOptions').hide(); // Hide the dropdown after selecting an option
                        });

                        // Filter dropdown options based on search input
                        $('#searchInput').on('input', function () {
                            var value = $(this).val().toLowerCase();
                            $('#dropdownOptions li').filter(function () {
                                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
                            });
                            $('#dropdownOptions').show(); // Show the dropdown when typing in the search input
                        });

                        // Hide the dropdown when clicking outside the dropdown area
                        $(document).on('click', function (e) {
                            var target = $(e.target);
                            if (!target.closest('.searchable-dropdown').length) {
                                $('#dropdownOptions').hide();
                            }
                        });

                        // Handle chart resize when user clicks on a different div
                        $('.custom-div').on('click', function () {
                            var selectedValue = $(this).attr('id');
                            showSelectedDiv(selectedValue);
                        });

                        // Handle chart resize when the window is resized
                        jQuery(window).on('resize', function () {
                            handleChartResize();
                        });
                    });





                    window.addEventListener('resize', function () {
                        console.log("resized window eventListner");
                        setTimeout(function () {
                            dlabChartlist.resize();
                        }, 10);
                    });
                    jQuery(window).on('load', function () {
                        console.log("loadedWindow");
                        setTimeout(function () {
                            dlabChartlist.resize();
                        }, 10);
                    });
                    jQuery(window).on('resize', function () {
                        console.log("resized window");
                        setTimeout(function () {
                            dlabChartlist.resize();
                        }, 10);
                    });




                })(jQuery);
            </script>






            <script>



            </script>



            <script>
                function timeFormat(timeSpentInSeconds) {

                    var totalSeconds = Math.floor(timeSpentInSeconds / 1000);
                    var hours = Math.floor(totalSeconds / 3600);
                    var minutes = Math.floor((totalSeconds % 3600) / 60);
                    var seconds = totalSeconds % 60;
                    return  hours + "h " + minutes + "m " + seconds + "s";
                }
                ;
                function checkActivity() {
                    $('.status-span').each(function () {
                        var email = $(this).data('email');
                        var statusSpan = $(this);
                        $.ajax({
                            url: 'CheckStudentStatusServlet',
                            type: 'POST',
                            data: {email: email},
                            success: function (response) {
                                if (response.status) {
                                    statusSpan.text('\u00A0' + " En Ligne " + '\u00A0');
                                    statusSpan.addClass('badge-success');
                                    statusSpan.removeClass('badge-danger');
                                } else {
                                    statusSpan.text('Hors ligne');
                                    statusSpan.addClass('badge-danger');
                                    statusSpan.removeClass('badge-success');
                                }

                            },
                            error: function (xhr, status, error) {
                                console.log('Error occurred: ' + error);
                            }
                        });
                    });
                }
                checkActivity();
                // Set the interval to periodically call the function
                setInterval(checkActivity, 5000);
            </script>
            <script src="./vendor/raphael/raphael.min.js"></script>
            <script src="./vendor/morris/morris.min.js"></script>
            <script>
                (function ($) {
                    "use strict"

                    var dlabMorris = function () {

                        var screenWidth = $(window).width();
                        var setChartWidth = function () {
                            if (screenWidth <= 768)
                            {
                                var chartBlockWidth = 0;
                                chartBlockWidth = (screenWidth < 300) ? screenWidth : 300;
                                jQuery('.morris_chart_height').css('min-width', chartBlockWidth - 31);
                            }
                        }

                        var donutChart = function () {
                            Morris.Donut({
                                element: 'morris_donught',
                                data: [
                                    {
                                        label: "\xa0 \xa0 Valid�es \xa0 \xa0",
                                        value: <%=nbrCV%>,
                                    }, {
                                        label: "\xa0 \xa0 Restantes \xa0 \xa0",
                                        value: <%= 33 - student.getSkillsInProgress().size()%>
                                    }, {
                                        label: "\xa0 \xa0 En cours \xa0 \xa0",
                                        value: <%= student.getSkillsInProgress().size() - nbrCV%>
                                    }],
                                resize: true,
                                redraw: true,
                                colors: [
                                    '#339933',
                                    'rgb(255, 92, 0)',
                                    '#ffaa2b'],
                            });
                        }

                        var lineChart = function () {
                            //line chart
                            let line = new Morris.Line({
                                element: 'morris_line',
                                resize: true,
                                data: [{
                                        y: '2011 Q1',
                                        item1: 2666
                                    },
                                    {
                                        y: '2011 Q2',
                                        item1: 2778
                                    },
                                    {
                                        y: '2011 Q3',
                                        item1: 4912
                                    },
                                    {
                                        y: '2011 Q4',
                                        item1: 3767
                                    },
                                    {
                                        y: '2012 Q1',
                                        item1: 6810
                                    },
                                    {
                                        y: '2012 Q2',
                                        item1: 5670
                                    },
                                    {
                                        y: '2012 Q3',
                                        item1: 4820
                                    },
                                    {
                                        y: '2012 Q4',
                                        item1: 15073
                                    },
                                    {
                                        y: '2013 Q1',
                                        item1: 10687
                                    },
                                    {
                                        y: '2013 Q2',
                                        item1: 8432
                                    }
                                ],
                                xkey: 'y',
                                ykeys: ['item1'],
                                labels: ['Item 1'],
                                gridLineColor: 'transparent',
                                lineColors: ['rgb(13,153,255)'], //here
                                lineWidth: 1,
                                hideHover: 'auto',
                                pointSize: 0,
                                axes: false
                            });
                        }

                        var lineChart2 = function () {
                            //Area chart
                            Morris.Area({
                                element: 'line_chart_2',
                                data: [{
                                        period: '2001',
                                        smartphone: 0,
                                        windows: 0,
                                        mac: 0
                                    }, {
                                        period: '2002',
                                        smartphone: 90,
                                        windows: 60,
                                        mac: 25
                                    }, {
                                        period: '2003',
                                        smartphone: 40,
                                        windows: 80,
                                        mac: 35
                                    }, {
                                        period: '2004',
                                        smartphone: 30,
                                        windows: 47,
                                        mac: 17
                                    }, {
                                        period: '2005',
                                        smartphone: 150,
                                        windows: 40,
                                        mac: 120
                                    }, {
                                        period: '2006',
                                        smartphone: 25,
                                        windows: 80,
                                        mac: 40
                                    }, {
                                        period: '2007',
                                        smartphone: 10,
                                        windows: 10,
                                        mac: 10
                                    }


                                ],
                                xkey: 'period',
                                ykeys: ['smartphone', 'windows', 'mac'],
                                labels: ['Phone', 'Windows', 'Mac'],
                                pointSize: 3,
                                fillOpacity: 0,
                                pointStrokeColors: ['#EE3C3C', '#ffaa2b', '#0d99ff'],
                                behaveLikeLine: true,
                                gridLineColor: 'transparent',
                                lineWidth: 3,
                                hideHover: 'auto',
                                lineColors: ['rgb(13,153,255)', 'rgb(0, 171, 197)', '#0d99ff'],
                                resize: true

                            });
                        }

                        var barChart = function () {
                            if (jQuery('#morris_bar').length > 0)
                            {
                                //bar chart
                                Morris.Bar({
                                    element: 'morris_bar',
                                    data: [{
                                            y: '2006',
                                            a: 100,
                                            b: 90,
                                            c: 60
                                        }, {
                                            y: '2007',
                                            a: 75,
                                            b: 65,
                                            c: 40
                                        }, {
                                            y: '2008',
                                            a: 50,
                                            b: 40,
                                            c: 30
                                        }, {
                                            y: '2009',
                                            a: 75,
                                            b: 65,
                                            c: 40
                                        }, {
                                            y: '2010',
                                            a: 50,
                                            b: 40,
                                            c: 30
                                        }, {
                                            y: '2011',
                                            a: 75,
                                            b: 65,
                                            c: 40
                                        }, {
                                            y: '2012',
                                            a: 100,
                                            b: 90,
                                            c: 40
                                        }],
                                    xkey: 'y',
                                    ykeys: ['a', 'b', 'c'],
                                    labels: ['A', 'B', 'C'],
                                    barColors: ['#0d99ff', '#ffaa2b', '#ff9f00'],
                                    hideHover: 'auto',
                                    gridLineColor: 'transparent',
                                    resize: true,
                                    barSizeRatio: 0.25,
                                    yaxis: {

                                        style: {
                                            colors: '#fff',
                                        }
                                    },
                                    xaxis: {
                                        style: {
                                            colors: '#fff',
                                        },
                                    }
                                });
                            }
                        }

                        var barStalkChart = function () {
                            //bar chart
                            Morris.Bar({
                                element: 'morris_bar_stalked',
                                data: [{
                                        y: 'S',
                                        a: 66,
                                        b: 34
                                    }, {
                                        y: 'M',
                                        a: 75,
                                        b: 25
                                    }, {
                                        y: 'T',
                                        a: 50,
                                        b: 50
                                    }, {
                                        y: 'W',
                                        a: 75,
                                        b: 25
                                    }, {
                                        y: 'T',
                                        a: 50,
                                        b: 50
                                    }, {
                                        y: 'F',
                                        a: 16,
                                        b: 84
                                    }, {
                                        y: 'S',
                                        a: 70,
                                        b: 30
                                    }, {
                                        y: 'S',
                                        a: 30,
                                        b: 70
                                    }, {
                                        y: 'M',
                                        a: 40,
                                        b: 60
                                    }, {
                                        y: 'T',
                                        a: 29,
                                        b: 71
                                    }, {
                                        y: 'W',
                                        a: 44,
                                        b: 56
                                    }, {
                                        y: 'T',
                                        a: 30,
                                        b: 70
                                    }, {
                                        y: 'F',
                                        a: 60,
                                        b: 40
                                    }, {
                                        y: 'G',
                                        a: 40,
                                        b: 60
                                    }, {
                                        y: 'S',
                                        a: 46,
                                        b: 54
                                    }],
                                xkey: 'y',
                                ykeys: ['a', 'b'],
                                labels: ['A', 'B'],
                                barColors: ['#0d99ff', "#F1F3F7"],
                                hideHover: 'auto',
                                gridLineColor: 'transparent',
                                resize: true,
                                barSizeRatio: 0.25,
                                stacked: true,
                                behaveLikeLine: true,
                                //redraw: true

                                // barRadius: [6, 6, 0, 0]
                            });
                        }

                        var areaChart = function () {
                            //area chart
                            Morris.Area({
                                element: 'morris_area',
                                data: [{
                                        period: '2001',
                                        smartphone: 0,
                                        windows: 0,
                                        mac: 0
                                    }, {
                                        period: '2002',
                                        smartphone: 90,
                                        windows: 60,
                                        mac: 25
                                    }, {
                                        period: '2003',
                                        smartphone: 40,
                                        windows: 80,
                                        mac: 35
                                    }, {
                                        period: '2004',
                                        smartphone: 30,
                                        windows: 47,
                                        mac: 17
                                    }, {
                                        period: '2005',
                                        smartphone: 150,
                                        windows: 40,
                                        mac: 120
                                    }, {
                                        period: '2006',
                                        smartphone: 25,
                                        windows: 80,
                                        mac: 40
                                    }, {
                                        period: '2007',
                                        smartphone: 10,
                                        windows: 10,
                                        mac: 10
                                    }


                                ],
                                lineColors: ['#0d99ff', 'rgb(16, 202, 147)', 'rgb(255, 92, 0)'],
                                xkey: 'period',
                                ykeys: ['smartphone', 'windows', 'mac'],
                                labels: ['Phone', 'Windows', 'Mac'],
                                pointSize: 0,
                                lineWidth: 0,
                                resize: true,
                                fillOpacity: 0.95,
                                behaveLikeLine: true,
                                gridLineColor: 'transparent',
                                hideHover: 'auto',
                            });
                        }

                        var areaChart2 = function () {
                            if (jQuery('#morris_area_2').length > 0)
                            {
                                //area chart
                                Morris.Area({
                                    element: 'morris_area_2',
                                    data: [{
                                            period: '2010',
                                            SiteA: 0,
                                            SiteB: 0,
                                        }, {
                                            period: '2011',
                                            SiteA: 130,
                                            SiteB: 100,
                                        }, {
                                            period: '2012',
                                            SiteA: 80,
                                            SiteB: 60,
                                        }, {
                                            period: '2013',
                                            SiteA: 70,
                                            SiteB: 200,
                                        }, {
                                            period: '2014',
                                            SiteA: 180,
                                            SiteB: 150,
                                        }, {
                                            period: '2015',
                                            SiteA: 105,
                                            SiteB: 90,
                                        },
                                        {
                                            period: '2016',
                                            SiteA: 250,
                                            SiteB: 150,
                                        }
                                    ],
                                    xkey: 'period',
                                    ykeys: ['SiteA', 'SiteB'],
                                    labels: ['Site A', 'Site B'],
                                    pointSize: 0,
                                    fillOpacity: 0.6,
                                    pointStrokeColors: ['#b4becb', '#00A2FF'], //here
                                    behaveLikeLine: true,
                                    gridLineColor: 'transparent',
                                    lineWidth: 0,
                                    smooth: false,
                                    hideHover: 'auto',
                                    lineColors: ['rgb(0, 171, 197)', 'rgb(0, 0, 128)'],
                                    resize: true

                                });
                            }
                        }


                        /* Function ============ */
                        return {
                            init: function () {
                                setChartWidth();
                                donutChart();
                                lineChart();
                                lineChart2();
                                barChart();
                                barStalkChart();
                                areaChart();
                                areaChart2();
                            },
                            resize: function () {
                                screenWidth = $(window).width();
                                setChartWidth();
                                donutChart();
                                lineChart();
                                lineChart2();
                                barChart();
                                barStalkChart();
                                areaChart();
                                areaChart2();
                            }
                        }

                    }();
                    jQuery(document).ready(function () {
                        dlabMorris.init();
                        //dlabMorris.resize();

                    });
                    jQuery(window).on('load', function () {
                        //dlabMorris.init();
                    });
                    jQuery(window).resize(function () {
                        //dlabMorris.resize();
                        //dlabMorris.init();
                    });
                })(jQuery);
            </script>

            <script>
                var names = [];
                var timeSpent = [];
                <% for (skill skil
                            : student.getSkillsInProgress()) {%>
                names.push("<%= skil.getName()%>");
                // Convert the timeSpent value from milliseconds to minutes
                var timeSpentInMinutes = <%= skil.getTimeSpent()%>;
                timeSpent.push(timeSpentInMinutes);
                <% }%>

                // Display the final list in the console
                console.log(names);
                console.log(timeSpent);
            </script>

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
                                new Chart(barChart_1, {
                                    type: 'bar',
                                    data: {
                                        defaultFontFamily: 'Poppins',
                                        labels: names,
                                        datasets: [
                                            {
                                                label: "My First dataset",
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
                                barChart_2gradientStroke.addColorStop(0, "rgb(250, 250, 110)");
                                barChart_2gradientStroke.addColorStop(1, "rgb(42, 72, 88)");
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
                                                    return "Temps pass� : " + hours + "h " + minutes + "m " + seconds + "s";
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
                                radar_chart.height = 100;
                                new Chart(radar_chart, {
                                    type: 'radar',
                                    data: {
                                        defaultFontFamily: 'Poppins',
                                        labels: ["Entiers", "D�cimaux", "Fractions", "Conversion", "Proportionnalit�"],
                                        datasets: [
                                            {
                                                label: "",
                                                data: [<%= (int) (((float) nbrCV / 33) * 100)%>, 0, 0, 0, 0],
                                                borderColor: '#000000',
                                                borderWidth: "1",
                                                backgroundColor: "DDD",
                                                pointRadius: 0
                                            }
                                        ]
                                    },
                                    options: {
                                        legend: false,
                                        //maintainAspectRatio: false, 
                                        scale: {
                                            ticks: {
                                                display: false,
                                                max: 100,
                                                stepSize: 25


                                            },
                                            gridLines: {
                                                color: "#DDD",
                                            }

                                        },
                                        tooltips: {
                                            enabled: false // Disable point hover (tooltip)
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
            <script src="vendor/peity/jquery.peity.min.js"></script>
            <script src="js/plugins-init/widgets-script-init.js"></script>
            <script>

                (function ($) {
                    "use strict"


                    /****************
                     Piety chart
                     *****************/
                    var dlabPiety = function () {

                        var getGraphBlockSize = function (selector) {
                            var screenWidth = $(window).width();
                            var graphBlockSize = '100%';
                            if (screenWidth <= 768)
                            {
                                screenWidth = (screenWidth < 300) ? screenWidth : 300;
                                var blockWidth = jQuery(selector).parent().innerWidth() - jQuery(selector).parent().width();
                                blockWidth = Math.abs(blockWidth);
                                var graphBlockSize = screenWidth - blockWidth - 10;
                            }

                            return graphBlockSize;
                        }

                        var handlePietyBarLine = function () {
                            if (jQuery('.bar-line').length > 0) {
                                $(".bar-line").peity("bar", {
                                    width: "100",
                                    height: "100"
                                });
                            }
                        }

                        var handlePietyPie = function () {
                            if (jQuery('span.pie').length > 0) {
                                $("span.pie").peity("pie", {
                                    fill: ['#0d99ff', 'rgba(44, 44, 44, .3)'],
                                    width: "100",
                                    height: "100"
                                });
                            }
                        }

                        var handlePietyDonut = function () {
                            if (jQuery('span.donut').length > 0) {
                                $("span.donut").peity("donut", {
                                    width: "100",
                                    height: "100"
                                });
                            }
                        }

                        var handlePietyLine = function () {
                            if (jQuery('.peity-line').length > 0) {
                                $(".peity-line").peity("line", {
                                    fill: ["rgba(13,153,255,0.5)"],
                                    stroke: '#0d99ff',
                                    width: "100%",
                                    height: "100"
                                });
                            }
                        }

                        var handlePietyLine2 = function () {
                            if (jQuery('.peity-line-2').length > 0) {
                                $(".peity-line-2").peity("line", {
                                    fill: "#0d99ff",
                                    stroke: "#f77f8b",
                                    //width: "100%",
                                    width: getGraphBlockSize('.peity-line-2'),
                                    strokeWidth: "3",
                                    height: "150"
                                });
                            }
                        }

                        var handlePietyLine3 = function () {
                            if (jQuery('.peity-line-3').length > 0) {
                                $(".peity-line-3").peity("line", {
                                    fill: "#673bb7",
                                    stroke: "#ab84f3",
                                    width: "100%",
                                    strokeWidth: "3",
                                    height: "150"
                                });
                            }
                        }

                        var handlePietyBar = function () {
                            if (jQuery('.bar').length > 0) {
                                $(".bar").peity("bar", {
                                    fill: ["#0d99ff", "#ffaa2b", "#3693FF"],
                                    width: "100%",
                                    height: "100",
                                });
                            }
                        }

                        var handlePietyBar1 = function () {
                            if (jQuery('.bar1').length > 0) {
                                $(".bar1").peity("bar", {
                                    fill: ["#0d99ff", "#ffaa2b", "#3693FF"],
                                    //width: "100%",
                                    width: getGraphBlockSize('.bar1'),
                                    height: "140"
                                });
                            }
                        }

                        var handlePietyBarColours1 = function () {
                            if (jQuery('.bar-colours-1').length > 0) {
                                $(".bar-colours-1").peity("bar", {
                                    fill: ["#0d99ff", "#ffaa2b", "#3693FF"],
                                    width: "100",
                                    height: "100"
                                });
                            }
                        }

                        var handlePietyBarColours2 = function () {
                            if (jQuery('.bar-colours-2').length > 0) {
                                $(".bar-colours-2").peity("bar", {
                                    fill: function (t, e, i) {
                                        return "rgb(58, " + parseInt(e / i.length * 122) + ", 254)"
                                    },
                                    width: "100",
                                    height: "100"
                                });
                            }
                        }

                        var handlePietyBarColours3 = function () {
                            if (jQuery('.bar-colours-3').length > 0) {
                                $(".bar-colours-3").peity("bar", {
                                    fill: function (t, e, i) {
                                        return "rgb(16, " + parseInt(e / i.length * 202) + ", 147)"
                                    },
                                    width: "100",
                                    height: "100"
                                });
                            }
                        }

                        var handlePietyColours1 = function () {
                            if (jQuery('.pie-colours-1').length > 0) {
                                $(".pie-colours-1").peity("pie", {
                                    fill: ["cyan", "magenta", "yellow", "black"],
                                    width: "100",
                                    height: "100"
                                });
                            }
                        }

                        var handlePietyColours2 = function () {
                            if (jQuery('.pie-colours-2').length > 0) {
                                $(".pie-colours-2").peity("pie", {
                                    fill: ["#0d99ff", "#ffaa2b", "#3693FF", "#ff5c00", "#EE3C3C"],
                                    width: "100",
                                    height: "100"
                                });
                            }
                        }

                        var handlePietyDataAttr = function () {
                            if (jQuery('.data-attr').length > 0) {
                                $(".data-attr").peity("donut");
                            }
                        }

                        var handlePietyUpdatingChart = function () {
                            var t = $(".updating-chart").peity("line", {
                                fill: ['rgba(13, 153, 255,1)'],
                                stroke: 'rgb(13, 153, 255)',
                                width: "100%",
                                height: 100
                            });
                            setInterval(function () {
                                var e = Math.round(10 * Math.random()),
                                        i = t.text().split(",");
                                i.shift(), i.push(e), t.text(i.join(",")).change()
                            }, 1e3);
                        }

                        /* Function ============ */
                        return {
                            init: function () {
                            },
                            load: function () {
                                handlePietyBarLine();
                                handlePietyPie();
                                handlePietyDonut();
                                handlePietyLine();
                                handlePietyLine2();
                                handlePietyLine3();
                                handlePietyBar();
                                handlePietyBar1();
                                handlePietyBarColours1();
                                handlePietyBarColours2();
                                handlePietyBarColours3();
                                handlePietyColours1();
                                handlePietyColours2();
                                handlePietyDataAttr();
                                handlePietyUpdatingChart();
                            },
                            resize: function () {
                                handlePietyBarLine();
                                handlePietyPie();
                                handlePietyDonut();
                                handlePietyLine();
                                handlePietyLine2();
                                handlePietyLine3();
                                handlePietyBar();
                                handlePietyBar1();
                                handlePietyBarColours1();
                                handlePietyBarColours2();
                                handlePietyBarColours3();
                                handlePietyColours1();
                                handlePietyColours2();
                                handlePietyDataAttr();
                                //handlePietyUpdatingChart();
                            }
                        }

                    }();
                    jQuery(document).ready(function () {



                    });
                    jQuery(window).on('load', function () {
                        setTimeout(function () {
                            dlabPiety.load();
                        }, 1000);
                    });
                    jQuery(window).on('resize', function () {
                        setTimeout(function () {
                            dlabPiety.resize();
                        }, 1000);
                    });
                })(jQuery);
            </script>



<script>

function updateBeltColor() {
    
    var validatedSkillsElements = document.querySelectorAll('.validated-skill');
    var validatedSkills = Array.from(validatedSkillsElements).map(el => el.textContent.trim());
    var beltColor = "blanche"; // Couleur par défaut

    console.log(validatedSkills);
    
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
