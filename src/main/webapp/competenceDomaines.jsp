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
                background: rgba(0, 0, 0, 0.10) url(images/icons8-padlock-50_2.png);    
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
                        <li class="breadcrumb-item "><a href="accuiel">Domaines de compétence</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">${cd}</a></li>
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
                                                <svg  xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" height="80" class="my-2" width="80"  stroke="currentColor" stroke-width="1" fill="none" stroke-linecap="round" stroke-linejoin="round" viewBox="0 0 50 50">
                                                <path d="M 2.84375 3 C 1.285156 3 0 4.285156 0 5.84375 L 0 10.8125 C -0.00390625 10.855469 -0.00390625 10.894531 0 10.9375 L 0 46 C 0 46.550781 0.449219 47 1 47 L 49 47 C 49.550781 47 50 46.550781 50 46 L 50 11 C 50 10.96875 50 10.9375 50 10.90625 L 50 5.84375 C 50 4.285156 48.714844 3 47.15625 3 Z M 2.84375 5 L 47.15625 5 C 47.636719 5 48 5.363281 48 5.84375 L 48 10 L 2 10 L 2 5.84375 C 2 5.363281 2.363281 5 2.84375 5 Z M 2 12 L 48 12 L 48 45 L 2 45 Z M 20.5 17.875 C 18.222656 18.183594 16.261719 19.515625 14.71875 21.84375 C 13.191406 24.148438 12.4375 27.003906 12.4375 30.28125 C 12.4375 32.089844 12.824219 33.542969 13.59375 34.625 C 14.375 35.722656 15.492188 36.355469 16.90625 36.53125 C 16.917969 36.53125 16.925781 36.53125 16.9375 36.53125 C 17.050781 36.53125 17.128906 36.457031 17.15625 36.34375 L 17.34375 35.625 C 17.359375 35.558594 17.351563 35.492188 17.3125 35.4375 C 17.273438 35.378906 17.191406 35.324219 17.125 35.3125 C 16.289063 35.15625 15.714844 34.722656 15.34375 33.96875 C 14.957031 33.1875 14.75 32.175781 14.75 30.9375 C 14.75 29.683594 14.886719 28.351563 15.15625 26.96875 C 15.425781 25.589844 15.800781 24.339844 16.28125 23.28125 C 16.820313 22.078125 17.441406 21.105469 18.15625 20.40625 C 18.855469 19.71875 19.621094 19.296875 20.40625 19.15625 C 20.507813 19.136719 20.574219 19.070313 20.59375 18.96875 L 20.75 18.1875 C 20.765625 18.109375 20.742188 18.027344 20.6875 17.96875 C 20.632813 17.910156 20.578125 17.867188 20.5 17.875 Z M 34.28125 17.875 C 34.152344 17.863281 34.027344 17.9375 34 18.0625 L 33.84375 18.78125 C 33.828125 18.847656 33.835938 18.945313 33.875 19 C 33.914063 19.058594 33.996094 19.082031 34.0625 19.09375 C 34.898438 19.25 35.472656 19.683594 35.84375 20.4375 C 36.230469 21.21875 36.4375 22.261719 36.4375 23.5 C 36.4375 24.753906 36.304688 26.085938 36.03125 27.46875 C 35.757813 28.851563 35.378906 30.097656 34.90625 31.15625 C 34.367188 32.359375 33.714844 33.300781 33 34 C 32.300781 34.6875 31.566406 35.109375 30.78125 35.25 C 30.679688 35.269531 30.582031 35.335938 30.5625 35.4375 L 30.40625 36.25 C 30.390625 36.328125 30.414063 36.410156 30.46875 36.46875 C 30.515625 36.519531 30.589844 36.53125 30.65625 36.53125 C 30.667969 36.53125 30.675781 36.53125 30.6875 36.53125 C 32.964844 36.222656 34.925781 34.890625 36.46875 32.5625 C 37.996094 30.257813 38.75 27.433594 38.75 24.15625 C 38.75 22.347656 38.363281 20.894531 37.59375 19.8125 C 36.8125 18.714844 35.695313 18.050781 34.28125 17.875 Z M 29.75 23.0625 C 29.402344 23.0625 29.003906 23.164063 28.625 23.375 C 28.242188 23.585938 27.871094 23.957031 27.4375 24.5 C 26.988281 25.054688 26.636719 25.5 26.4375 25.84375 C 26.316406 26.050781 26.167969 26.296875 26 26.5625 L 25.9375 26.21875 C 25.902344 26.058594 25.765625 25.605469 25.5625 24.875 C 25.371094 24.1875 25.128906 23.722656 24.78125 23.46875 C 24.441406 23.21875 24 23.09375 23.5 23.09375 C 23.390625 23.09375 23.199219 23.121094 22.625 23.3125 C 22.222656 23.449219 21.753906 23.632813 21.25 23.84375 C 21.179688 23.871094 21.113281 23.925781 21.09375 24 L 20.90625 24.65625 C 20.882813 24.742188 20.90625 24.8125 20.96875 24.875 C 21.03125 24.941406 21.132813 24.964844 21.21875 24.9375 C 21.398438 24.886719 21.605469 24.863281 21.8125 24.8125 C 22.34375 24.679688 22.785156 24.71875 23.0625 24.90625 C 23.179688 24.984375 23.34375 25.203125 23.53125 25.78125 C 23.660156 26.195313 23.792969 26.667969 23.9375 27.21875 L 24.3125 28.65625 C 23.984375 29.234375 23.628906 29.757813 23.25 30.21875 C 22.90625 30.636719 22.632813 30.960938 22.40625 31.1875 C 22.246094 31.136719 22.085938 31.085938 21.9375 31.03125 C 21.710938 30.945313 21.488281 30.90625 21.25 30.90625 C 20.777344 30.90625 20.40625 31.019531 20.125 31.28125 C 19.839844 31.546875 19.6875 31.871094 19.6875 32.25 C 19.6875 32.640625 19.808594 32.960938 20.0625 33.1875 C 20.308594 33.410156 20.601563 33.53125 20.96875 33.53125 C 21.359375 33.53125 21.753906 33.414063 22.125 33.1875 C 22.480469 32.972656 22.867188 32.59375 23.28125 32.09375 C 23.742188 31.535156 24.082031 31.105469 24.28125 30.78125 C 24.402344 30.585938 24.558594 30.371094 24.71875 30.125 C 24.753906 30.261719 24.777344 30.394531 24.8125 30.53125 C 24.894531 30.855469 24.992188 31.242188 25.125 31.71875 C 25.324219 32.433594 25.589844 32.910156 25.9375 33.15625 C 26.277344 33.394531 26.714844 33.5 27.21875 33.5 C 27.601563 33.5 27.949219 33.460938 28.28125 33.375 C 28.613281 33.292969 29.121094 33.109375 29.75 32.84375 C 29.820313 32.8125 29.855469 32.761719 29.875 32.6875 L 30.0625 32.03125 C 30.085938 31.941406 30.070313 31.84375 30 31.78125 C 29.9375 31.714844 29.839844 31.71875 29.75 31.75 C 29.613281 31.800781 29.410156 31.835938 29.15625 31.875 C 28.894531 31.917969 28.671875 31.9375 28.53125 31.9375 C 28.164063 31.9375 27.90625 31.851563 27.6875 31.65625 C 27.457031 31.449219 27.265625 31.167969 27.15625 30.8125 C 27.015625 30.375 26.871094 29.9375 26.75 29.5 C 26.632813 29.085938 26.519531 28.574219 26.375 28 C 26.695313 27.4375 27.042969 26.910156 27.40625 26.4375 C 27.734375 26.003906 28.023438 25.683594 28.28125 25.4375 C 28.40625 25.476563 28.570313 25.511719 28.75 25.5625 C 29.472656 25.761719 30.003906 25.671875 30.5 25.34375 C 30.84375 25.117188 31.023438 24.773438 31.03125 24.3125 C 31.039063 23.945313 30.910156 23.640625 30.65625 23.40625 C 30.40625 23.171875 30.097656 23.0625 29.75 23.0625 Z"></path>
                                                </svg>
                                                <h4 class="my-2">Nombres et Calculs</h4>
                                                <a href="sousCompetence?ci='Nombres et Calculs'" class="btn my-2 btn-primary btn-lg px-4"></i> Commencer</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 mb-4">
                                        <div class="card">
                                            <div class="card-body text-center ai-icon  text-primary">
                                                <svg  class="my-2" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="80" height="80" stroke="currentColor" stroke-width="1" fill="none" stroke-linecap="round" stroke-linejoin="round" viewBox="0 0 32 32">
                                                <path d="M 6 2 C 3.7939453 2 2 3.7944336 2 6 L 2 18 C 2 20.205566 3.7939453 22 6 22 L 13 22 L 13 24 L 11.619141 24 C 10.855469 24 10.169922 24.423828 9.8300781 25.105469 L 8.1054688 28.552734 C 7.9501953 28.862793 7.9677734 29.230469 8.1503906 29.525391 C 8.3330078 29.819824 8.6533203 30 9 30 L 23 30 C 23.34668 30 23.666992 29.819824 23.849609 29.525391 C 24.032227 29.230469 24.049805 28.862793 23.894531 28.552734 L 22.169922 25.105469 C 21.830078 24.422852 21.144531 24 20.380859 24 L 19 24 L 19 22 L 26 22 C 28.206055 22 30 20.205566 30 18 L 30 6 C 30 3.7944336 28.206055 2 26 2 L 6 2 z M 6 4 L 26 4 C 27.102539 4 28 4.8969727 28 6 L 28 18 C 28 19.103027 27.102539 20 26 20 L 22 20 L 22 16 C 22 15.734863 21.894531 15.480469 21.707031 15.292969 L 19.707031 13.292969 C 19.519531 13.105469 19.265625 13 19 13 L 11 13 C 10.447266 13 10 13.447754 10 14 L 10 20 L 6 20 C 4.8974609 20 4 19.103027 4 18 L 4 6 C 4 4.8969727 4.8974609 4 6 4 z M 8 5 C 7.4472656 5 7 5.4477539 7 6 C 6.4472656 6 6 6.4477539 6 7 C 6 7.5522461 6.4472656 8 7 8 L 7 9 C 6.4472656 9 6 9.4477539 6 10 C 6 10.552246 6.4472656 11 7 11 C 7 11.552246 7.4472656 12 8 12 C 8.5527344 12 9 11.552246 9 11 L 10 11 C 10 11.552246 10.447266 12 11 12 C 11.552734 12 12 11.552246 12 11 C 12.552734 11 13 10.552246 13 10 C 13 9.4477539 12.552734 9 12 9 L 12 8 C 12.552734 8 13 7.5522461 13 7 C 13 6.4477539 12.552734 6 12 6 C 12 5.4477539 11.552734 5 11 5 C 10.447266 5 10 5.4477539 10 6 L 9 6 C 9 5.4477539 8.5527344 5 8 5 z M 21 5 C 20.447266 5 20 5.4477539 20 6 C 19.447266 6 19 6.4477539 19 7 C 19 7.5522461 19.447266 8 20 8 L 20 9 C 19.447266 9 19 9.4477539 19 10 C 19 10.552246 19.447266 11 20 11 C 20 11.552246 20.447266 12 21 12 C 21.552734 12 22 11.552246 22 11 L 23 11 C 23 11.552246 23.447266 12 24 12 C 24.552734 12 25 11.552246 25 11 C 25.552734 11 26 10.552246 26 10 C 26 9.4477539 25.552734 9 25 9 L 25 8 C 25.552734 8 26 7.5522461 26 7 C 26 6.4477539 25.552734 6 25 6 C 25 5.4477539 24.552734 5 24 5 C 23.447266 5 23 5.4477539 23 6 L 22 6 C 22 5.4477539 21.552734 5 21 5 z M 9 8 L 10 8 L 10 9 L 9 9 L 9 8 z M 16 8 C 15.621094 8 15.275391 8.2138672 15.105469 8.5527344 L 14.105469 10.552734 C 13.885742 10.991699 14.016602 11.523926 14.414062 11.810547 C 14.589844 11.9375 14.795898 12 15 12 C 15.257812 12 15.513672 11.900879 15.707031 11.707031 L 17.707031 9.7070312 C 17.993164 9.4208984 18.079102 8.991211 17.923828 8.6171875 C 17.769531 8.2436524 17.404297 8 17 8 L 16 8 z M 22 8 L 23 8 L 23 9 L 22 9 L 22 8 z M 12 15 L 17 15 L 17 17 C 17 17.552246 17.447266 18 18 18 L 20 18 L 20 20 L 12 20 L 12 15 z M 19 15.414062 L 19.585938 16 L 19 16 L 19 15.414062 z M 15 22 L 17 22 L 17 26 C 17 26.552246 17.447266 27 18 27 C 18.552734 27 19 26.552246 19 26 L 20.380859 26 L 21.380859 28 L 10.619141 28 L 11.619141 26 L 13 26 C 13 26.552246 13.447266 27 14 27 C 14.552734 27 15 26.552246 15 26 L 15 22 z"></path>
                                                </svg>
                                                <h4 class="my-2">Grandeurs et Mesures</h4>
                                                <a href="afficherCours?c=Decimaux" class="btn my-2 btn-primary btn-lg px-4"> Commencer</a>
                                                <div id="overlay"></div>
                                            </div>
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
