<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Locale"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import ="java.util.Base64" %>
<%@ page import ="Models.Student" %>
<%@ page import ="Models.Teacher" %>
<%@ page import ="java.util.List" %>
<%@ page import ="java.util.ArrayList" %>

<%List<Student> etudiants = (List<Student>) session.getAttribute("etudiants");%>
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
        <link href="./vendor/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">
        <link href="./vendor/datatables/css/jquery.dataTables.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/buttons/1.6.4/css/buttons.dataTables.min.css" rel="stylesheet">
        <link href="vendor/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet">

        <!-- tagify-css -->

        <link href="./vendor/tagify/dist/tagify.css" rel="stylesheet">
        <!-- Style css -->
        <link href="./css/style.css" rel="stylesheet">

    </head>
    <body data-typography="poppins" data-theme-version="light" data-layout="vertical" data-nav-headerbg="black" data-headerbg="color_1">

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
                                                        Teacher user = (Teacher) session.getAttribute("user");

                                                        String base64Im = Base64.getEncoder().encodeToString(user.getProfilePicture());

                                                    %>

                                                    <img src="data:image/png;base64,<%=base64Im%>" alt="">
                                                </div>
                                             

                                            </div>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-end" style="">
                                            <div class="card border-0 mb-0">
                                                <div class="card-header py-2">
                                                    <div class="products">
                                                        <img src="data:image/png;base64,<%=base64Im%>"  class="avatar avatar-md" alt="">
                                                        <div>
                                                    
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
                        <li class="menu-title">JudoMath</li>
                        <li><a class="has-arrow " href="javascript:void(0);" aria-expanded="false">
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
                    <div class="help-desk" style="position:fixed; bottom: 20px " >
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
                <!-- row -->	
                <div class="page-titles">
                    <ol class="breadcrumb">
                        <li><h5 class="bc-title">Tableau de bord</h5></li>
                        <li class="breadcrumb-item"><a href="javascript:void(0)">
                                <svg width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M2.125 6.375L8.5 1.41667L14.875 6.375V14.1667C14.875 14.5424 14.7257 14.9027 14.4601 15.1684C14.1944 15.4341 13.8341 15.5833 13.4583 15.5833H3.54167C3.16594 15.5833 2.80561 15.4341 2.53993 15.1684C2.27426 14.9027 2.125 14.5424 2.125 14.1667V6.375Z" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M6.375 15.5833V8.5H10.625V15.5833" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round"/>
                                </svg>
                                Etudiants </a>
                        </li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">Etudiants</a></li>
                    </ol>
                    <a class="text-primary fs-13" data-bs-toggle="offcanvas" href="#offcanvasExample1" role="button" aria-controls="offcanvasExample1">+ Add Task</a>
                </div>
                <div class="container-fluid">
                   
                    <div class="row">
                        <div class="col-xl-12 bst-seller">

                            <div class="card">
                                <div class="card-body p-0">
                                    <div class="table-responsive active-projects style-1 dt-filter exports">
                                        <div class="tbl-caption">
                                        </div>
                                        <table id="customer-tbl" class="table shorting">
                                            <thead>
                                                <tr>
                                                    <th class="">
                                                        Acces
                                                        <div class="form-check custom-checkbox ms-0" >
                                                            <input type="checkbox" class="form-check-input" id="checkAll" required="">
                                                            <label class="form-check-label" for="checkAll"></label>
                                                        </div>
                                                    </th>

                                                    <th>Nom complet</th>
                                                    <th>Email</th>
                                                    <th>Points XP</th>
                                                    <th>Nombre de visites</th>
                                                    <th>Derniere visite</th>
                                                    <th>Date d'inscription</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody >
                                                <%
                                                    SimpleDateFormat inputFormat = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy", Locale.ENGLISH);
                                                    SimpleDateFormat outputFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm");

                                                    List<Integer> list = new ArrayList();

                                                    for (Student etudiant : etudiants) {
                                                        list.add(etudiant.getNumberOfVisits());

                                                        String base64Image = Base64.getEncoder().encodeToString(etudiant.getProfilePicture());


                                                %>


                                                <tr>
                                                    <td>
                                                        <div class="form-check custom-checkbox">
                                                            <% String check = etudiant.isAccesToTest() ? "checked" : "";%>
                                                            <!--<a href="#" class="btn btn-primary shadow btn-xs sharp me-1"><i class="fas fa-pencil-alt"></i></a>-->
                                                            <input type="checkbox" class="form-check-input myCheckbox" data-email="<%=etudiant.getEmail()%>" <%= etudiant.isAccesToTest() ? "checked" : ""%>>
                                                            <label class="form-check-label" for="customCheckBox2"></label>
                                                        </div>
                                                    </td>

                                                    <td>
                                                        <div class="products">
                                                            <% if (!base64Image.equals("")) {%>
                                                            <img src="data:image/jpeg;base64,<%=base64Image%>" class="avatar avatar-md" alt="">
                                                            <% } else {%>
                                                            <img src="images/contacts/pic1.jpg" class="avatar avatar-md" alt="">


                                                            <% }%>
                                                            <div>
                                                                <h6><a href="profilEtudiant?e=<%=etudiants.indexOf(etudiant)%>"><strong><%=etudiant.getNom()%> <%=etudiant.getPrenom()%></strong></a></h6>
                                                                <span><%=etudiant.getRole()%></span>	
                                                            </div>	
                                                        </div>
                                                    </td>
                                                    <td ><span><%=etudiant.getEmail()%> </span></td>
                                                    <td style="text-align:center"><%=etudiant.getExperiencePoints()%></strong></td>
                                                    <td style="text-align:center">
                                                        <span><%= etudiant.getNumberOfVisits()%></span>
                                                    </td>
                                                    <td>
                                                        <span><%=outputFormat.format(etudiant.getLastLogin())%></span>
                                                    </td>	
                                                    <td>
                                                        <span><%=outputFormat.format(etudiant.getDateOfSignup())%></span>
                                                    </td>
                                                    <td>
                                                        <span class="badge light border-0 status-span" data-email="<%= etudiant.getEmail()%>"></span>

                                                    </td>
                                                </tr>






                                                <%}%> 

                                            </tbody>

                                        </table>
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
            <div class="footer">
                <div class="copyright">
                    <p>Copyright Â© Developed by <a href="https://dexignzone.com/" target="_blank">DexignZone</a> 2023</p>
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
        <script src="./vendor/apexchart/apexchart.js"></script>
        <!-- Dashboard 1 -->
        <script src="./vendor/tagify/dist/tagify.js"></script>
        <!-- tagify -->


        <script src="./vendor/datatables/js/jquery.dataTables.min.js"></script>
        <script src="./vendor/datatables/js/dataTables.buttons.min.js"></script>
        <script src="./vendor/datatables/js/buttons.html5.min.js"></script>
        <script src="./vendor/datatables/js/jszip.min.js"></script>
        <script src="./js/plugins-init/datatables.init.js"></script>

        <!-- Apex Chart -->

        <script src="vendor/bootstrap-datetimepicker/js/moment.js"></script>
        <script src="vendor/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
        <!-- Vectormap -->

        <script src="./js/custom.js"></script>
        <script src="./js/deznav-init.js"></script>



        <script>
            $(document).ready(function () {

                document.getElementById('checkAll').addEventListener('change', function (event) {
                    var em = "<%= user.getEmail()%>";
                    $.ajax({
                        url: 'grantAcces',
                        type: 'POST',
                        data: {emailEnseignant: em, grantAccessAll: true},
                        success: function (response) {
                            console.log('Checkbox state updated successfully.');
                        },
                        error: function (xhr, status, error) {
                            console.log('Error updating checkbox state: ' + error);
                        }
                    });

                });

                document.addEventListener('change', function (event) {
                    if (event.target.classList.contains('myCheckbox')) {
                        var checkbox = event.target;
                        var isChecked = checkbox.checked;
                        var email = checkbox.dataset.email;

                        // Send the checkbox state to the server using AJAX
                        $.ajax({
                            url: 'grantAcces',
                            type: 'POST',
                            data: {isChecked: isChecked, emailStudent: email},
                            success: function (response) {
                                console.log('Checkbox state updated successfully.');
                            },
                            error: function (xhr, status, error) {
                                console.log('Error updating checkbox state: ' + error);
                            }
                        });
                    }



                });
            });





        </script>
        <script>
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
                                statusSpan.text( '\u00A0' + " En Ligne " + '\u00A0');
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


    </body>
</html>
