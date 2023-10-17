<%-- 
    Document   : accuiel
    Created on : 31 mai 2023, 09:29:10
    Author     : medel
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            /* (A1) SET RELATIVE POSITION ON CONTAINER */
            /*            #container { position: relative; }*/

            /* (A2) OVERLAY OVER CONTAINER */
            #overlay {
                z-index: 1;
                width: 100%; height: 100%;
                position: absolute; top: 0; left: 0;
                background: rgba(0, 0, 0, 0.5) url(images/icons8-padlock-50.png);    
                background-repeat: no-repeat;
                background-position: center;
            }

            .base-timer {

                position: relative;
                width: 50px;
                height: 50px;
            }

            .base-timer__svg {
                transform: scaleX(-1);
            }

            .base-timer__circle {
                fill: none;
                stroke: none;
            }

            .base-timer__path-elapsed {
                stroke-width: 3px;
                stroke: grey;
            }

            .base-timer__path-remaining {
                stroke-width: 3px;
                stroke-linecap: round;
                transform: rotate(90deg);
                transform-origin: center;
                transition: 1s linear all;
                fill-rule: nonzero;
                stroke: currentColor;
            }

            .base-timer__path-remaining.green {
                color: rgb(65, 184, 131);
            }

            .base-timer__path-remaining.orange {
                color: orange;
            }

            .base-timer__path-remaining.red {
                color: red;
            }

            .base-timer__label {
                position: absolute;
                width: 50px;
                height: 50px;
                top: 0;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 12px;
            }
            .timer-container {
                display: flex;
                align-items: center;
                justify-content: flex-start;
            }

            #timer-msg {
                margin-right: 10px; /* Adjust the margin as desired */
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
        Chat box start
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
                                                        boolean isTimer = false;
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

                        <li>
                            <a href="choisirComp"  aria-expanded="false">
                                <div class="menu-icon">
                                    <i class="fa-solid fa-person-chalkboard" ></i>
                                </div>	&nbsp;&nbsp;
                                <span class="nav-text">S'entraîner</span>
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
                <audio id="myAudio" style="display:none">
                    <source src="">
                    Votre navigateur ne prend pas en charge l'élément audio.
                </audio>    
                <div class="page-titles">
                    <ol class="breadcrumb">
                        <li><h5 class="bc-title">Entraînement</h5></li>
                        <li class="breadcrumb-item"><a href="choisirComp">
                                <i class="fa-solid fa-person-chalkboard" ></i>
                                Judomath </a>
                        </li>    
                        <li class="breadcrumb-item "><a href="choisirComp">S'entraîner</a></li>



                        <li class="breadcrumb-item active"><a href="javascript:void(0)">Entraînement</a></li>
                    </ol>

                    <span id="xpPoints">XP : ${user.experiencePoints}</span>

                </div>
                <!-- row -->
                <div class="container-fluid">
                    <%                Lesson lesson = (Lesson) session.getAttribute("lesson");
                    %>


                    <div class="col-xl-12 col-xxl-12">



                        <div class='card'>
                            <div class="card-header">

                                <h2 > 
                                    <svg width="35" height="35" aria-hidden="true" viewBox="0 0 18 18"><path fill="currentColor" d="M11.879 16.244 10.864 18H7.132l-1.014-1.756h5.76ZM8.999 0c3.684 0 6.672 2.978 6.672 6.652a6.643 6.643 0 0 1-3.199 5.68l-.044.027v2.744H5.582v-2.736l-.016-.01a6.646 6.646 0 0 1-3.24-5.62v-.085C2.325 2.978 5.313 0 8.998 0Zm0 1.756c-2.717 0-4.918 2.193-4.918 4.896a4.894 4.894 0 0 0 2.762 4.402l.494.24v2.052h3.335V11.29l.492-.241a4.887 4.887 0 0 0 2.75-4.397c.001-2.703-2.2-4.896-4.916-4.896Zm.216 2.229-.493 1.9h2.449l-.91 3.827H8.456l.492-2.07H6.453L7.4 3.985h1.814Z"></path></svg>
                                    Apprendre : ${c}   <div id="palier" style="display:inline-block"></div></h2>

                            </div> 

                        </div>  




                        <div class="row">
                            <div class="col-xl-6 col-xxl-6">
                                <div class="card">
                                    <div class="card-header">
                                        <h3><svg style="margin-right:8px;" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="50" height="50" viewBox="0,0,256,256">
                                            <g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><g transform="scale(5.33333,5.33333)"><path d="M40,40c-6.9,0 -16,4 -16,4v-22c0,0 9,-4 18,-4z" fill="#339af0"></path><path d="M8,40c6.9,0 16,4 16,4v-22c0,0 -9,-4 -18,-4z" fill="#339af0"></path><path d="M24,4c-4.41828,0 -8,3.58172 -8,8c0,4.41828 3.58172,8 8,8c4.41828,0 8,-3.58172 8,-8c0,-4.41828 -3.58172,-8 -8,-8zM41,32h1c0.6,0 1,-0.4 1,-1v-4c0,-0.6 -0.4,-1 -1,-1h-1c-1.7,0 -3,1.3 -3,3v0c0,1.7 1.3,3 3,3zM7,26h-1c-0.6,0 -1,0.4 -1,1v4c0,0.6 0.4,1 1,1h1c1.7,0 3,-1.3 3,-3v0c0,-1.7 -1.3,-3 -3,-3z" fill="#20c997"></path></g></g>
                                            </svg> Les notions à retenir </h3>
                                    </div>
                                    <div class="card-body">

                                        <p><%= lesson.getContent()%></p> 


                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6 col-xxl-6">
                                <div class="card">
                                    <div class="card-header">
                                        <h3> <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="50" height="50" viewBox="0 0 48 48" style="margin-right:10px;">
                                            <path fill="#8fcae6" d="M42,22H6c-0.553,0-1,0.447-1,1v2c0,0.553,0.447,1,1,1h36c0.553,0,1-0.447,1-1v-2	C43,22.447,42.553,22,42,22z"></path><path fill="#8fcae6" d="M8,14H5c-0.553,0-1,0.447-1,1v18c0,0.553,0.447,1,1,1h3c0.553,0,1-0.447,1-1V15	C9,14.447,8.553,14,8,14z"></path><path fill="#8fcae6" d="M6,17H1c-0.553,0-1,0.447-1,1v12c0,0.553,0.447,1,1,1h5c0.553,0,1-0.447,1-1V18	C7,17.447,6.553,17,6,17z"></path><path fill="#324561" d="M4,32c-0.553,0-1-0.447-1-1V17c0-0.553,0.447-1,1-1s1,0.447,1,1v14C5,31.553,4.553,32,4,32z"></path><path fill="#8fcae6" d="M43,14h-3c-0.553,0-1,0.447-1,1v18c0,0.553,0.447,1,1,1h3c0.553,0,1-0.447,1-1V15	C44,14.447,43.553,14,43,14z"></path><path fill="#8fcae6" d="M47,17h-5c-0.553,0-1,0.447-1,1v12c0,0.553,0.447,1,1,1h5c0.553,0,1-0.447,1-1V18	C48,17.447,47.553,17,47,17z"></path><path fill="#324561" d="M44,32c-0.553,0-1-0.447-1-1V17c0-0.553,0.447-1,1-1s1,0.447,1,1v14C45,31.553,44.553,32,44,32z"></path>
                                            </svg>Pratiquer </h3>
                                        <div class="progress-box mt-0" >
                                            <%
                                                Integer e = (Integer) session.getAttribute("e");

                                            %>
                                            <span  id="practice" class="badge badge-rounded badge-outline-light" style="padding: 10px 15px; background-color: white">
                                                <div style="margin-bottom:5px">
                                                    <!--                                                    <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="25" height="25" viewBox="0 0 80 80" style="display:inline-block">
                                                                                                        <path fill="#839cb2" d="M-8.379 38.5H88.37899999999999V41.5H-8.379z" transform="rotate(134.999 40 40)"></path><path fill="#66798f" d="M73.148,5.438l1.414,1.414L6.852,74.562l-1.414-1.414L73.148,5.438 M73.148,4.023L4.023,73.148 l2.828,2.828L75.977,6.852L73.148,4.023L73.148,4.023z"></path><path fill="#99c99e" d="M61.257 4.186H68.742V25.814H61.257z" transform="rotate(134.999 65 15)"></path><path fill="#5e9c76" d="M60,5.414L74.586,20L70,24.586L55.414,10L60,5.414 M60,4l-6,6l16,16l6-6L60,4L60,4z"></path><path fill="#ffeea3" d="M52.429 1.701H65.571V40.299H52.429z" transform="rotate(134.999 59 21)"></path><path fill="#ba9b48" d="M50,3.414L76.586,30L68,38.586L41.414,12L50,3.414 M50,2L40,12l28,28l10-10L50,2L50,2z"></path><path fill="#8bb7f0" d="M36.701 19.964H76.299V27.034999999999997H36.701z" transform="rotate(45.001 56.5 23.5)"></path><path fill="#4e7ab5" d="M68 38.586L41.414 12 45 8.414 45.707 7.707 45 7 40 12 68 40 73 35 72.293 34.293z"></path><path fill="#99c99e" d="M11.257 54.186H18.742V75.814H11.257z" transform="rotate(134.999 15 65)"></path><path fill="#5e9c76" d="M10,55.414L24.586,70L20,74.586L5.414,60L10,55.414 M10,54l-6,6l16,16l6-6L10,54L10,54z"></path><g><path fill="#ffeea3" d="M14.429 39.701H27.570999999999998V78.299H14.429z" transform="rotate(134.999 21 59)"></path><path fill="#ba9b48" d="M12,41.414L38.586,68L30,76.586L3.414,50L12,41.414 M12,40L2,50l28,28l10-10L12,40L12,40z"></path></g><path fill="#8bb7f0" d="M3.701 52.964H43.299V60.035H3.701z" transform="rotate(45.001 23.5 56.5)"></path><path fill="#4e7ab5" d="M40 68L12 40 7 45 7.707 45.707 12 41.414 38.586 68 34.293 72.293 35 73z"></path>
                                                                                                        </svg>-->

                                                    Entraînement&nbsp;&nbsp;
                                                    <p class="mb-0" id="attempt" style="display:inline-block" ></p>

                                                </div>
                                                <div class="progress" >
                                                    <div class="progress-bar  " style=" height:5px; border-radius:4px;" role="progressbar"></div>
                                                </div>
                                            </span>



                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div id="smartwizard" class="form-wizard order-create">

                                            <ul class="nav nav-wizard">
                                                <%                                                    int count = 1;
                                                    for (Exercise exercise : lesson.getExercises()) {
                                                        if (exercise.getTimer()) {
                                                            isTimer = true;
                                                        }
                                                %>
                                                <li><a class="nav-link" href="#wizard_<%=count%>" style="pointer-events: none"> 
                                                        <span><%=count%></span> 
                                                    </a></li>

                                                <%
                                                        count++;

                                                    }%>

                                                <li><a class="nav-link" href="#wizard_Finish" style="pointer-events: none">
                                                        <span>Fin</span>
                                                    </a></li>
                                            </ul>

                                            <%
                                                List<Integer> answers = (List<Integer>) session.getAttribute("answersTraining");
                                                List<Boolean> results = (List<Boolean>) session.getAttribute("resultsTraining");

                                                if (answers != null && results != null) {

                                            %>
                                            <div class="tab-content">


                                                <%                                                                    int countE = 1;
                                                    for (Exercise exercise : lesson.getExercises()) {

                                                %>
                                                <div id="wizard_<%=countE%>" class="tab-pane" role="tabpanel">

                                                    <p>Exercise <%=countE%></p>
                                                    <div class="row" style="text-align:center">

                                                        <p><%= exercise.getContent()%> </p>
                                                        <div class="basic-form">
                                                            <div class="mb-3 mb-0">
                                                                <% for (String option : exercise.getOptions()) {%>

                                                                <% if (option.equals(answers.get(countE - 1)) && results.get(countE - 1)) {%>

                                                                <div class="form-check custom-checkbox mb-2 checkbox-success " >
                                                                    <input type="radio" class="form-check-input" id="customRadioBox<%=countE%>" name="Ex<%=countE%>" value="<%= option%>" checked disabled >
                                                                    <label class="form-check-label" for="customRadioBox<%=countE%>"><%= option%></label>
                                                                </div> 

                                                                <%  } else if (option.equals(answers.get(countE - 1)) && results.get(countE - 1) == false) {%>
                                                                <div class="form-check custom-checkbox mb-2 checkbox-danger" >
                                                                    <input type="radio" class="form-check-input" id="customRadioBox<%=countE%>" name="Ex<%=countE%>" value="<%= option%>" checked disabled>
                                                                    <label class="form-check-label" for="customRadioBox<%=countE%>"><%= option%></label>
                                                                </div>

                                                                <%  } else {%>


                                                                <div class="form-check custom-checkbox mb-2" >
                                                                    <input type="radio" class="form-check-input" id="customRadioBox<%=countE%>" name="Ex<%=countE%>" value="<%= option%>" disabled>
                                                                    <label class="form-check-label" for="customRadioBox<%=countE%>"><%= option%></label>
                                                                </div>


                                                                <%  } %>

                                                                <%  }%>
                                                                <%= results.get(countE - 1)%>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%
                                                        countE++;
                                                    }%>
                                                <div id="wizard_Finish" class="tab-pane" role="tabpanel">
                                                    <div class="row emial-setup" style="text-align: center">
                                                        <p>Bravo, tu as terminé l'entrainement de la compétence : ${c}</p>


                                                        <div class="sweetalert">
                                                            <button class="btn btn-success btn sweet-success">Sweet Success</button>
                                                        </div>

                                                        <!-- /# card -->

                                                    </div>
                                                </div>

                                            </div>





                                            <% } else { %>


                                            <div class="tab-content">
                                                <%
                                                    if (isTimer) {
                                                %>
                                                <div class="row">
                                                    <div class="col-xl-9 col-xxl-9 col-9">

                                                    </div>
                                                    <div class="col-xl-3 col-xxl-3 col-3" align="right">
                                                        <div class="timer-container">
                                                            <span id="timer-msg"></span>
                                                            <div id="timer">timer</div>

                                                        </div>
                                                    </div>

                                                </div>


                                                <%}%>

                                                <form action="acquerirCompetence" method="post">

                                                    <%                                                                    int countE = 1;
                                                        for (Exercise exercise : lesson.getExercises()) {
                                                    %>

                                                    <div id="wizard_<%=countE%>" class="tab-pane" role="tabpanel" style="padding:0 3%">
                                                        <div class="row">
                                                            <div class="col-xl-9 col-xxl-9 col-9" <% if (isTimer) { %> style="position:relative; top:-30px" <%}%>>
                                                                <h5> Question  <%=countE%> sur <%=lesson.getExercises().size()%></h5>
                                                            </div>
    <!--                                                        <div class="alert alert-warning alert-dismissible fade show" style="visibility:hidden" id="alerte_<%=countE%>">
                                                                <svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="me-2"><path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"></path><line x1="12" y1="9" x2="12" y2="13"></line><line x1="12" y1="17" x2="12.01" y2="17"></line></svg>
                                                                <strong>⚠️ Oops!</strong>  Veuillez choisir une réponse.
                                                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="btn-close"></button>
                                                            </div>-->

                                                        </div>

                                                        <div class="row" style="padding:  3% " >
                                                            <h3><%= exercise.getContent()%> </h3><br><br> <% if (isTimer) { %> <br><br> <%}%>
                                                            <div class="basic-form" >
                                                                <div class="mb-3 mb-0" style="padding: 1% 1%">
                                                                    <%  if (exercise.getPrompt().equals(false)) {
                                                                            for (String option : exercise.getOptions()) {


                                                                    %>

                                                                    <div id="option" >
                                                                        <input type="radio" class="form-check-input" id="customRadioBox<%=countE%>" name="Ex<%=countE%>"  value="<%= option%>" required>
                                                                        <label class="form-check-label" for="customRadioBox<%=countE%>"><%= option%></label>
                                                                    </div><br>



                                                                    <% }%>
                                                                    <div  id ="verify_<%=countE%>" style='text-align:right'>
                                                                        <button type="button" onclick="verifyAnswer(this,<%=countE%>)" class="btn tp-btn-light btn-primary">Vérifier la réponse</button>

                                                                    </div>
                                                                    <%                                                          } else {%>
                                                                    <br><br>
                                                                    <div class="input-group mb-3">

                                                                        <input type="text" class="form-control" id="customRadioBox<%=countE%>" name="Ex<%=countE%>" placeholder="Mettre la réponse Ici"  required>

                                                                        <div id="verify_<%=countE%>">
                                                                            <button type="button" onclick="verifyAnswer(this,<%=countE%>)" class="btn tp-btn-light btn-primary">Vérifier la réponse</button>

                                                                        </div>
                                                                    </div>


                                                                    <%   }%>
                                                                </div>
                                                            </div>

                                                        </div>

                                                    </div>
                                                    <%
                                                            countE++;
                                                        }%>
                                                </form>
                                                <div id="wizard_Finish" class="tab-pane" role="tabpanel">
                                                    <div class="row emial-setup" style="text-align: center">
                                                        <p>Bravo, tu as terminé les exercices de la compétence : ${c}</p>
                                                        <%if (e >= 2) {%>
                                                        <div>
                                                            <div class="sweetalert"  >
                                                                <button class="btn btn-success btn sweet-success" style="display:none" id="passTest"></button>
                                                            </div>

                                                            <form method="post" action="ApprentissageAdaptatif" >
                                                                <button class="btn tp-btn-light btn-primary"> S'entraîner à nouveau</button>
                                                            </form>
                                                            <form method="get" action="test">
                                                                <button class="btn tp-btn-light btn-primary" > Passer le test</button>
                                                            </form>

                                                        </div>
                                                        <%} else {%>
                                                        <div>

                                                            <a href="ApprentissageAdaptatif" class="btn tp-btn-light btn-primary"> S'entraîner à nouveau</a>
                                                        </div>


                                                        <%}%>

                                                    </div>
                                                </div>

                                            </div>
                                            <% }%>





                                        </div>
                                    </div>
                                    <br><br>
                                </div>
                            </div>


                        </div>



                    </div>
                    <%
                        String h = (String) session.getAttribute("h");
                        if (h != null) {
                    %>
                    <div class="card" style="display: none"  >
                        <div class="card-body">
                            <h4 class="card-title">Sweet Text</h4>
                            <div class="card-content">
                                <div class="sweetalert">
                                    <button class="btn btn-primary btn sweet-text">Sweet Text</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                            session.removeAttribute("h");
                        }%>









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




            <!--**********************************
                Main wrapper end
            ***********************************-->

            <!--**********************************
                Scripts
            ***********************************-->




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


            <script src="./js/custom.js"></script>
            <script src="./js/deznav-init.js"></script>

            <%
                Integer palier = (Integer) session.getAttribute("palier");

            %>


            <script>
                                                                                $(document).ready(function () {
                <%                                                                                           if (isTimer) {
                %>
                                                                                    const FULL_DASH_ARRAY = 126;
                                                                                    const WARNING_THRESHOLD = 10;
                                                                                    const ALERT_THRESHOLD = 5;

                                                                                    const COLOR_CODES = {
                                                                                        info: {
                                                                                            color: "green"
                                                                                        },
                                                                                        warning: {
                                                                                            color: "orange",
                                                                                            threshold: WARNING_THRESHOLD
                                                                                        },
                                                                                        alert: {
                                                                                            color: "red",
                                                                                            threshold: ALERT_THRESHOLD
                                                                                        }
                                                                                    };

                                                                                    const TIME_LIMIT = 15;
                                                                                    let timePassed = 0;
                                                                                    let timeLeft = TIME_LIMIT;
                                                                                    let timerInterval = null;
                                                                                    let remainingPathColor = COLOR_CODES.info.color;

                                                                                    function resetTimer() {
                                                                                        clearInterval(timerInterval);
                                                                                        timePassed = 0;
                                                                                        timeLeft = TIME_LIMIT;
                                                                                        timerInterval = null;
                                                                                        document.getElementById("timer").innerHTML =
                                                                                                '<div class="base-timer">' +
                                                                                                '<svg class="base-timer__svg" viewBox="0 0 50 50" xmlns="http://www.w3.org/2000/svg">' +
                                                                                                '<g class="base-timer__circle">' +
                                                                                                '<circle class="base-timer__path-elapsed" cx="25" cy="25" r="20"></circle>' +
                                                                                                '<path id="base-timer-path-remaining" stroke-dasharray="' + FULL_DASH_ARRAY + '" class="base-timer__path-remaining ' + remainingPathColor +
                                                                                                '" d="M 25, 25 m -20, 0 a 20,20 0 1,0 40,0 a 20,20 0 1,0 -40,0"></path>' +
                                                                                                '</g>' +
                                                                                                '</svg>' +
                                                                                                '<span id="base-timer-label" class="base-timer__label">' + formatTime(timeLeft) + '</span>' +
                                                                                                '</div>';
                                                                                    }



                                                                                    function startTimer() {
                                                                                        timerInterval = setInterval(() => {
                                                                                            timePassed = timePassed + 1;
                                                                                            timeLeft = TIME_LIMIT - timePassed;
                                                                                            document.getElementById("base-timer-label").innerHTML = formatTime(timeLeft);
                                                                                            setCircleDasharray();
                                                                                            setRemainingPathColor(timeLeft);

                                                                                            if (timeLeft === 0) {
                                                                                                resetTimer();


                                                                                                $('#smartwizard').smartWizard("next");



                                                                                            }
                                                                                        }, 1000);
                                                                                    }

                                                                                    function formatTime(time) {
                                                                                        const minutes = Math.floor(time / 60);
                                                                                        let seconds = time % 60;

                                                                                        if (seconds < 10) {
                                                                                            seconds = "0" + seconds;
                                                                                        }

                                                                                        return minutes + ":" + seconds;
                                                                                    }

                                                                                    function setRemainingPathColor(timeLeft) {
                                                                                        const {alert, warning, info} = COLOR_CODES;
                                                                                        const pathRemaining = document.getElementById("base-timer-path-remaining");

                                                                                        if (timeLeft <= alert.threshold) {
                                                                                            pathRemaining.classList.remove(warning.color);
                                                                                            pathRemaining.classList.add(alert.color);
                                                                                            $(".sw-btn-next").show();
                                                                                        } else if (timeLeft <= warning.threshold) {
                                                                                            pathRemaining.classList.remove(info.color);
                                                                                            pathRemaining.classList.add(warning.color);
                                                                                        }
                                                                                    }

                                                                                    function calculateTimeFraction() {
                                                                                        const rawTimeFraction = timeLeft / TIME_LIMIT;
                                                                                        return rawTimeFraction - (1 / TIME_LIMIT) * (1 - rawTimeFraction);
                                                                                    }

                                                                                    function setCircleDasharray() {
                                                                                        const circleDasharray = (calculateTimeFraction() * FULL_DASH_ARRAY).toFixed(0) + " " + FULL_DASH_ARRAY;
                                                                                        const pathRemaining = document.getElementById("base-timer-path-remaining");
                                                                                        pathRemaining.setAttribute("stroke-dasharray", circleDasharray);
                                                                                    }


                <%}%>



                                                                                    $('.sweet-text').click();

                                                                                    var e = <%= e%>;
                                                                                    var spanAttempt = document.getElementById("attempt");
                                                                                    var progressBar = document.querySelector(".progress-bar");
                                                                                    var progressBarWidth = (e / 3) * 100;

                                                                                    spanAttempt.textContent = "  " + e + "/3";
                                                                                    progressBar.style.width = progressBarWidth + "%";



                                                                                    if (e <= 1) {

                                                                                        $(".progress-bar").addClass("bg-danger");
                                                                                        //  spanAttempt.style.color = "red";

                                                                                    } else if (e === 2) {
                                                                                        $(".progress-bar").addClass("bg-warning");
                                                                                        //     spanAttempt.style.color = "orange";
                                                                                    } else {
                                                                                        $(".progress-bar").addClass("bg-green");
                                                                                        //    spanAttempt.style.color = "green";
                                                                                    }



                                                                                    // Toolbar extra buttons
                                                                                    var btnFinish = $('<button onclick="window.location.href="https://w3docs.com""></button>').text('Valider les réponses')
                                                                                            .addClass('btn btn-info').addClass('finishLine')
                                                                                            .on('click', function () {
                                                                                                swal("Bravo !", "Tu peux désormais t'essayer au test ;)", "success");
                                                                                            });
                                                                                    // Step show event
                                                                                    $("#smartwizard").on("showStep", function (e, anchorObject, stepNumber, stepDirection, stepPosition) {

                                                                                        $(".sw-btn-next").hide();

                <%
                    if (isTimer) {
                %>
                                                                                        resetTimer();


                                                                                        if (stepPosition !== 'last') {
                                                                                            timePassed = 0;
                                                                                            timeLeft = TIME_LIMIT;
                                                                                            timerInterval = null;





                                                                                            startTimer();



                                                                                        } else {
                                                                                            $("#timer").hide();// Reset the timer for first and last steps
                                                                                            $("#timer-msg").hide();// Reset the timer for first and last steps
                                                                                        }
                <%}%>


                                                                                        if (stepPosition !== 'last') {
                                                                                            $('.finishLine').hide();


                                                                                        } else {
                                                                                            $(".sw-btn-next").hide();
               
                                                                                            $.ajax({
                                                                                                url: "incrementAttempts", // Replace with the URL of your servlet or endpoint
                                                                                                type: "POST",
                                                                                                dataType: "json",
                                                                                                data: {essais: <%=e%>}, // Pass any additional data if needed
                                                                                                success: function (response) {
                                                                                                    var progressBarWidth = (response.e / 3) * 100;


                                                                                                    spanAttempt.textContent = response.e + "/3";
                                                                                                    progressBar.style.width = progressBarWidth + "%";



                                                                                                    if (response.e <= 1) {
                                                                                                        xpIncrement(<%=palier%>, false, false);

                                                                                                        $(".progress-bar").addClass("bg-danger");
                                                                                                        $(".progress-bar").removeClass("bg-warning", "bg-green");


                                                                                                        // spanAttempt.style.color = "red";

                                                                                                    } else if (response.e == 2) {
                                                                                                        xpIncrement(<%=palier%>, false, false);
                                                                                                        $(".progress-bar").addClass("bg-warning");
                                                                                                        $(".progress-bar").removeClass("bg-danger", "bg-green");
                                                                                                        //                                                                                                        spanAttempt.style.color = "orange";
                                                                                                    } else {
                                                                                                        $(".progress-bar").addClass("bg-green");
                                                                                                        $(".progress-bar").removeClass("bg-warning", "bg-danger");
                                                                                                        //spanAttempt.style.color = "green";
                                                                                                        xpIncrement(<%=palier%>, false, false);
                                                                                                    }
                                                                                                    // Handle the response from the server
                                                                                                    console.log("Update successful!");
                                                                                                },
                                                                                                error: function (xhr, status, error) {
                                                                                                    // Handle the error response
                                                                                                    console.log("Error: " + error);
                                                                                                }
                                                                                            });
                                                                                            
                
                <% if (e == 2) {%>
                                                                                            $('#passTest').click();
                <%}%>
                                                                                        }


                                                                                        if (stepPosition === 'first') {
                                                                                            $("#prev-btn").addClass('disabled');
                                                                                        } else if (stepPosition === 'last') {
                                                                                            $("#next-btn").addClass('disabled');
                                                                                        } else {
                                                                                            $("#prev-btn").removeClass('disabled');
                                                                                            $("#next-btn").removeClass('disabled');
                                                                                        }
                                                                                    });
                                                                                    // Smart Wizard
                                                                                    var numExos = <%= lesson.getExercises().size()%>

                                                                                    for (var i = 1; i <= numExos; i++) {

                                                                                        $("#wizard_" + i).hide();

                                                                                    }


                                                                                    $('#smartwizard').smartWizard({

                                                                                        toolbarSettings: {
                                                                                            toolbarPosition: 'bottom', // both bottom
                                                                                            showPreviousButton: false,
                                                                                            toolbarExtraButtons: [btnFinish]
                                                                                        }
                                                                                    });
                                                                                    // External Button Events
                                                                                    $("#reset-btn").on("click", function () {
                                                                                        // Reset wizard
                                                                                        $('#smartwizard').smartWizard("reset");
                                                                                        return true;
                                                                                    });
                                                                                    $("#prev-btn").on("click", function () {
                                                                                        // Navigate previous
                                                                                        $('#smartwizard').smartWizard("prev");

                                                                                        return true;
                                                                                    });
                                                                                    $("#next-btn").on("click", function () {
                                                                                        // Navigate next

                                                                                        $('#smartwizard').smartWizard("next");


                                                                                        return true;
                                                                                    });
                                                                                }
                                                                                );
            </script>

            <script>
                (function ($) {
                    "use strict";

                    document.querySelector(".sweet-success").onclick = function () {
                        swal("Bravo !!", "Tu peux maintenant t'essayer au test ;)", "success");
                    };

                })(jQuery);
            </script>

            <script>




                // Define the correct answers as an array
                var correctAnswers = [
                <% for (Exercise exercise : lesson.getExercises()) {%>
                    "<%= exercise.getAnswer()%>",
                <% }%>
                ];
                function verifyAnswer(radioButton, exerciseNumber) {
                    console.log(exerciseNumber);
                    var radioButtonContainer = radioButton.parentNode;
                    var buttonDiv = document.getElementById("verify_" + exerciseNumber);
                    // Get the selected radio button value
                    var selectedValue = document.querySelector('input[name="Ex' + exerciseNumber + '"]:checked');

                    var exerciseIndex = exerciseNumber - 1;
                    // Retrieve the correct answer for the exercise
                    var correctAnswer1 = correctAnswers[exerciseIndex];

                    if (!selectedValue) {


                        selectedValue = document.querySelector('input[name="Ex' + exerciseNumber + '"][type="text"]');

                        if (!selectedValue) {
                            return;
                        } else {
                            if (selectedValue.value === "") {

                                var buttonAlerte = document.getElementById("alerte_" + exerciseNumber);
                                buttonAlerte.style.visibility = "visible";
                                return;
                            } else {

                                var isCorrect = (selectedValue.value.trim() === correctAnswer1);
                                if (isCorrect) {

                                    buttonDiv.innerHTML = "  &nbsp;  ✅ ";
                                    $(".sw-btn-next").show();

                                    return;
                                } else {


                                    buttonDiv.innerHTML = "  &nbsp;  ❌ Réponse incorrecte" + "<br>La réponse correcte est : " + correctAnswer1;
                                    $(".sw-btn-next").show();
                                    return;
                                }


                            }


                        }






                    } else {
                        buttonDiv.style.visibility = "hidden";

                        // Retrieve the correct answer for the exercise
                        var correctAnswer = correctAnswers[exerciseIndex];
                        // Perform answer verification
                        var isCorrect = (selectedValue.value === correctAnswer);
                        console.log(selectedValue.value + " blabla " + correctAnswer);
                        console.log(typeof (correctAnswer) + " " + typeof (selectedValue.value));
                        var correctRadioButton = document.querySelector('input[name="Ex' + exerciseNumber + '"][value="' + correctAnswer + '"]');
                        if (isCorrect) {
                            var correctRadioButtonParent = correctRadioButton.parentNode;
                            var label = correctRadioButtonParent.querySelector('label');
                            // Add the "correct" class to the parent container of the radio button
                            correctRadioButtonParent.classList.add("checkbox-success");
                            correctRadioButtonParent.classList.remove("checkbox-primary");
                            correctRadioButtonParent.classList.remove("badge-primary");
                            correctRadioButtonParent.classList.add("badge-rounded", "light", "badge-success");
                            // Display the "Correct" message
                            label.innerHTML = label.innerHTML + "  &nbsp;  ✅";

                            xpIncrement(<%=palier%>, true, true);
                        } else {
                            var selectedValueParent = selectedValue.parentNode;
                            var label1 = selectedValueParent.querySelector('label');
                            selectedValueParent.classList.add("badge-rounded", "light", "badge-danger");
                            // Add the "incorrect" class to the parent container of the radio button
                            selectedValueParent.classList.add("checkbox-danger");
                            // Find the radio button for the correct answer
                            var correctRadioButton = document.querySelector('input[name="Ex' + exerciseNumber + '"][value="' + correctAnswer + '"]');
                            if (correctRadioButton) {
                                // Get the parent container of the correct radio button for styling purposes
                                var correctRadioButtonContainer = correctRadioButton.parentNode;
                                var label2 = correctRadioButtonContainer.querySelector('label');
                                // Add the "incorrect" class to the parent container of the correct radio button
                                correctRadioButtonContainer.classList.add("badge-rounded", "light", "badge-success");
                                // Display the "Correct" message beside the correct answer
                                label2.innerHTML = label2.innerHTML + " &nbsp;&nbsp;  ✅";
                            }
                            xpIncrement(<%=palier%>, true, false);




                            // Display the "Incorrect" message beside the selected answer
                            label1.innerHTML = label1.innerHTML + "      &nbsp;&nbsp;  ❌";
                        }

                    }
                    $(".sw-btn-next").show();




                }
                function disableAndCheckRadioButtons(parentElement) {
                    // Get the parent element


                    // Find all radio buttons within the parent element
                    var radioButtons = parentElement.querySelectorAll('input[type="radio"]');
                    // Disable and check each radio button
                    radioButtons.forEach(function (radioButton) {
                        radioButton.disabled = true;
                        radioButton.checked = true;
                    });
                }


                function xpIncrement(palier, isQuestion, isCorrect) {
                    $.ajax({
                        url: 'XpIncrement',
                        type: 'POST',
                        data: {palier: palier, isQuestion: isQuestion, isCorrect: isCorrect},
                        success: function (response) {

                            $("#xpPoints").text(response.xpPoints);


                        },
                        error: function (xhr, status, error) {
                            console.log('Error updating checkbox state: ' + error);
                        }
                    });
                }




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
                var startTime = Date.now();

                window.addEventListener('beforeunload', function () {
                    var endTime = Date.now();
                    var timeSpent = endTime - startTime;
                    // Create an object with the page URL and timeSpent
                    var data = {
                        page: "window.location.href",
                        timeSpent: timeSpent
                    };
                    // Send the data to the backend using AJAX with jQuery
                    $.ajax({
                        url: 'TimeTrackingServlet',
                        type: 'POST',
                       
                        data: {
                            page: window.location.href,
                            timeSpent: timeSpent
                        },
                        success: function (response) {
                            
                        },
                        error: function (xhr, textStatus, errorThrown) {
                           
                        }
                    });
                }
                );
            </script>


<script>
        // Sélectionnez l'élément audio
        var audio = document.getElementById('myAudio');
        var muteButton = document.getElementById('muteButton');
        var muteField = document.getElementById('muteField');

        audio.volume = 0.05;        
        
        var audioFiles = [
            'musique/m1.mp3',
            'musique/m2.mp3',
            'musique/m3.mp3',
	    'musique/m4.mp3',
	    'musique/m5.mp3'
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





    </body>
</html>
