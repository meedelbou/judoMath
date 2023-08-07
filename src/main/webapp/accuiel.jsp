<%-- 
    Document   : accuiel
    Created on : 31 mai 2023, 09:29:10
    Author     : medel
--%>

<%@page import="java.lang.String"%>
<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.util.Base64" %>
<%@ page import ="Models.Student" %>
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
        <title>W3CRM Customer Relationship Management</title>

        <!-- FAVICONS ICON -->
        <link rel="shortcut icon" type="image/png" href="images/favicon.png">
        <link href="https://fonts.googleapis.com/css2?family=Material+Icons" rel="stylesheet">
        <link href="./vendor/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">
        <link href="./css/style.css" rel="stylesheet">

        <style>
            /* (A1) SET RELATIVE POSITION ON CONTAINER */
            /*            #container { position: relative; }*/

            /* (A2) OVERLAY OVER CONTAINER */
            #overlay {
                z-index: 99;
                width: 100%; height: 100%;
                position: absolute; top: 0; left: 0;
                background: rgba(0, 0, 0, 0.1) url(images/icons8-padlock-50_2.png);    
                background-repeat: no-repeat;
                background-position: center;
                z-index: 1;
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
                <a href="index.html" class="brand-logo">
                    <svg class="logo-abbr" width="39" height="23" viewBox="0 0 39 23" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path class="w3" d="M32.0362 22H19.0466L20.7071 18.7372C20.9559 18.2484 21.455 17.9378 22.0034 17.9305L31.1036 17.8093C33.0753 17.6497 33.6571 15.9246 33.7015 15.0821C33.7015 13.2196 32.1916 12.5765 31.4367 12.4878H23.7095L25.9744 8.49673H30.4375C31.8763 8.3903 32.236 7.03332 32.236 6.36814C32.3426 4.93133 30.9482 4.61648 30.2376 4.63865H28.6955C28.2646 4.63865 27.9788 4.19212 28.1592 3.8008L29.7047 0.44798C31.0903 0.394765 32.8577 0.780573 33.5683 0.980129C38.6309 3.42801 37.0988 7.98676 35.6999 9.96014C38.1513 11.9291 38.4976 14.3282 38.3644 15.2816C38.098 20.1774 34.0346 21.8005 32.0362 22Z" fill="var(--primary)"/>
                    <path class="react-w" d="M9.89261 21.4094L0 2.80536H4.86354C5.41354 2.80536 5.91795 3.11106 6.17246 3.59864L12.4032 15.5355C12.6333 15.9762 12.6261 16.5031 12.3842 16.9374L9.89261 21.4094Z" fill="white"/>
                    <path class="react-w" d="M17.5705 21.4094L7.67786 2.80536H12.5372C13.0894 2.80536 13.5954 3.11351 13.8489 3.60412L20.302 16.0939L17.5705 21.4094Z" fill="white"/>
                    <path class="react-w" d="M17.6443 21.4094L28.2751 0H23.4513C22.8806 0 22.361 0.328884 22.1168 0.844686L14.8271 16.2416L17.6443 21.4094Z" fill="white"/>
                    <path class="react-w" d="M9.89261 21.4094L0 2.80536H4.86354C5.41354 2.80536 5.91795 3.11106 6.17246 3.59864L12.4032 15.5355C12.6333 15.9762 12.6261 16.5031 12.3842 16.9374L9.89261 21.4094Z" stroke="white"/>
                    <path class="react-w" d="M17.5705 21.4094L7.67786 2.80536H12.5372C13.0894 2.80536 13.5954 3.11351 13.8489 3.60412L20.302 16.0939L17.5705 21.4094Z" stroke="white"/>
                    <path class="react-w" d="M17.6443 21.4094L28.2751 0H23.4513C22.8806 0 22.361 0.328884 22.1168 0.844686L14.8271 16.2416L17.6443 21.4094Z" stroke="white"/>
                    </svg>
                    <svg class="brand-title" width="47" height="16" viewBox="0 0 47 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M8.36 15.2C7.2933 15.2 6.3 15.0267 5.38 14.68C4.4733 14.32 3.68 13.82 3 13.18C2.3333 12.5267 1.8133 11.76 1.44 10.88C1.0667 9.99999 0.880005 9.03999 0.880005 7.99999C0.880005 6.95999 1.0667 5.99999 1.44 5.11999C1.8133 4.23999 2.34 3.47999 3.02 2.83999C3.7 2.18666 4.49331 1.68666 5.40001 1.33999C6.30671 0.979988 7.3 0.799988 8.38 0.799988C9.5267 0.799988 10.5733 0.999988 11.52 1.39999C12.4667 1.78666 13.2667 2.36666 13.92 3.13999L12.24 4.71999C11.7333 4.17332 11.1667 3.76666 10.54 3.49999C9.9133 3.21999 9.2333 3.07999 8.5 3.07999C7.7667 3.07999 7.0933 3.19999 6.48 3.43999C5.88 3.67999 5.35331 4.01999 4.90001 4.45999C4.46001 4.89999 4.1133 5.41999 3.86 6.01999C3.62 6.61999 3.5 7.27999 3.5 7.99999C3.5 8.71999 3.62 9.37999 3.86 9.97999C4.1133 10.58 4.46001 11.1 4.90001 11.54C5.35331 11.98 5.88 12.32 6.48 12.56C7.0933 12.8 7.7667 12.92 8.5 12.92C9.2333 12.92 9.9133 12.7867 10.54 12.52C11.1667 12.24 11.7333 11.82 12.24 11.26L13.92 12.86C13.2667 13.62 12.4667 14.2 11.52 14.6C10.5733 15 9.52 15.2 8.36 15.2ZM16.4113 15V0.999988H22.1713C23.4113 0.999988 24.4713 1.19999 25.3513 1.59999C26.2446 1.99999 26.9313 2.57332 27.4113 3.31999C27.8913 4.06666 28.1313 4.95332 28.1313 5.97999C28.1313 7.00669 27.8913 7.89329 27.4113 8.63999C26.9313 9.37329 26.2446 9.93999 25.3513 10.34C24.4713 10.7267 23.4113 10.92 22.1713 10.92H17.8513L19.0113 9.73999V15H16.4113ZM25.5713 15L22.0313 9.91999H24.8112L28.3713 15H25.5713ZM19.0113 10.02L17.8513 8.77999H22.0513C23.1979 8.77999 24.0579 8.53329 24.6312 8.03999C25.2179 7.54669 25.5113 6.85999 25.5113 5.97999C25.5113 5.08666 25.2179 4.39999 24.6312 3.91999C24.0579 3.43999 23.1979 3.19999 22.0513 3.19999H17.8513L19.0113 1.91999V10.02ZM31.0402 15V0.999988H33.1802L39.3002 11.22H38.1802L44.2002 0.999988H46.3402L46.3602 15H43.9002L43.8802 4.85999H44.4002L39.2802 13.4H38.1202L32.9202 4.85999H33.5202V15H31.0402Z" fill="black"/>
                    </svg>
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
                                <div class="input-group search-area">
                                    <span class="input-group-text"><a href="javascript:void(0)">
                                            <svg width="19" height="19" viewBox="0 0 19 19" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <circle cx="8.78605" cy="8.78605" r="8.23951" stroke="white" stroke-linecap="round" stroke-linejoin="round"/>
                                            <path d="M14.5168 14.9447L17.7471 18.1667" stroke="white" stroke-linecap="round" stroke-linejoin="round"/>
                                            </svg>

                                        </a></span>
                                    <input type="text" class="form-control" placeholder="Search">
                                </div>
                            </div>
                            <ul class="navbar-nav header-right">
                                <li class="nav-item dropdown notification_dropdown">
                                    <a class="nav-link bell-link" href="javascript:void(0);">
                                        <svg width="20" height="22" viewBox="0 0 22 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M16.9026 6.85114L12.4593 10.4642C11.6198 11.1302 10.4387 11.1302 9.59922 10.4642L5.11844 6.85114" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M15.9089 19C18.9502 19.0084 21 16.5095 21 13.4384V6.57001C21 3.49883 18.9502 1 15.9089 1H6.09114C3.04979 1 1 3.49883 1 6.57001V13.4384C1 16.5095 3.04979 19.0084 6.09114 19H15.9089Z" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                        </svg>
                                    </a>
                                </li>	
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

                                                    <img src="data:image/png;base64,<%=base64Im%>" alt="">
                                                </div>
                                                <div class="header-info">
                                                    <h6>${user.prenom} ${user.nom}</h6>
                                                    <p>${user.email}</p>
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
                                                    <a href="app-profile.html" class="dropdown-item ai-icon ">
                                                        <svg  width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M11.9848 15.3462C8.11714 15.3462 4.81429 15.931 4.81429 18.2729C4.81429 20.6148 8.09619 21.2205 11.9848 21.2205C15.8524 21.2205 19.1543 20.6348 19.1543 18.2938C19.1543 15.9529 15.8733 15.3462 11.9848 15.3462Z" stroke="var(--primary)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M11.9848 12.0059C14.5229 12.0059 16.58 9.94779 16.58 7.40969C16.58 4.8716 14.5229 2.81445 11.9848 2.81445C9.44667 2.81445 7.38857 4.8716 7.38857 7.40969C7.38 9.93922 9.42381 11.9973 11.9524 12.0059H11.9848Z" stroke="var(--primary)" stroke-width="1.42857" stroke-linecap="round" stroke-linejoin="round"/>
                                                        </svg>

                                                        <span class="ms-2">Profile </span>
                                                    </a>
                                                    <a href="app-profile.html" class="dropdown-item ai-icon ">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-pie-chart"><path d="M21.21 15.89A10 10 0 1 1 8 2.83"></path><path d="M22 12A10 10 0 0 0 12 2v10z"></path></svg>

                                                        <span class="ms-2">My Project</span><span class="badge badge-sm badge-secondary light rounded-circle text-white ms-2">4</span>
                                                    </a>
                                                    <a href="javascript:void(0);" class="dropdown-item ai-icon ">
                                                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path d="M17.9026 8.85114L13.4593 12.4642C12.6198 13.1302 11.4387 13.1302 10.5992 12.4642L6.11844 8.85114" stroke="var(--primary)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M16.9089 21C19.9502 21.0084 22 18.5095 22 15.4384V8.57001C22 5.49883 19.9502 3 16.9089 3H7.09114C4.04979 3 2 5.49883 2 8.57001V15.4384C2 18.5095 4.04979 21.0084 7.09114 21H16.9089Z" stroke="var(--primary)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                                        </svg>

                                                        <span class="ms-2">Message </span>
                                                    </a>
                                                    <a href="email-inbox.html" class="dropdown-item ai-icon ">
                                                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M12 17.8476C17.6392 17.8476 20.2481 17.1242 20.5 14.2205C20.5 11.3188 18.6812 11.5054 18.6812 7.94511C18.6812 5.16414 16.0452 2 12 2C7.95477 2 5.31885 5.16414 5.31885 7.94511C5.31885 11.5054 3.5 11.3188 3.5 14.2205C3.75295 17.1352 6.36177 17.8476 12 17.8476Z" stroke="var(--primary)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                                        <path d="M14.3888 20.8572C13.0247 22.372 10.8967 22.3899 9.51947 20.8572" stroke="var(--primary)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                                        </svg>

                                                        <span class="ms-2">Notification </span>
                                                    </a>
                                                </div>
                                                <div class="card-footer px-0 py-2">
                                                    <a href="javascript:void(0);" class="dropdown-item ai-icon ">
                                                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M20.8066 7.62355L20.1842 6.54346C19.6576 5.62954 18.4907 5.31426 17.5755 5.83866V5.83866C17.1399 6.09528 16.6201 6.16809 16.1307 6.04103C15.6413 5.91396 15.2226 5.59746 14.9668 5.16131C14.8023 4.88409 14.7139 4.56833 14.7105 4.24598V4.24598C14.7254 3.72916 14.5304 3.22834 14.17 2.85761C13.8096 2.48688 13.3145 2.2778 12.7975 2.27802H11.5435C11.0369 2.27801 10.5513 2.47985 10.194 2.83888C9.83666 3.19791 9.63714 3.68453 9.63958 4.19106V4.19106C9.62457 5.23686 8.77245 6.07675 7.72654 6.07664C7.40418 6.07329 7.08843 5.98488 6.8112 5.82035V5.82035C5.89603 5.29595 4.72908 5.61123 4.20251 6.52516L3.53432 7.62355C3.00838 8.53633 3.31937 9.70255 4.22997 10.2322V10.2322C4.82187 10.574 5.1865 11.2055 5.1865 11.889C5.1865 12.5725 4.82187 13.204 4.22997 13.5457V13.5457C3.32053 14.0719 3.0092 15.2353 3.53432 16.1453V16.1453L4.16589 17.2345C4.41262 17.6797 4.82657 18.0082 5.31616 18.1474C5.80575 18.2865 6.33061 18.2248 6.77459 17.976V17.976C7.21105 17.7213 7.73116 17.6515 8.21931 17.7821C8.70746 17.9128 9.12321 18.233 9.37413 18.6716C9.53867 18.9488 9.62708 19.2646 9.63043 19.5869V19.5869C9.63043 20.6435 10.4869 21.5 11.5435 21.5H12.7975C13.8505 21.5 14.7055 20.6491 14.7105 19.5961V19.5961C14.7081 19.088 14.9088 18.6 15.2681 18.2407C15.6274 17.8814 16.1154 17.6806 16.6236 17.6831C16.9451 17.6917 17.2596 17.7797 17.5389 17.9393V17.9393C18.4517 18.4653 19.6179 18.1543 20.1476 17.2437V17.2437L20.8066 16.1453C21.0617 15.7074 21.1317 15.1859 21.0012 14.6963C20.8706 14.2067 20.5502 13.7893 20.111 13.5366V13.5366C19.6717 13.2839 19.3514 12.8665 19.2208 12.3769C19.0902 11.8872 19.1602 11.3658 19.4153 10.9279C19.5812 10.6383 19.8213 10.3981 20.111 10.2322V10.2322C21.0161 9.70283 21.3264 8.54343 20.8066 7.63271V7.63271V7.62355Z" stroke="var(--primary)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                                        <circle cx="12.175" cy="11.889" r="2.63616" stroke="var(--primary)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                                        </svg>

                                                        <span class="ms-2">Settings </span>
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
                        <li class="menu-title">E-learning Maths</li>
                        <li><a href="accuiel">
                                <div class="menu-icon">
                                    <i class="fa-solid fa-graduation-cap"></i>  
                                </div>	&nbsp;&nbsp;
                                <span class="nav-text">Catalogue</span>
                            </a>

                        </li>
                        <li><a href="ApprentissageAdaptatif" aria-expanded="false">
                                <div class="menu-icon">
                                    <i class="fa-solid fa-person-chalkboard" ></i>
                                </div>	&nbsp;&nbsp;
                                <span class="nav-text">Apprentissage adaptatif</span>
                            </a>
                        </li>

                        <li><a  href="test" aria-expanded="false">
                                <div class="menu-icon">
                                    <i class="fa-solid fa-list-check"></i>
                                </div>	&nbsp;&nbsp;
                                <span class="nav-text">Test de validation</span>
                            </a>
                        </li>

                    </ul>
                    <div class="help-desk" style="position:fixed; bottom: 20px ">
                        <a href="javascript:void(0)" class="btn btn-primary">Help Desk</a>
                    </div>	
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
                        <li><h5 class="bc-title">Catalogue</h5></li>
                        <li class="breadcrumb-item"><a href="javascript:void(0)">
                                <i class="fa-solid fa-graduation-cap"></i>  
                                Catalogue </a>
                        </li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">Domaines de compétence</a></li>
                    </ol>

                </div>
                <!-- row -->
                <div class="container-fluid">

                    <div class="row">
                        <div class="col-lg-12">


                            <div class="card-body pb-1">
                                <div id="lightgallery" class="row">
                                    <div class="col-lg-3 col-md-6 mb-4">
                                        <div class="card">
                                            <div class="card-body text-center ai-icon  text-primary">
                                                <svg version="1.0" xmlns="http://www.w3.org/2000/svg" height="80" class="my-2" width="80"  stroke="currentColor" stroke-width="1" fill="none" stroke-linecap="round" stroke-linejoin="round" 
                                                     width="80.000000pt" height="80.000000pt" viewBox="0 0 80.000000 80.000000"
                                                     preserveAspectRatio="xMidYMid meet">

                                                <g transform="translate(0.000000,80.000000) scale(0.015625,-0.015625)"
                                                   fill="#000000" stroke="none">
                                                <path d="M2259 4422 c-34 -17 -65 -44 -84 -71 l-30 -43 -3 -1798 -2 -1798 26
                                                      -21 c25 -19 40 -21 195 -21 106 0 177 4 193 12 38 17 46 61 46 261 l0 177 69
                                                      0 69 0 3 -79 c4 -69 8 -85 34 -122 19 -27 51 -54 85 -72 48 -25 63 -28 117
                                                      -24 39 3 76 13 100 27 l37 22 40 -24 c58 -33 164 -33 222 0 l40 24 37 -22 c24
                                                      -14 61 -24 100 -27 54 -4 69 -1 117 24 78 41 110 90 123 192 l11 81 132 0 132
                                                      0 3 -79 c4 -69 8 -85 34 -122 91 -129 289 -129 380 0 26 37 30 53 34 122 l3
                                                      79 74 0 74 0 0 -204 0 -205 26 -20 c25 -19 40 -21 199 -21 159 0 174 2 199 21
                                                      l26 21 -2 1798 -3 1798 -30 43 c-91 129 -289 129 -380 0 l-30 -43 -3 -164 -3
                                                      -164 -74 0 -73 0 -3 79 c-4 69 -8 85 -34 122 -65 93 -190 124 -292 74 l-51
                                                      -26 -36 22 c-20 12 -61 23 -96 26 -51 5 -67 2 -114 -21 l-54 -26 -36 21 c-20
                                                      12 -61 23 -96 26 -51 5 -67 2 -114 -21 l-54 -26 -36 21 c-23 13 -61 23 -99 26
                                                      -54 4 -69 1 -117 -24 -34 -18 -66 -45 -85 -72 -26 -37 -30 -53 -34 -122 l-3
                                                      -79 -284 0 -284 0 0 114 c0 142 -12 210 -48 261 -38 54 -118 95 -187 95 -38 0
                                                      -67 -8 -106 -28z m141 -142 c10 -5 23 -24 29 -41 8 -23 11 -513 11 -1720 l0
                                                      -1689 -70 0 -70 0 0 1710 c0 1697 0 1710 20 1730 22 22 51 26 80 10z m2530 0
                                                      c10 -5 23 -24 29 -41 8 -23 11 -513 11 -1720 l0 -1689 -75 0 -75 0 0 1689 c0
                                                      1150 3 1699 10 1718 18 48 58 66 100 43z m-1500 -170 c30 -16 40 -67 40 -212
                                                      0 -156 -12 -203 -54 -214 -38 -9 -67 5 -82 42 -17 40 -20 297 -4 341 18 48 58
                                                      66 100 43z m300 0 c30 -16 40 -67 40 -212 0 -156 -12 -203 -54 -214 -38 -9
                                                      -67 5 -82 42 -17 40 -20 297 -4 341 18 48 58 66 100 43z m300 0 c30 -16 40
                                                      -67 40 -212 0 -156 -12 -203 -54 -214 -38 -9 -67 5 -82 42 -17 40 -20 297 -4
                                                      341 18 48 58 66 100 43z m300 0 c30 -16 40 -67 40 -212 0 -156 -12 -203 -54
                                                      -214 -38 -9 -67 5 -82 42 -17 40 -20 297 -4 341 18 48 58 66 100 43z m-1159
                                                      -369 c4 -69 8 -85 34 -122 19 -27 51 -54 85 -72 48 -25 63 -28 117 -24 39 3
                                                      76 13 100 27 l37 22 40 -24 c58 -33 165 -33 220 0 l40 24 40 -24 c58 -33 165
                                                      -33 220 0 l40 24 39 -22 c24 -14 63 -24 101 -27 53 -4 68 -1 116 24 34 18 66
                                                      45 85 72 26 37 30 53 34 122 l3 79 74 0 74 0 0 -370 0 -370 -74 0 -74 0 -3 79
                                                      c-4 69 -8 85 -34 122 -65 93 -190 124 -292 74 l-51 -26 -36 22 c-20 12 -61 23
                                                      -96 26 -51 5 -67 2 -114 -21 l-54 -26 -36 21 c-23 13 -61 23 -99 26 -54 4 -69
                                                      1 -117 -24 -34 -18 -66 -45 -85 -72 -26 -37 -30 -53 -34 -122 l-3 -79 -132 0
                                                      -132 0 -11 81 c-13 101 -45 151 -122 191 -103 54 -229 24 -296 -71 -26 -37
                                                      -30 -53 -34 -122 l-3 -79 -69 0 -69 0 0 370 0 370 284 0 284 0 3 -79z m-171
                                                      -531 c30 -16 40 -67 40 -210 0 -75 -5 -151 -11 -169 -18 -52 -72 -68 -109 -31
                                                      -19 19 -20 33 -20 200 0 167 1 181 20 200 22 22 51 26 80 10z m730 0 c30 -16
                                                      40 -67 40 -212 0 -156 -12 -203 -54 -214 -38 -9 -67 5 -82 42 -17 40 -20 297
                                                      -4 341 18 48 58 66 100 43z m300 0 c30 -16 40 -67 40 -212 0 -156 -12 -203
                                                      -54 -214 -38 -9 -67 5 -82 42 -17 40 -20 297 -4 341 18 48 58 66 100 43z m300
                                                      0 c30 -16 40 -67 40 -212 0 -156 -12 -203 -54 -214 -38 -9 -67 5 -82 42 -17
                                                      40 -20 297 -4 341 18 48 58 66 100 43z m-1589 -369 c4 -69 8 -85 34 -122 67
                                                      -95 193 -125 296 -71 77 40 109 90 122 191 l11 81 132 0 132 0 3 -79 c4 -69 8
                                                      -85 34 -122 19 -27 51 -54 85 -72 48 -25 63 -28 117 -24 39 3 76 13 100 27
                                                      l37 22 40 -24 c58 -33 165 -33 220 0 l40 24 39 -22 c24 -14 63 -24 101 -27 53
                                                      -4 68 -1 116 24 34 18 66 45 85 72 26 37 30 53 34 122 l3 79 74 0 74 0 0 -370
                                                      0 -370 -74 0 -74 0 -3 79 c-4 69 -8 85 -34 122 -65 93 -190 124 -292 74 l-51
                                                      -26 -36 22 c-23 13 -60 23 -99 26 -54 4 -69 1 -117 -24 -34 -18 -66 -45 -85
                                                      -72 -26 -37 -30 -53 -34 -122 l-3 -79 -132 0 -132 0 -11 81 c-13 102 -45 151
                                                      -123 192 -48 25 -63 28 -117 24 -39 -3 -76 -13 -99 -26 l-36 -22 -51 26 c-102
                                                      50 -227 19 -292 -74 -26 -37 -30 -53 -34 -122 l-3 -79 -69 0 -69 0 0 370 0
                                                      370 69 0 69 0 3 -79z m259 -531 c30 -16 40 -67 40 -210 0 -75 -5 -151 -11
                                                      -169 -18 -52 -72 -68 -109 -31 -19 19 -20 33 -20 200 0 167 1 181 20 200 22
                                                      22 51 26 80 10z m300 0 c30 -16 40 -67 40 -210 0 -75 -5 -151 -11 -169 -18
                                                      -52 -72 -68 -109 -31 -19 19 -20 33 -20 200 0 167 1 181 20 200 22 22 51 26
                                                      80 10z m730 0 c30 -16 40 -67 40 -212 0 -156 -12 -203 -54 -214 -38 -9 -67 5
                                                      -82 42 -17 40 -20 297 -4 341 18 48 58 66 100 43z m300 0 c30 -16 40 -67 40
                                                      -212 0 -156 -12 -203 -54 -214 -38 -9 -67 5 -82 42 -17 40 -20 297 -4 341 18
                                                      48 58 66 100 43z m-1589 -369 c4 -69 8 -85 34 -122 19 -27 51 -54 85 -72 48
                                                      -25 63 -28 117 -24 39 3 76 13 100 27 l37 22 39 -22 c24 -14 63 -24 101 -27
                                                      53 -4 68 -1 116 24 78 41 110 90 123 192 l11 81 132 0 132 0 3 -79 c4 -69 8
                                                      -85 34 -122 19 -27 51 -54 85 -72 48 -25 63 -28 117 -24 39 3 76 13 100 27
                                                      l37 22 39 -22 c24 -14 63 -24 101 -27 53 -4 68 -1 116 24 34 18 66 45 85 72
                                                      26 37 30 53 34 122 l3 79 74 0 74 0 0 -370 0 -370 -74 0 -74 0 -3 79 c-4 69
                                                      -8 85 -34 122 -91 129 -289 129 -380 0 -26 -37 -30 -53 -34 -122 l-3 -79 -132
                                                      0 -132 0 -11 81 c-13 102 -45 151 -123 192 -48 25 -63 28 -117 24 -38 -3 -76
                                                      -13 -99 -26 l-36 -21 -54 26 c-47 23 -63 26 -114 21 -35 -3 -76 -14 -96 -26
                                                      l-36 -22 -51 26 c-102 50 -227 19 -292 -74 -26 -37 -30 -53 -34 -122 l-3 -79
                                                      -69 0 -69 0 0 370 0 370 69 0 69 0 3 -79z m259 -531 c30 -16 40 -67 40 -210 0
                                                      -75 -5 -151 -11 -169 -18 -52 -72 -68 -109 -31 -19 19 -20 33 -20 200 0 167 1
                                                      181 20 200 22 22 51 26 80 10z m300 0 c30 -16 40 -67 40 -210 0 -75 -5 -151
                                                      -11 -169 -18 -52 -72 -68 -109 -31 -19 19 -20 33 -20 200 0 167 1 181 20 200
                                                      22 22 51 26 80 10z m300 0 c30 -16 40 -67 40 -210 0 -75 -5 -151 -11 -169 -18
                                                      -52 -72 -68 -109 -31 -19 19 -20 33 -20 200 0 167 1 181 20 200 22 22 51 26
                                                      80 10z m730 0 c30 -16 40 -67 40 -212 0 -156 -12 -203 -54 -214 -38 -9 -67 5
                                                      -82 42 -17 40 -20 297 -4 341 18 48 58 66 100 43z"/>
                                                <path d="M1096 4134 c-183 -44 -343 -207 -386 -391 -8 -34 -17 -53 -26 -53
                                                      -29 0 -111 -50 -147 -89 -63 -70 -72 -95 -72 -206 0 -78 4 -107 18 -133 30
                                                      -55 88 -112 141 -140 l51 -27 550 0 550 0 51 27 c53 28 113 87 137 135 21 42
                                                      29 81 28 151 0 75 -23 133 -77 192 -36 40 -118 90 -148 90 -9 0 -18 18 -25 52
                                                      -40 183 -205 348 -392 393 -79 18 -175 18 -253 -1z m9 -224 c-14 -29 -44 -72
                                                      -67 -96 -41 -44 -160 -113 -166 -95 -6 17 48 112 90 157 41 44 160 113 166 95
                                                      2 -5 -9 -33 -23 -61z m311 25 c22 -13 57 -42 77 -64 38 -42 90 -136 85 -152
                                                      -6 -18 -125 51 -166 95 -38 41 -92 133 -92 155 0 13 39 -1 96 -34z m-91 -263
                                                      c56 -49 167 -107 223 -117 39 -6 40 -8 32 -35 -28 -98 -111 -193 -208 -238
                                                      -48 -23 -71 -27 -147 -27 -76 0 -99 4 -145 26 -99 47 -182 141 -210 239 -8 27
                                                      -7 29 32 35 93 16 267 134 307 209 l14 25 27 -37 c15 -21 49 -57 75 -80z
                                                      m-611 -189 c7 -47 54 -140 96 -193 l32 -40 -54 0 c-150 0 -222 142 -125 248
                                                      29 32 44 27 51 -15z m1073 15 c32 -35 43 -63 43 -106 0 -82 -71 -142 -168
                                                      -142 l-53 0 41 54 c42 55 90 160 90 196 0 27 22 25 47 -2z"/>
                                                <path d="M21 3428 c-22 -20 -23 -26 -19 -122 9 -188 90 -358 237 -498 117
                                                      -113 261 -185 408 -206 l48 -7 3 -139 3 -138 -34 -52 c-95 -143 -119 -235
                                                      -121 -458 -1 -219 -8 -212 174 -216 l130 -4 0 -338 0 -339 -53 -19 c-29 -11
                                                      -85 -30 -125 -42 -96 -29 -122 -51 -122 -100 0 -30 6 -43 26 -59 15 -12 36
                                                      -21 48 -21 23 0 306 92 343 111 12 7 27 25 33 42 6 19 10 167 10 398 l0 369
                                                      220 0 220 0 0 -388 c0 -372 1 -390 19 -406 24 -22 323 -126 360 -126 42 0 71
                                                      33 71 80 0 55 -18 67 -163 116 l-122 41 -3 341 -2 340 125 4 c176 4 170 -3
                                                      169 216 -1 121 -6 185 -18 232 -19 75 -66 181 -100 225 -23 30 -24 38 -27 250
                                                      -4 217 -4 221 -32 277 -30 61 -64 95 -131 131 -40 21 -50 22 -371 22 -321 0
                                                      -331 -1 -371 -22 -64 -34 -100 -69 -126 -121 l-24 -48 -63 12 c-200 41 -404
                                                      232 -460 429 -7 22 -16 78 -21 124 -7 65 -14 89 -31 107 -29 31 -77 32 -108 2z
                                                      m1502 -652 c68 -28 72 -44 75 -304 l4 -234 34 -45 c74 -97 100 -176 110 -333
                                                      l7 -110 -527 0 -526 0 0 48 c0 160 37 292 109 387 l40 52 3 229 c3 256 10 283
                                                      71 309 46 20 553 21 600 1z"/>
                                                </g>
                                                </svg>

                                                <h4 class="my-2">Calculer</h4>
                                                <a href="competences?cd='Calculer'" class="btn my-2 btn-primary btn-lg px-4"></i> Commencer</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 mb-4">
                                        <div class="card">
                                            <div class="card-body text-center ai-icon  text-primary">


                                                <svg xmlns="http://www.w3.org/2000/svg"  x="0px" y="0px" height="80" class="my-2" width="80"  stroke="currentColor" stroke-width="1" fill="none" stroke-linecap="round" stroke-linejoin="round" viewBox="0 0 80 80">
                                                <g transform="translate(0.000000,80.000000) scale(0.015625,-0.015625)"
                                                   fill="#000000" stroke="none">
                                                <path d="M1348 5103 c-9 -10 -71 -197 -139 -415 -68 -219 -127 -398 -130 -398
                                                      -3 0 -25 71 -48 157 -23 86 -49 165 -58 175 -14 16 -35 18 -184 18 l-168 0
                                                      -20 -26 c-28 -35 -26 -67 3 -101 24 -27 28 -28 138 -31 l114 -4 69 -256 c37
                                                      -141 72 -265 77 -275 27 -53 107 -58 135 -8 8 14 86 251 172 526 l156 500 242
                                                      3 242 2 20 27 c27 33 27 63 0 97 l-20 26 -293 0 c-266 0 -294 -2 -308 -17z"/>
                                                <path d="M3648 5103 c-22 -25 -198 -395 -198 -415 0 -33 23 -67 53 -78 16 -5
                                                      61 -10 100 -10 51 0 68 -3 64 -12 -3 -7 -31 -68 -62 -135 -42 -89 -56 -128
                                                      -51 -147 13 -50 60 -75 110 -57 23 9 43 42 123 209 102 213 113 252 73 284
                                                      -18 14 -41 18 -111 18 -49 0 -89 2 -89 5 0 3 27 59 60 125 63 126 72 168 44
                                                      208 -20 28 -93 31 -116 5z"/>
                                                <path d="M2589 5035 c-31 -17 -23 2 -218 -511 -78 -203 -141 -380 -141 -393 0
                                                      -31 43 -71 77 -71 47 0 70 25 104 115 l32 85 197 0 196 0 29 -81 c32 -88 60
                                                      -119 106 -119 33 0 66 28 74 62 4 16 -44 157 -149 434 -85 226 -161 423 -167
                                                      438 -23 50 -88 69 -140 41z m116 -432 c32 -87 60 -164 63 -170 3 -10 -26 -13
                                                      -127 -13 -72 0 -131 3 -131 6 0 15 125 334 131 334 3 0 32 -71 64 -157z"/>
                                                <path d="M169 4981 c-33 -27 -31 -82 4 -119 l27 -28 -27 -27 c-33 -32 -36 -86
                                                      -8 -117 27 -30 94 -28 125 5 l24 25 26 -25 c33 -32 91 -34 120 -5 28 28 26 81
                                                      -4 117 l-24 28 24 28 c71 83 -30 184 -113 113 l-28 -24 -28 24 c-35 29 -86 31
                                                      -118 5z"/>
                                                <path d="M4858 4861 c-57 -23 -103 -50 -189 -112 -61 -45 -68 -48 -100 -39
                                                      -19 6 -66 10 -106 10 -66 0 -73 -2 -93 -27 -16 -20 -20 -36 -16 -58 9 -44 36
                                                      -61 110 -68 37 -4 86 -15 109 -25 50 -22 117 -78 117 -98 0 -16 -209 -234
                                                      -322 -336 -90 -81 -90 -81 -145 -9 -76 99 -79 224 -8 340 41 66 42 94 5 131
                                                      -101 101 -252 -174 -208 -380 l13 -65 -53 -74 c-125 -176 -153 -294 -85 -357
                                                      61 -57 185 -20 361 109 l54 39 78 -13 c305 -49 569 212 519 512 -6 35 -11 69
                                                      -12 74 0 6 25 47 56 91 79 114 117 198 117 258 0 41 -5 53 -34 82 -28 28 -41
                                                      34 -77 34 -24 -1 -65 -9 -91 -19z m-113 -633 c-21 -122 -116 -217 -245 -243
                                                      -33 -7 -26 2 105 138 77 79 142 145 143 146 2 0 1 -18 -3 -41z"/>
                                                <path d="M1639 4719 c-105 -16 -188 -90 -220 -197 -15 -53 0 -95 43 -113 49
                                                      -20 79 -3 110 63 31 65 65 88 128 88 32 0 48 -6 70 -29 79 -79 55 -135 -208
                                                      -489 -135 -182 -146 -209 -97 -257 l24 -25 233 0 c257 0 270 3 283 59 5 24
                                                      -12 82 -28 93 -1 0 -68 4 -149 7 l-147 6 111 155 c61 85 125 184 142 220 27
                                                      57 31 76 31 150 0 75 -3 91 -27 131 -63 106 -174 158 -299 138z"/>
                                                <path d="M3216 4049 c-35 -28 -35 -76 0 -119 l27 -31 -27 -28 c-47 -49 -26
                                                      -124 39 -137 22 -4 40 1 69 21 l39 26 21 -20 c12 -12 36 -24 54 -27 26 -5 36
                                                      -1 63 25 26 27 30 37 25 63 -3 18 -15 42 -27 54 l-20 21 26 39 c20 29 25 47
                                                      21 69 -13 65 -88 86 -137 39 l-28 -27 -31 27 c-38 31 -78 33 -114 5z"/>
                                                <path d="M417 4035 c-221 -61 -368 -254 -369 -485 -2 -146 45 -261 147 -362
                                                      193 -194 513 -195 709 -3 275 271 156 744 -213 847 -77 21 -203 23 -274 3z
                                                      m253 -160 c145 -50 239 -197 228 -356 -7 -89 -42 -161 -111 -226 -210 -199
                                                      -564 -62 -585 226 -18 255 226 440 468 356z"/>
                                                <path d="M525 3830 c-45 -17 -50 -36 -50 -177 l0 -135 28 -24 c24 -20 39 -24
                                                      95 -24 37 0 77 3 90 6 23 7 52 50 52 79 0 27 -46 65 -79 65 l-29 0 -3 85 c-3
                                                      68 -8 88 -24 104 -25 24 -54 32 -80 21z"/>
                                                <path d="M4740 3660 c-28 -28 -26 -82 4 -117 l24 -28 -24 -28 c-30 -36 -32
                                                      -89 -4 -117 29 -29 90 -27 120 5 l23 24 29 -24 c34 -29 83 -33 116 -9 33 23
                                                      31 92 -3 124 l-25 24 25 26 c32 33 34 91 5 120 -28 28 -81 26 -118 -5 l-29
                                                      -24 -23 24 c-30 32 -91 34 -120 5z"/>
                                                <path d="M2943 3565 c-53 -27 -145 -109 -205 -184 l-36 -45 -102 48 c-200 94
                                                      -341 130 -510 131 -134 0 -196 -13 -299 -63 -74 -36 -167 -116 -222 -191 l-24
                                                      -33 -55 17 c-76 23 -243 31 -311 15 -187 -44 -314 -180 -369 -395 -66 -257
                                                      -43 -630 66 -1109 24 -106 25 -109 6 -130 -81 -92 -108 -256 -62 -379 40 -106
                                                      133 -197 237 -228 48 -16 53 -28 53 -149 0 -100 24 -224 61 -322 44 -114 96
                                                      -146 153 -93 32 30 34 70 5 126 -11 22 -30 75 -41 117 -19 71 -21 112 -25 498
                                                      l-5 421 42 7 c106 17 235 102 316 209 46 61 126 215 139 270 4 15 11 27 15 27
                                                      4 0 32 -16 61 -36 165 -111 398 -194 649 -230 159 -23 451 -16 603 15 144 29
                                                      292 82 404 143 94 52 245 160 322 231 25 22 46 37 47 31 10 -34 36 -418 46
                                                      -679 8 -232 8 -378 0 -580 -12 -301 -19 -340 -84 -475 -34 -70 -57 -100 -132
                                                      -175 -74 -74 -107 -99 -176 -132 -126 -61 -185 -72 -456 -83 -500 -20 -1120
                                                      -6 -1256 29 -89 23 -182 68 -255 122 -62 47 -102 51 -138 14 -37 -36 -32 -71
                                                      15 -116 48 -46 151 -107 241 -142 135 -54 188 -58 784 -64 820 -8 964 6 1154
                                                      108 208 112 369 315 426 539 14 55 34 241 35 333 0 19 5 27 18 27 38 0 142 62
                                                      185 110 112 124 135 295 61 442 -45 89 -149 173 -240 192 l-30 7 -12 188 c-7
                                                      103 -19 252 -28 331 l-15 143 31 36 c176 209 262 332 330 472 59 122 73 176
                                                      68 274 -3 74 -6 88 -34 127 -88 120 -250 122 -414 4 l-47 -34 -7 60 c-8 78
                                                      -34 135 -78 174 -52 45 -96 57 -197 52 -114 -5 -208 -48 -304 -138 -53 -49
                                                      -67 -58 -67 -42 0 27 -24 81 -50 115 -56 71 -189 90 -287 42z m161 -141 c9 -8
                                                      19 -27 23 -42 12 -42 7 -190 -9 -263 -20 -89 1 -138 59 -139 41 0 54 13 95 94
                                                      114 228 245 350 389 363 52 5 60 3 83 -20 21 -22 26 -35 26 -79 0 -67 -21
                                                      -155 -59 -251 -24 -60 -29 -82 -21 -101 12 -34 53 -59 81 -51 12 4 78 64 148
                                                      134 132 132 212 189 279 198 34 5 42 2 60 -22 26 -33 27 -63 6 -136 -53 -176
                                                      -226 -421 -460 -649 -275 -267 -475 -380 -774 -436 -149 -28 -468 -26 -618 4
                                                      -234 47 -424 131 -576 252 -68 55 -94 70 -120 70 -44 0 -61 -22 -80 -102 -37
                                                      -159 -112 -305 -198 -385 -62 -56 -127 -84 -221 -95 -45 -5 -102 -13 -127 -18
                                                      -28 -5 -47 -5 -51 1 -13 22 -79 383 -95 519 -20 181 -15 441 11 540 35 131 94
                                                      220 177 266 50 27 59 29 168 29 101 0 125 -3 196 -29 52 -18 91 -26 107 -22
                                                      17 4 43 33 82 91 97 146 197 204 367 213 147 7 299 -29 474 -112 l85 -41 -70
                                                      -86 c-79 -98 -147 -160 -208 -189 -74 -35 -94 -90 -48 -135 31 -32 53 -31 122
                                                      3 84 40 199 156 348 347 73 93 155 191 181 216 79 75 135 96 168 63z m-2002
                                                      -2041 l-4 -212 -27 14 c-158 81 -155 317 4 399 16 8 30 14 30 13 1 -1 -1 -97
                                                      -3 -214z m3053 145 c61 -66 71 -161 29 -247 -24 -47 -90 -111 -116 -111 -4 0
                                                      -8 97 -8 216 l0 215 31 -18 c17 -10 46 -35 64 -55z"/>
                                                <path d="M4523 3004 c-52 -12 -53 -17 -53 -451 0 -390 1 -404 20 -423 18 -18
                                                      33 -20 188 -20 194 0 236 10 305 70 60 53 91 125 90 210 0 77 -18 123 -68 179
                                                      l-37 41 18 37 c42 90 24 209 -43 278 -62 64 -108 78 -263 81 -74 1 -145 0
                                                      -157 -2z m299 -193 c35 -39 36 -70 2 -110 -25 -30 -28 -31 -110 -31 l-84 0 0
                                                      91 0 92 82 -5 c76 -5 83 -7 110 -37z m35 -327 c16 -11 36 -36 46 -56 15 -31
                                                      16 -40 5 -74 -8 -24 -26 -47 -47 -61 -30 -20 -46 -23 -132 -23 l-99 0 0 121 0
                                                      121 100 -4 c80 -3 105 -8 127 -24z"/>
                                                <path d="M393 2260 c-34 -14 -43 -42 -43 -128 l0 -80 -91 -4 c-81 -3 -93 -6
                                                      -110 -27 -25 -30 -24 -72 2 -105 19 -25 25 -26 110 -26 l89 0 0 -84 c0 -69 4
                                                      -88 21 -110 28 -35 80 -36 114 -1 23 22 25 32 25 110 l0 85 85 0 c79 0 88 2
                                                      112 26 21 21 24 32 20 62 -10 57 -26 67 -127 70 l-90 4 0 71 c0 94 -7 115 -41
                                                      132 -32 17 -44 18 -76 5z"/>
                                                <path d="M1895 1671 c-105 -44 -118 -272 -19 -350 73 -58 168 17 181 142 7 74
                                                      -12 134 -57 179 -38 38 -64 45 -105 29z"/>
                                                <path d="M3159 1640 c-75 -78 -75 -222 0 -300 51 -54 89 -55 141 -2 77 77 78
                                                      222 1 302 -52 55 -90 55 -142 0z"/>
                                                <path d="M2241 1024 c-28 -36 -26 -62 7 -115 41 -64 124 -134 190 -161 86 -34
                                                      216 -32 295 5 79 36 128 77 171 141 42 64 46 103 13 134 -37 35 -81 29 -113
                                                      -15 -68 -92 -112 -124 -191 -138 -92 -15 -180 33 -261 144 -31 41 -81 44 -111
                                                      5z"/>
                                                </g>
                                                </svg>

                                                <h4 class="my-2">Raisonner</h4>
                                                <a href="afficherCours?c=Decimaux" class="btn my-2 btn-primary btn-lg px-4"> Commencer</a>
                                                <div id="overlay"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 mb-4">
                                        <div class="card">
                                            <div class="card-body text-center ai-icon  text-primary">

                                                <svg version="1.0" xmlns="http://www.w3.org/2000/svg" height="80" class="my-2" width="80"  stroke="currentColor" stroke-width="1" fill="none" stroke-linecap="round" stroke-linejoin="round" 
                                                     width="80.000000pt" height="80.000000pt" viewBox="0 0 80.000000 80.000000"
                                                     preserveAspectRatio="xMidYMid meet">

                                                <g transform="translate(0.000000,80.000000) scale(0.015625,-0.015625)"
                                                   fill="#000000" stroke="none">
                                                <path d="M1255 4966 c-16 -8 -282 -266 -590 -575 l-560 -561 0 -1460 0 -1460
                                                      38 -37 37 -38 1428 -3 c785 -1 1443 0 1462 3 30 5 116 87 593 563 307 306 565
                                                      569 573 584 12 23 14 237 14 1472 0 1099 -3 1451 -12 1471 -26 58 59 55 -1510
                                                      55 -1196 -1 -1448 -3 -1473 -14z m155 -261 l0 -55 110 0 110 0 0 55 0 55 1117
                                                      0 1118 0 -435 -435 -435 -435 -1255 0 -1255 0 435 435 c363 363 439 435 462
                                                      435 27 0 28 -2 28 -55z m2620 -1330 l0 -1225 -55 0 -55 0 0 -88 0 -87 -380
                                                      -380 -380 -380 0 1259 0 1258 432 434 c237 239 433 434 435 434 2 0 3 -551 3
                                                      -1225z m-1090 -1015 l0 -1310 -1153 0 -1153 0 -59 60 c-33 33 -64 60 -70 60
                                                      -6 0 -37 -27 -70 -60 -44 -45 -66 -60 -87 -60 l-28 0 0 1310 0 1310 1310 0
                                                      1310 0 0 -1310z"/>
                                                <path d="M1410 4120 l0 -110 110 0 110 0 0 110 0 110 -110 0 -110 0 0 -110z"/>
                                                <path d="M3280 2035 l0 -115 110 0 110 0 0 115 0 115 -110 0 -110 0 0 -115z"/>
                                                <path d="M1410 3480 l0 -110 110 0 110 0 0 110 0 110 -110 0 -110 0 0 -110z"/>
                                                <path d="M1410 2840 l0 -110 110 0 110 0 0 110 0 110 -110 0 -110 0 0 -110z"/>
                                                <path d="M1410 2200 l0 -110 110 0 110 0 0 110 0 110 -110 0 -110 0 0 -110z"/>
                                                <path d="M2000 2035 l0 -115 110 0 110 0 0 115 0 115 -110 0 -110 0 0 -115z"/>
                                                <path d="M2640 2035 l0 -115 110 0 110 0 0 115 0 115 -110 0 -110 0 0 -115z"/>
                                                <path d="M1332 2007 c-39 -40 -72 -77 -72 -82 0 -6 34 -44 75 -85 l75 -75 80
                                                      80 80 80 -77 77 c-43 43 -80 78 -83 78 -3 0 -38 -33 -78 -73z"/>
                                                <path d="M877 1552 l-77 -77 80 -80 80 -80 75 75 c41 41 75 79 75 85 0 10
                                                      -140 155 -150 155 -3 0 -40 -35 -83 -78z"/>
                                                <path d="M4548 4964 c-36 -19 -48 -43 -48 -99 0 -38 5 -52 29 -76 24 -24 38
                                                      -29 75 -29 l46 0 0 -1250 0 -1250 -46 0 c-37 0 -51 -5 -75 -29 -24 -24 -29
                                                      -38 -29 -76 0 -104 25 -115 262 -115 206 0 223 5 252 63 38 78 -12 157 -100
                                                      157 l-44 0 0 1250 0 1250 44 0 c110 0 155 132 68 200 -23 18 -41 20 -216 20
                                                      -149 -1 -197 -4 -218 -16z"/>
                                                <path d="M170 657 c-61 -21 -70 -54 -70 -262 0 -161 2 -183 20 -212 21 -36 74
                                                      -56 121 -46 43 8 79 56 79 104 l0 39 1250 0 1250 0 0 -40 c0 -30 7 -48 29 -72
                                                      26 -29 35 -33 81 -33 46 0 55 4 81 33 l29 32 0 193 c0 173 -2 195 -20 224 -51
                                                      84 -200 35 -200 -66 l0 -41 -1250 0 -1250 0 0 43 c0 51 -21 84 -66 103 -39 16
                                                      -39 16 -84 1z"/>
                                                </g>
                                                </svg>
                                                <h4 class="my-2">Modéliser</h4>
                                                <a href="afficherCours?c=Fraction" class="btn my-2 btn-primary btn-lg px-4"></i>Commencer</a>
                                                <div id="overlay"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 mb-4">
                                        <div class="card">
                                            <div class="card-body text-center ai-icon  text-primary">




                                                <svg version="1.0" xmlns="http://www.w3.org/2000/svg" height="80" class="my-2" width="80"  stroke="currentColor" stroke-width="1" fill="none" stroke-linecap="round" stroke-linejoin="round"
                                                     viewBox="0 0 80.000000 80.000000"
                                                     preserveAspectRatio="xMidYMid meet">

                                                <g transform="translate(0.000000,80.000000) scale(0.015625,-0.015625)"
                                                   fill="#000000" stroke="none">
                                                <path d="M1069 4910 c-221 -34 -409 -172 -511 -373 -94 -188 -91 -438 9 -630
                                                      51 -98 182 -229 280 -280 79 -41 203 -77 267 -77 72 0 82 -8 121 -82 68 -128
                                                      119 -168 215 -168 94 0 139 36 214 172 40 74 40 74 147 82 211 16 424 166 524
                                                      369 195 394 -13 854 -440 974 -50 14 -118 17 -415 19 -195 1 -380 -2 -411 -6z
                                                      m763 -161 c143 -30 288 -138 355 -265 139 -261 42 -582 -217 -718 -73 -39
                                                      -175 -66 -248 -66 -51 0 -110 -28 -143 -68 -13 -15 -42 -60 -64 -100 -57 -103
                                                      -77 -102 -135 3 -75 136 -99 153 -247 171 -241 30 -403 164 -470 388 -22 75
                                                      -19 216 6 297 53 168 206 312 377 353 75 18 704 22 786 5z"/>
                                                <path d="M1094 4298 c-22 -10 -44 -47 -44 -73 0 -8 11 -26 23 -41 43 -50 116
                                                      -29 132 38 6 22 1 33 -23 58 -32 31 -52 36 -88 18z"/>
                                                <path d="M1413 4300 c-46 -19 -56 -74 -20 -116 46 -54 127 -25 129 46 1 25 -6
                                                      39 -26 57 -29 24 -47 27 -83 13z"/>
                                                <path d="M1715 4285 c-43 -42 -28 -103 28 -124 77 -30 135 77 71 128 -35 28
                                                      -69 26 -99 -4z"/>
                                                <path d="M3275 4905 c-322 -62 -546 -317 -562 -640 -7 -131 13 -222 73 -345
                                                      100 -201 311 -350 522 -366 108 -8 107 -8 147 -81 75 -136 121 -173 215 -173
                                                      96 0 147 40 215 168 39 74 49 82 121 82 64 0 188 36 267 77 109 57 232 183
                                                      285 293 53 109 72 191 72 311 0 313 -200 577 -505 665 -51 14 -115 17 -420 20
                                                      -273 2 -377 0 -430 -11z m776 -155 c181 -34 346 -184 401 -365 58 -189 7 -389
                                                      -137 -530 -94 -93 -239 -154 -370 -155 -55 -1 -117 -31 -147 -71 -14 -19 -41
                                                      -64 -61 -100 -57 -105 -74 -103 -139 14 -66 117 -116 157 -200 157 -74 0 -175
                                                      27 -249 66 -314 165 -376 589 -123 840 67 66 158 118 247 140 65 15 698 19
                                                      778 4z"/>
                                                <path d="M3306 4289 c-64 -51 -6 -158 71 -128 56 21 71 82 28 124 -30 30 -64
                                                      32 -99 4z"/>
                                                <path d="M3624 4287 c-54 -46 -23 -130 47 -130 33 0 79 39 79 68 0 27 -23 63
                                                      -47 74 -35 16 -49 14 -79 -12z"/>
                                                <path d="M3938 4280 c-24 -25 -29 -36 -23 -58 16 -67 89 -88 132 -38 26 30 28
                                                      44 12 79 -11 25 -47 47 -75 47 -9 0 -29 -14 -46 -30z"/>
                                                <path d="M1240 3193 c-195 -30 -450 -123 -485 -176 -9 -14 -15 -38 -13 -52 2
                                                      -23 -6 -33 -53 -66 -50 -36 -59 -39 -84 -29 -16 6 -40 8 -53 5 -47 -12 -194
                                                      -171 -277 -301 -84 -131 -172 -342 -190 -454 -4 -25 -16 -61 -27 -80 -62 -107
                                                      -77 -260 -36 -368 19 -50 23 -84 28 -287 6 -199 10 -239 29 -300 79 -247 300
                                                      -428 550 -451 60 -6 71 -10 66 -23 -39 -99 -57 -177 -62 -266 -8 -156 -97
                                                      -139 771 -143 516 -2 739 1 758 9 39 16 52 56 43 136 -18 165 -86 335 -191
                                                      473 l-56 74 23 16 c271 177 432 409 501 725 8 38 13 128 12 250 -1 223 -18
                                                      337 -69 464 l-33 84 23 19 c62 48 86 188 46 266 -10 21 -57 73 -103 117 -186
                                                      179 -439 306 -697 349 -87 15 -350 20 -421 9z m1024 -875 c55 -115 71 -212 71
                                                      -433 0 -154 -4 -204 -19 -265 -46 -181 -127 -320 -259 -447 -176 -169 -386
                                                      -253 -632 -253 -174 0 -327 42 -478 131 -98 57 -247 209 -309 314 -115 194
                                                      -154 432 -109 652 39 189 114 289 260 349 l56 24 692 0 692 0 35 -72z m-1888
                                                      -263 c-3 -9 -11 -57 -17 -108 -12 -100 -6 -240 15 -330 13 -54 12 -57 -6 -57
                                                      -32 0 -84 27 -126 65 -117 105 -115 279 3 383 57 50 144 81 131 47z m747
                                                      -1249 c204 -59 419 -57 632 8 l49 15 28 -32 c99 -115 173 -253 202 -376 l14
                                                      -61 -99 0 -99 0 0 94 c0 90 -1 96 -26 115 -33 26 -65 27 -95 2 -22 -17 -24
                                                      -29 -27 -115 l-4 -96 -284 0 -284 0 0 90 c0 83 -2 93 -25 115 -31 32 -69 32
                                                      -100 0 -23 -22 -25 -32 -25 -115 l0 -90 -95 0 c-111 0 -108 -4 -74 106 25 82
                                                      58 148 112 228 37 55 105 136 113 136 2 0 41 -11 87 -24z"/>
                                                <path d="M1023 1980 c-33 -14 -43 -42 -43 -125 0 -67 3 -79 25 -100 30 -30 64
                                                      -32 99 -4 24 19 26 26 26 104 0 64 -4 87 -17 103 -21 25 -60 35 -90 22z"/>
                                                <path d="M2073 1966 c-26 -23 -28 -29 -28 -106 0 -77 2 -83 28 -106 36 -31 71
                                                      -31 102 1 22 21 25 32 25 102 -1 81 -8 101 -47 121 -32 17 -49 15 -80 -12z"/>
                                                <path d="M1414 1878 c-54 -26 -55 -90 -2 -139 75 -68 186 -88 276 -49 57 25
                                                      122 89 122 121 0 26 -52 79 -78 79 -10 0 -37 -13 -60 -29 -62 -45 -111 -46
                                                      -167 -1 -40 32 -57 35 -91 18z"/>
                                                <path d="M3451 3184 c-174 -30 -360 -106 -521 -212 -100 -67 -244 -201 -271
                                                      -254 -40 -78 -16 -218 46 -266 l23 -19 -33 -84 c-43 -106 -64 -226 -72 -404
                                                      -10 -238 20 -401 107 -580 91 -190 218 -331 409 -455 l23 -16 -56 -74 c-105
                                                      -138 -173 -308 -191 -473 -9 -80 4 -120 43 -136 19 -8 242 -11 758 -9 851 3
                                                      774 -8 774 112 0 154 -79 363 -195 515 -31 40 -55 74 -53 76 2 1 31 21 65 43
                                                      133 90 267 242 339 383 l34 69 48 0 c149 0 286 92 356 239 29 62 31 73 31 181
                                                      0 111 -1 117 -34 180 -18 36 -42 101 -53 145 -64 266 -232 549 -421 709 -59
                                                      49 -108 55 -138 16 -37 -49 -27 -73 79 -184 135 -140 210 -253 276 -415 l25
                                                      -63 -22 6 c-12 3 -48 9 -79 12 -56 7 -57 7 -92 63 -64 104 -167 186 -292 233
                                                      -59 23 -63 23 -797 28 l-739 5 -19 24 c-10 13 -19 32 -19 42 0 25 57 87 147
                                                      159 186 150 400 236 651 262 193 19 417 -18 589 -97 88 -41 110 -43 147 -14
                                                      35 28 36 81 2 112 -33 31 -179 89 -306 122 -93 24 -127 28 -295 31 -135 2
                                                      -214 -1 -274 -12z m862 -803 c20 -6 65 -31 99 -54 129 -89 188 -226 196 -460
                                                      3 -76 0 -153 -7 -190 -69 -361 -329 -643 -679 -734 -132 -34 -306 -36 -436 -4
                                                      -330 80 -581 323 -678 657 -21 71 -23 100 -23 289 0 166 4 226 18 285 16 68
                                                      64 188 87 215 13 16 1373 13 1423 -4z m537 -349 c52 -32 105 -112 115 -174 22
                                                      -129 -71 -269 -199 -298 -20 -4 -36 -7 -36 -6 0 0 7 35 16 76 18 86 20 297 4
                                                      379 -5 29 -10 56 -10 59 0 12 69 -11 110 -36z m-1410 -1238 c180 -46 371 -42
                                                      558 12 l87 26 47 -53 c90 -102 172 -263 193 -381 l7 -38 -96 0 -96 0 0 90 c0
                                                      83 -2 93 -25 115 -30 30 -64 32 -99 4 -25 -19 -26 -25 -26 -115 l0 -94 -285 0
                                                      -285 0 0 90 c0 83 -2 93 -25 115 -32 33 -74 33 -106 -1 -21 -22 -24 -37 -27
                                                      -115 l-4 -89 -90 0 -91 0 7 46 c3 25 19 79 36 120 50 125 179 308 210 297 8
                                                      -2 58 -16 110 -29z"/>
                                                <path d="M2973 1979 c-37 -13 -53 -49 -53 -116 0 -73 13 -107 47 -122 34 -16
                                                      47 -14 77 10 24 19 26 26 26 103 0 90 -13 120 -53 128 -13 3 -33 1 -44 -3z"/>
                                                <path d="M4034 1975 c-39 -16 -44 -30 -44 -121 0 -66 3 -78 25 -99 13 -14 36
                                                      -25 50 -25 14 0 37 11 50 25 22 21 25 32 25 102 -1 48 -6 85 -14 95 -21 28
                                                      -58 38 -92 23z"/>
                                                <path d="M3370 1883 c-33 -12 -50 -37 -50 -74 0 -32 6 -43 42 -74 106 -90 267
                                                      -82 356 20 38 43 40 65 9 101 -29 34 -77 37 -110 7 -55 -50 -111 -53 -164 -9
                                                      -32 26 -61 37 -83 29z"/>
                                                </g>
                                                </svg>

                                                <h4 class="my-2">Communiquer</h4>
                                                <a href="afficherCours?c=Conversion" class="btn my-2 btn-primary btn-lg px-4"></i> Commencer</a>
                                            </div>
                                            <div id="overlay"></div>
                                        </div>
                                    </div>


                                </div>
                            </div>

                            <!-- /# card -->
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
                    <p>Copyright © Developed by <a href="https://dexignzone.com/" target="_blank">DexignZone</a> 2023</p>
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
        <script src="./vendor/global/global.min.js"></script>
        <script src="./vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
        <script src="./js/custom.js"></script>
        <script src="./js/deznav-init.js"></script>


    </body>
</html>
