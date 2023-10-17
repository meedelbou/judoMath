<%-- 
    Document   : accuiel
    Created on : 31 mai 2023, 09:29:10
    Author     : medel
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <script>
            function updateModalContent(solutions) {
                var modalBody = document.querySelector("#exampleModalpopover .modal-body");
                modalBody.innerHTML = '';
                var name = solutions[0]["name"];
                var encodedURL = encodeURIComponent(solutions[0]["url"]);
                var h5 = document.createElement("h5");
                var a = document.createElement("a");
                a.href = "choiceMade?nextSkill=" + encodeURIComponent(name) + '&nextSkillURL=' + encodedURL;
                a.textContent = (0 + 1) + " - " + name;
                h5.appendChild(a);
                modalBody.appendChild(h5);
                var hr = document.createElement("hr");
                modalBody.appendChild(hr);
                for (var i = 1; i < solutions.length; i++) {
                    modalBody.appendChild(hr);
                    var name = solutions[i]["name"];
                    var encodedURL = encodeURIComponent(solutions[i]["url"]);
                    var h5 = document.createElement("h5");
                    var a = document.createElement("a");
                    a.href = "choiceMade?nextSkill=" + encodeURIComponent(name) + '&nextSkillURL=' + encodedURL;
                    a.textContent = (i + 1) + " - " + name;
                    h5.appendChild(a);
                    modalBody.appendChild(h5);
                    var hr = document.createElement("hr");
                }
            }

            function recommendCompetences() {
                $.ajax({
                    url: 'recommendation',
                    type: 'POST',
                    data: {},
                    success: function (response) {
                        var solutions = response.solutions;
                        console.log('Skills Recommended Succesfully');
                        updateModalContent(solutions);
                    },
                    error: function (xhr, status, error) {
                        console.log('Error Recommending skills :' + error);
                    }
                });
            }

        </script>
        <%
            Integer palier = (Integer) session.getAttribute("palier");
        %>

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
                            <a  href="test" aria-expanded="false">
                                <div class="menu-icon">
                                    <i class="fa-solid fa-list-check"></i>
                                </div>	&nbsp;&nbsp;
                                <span class="nav-text">Test de validation</span>
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
                        <li><h5 class="bc-title">Test de validation</h5></li>
                        <li class="breadcrumb-item"><a href="choisirComp">
                             <i class="fa-solid fa-list-check" aria-hidden="true"></i>
                                Judomath </a>
                        </li>    
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">Test de validation</a></li>
                    </ol>

                    <span id="xpPoints">XP : ${user.experiencePoints}</span>

                </div>
                <!-- row -->
                <div class="container-fluid">

                    <div class='card'>
                        <div class="card-header">

                            <h2 > 
                                <svg width="35" height="35" aria-hidden="true" viewBox="0 0 18 18"><path fill="currentColor" d="m9.84 0 .001 7.243a1.948 1.948 0 1 1-1.64-.02V5.34a3.778 3.778 0 0 0 .824 7.462 3.776 3.776 0 0 0 3.207-5.77l1.358-.922A5.416 5.416 0 1 1 8.2 3.67V1.682a7.361 7.361 0 1 0 6.99 3.336l1.353-.918A8.908 8.908 0 0 1 18 9 9 9 0 1 1 8.202.035c.138-.012.276-.012.415-.008L9.84 0Z"></path></svg>
                                Test de Validation : ${c}   <div id="palier" style="display:inline-block"></div></h2>

                        </div> 

                    </div>
                    <%
                        List<Exercise> exercises = (List<Exercise>) session.getAttribute("exercisesTest");
                    %>

                    <div class="row">
                        <div class="col-xl-12 col-xxl-12">



                            <div class="col-xl-12 col-xxl-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h2 > <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="35" height="35" viewBox="0 0 100 100">
                                            <path d="M24.5,100C18.71,100,14,95.29,14,89.5v-67C14,16.71,18.71,12,24.5,12h13.116C40.233,6.604,45.754,3,52,3 s8.767,3.604,11.384,9H79.5C85.29,12,90,16.71,90,22.5v67c0,5.79-4.71,10.5-10.5,10.5H24.5z" opacity=".35"></path><path fill="#f2f2f2" d="M22.5,98C16.71,98,12,93.29,12,87.5v-67C12,14.71,16.71,10,22.5,10h13.116 C38.233,4.604,43.754,1,50,1s11.767,3.604,14.384,9H77.5C83.29,10,88,14.71,88,20.5v67C88,93.29,83.29,98,77.5,98H22.5z"></path><path fill="#707cc0" d="M76.776,17.011H57.999C57.999,17.007,58,17.004,58,17c0-4.418-3.582-8-8-8s-8,3.582-8,8 c0,0.004,0.001,0.007,0.001,0.011H23.025c-2.209,0-4,1.791-4,4V87c0,2.209,1.791,4,4,4h53.949c2.209,0,4-1.791,4-4V21.211 C80.976,18.891,79.095,17.011,76.776,17.011z"></path><path fill="#d9eeff" d="M73.831,84.92H26.169c-1.176,0-2.129-0.952-2.129-2.129V25.148c0-1.176,0.952-2.129,2.129-2.129 h47.664c1.175,0,2.128,0.952,2.128,2.129v57.644C75.96,83.967,75.008,84.92,73.831,84.92z"></path><circle cx="50" cy="17" r="5" fill="#70bfff"></circle><path fill="#70bfff" d="M62,28H39c-2.209,0-4-1.791-4-4v-6h31v6C66,26.209,64.209,28,62,28z"></path><circle cx="50" cy="17" r="10" fill="#70bfff"></circle><circle cx="50" cy="17" r="2" fill="#40396e"></circle><path fill="#40396e" d="M77.5,93h-55c-3.033,0-5.5-2.468-5.5-5.5v-67c0-3.032,2.467-5.5,5.5-5.5h16.693 C40.137,9.853,44.636,6,50,6s9.863,3.853,10.807,9H77.5c3.033,0,5.5,2.468,5.5,5.5v67C83,90.532,80.533,93,77.5,93z M22.5,18 c-1.378,0-2.5,1.121-2.5,2.5v67c0,1.379,1.122,2.5,2.5,2.5h55c1.378,0,2.5-1.121,2.5-2.5v-67c0-1.379-1.122-2.5-2.5-2.5H59.475 c-0.798,0-1.456-0.625-1.498-1.422C57.755,12.329,54.251,9,50,9s-7.755,3.329-7.977,7.578C41.981,17.375,41.323,18,40.525,18H22.5 z"></path><path fill="#70bfff" d="M68.5,44h-37c-0.828,0-1.5-0.672-1.5-1.5l0,0c0-0.828,0.672-1.5,1.5-1.5h37 c0.828,0,1.5,0.672,1.5,1.5l0,0C70,43.328,69.328,44,68.5,44z"></path><path fill="#70bfff" d="M68.5,56h-37c-0.828,0-1.5-0.672-1.5-1.5l0,0c0-0.828,0.672-1.5,1.5-1.5h37 c0.828,0,1.5,0.672,1.5,1.5l0,0C70,55.328,69.328,56,68.5,56z"></path><path fill="#70bfff" d="M68.5,68h-37c-0.828,0-1.5-0.672-1.5-1.5l0,0c0-0.828,0.672-1.5,1.5-1.5h37 c0.828,0,1.5,0.672,1.5,1.5l0,0C70,67.328,69.328,68,68.5,68z"></path>
                                            </svg> Test  </h2>

                                        <div class="col-xl-3 col-xxl-3" align="right">
                                            <div class="timer-container">
                                                <span id="timer-msg"></span>
                                                <div id="timer"></div>
                                            </div>
                                        </div>


                                    </div>
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-xl-6 col-xxl-6" align="right"></div>

                                        </div>
                                        <div>



                                            <%
                                                List<Integer> answersTest = (List<Integer>) session.getAttribute("answersTest");
                                                List<Boolean> resultsTest = (List<Boolean>) session.getAttribute("resultsTest");

                                                if (answersTest != null && resultsTest != null) {

                                            %>
                                            <div >
                                                <div class="row" style="text-align:center; padding:2%;margin:2%">


                                                    <h1 style="font-size:40px" >Votre Score : <strong>${scoreTest}/20</strong></h1>

                                                    <div id="wizard_Finish" class="tab-pane" role="tabpanel">
                                                        <c:if test="${not empty passed}">
                                                            <span style="color: green;">${passed}</span>

                                                        </c:if>
                                                        <c:if test="${not empty failed}">
                                                            <span style="color: red;">${failed}</span>

                                                        </c:if>
                                                        <c:if test="${not empty passed_palier}">
                                                            <span style="color: green;">${passed_palier}</span>


                                                        </c:if>

                                                    </div>





                                                </div>

                                                <h3 class="text-primary">Résultats détaillés du test </h3>  <br>  
                                                <div >
                                                

                                                    <%                                                                    int countE = 1;
                                                        for (Exercise exercise : exercises) {
                                                    %>
                                                 
                                                    <div style ="padding:0% 5%"  >

                                                        <h5>Question  <%=countE%> sur <%=exercises.size()%> :</h5>



                                                        <div class="row" style ="padding:0% 8%"  >
                                                            <h3 ><%= exercise.getContent()%></h3>

                                                            <div class="basic-form">
                                                                <div class="mb-3 mb-0" style="padding:3%;padding-left:0">
                                                                    <%  if (exercise.getPrompt().equals(false)) {


                                                                    %>
                                                                    <% for (String option : exercise.getOptions()) {%>

                                                                    <% if (option.equals(answersTest.get(countE - 1)) && resultsTest.get(countE - 1)) {%>

                                                                    <div class="form-check custom-checkbox mb-2 checkbox-success " >
                                                                        <input type="radio" class="form-check-input" id="customRadioBox<%=countE%>" name="Ex<%=countE%>" value="<%= option%>" checked disabled >
                                                                        <label class="form-check-label" for="customRadioBox<%=countE%>"><%= option%></label>
                                                                    </div> 

                                                                    <%  } else if (option.equals(answersTest.get(countE - 1)) && resultsTest.get(countE - 1) == false) {%>
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

                                                                    <%  } else {%>

                                                                    <%if (resultsTest.get(countE - 1)) {%>

                                                                    <a class="badge-rounded light badge-success" style="padding:1%"> <strong><%=answersTest.get(countE - 1)%> </strong> &nbsp;  ✅ Réponse correcte</a>

                                                                    <%} else {%>

                                                                    <a class="badge-rounded light badge-danger" style="padding:1%"> <strong> <%=answersTest.get(countE - 1)%> </strong>   &nbsp;   ❌ Réponse incorrecte</a> <br><br><br>
                                                                    <a class="badge-rounded light badge-dark" style="padding:1%">   &nbsp;    la Réponse Correcte  est &nbsp; : &nbsp;<strong><%=exercises.get(countE - 1).getAnswer()%></strong> </a>





                                                                    <%  }
                                                                    }%>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <%
                                                            countE++;
                                                        }%>
                                                    <div id="wizard_Finish" class="tab-pane" role="tabpanel">
                                                        <c:if test="${not empty passed}">


                                                            <div class="row emial-setup" style="text-align: center">



                                                                <div class="sweetalert">
                                                                    <button class="btn btn-success btn" type="button"    data-bs-toggle="modal" data-bs-target="#exampleModalpopover" id="unlock" onclick="recommendCompetences();">Dévérouiller les compétences !</button>
                                                                </div>
                                                                <div class="modal fade" id="exampleModalpopover">
                                                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title">Quelle sera ta prochaine compétence ?</h5>
                                                                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <!-- Modal content -->
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>


                                                                <!-- /# card -->

                                                            </div>
                                                        </c:if>
                                                        <c:if test="${not empty failed}">

                                                            <form method="post" action="ApprentissageAdaptatif" style="text-align:center">
                                                                <button class="btn  btn-primary"> S'entraîner à nouveau</button>
                                                            </form>
                                                        </c:if>
                                                        <c:if test="${not empty passed_palier}">
                                                            <div style="text-align:center">
                                                                <a  href="ApprentissageAdaptatif" class="btn btn-outline-success  btn-card">Continuer</a>

                                                            </div>

                                                        </c:if>

                                                    </div>
                                                </div>

                                            </div>
                                        </div>





                                        <% } else {%>
                                        <div id="smartwizard" class="form-wizard order-create">
                                            <ul class="nav nav-wizard">
                                                <li><a class="nav-link" href="#wizard_0"> 
                                                        <span>Pré</span> 
                                                    </a></li>

                                                <%
                                                    int count = 1;
                                                    for (Exercise exercise : exercises) {
                                                %>
                                                <li><a class="nav-link" href="#wizard_<%=count%>" style="pointer-events: none"> 
                                                        <span><%=count%></span> 
                                                    </a></li>

                                                <%
                                                        count++;

                                                    }%>

                                                <li><a class="nav-link" href="#wizard_Finish">
                                                        <span>Fin</span>
                                                    </a></li>
                                            </ul>




                                            <div class="tab-content">
                                                <div id="wizard_0" class="tab-pane" role="tabpanel">
                                                    <br>


                                                    <div class="row" style="text-align:center">


                                                        <h1>${c} (Palier ${palier}/3) </h1>

                                                        <div id="lightgallery" class="row" style="padding:3% 2% 0% 5%">
                                                            <div class="col-lg-4 col-md-6 mb-4">
                                                                <div class="card">
                                                                    <div class="card-body text-center ai-icon  text-primary">
                                                                        <svg class="my-2" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="80" height="80" viewBox="0 0 60 60">
                                                                        <path fill="#a97866" d="M43,29.04V8a3,3,0,0,0-3-3H4A3,3,0,0,0,1,8V52a3,3,0,0,0,3,3H33.82Z"></path><path fill="#fff" d="M39,29.86V10a1,1,0,0,0-1-1H6a1,1,0,0,0-1,1V44l7,7H30.73Z"></path><path fill="#b5cedd" d="M30,6V8a2.006,2.006,0,0,1-2,2H16a2.006,2.006,0,0,1-2-2V6a2.006,2.006,0,0,1,2-2h3a3,3,0,0,1,6,0h3A2.006,2.006,0,0,1,30,6Z"></path><circle cx="44" cy="44" r="15" fill="#fff"></circle><path fill="#b5cedd" d="M12,45.17V51L5,44h5.83A1.165,1.165,0,0,1,12,45.17Z"></path><circle cx="44" cy="44" r="2" fill="#c4ddf0"></circle><g><path fill="#373737" d="M44,28V8a4,4,0,0,0-4-4H30.22A2.985,2.985,0,0,0,28,3H25.873a4,4,0,0,0-7.746,0H16a2.985,2.985,0,0,0-2.22,1H4A4,4,0,0,0,0,8V52a4,4,0,0,0,4,4H29a1,1,0,0,0,0-2H4a2,2,0,0,1-2-2V8A2,2,0,0,1,4,6h9V8H6a2,2,0,0,0-2,2V44a1,1,0,0,0,.293.707l7,7A1,1,0,0,0,12,52H30.165A15.992,15.992,0,1,0,44,28ZM40,6a2,2,0,0,1,2,2V28.139a15.741,15.741,0,0,0-2,.388V10a2,2,0,0,0-2-2H31V6ZM16,5h3a1,1,0,0,0,1-1,2,2,0,0,1,4,0,1,1,0,0,0,1,1h3a1,1,0,0,1,1,1V8a1,1,0,0,1-1,1H16a1,1,0,0,1-1-1V6A1,1,0,0,1,16,5ZM11,48.586,7.414,45h3.419a.167.167,0,0,1,.167.167ZM13,50V45.167A2.169,2.169,0,0,0,10.833,43H6V10h7.78A2.985,2.985,0,0,0,16,11H28a2.985,2.985,0,0,0,2.22-1H38V29.178A15.959,15.959,0,0,0,29.178,50Zm31,8A14,14,0,1,1,58,44,14.015,14.015,0,0,1,44,58Z"></path><path fill="#373737" d="M48,43H46.816A3,3,0,0,0,45,41.184V38a1,1,0,0,0-2,0v3.184A2.993,2.993,0,1,0,46.816,45H48a1,1,0,0,0,0-2Zm-4,2a1,1,0,1,1,1-1A1,1,0,0,1,44,45Z"></path><path fill="#373737" d="M44,35a1,1,0,0,0,1-1V33a1,1,0,0,0-2,0v1A1,1,0,0,0,44,35Z"></path><path fill="#373737" d="M36.929,35.515a1,1,0,0,0-1.414,1.414l.707.707a1,1,0,0,0,1.414-1.414Z"></path><path fill="#373737" d="M34,43H33a1,1,0,0,0,0,2h1a1,1,0,0,0,0-2Z"></path><path fill="#373737" d="M36.222,50.364l-.707.707a1,1,0,1,0,1.414,1.414l.707-.707a1,1,0,0,0-1.414-1.414Z"></path><path fill="#373737" d="M44,53a1,1,0,0,0-1,1v1a1,1,0,0,0,2,0V54A1,1,0,0,0,44,53Z"></path><path fill="#373737" d="M51.778,50.364a1,1,0,0,0-1.414,1.414l.707.707a1,1,0,0,0,1.414-1.414Z"></path><path fill="#373737" d="M53,44a1,1,0,0,0,1,1h1a1,1,0,0,0,0-2H54A1,1,0,0,0,53,44Z"></path><path fill="#373737" d="M51.071,35.515l-.707.707a1,1,0,1,0,1.414,1.414l.707-.707a1,1,0,0,0-1.414-1.414Z"></path><path fill="#373737" d="M28.293,19.707A1,1,0,0,0,29,20l.071,0a1,1,0,0,0,.729-.4l3-4a1,1,0,0,0-1.6-1.2l-2.308,3.078-.185-.185a1,1,0,0,0-1.414,1.414Z"></path><path fill="#373737" d="M29,30l.071,0a1,1,0,0,0,.729-.4l3-4a1,1,0,1,0-1.6-1.2l-2.308,3.078-.185-.185a1,1,0,0,0-1.414,1.414l1,1A1,1,0,0,0,29,30Z"></path><path fill="#373737" d="M24,14H10a1,1,0,0,0,0,2H24a1,1,0,0,0,0-2Z"></path><path fill="#373737" d="M10,20h8a1,1,0,0,0,0-2H10a1,1,0,0,0,0,2Z"></path><path fill="#373737" d="M24,24H10a1,1,0,0,0,0,2H24a1,1,0,0,0,0-2Z"></path><path fill="#373737" d="M10,30h8a1,1,0,0,0,0-2H10a1,1,0,0,0,0,2Z"></path><path fill="#373737" d="M24,34H10a1,1,0,0,0,0,2H24a1,1,0,0,0,0-2Z"></path><path fill="#373737" d="M18,38H10a1,1,0,0,0,0,2h8a1,1,0,0,0,0-2Z"></path></g>
                                                                        </svg>
                                                                        <h4 class="my-2">Questions chronométrées</h4>

                                                                        <p style="color:black"> Résoudre une série de défis chronométrés avant que le chronomètre ne s'épuise. En général, cela prend environ <strong><%= (int) (exercises.size() * 0.5)%></strong> minutes.</p>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-md-6 mb-4">
                                                                <div class="card">
                                                                    <div class="card-body text-center ai-icon  text-primary">
                                                                        <svg class="my-2" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="80" height="80" viewBox="0 0 128 128">
                                                                        <path fill="#A5A4AA" d="M36.8 92.5L36.8 83.2M36.8 73.2L36.8 33.8M64 43.2L64 33.8M64 92.5L64 54.2M91.2 63.2L91.2 33.8M91.2 92.5L91.2 73.2"></path><path fill="#454B54" d="M36.8 95.5c-1.7 0-3-1.3-3-3V33.8c0-1.7 1.3-3 3-3s3 1.3 3 3v58.7C39.8 94.2 38.5 95.5 36.8 95.5zM64 95.5c-1.7 0-3-1.3-3-3V33.8c0-1.7 1.3-3 3-3s3 1.3 3 3v58.7C67 94.2 65.7 95.5 64 95.5zM91.2 95.5c-1.7 0-3-1.3-3-3V33.8c0-1.7 1.3-3 3-3s3 1.3 3 3v58.7C94.2 94.2 92.8 95.5 91.2 95.5z"></path><path fill="#7CA5C6" d="M64,57.3L64,57.3c-4.1,0-7.5-3.4-7.5-7.5v0c0-4.1,3.4-7.5,7.5-7.5h0c4.1,0,7.5,3.4,7.5,7.5v0C71.5,54,68.1,57.3,64,57.3z"></path><path fill="#454B54" d="M64,60.3c-5.8,0-10.5-4.7-10.5-10.5S58.2,39.3,64,39.3S74.5,44,74.5,49.8S69.8,60.3,64,60.3z M64,45.3c-2.5,0-4.5,2-4.5,4.5s2,4.5,4.5,4.5s4.5-2,4.5-4.5S66.5,45.3,64,45.3z"></path><path fill="#7CA5C6" d="M36.8,85.7L36.8,85.7c-4.1,0-7.5-3.4-7.5-7.5v0c0-4.1,3.4-7.5,7.5-7.5h0c4.1,0,7.5,3.4,7.5,7.5v0C44.3,82.3,41,85.7,36.8,85.7z"></path><path fill="#454B54" d="M36.8,88.7c-5.8,0-10.5-4.7-10.5-10.5S31,67.7,36.8,67.7s10.5,4.7,10.5,10.5S42.6,88.7,36.8,88.7z M36.8,73.7c-2.5,0-4.5,2-4.5,4.5s2,4.5,4.5,4.5s4.5-2,4.5-4.5S39.3,73.7,36.8,73.7z"></path><g><path fill="#7CA5C6" d="M91.2,80L91.2,80c-4.1,0-7.5-3.4-7.5-7.5v0c0-4.1,3.4-7.5,7.5-7.5h0c4.1,0,7.5,3.4,7.5,7.5v0C98.7,76.6,95.3,80,91.2,80z"></path><path fill="#454B54" d="M91.2,83c-5.8,0-10.5-4.7-10.5-10.5S85.4,62,91.2,62s10.5,4.7,10.5,10.5S97,83,91.2,83z M91.2,68c-2.5,0-4.5,2-4.5,4.5s2,4.5,4.5,4.5s4.5-2,4.5-4.5S93.6,68,91.2,68z"></path></g>
                                                                        </svg>
                                                                        <h4 class="my-2">Adaptatif</h4>
                                                                        <p style="color:black"> L'évaluation s'adaptera automatiquement au niveau de la compétence évaluée.</p>


                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-md-6 mb-4">
                                                                <div class="card">
                                                                    <div class="card-body text-center ai-icon  text-primary">
                                                                        <svg class="my-2" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="80" height="80" viewBox="0 0 480.013 480.013">
                                                                        <path fill="#b9dcff" d="M409.506,248.513c0-106.881-86.625-193.5-193.5-193.5c-106.87,0-193.5,86.63-193.5,193.5	c0,62.12,29.27,117.4,74.77,152.8l-10.16,42.84c-3.38,14.22,7.41,27.86,22.02,27.86c7.71,0,14.89-3.92,19.05-10.41l20.33-31.69	c43.005,16.027,91.721,16.362,135.86-0.33c0.179,0.493-1.464-2.154,20.45,32.02c4.161,6.489,11.34,10.41,19.05,10.41	c14.61,0,25.396-13.639,22.02-27.86c-10.955-46.146-9.977-42.613-10.53-43.33C380.506,365.403,409.506,310.343,409.506,248.513z"></path><path fill="#d1e7ff" d="M345.896,444.153c3.376,14.221-7.41,27.86-22.02,27.86c-7.71,0-14.889-3.921-19.05-10.41	c-21.886-34.129-20.271-31.527-20.45-32.02c18.52-6.99,35.68-16.74,50.99-28.76C335.919,401.54,334.942,398.013,345.896,444.153z"></path><path fill="#d1e7ff" d="M148.516,429.913l-20.33,31.69c-4.16,6.49-11.34,10.41-19.05,10.41c-14.61,0-25.4-13.64-22.02-27.86	l10.16-42.84C112.666,413.293,129.916,422.993,148.516,429.913z"></path><circle cx="216.006" cy="248.513" r="143.5" fill="#d1e7ff"></circle><circle cx="216.006" cy="248.513" r="93.5" fill="#b9dcff"></circle><path fill="#d1e7ff" d="M363.405,147.073c-17.87-6.641-36.988-10.717-56.912-11.783c-1.612-0.086-3.156-0.653-4.447-1.622	c-24.136-18.124-54.17-28.801-86.705-28.653c-78.41,0.355-142.501,64.465-142.834,142.875c-0.138,32.52,10.537,62.539,28.662,86.674	c0.97,1.292,1.537,2.836,1.623,4.449c1.06,19.911,5.131,39.021,11.768,56.886c2.759,7.426-5.833,13.868-12.24,9.209	c-48.632-35.363-79.264-92.022-79.807-154.887C21.595,143.979,107.439,56.276,213.677,55.027	c64.31-0.756,122.751,30.001,158.965,79.842C377.284,141.259,370.809,149.824,363.405,147.073z"></path><path fill="#e8f3ff" d="M291.369,135.058c-49.153,1.152-79.191,19.989-82.311,20.217	c-46.103,3.374-82.916,40.187-86.29,86.29c-0.037,0.5-0.168,0.988-0.389,1.438c-12.639,25.62-19.22,53.475-19.843,80.842	c-0.09,3.955-5.228,5.417-7.366,2.089c-14.456-22.502-22.785-49.296-22.662-78.045c0.333-78.41,64.424-142.52,142.834-142.875	c28.778-0.13,55.599,8.208,78.112,22.677C296.78,129.83,295.322,134.966,291.369,135.058z"></path><path fill="#d1e7ff" d="M195.059,163.398c-26.129,16.004-48.164,38.04-64.168,64.168c-1.791,2.924-6.328,1.069-5.48-2.253	c8.417-33,34.395-58.978,67.395-67.395C196.128,157.07,197.983,161.607,195.059,163.398z"></path><circle cx="216.006" cy="248.513" r="47.5" fill="#d1e7ff"></circle><path fill="#d1e7ff" d="M445.766,49.936l-32.76,2.577l2.578-32.76c0.384-4.887-4.939-8.15-9.118-5.588l-33.28,20.398	c-11.26,6.9-17.12,20.01-14.76,33.01l6.08,33.44l33.44,6.08c13,2.36,26.11-3.5,33.01-14.76l20.397-33.28	C453.914,54.873,450.654,49.552,445.766,49.936z"></path><path fill="#e8f3ff" d="M415.584,19.753l-0.735,9.316c-0.09,1.14-0.72,2.168-1.695,2.765l-32.858,20.139	c-6.467,3.963-11.77,9.836-15.179,16.588c-1.54,3.05-6.08,2.374-6.691-0.988c-2.36-13,3.5-26.11,14.76-33.01l33.28-20.398	C410.646,11.605,415.964,14.863,415.584,19.753z"></path><path fill="#eef7ff" d="M320.759,458.313c4.172,6.409-3.295,14.08-9.622,9.784c-2.445-1.66-4.607-3.835-6.312-6.494	c-21.885-34.13-20.271-31.527-20.45-32.02c2.921-1.102,5.805-2.27,8.654-3.507c3.166-1.374,6.858-0.287,8.722,2.617	C301.752,428.694,320.725,458.26,320.759,458.313z"></path><path fill="#eef7ff" d="M102.509,450.268c0.384,10.28-14.826,11.783-15.905,1.553c-0.26-2.461-0.113-5.039,0.512-7.668	l10.16-42.84c2.976,2.321,6.024,4.556,9.139,6.698c2.726,1.874,4.032,5.219,3.269,8.438	C102.634,446.188,102.356,446.182,102.509,450.268z"></path><path fill="#2e58ff" d="M391.875,167.304c-4.084,1.687-6.027,6.364-4.341,10.448c9.271,22.447,13.972,46.255,13.972,70.761 c0,102.285-83.215,185.5-185.5,185.5s-185.5-83.215-185.5-185.5s83.215-185.5,185.5-185.5c36.12,0,71.127,10.386,101.235,30.033 c3.702,2.417,8.659,1.373,11.071-2.327c2.415-3.7,1.373-8.657-2.327-11.071c-32.716-21.35-70.746-32.635-109.979-32.635 c-111.107,0-201.5,90.393-201.5,201.5c0,62.698,28.788,118.795,73.835,155.779l-9.015,38.019 c-4.56,19.231,10.013,37.702,29.808,37.702c10.484,0,20.124-5.269,25.785-14.094c2.385-3.719,1.304-8.668-2.415-11.053 c-3.719-2.389-8.667-1.306-11.053,2.414c-2.704,4.216-7.309,6.732-12.317,6.732c-9.457,0-16.418-8.825-14.24-18.011l7.405-31.229 c68.797,47.198,159.628,47.02,228.271-0.595l7.546,31.824c2.178,9.186-4.782,18.011-14.239,18.011 c-5.009,0-9.613-2.517-12.316-6.732c-2.386-3.718-7.334-4.8-11.054-2.415c-3.719,2.386-4.8,7.334-2.415,11.054 c5.661,8.825,15.3,14.094,25.785,14.094c19.765,0,34.375-18.441,29.808-37.702l-9.178-38.708 c69.723-57.869,90.685-152.372,57.817-231.958C400.637,167.562,395.96,165.619,391.875,167.304z"></path><path fill="#2e58ff" d="M461.687,42.192c-3.769-2.307-8.692-1.125-11.002,2.641l-26.549,43.318 c-5.138,8.38-15.088,12.826-24.757,11.071l-18.419-3.349c40.861-40.861,38.648-38.198,39.474-40.389 c0.699-1.854,0.186,2.302,4.048-46.845c0.51-6.498-6.582-10.862-12.156-7.448l-43.318,26.551 c-9.234,5.66-15.859,14.977-18.176,25.561c-1.095,5.003,2.725,9.712,7.823,9.712c3.677-0.001,6.988-2.552,7.808-6.292 c1.39-6.352,5.365-11.943,10.906-15.339L407.3,23.039l-2.038,25.904l-87.41,87.41c-27.93-25.426-63.789-39.34-101.846-39.34 c-83.538,0-151.5,67.963-151.5,151.5s67.962,151.5,151.5,151.5c103.938,0,177.57-103.088,143-201.65 c-1.461-4.17-6.025-6.366-10.196-4.901c-4.169,1.462-6.364,6.027-4.901,10.196c30.85,87.977-34.782,180.355-127.902,180.355 c-74.715,0-135.5-60.785-135.5-135.5s60.785-135.5,135.5-135.5c33.778,0,65.617,12.26,90.515,34.671l-24.083,24.084 c-18.439-16.018-41.736-24.755-66.431-24.755c-55.967,0-101.5,45.533-101.5,101.5s45.533,101.5,101.5,101.5 c67.267,0,116.359-64.764,97.497-129.81c-1.23-4.243-5.67-6.688-9.911-5.456c-4.244,1.23-6.687,5.668-5.456,9.911 c15.874,54.748-25.421,109.354-82.13,109.354c-47.145,0-85.5-38.355-85.5-85.5s38.355-85.5,85.5-85.5 c20.413,0,39.685,7.095,55.076,20.109l-21.324,21.324c-9.632-7.417-21.357-11.434-33.752-11.434c-30.603,0-55.5,24.897-55.5,55.5 s24.897,55.5,55.5,55.5c29.042,0,53.361-22.673,55.365-51.616c0.306-4.408-3.021-8.229-7.428-8.533 c-4.425-0.321-8.229,3.021-8.533,7.428c-1.427,20.592-18.734,36.722-39.404,36.722c-21.78,0-39.5-17.72-39.5-39.5 s17.72-39.5,39.5-39.5c8.096,0,15.793,2.406,22.303,6.882l-27.46,27.46c-5.054,5.055-1.407,13.657,5.657,13.657 c2.047,0,4.095-0.781,5.657-2.343l145.037-145.036c32.072,5.831,31.671,5.964,36.357,5.964c13.733,0,26.904-7.151,34.221-19.086 l26.55-43.318C466.636,49.426,465.453,44.501,461.687,42.192z"></path>
                                                                        </svg>
                                                                        <h4 class="my-2">Objectifs</h4>
                                                                        <%
                                                                            String c = (String) session.getAttribute("c");
                                                                            String obj = "Vous allez passer le test de la compétence <strong>" + c + "</strong> en difficulté " + palier + "/3.";
                                                                            if (palier == 3) {
                                                                                obj = "Vous allez passer le test de la compétence <strong>" + c + "</strong> en difficulté maximale.<br>En cas de réussite,<strong> la compétence sera validée !</strong>";
                                                                            }

                                                                        %>
                                                                        <p style="color:black"><%=obj%></p>


                                                                    </div>
                                                                </div>
                                                            </div>


                                                        </div>

                                                    </div>
                                                </div>

                                                <form action="test" method="post">

                                                    <%                                                                    int countE = 1;
                                                        for (Exercise exercise : exercises) {
                                                    %>

                                                    <div id="wizard_<%=countE%>" class="tab-pane" role="tabpanel" style="padding:0 3%">
                                                        <div >
                                                            <div class="row">
                                                                <div class="col-xl-9 col-xxl-9 col-9" >
                                                                    <h4>Question  <%=countE%> sur <%=exercises.size()%></h4>
                                                                </div>

                                                            </div>

                                                            <div class="row" style="padding:  3% ;" >
                                                                <h2><%= exercise.getContent()%> </h2><br><br> 
                                                                <div class="basic-form" >
                                                                    <div class="mb-3 mb-0" style="padding: 1% 1%">
                                                                        <%  if (exercise.getPrompt().equals(false)) {
                                                                                for (String option : exercise.getOptions()) {


                                                                        %>

                                                                        <div id="option" >
                                                                            <input type="radio" class="form-check-input" id="customRadioBox<%=countE%>" name="Ex<%=countE%>"  value="<%= option%>" >
                                                                            <label class="form-check-label" for="customRadioBox<%=countE%>"><%= option%></label>
                                                                        </div><br>



                                                                        <% }%>

                                                                        <%                                                          } else {%>
                                                                        <br><br>
                                                                        <div class="input-group mb-3">

                                                                            <input type="text" class="form-control" id="customRadioBox<%=countE%>" name="Ex<%=countE%>" placeholder="Votre réponse Ici"  >
                                                                        </div>


                                                                        <%   }%>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>

                                                    </div>



                                                    <%
                                                            countE++;
                                                        }%>
                                                    <div id="wizard_Finish" class="tab-pane" role="tabpanel">
                                                        <div class="row emial-setup" style="text-align: center">

                                                            <p>C'est terminé !!! </p>
                                                            <div>
                                                                <button type="submit" class="btn btn-primary">Valider les réponses</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <% }%>





                                        </div>

                                        <div id="overlay" ></div>

                                    </div>
                                </div>
                            </div>


                        </div>


                        <!-- Modal -->

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


        <script src="./vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>


        <script src="./js/custom.js"></script>
        <script src="custom.js"></script>
        <script src="./js/deznav-init.js"></script>
        <script src="./vendor/jquery-smartwizard/dist/js/jquery.smartWizard.js"></script>

        <script>



        </script>
        <script>
            $(document).ready(function () {

            <%
                int co = 1;
                for (Exercise exercise : exercises) {%>
                var button = $('#verify_<%=co%>');
                $(document).ready(function () {
                    // Your function code here
                    console.log("Button loaded: " + <%=co%>);
                    verifyAnswer(this,<%=co%>);
                    // Call your function passing the button or any other relevant data

                });
            <% co++;
                }%>

                var numExos = <%= exercises.size() + 1%>;

                for (var i = 1; i <= numExos; i++) {

                    $("#wizard_" + i).hide();

                }

            });
        </script>
        <script src='wizard_timer.js'>

        </script>
        <script>
            $(document).ready(function () {



                // Send the checkbox state to the server using AJAX
                function sendCheckboxState() {
                    $.ajax({
                        url: 'verifiyAcces',
                        type: 'POST',
                        data: {emailStudent: "<%=user.getEmail()%>"},
                        success: function (response) {

                            if (response.accesToTest) {

                                $("#overlay").css("display", "none");
                            } else {
                                $("#overlay").css("display", "initial");
                            }

                        },
                        error: function (xhr, status, error) {
                            console.log('Error updating checkbox state: ' + error);
                        }
                    });
                }
                sendCheckboxState();
                // Set the interval to periodically call the function
                setInterval(sendCheckboxState, 5000);
            });
        </script>
        <script>




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
            'musique/mTest.mp3'            
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
