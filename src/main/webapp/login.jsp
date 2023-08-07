<%-- 
    Document   : login
    Created on : 4 juin 2023, 21:29:18
    Author     : medel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="h-100">

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
        <!--<link rel="shortcut icon" type="image/png" href="images/favicon.png">-->
        <link href="./vendor/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">
        <link href="./vendor/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">
        <link href="./vendor/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">
        <link href="./vendor/swiper/css/swiper-bundle.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Material+Icons" rel="stylesheet">
        <link href="./css/style.css" rel="stylesheet">

        <link
            class="jsbin"
            href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/base/jquery-ui.css"
            rel="stylesheet"
            type="text/css"
            />
        <script
            class="jsbin"
            src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"
        ></script>
        <script
            class="jsbin"
            src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js"
        ></script>

        <style>

            article,
            aside,
            figure,
            footer,
            header,
            hgroup,
            menu,
            nav,
            section {
                display: block;
            }

        </style>

    </head>

    <body class="vh-100">
        <div class="page-wraper">

            <!-- Content -->
            <div class="browse-job login-style3">
                <!-- Coming Soon -->
                <div class="bg-img-fix overflow-hidden" style="background:#fff url(images/background/bg6.jpg); height: 100vh;">
                    <div class="row gx-0">
                        <div class="col-xl-4 col-lg-5 col-md-6 col-sm-12 vh-100 bg-white ">
                            <div id="mCSB_1" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: 653px; overflow: scroll" tabindex="0">
                                <div id="mCSB_1_container" class="mCSB_container" style="position:relative; top:0; left:0;" dir="ltr">
                                    <div class="login-form style-2">


                                        <div class="card-body">
                                            <div class="logo-header">
                                                <!--                                                <a href="index.html" class="logo"><img src="images/logo/logo-full.png" alt="" class="width-230 light-logo"></a>-->
                                                <!--<a href="index.html" class="logo"><img src="images/logo/logofull-white.png" alt="" class="width-230 dark-logo"></a>-->
                                                <a href="login.jsp" class="logo">LOGO</a>
                                            </div>

                                            <nav>
                                                <div class="nav nav-tabs border-bottom-0" id="nav-tab" role="tablist">

                                                    <div class="tab-content w-100" id="nav-tabContent">
                                                        <div class="tab-pane fade show active" id="nav-personal" role="tabpanel" aria-labelledby="nav-personal-tab">
                                                            <c:if test="${not empty error}">
                                                                <span style="color: red;">${error}</span>
                                                            </c:if>
                                                            <form action="login" method="post" class=" dz-form pb-3">
                                                                <h3 class="form-title m-t0">Informations Personnelles</h3>
                                                                <div class="dz-separator-outer m-b5">
                                                                    <div class="dz-separator bg-primary style-liner"></div>
                                                                </div>
                                                                <p>Saisissez votre adresse email et votre mot de passe. </p>
                                                                <div class="form-group mb-3">
                                                                    <input type="email" class="form-control"  name="email" Placeholder="hello@example.com">
                                                                </div>
                                                                <div class="form-group mb-3">
                                                                    <input type="password" class="form-control" name ="password" Placeholder="Mot de passe">
                                                                </div>
                                                                <div class="form-group text-left mb-5 forget-main">
                                                                    <button type="submit" class="btn btn-primary">Se connecter</button>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                    <span class="form-check d-inline-block">
                                                                        <input type="checkbox" class="form-check-input" id="check1" name="example1">
                                                                        <label class="form-check-label" for="check1">Se souvenir</label>
                                                                    </span>
                                                                    <button class="nav-link m-auto btn tp-btn-light btn-primary forget-tab " id="nav-forget-tab" data-bs-toggle="tab" data-bs-target="#nav-forget" type="button" role="tab" aria-controls="nav-forget" aria-selected="false">Mot de Passe Oublié ?</button> 	
                                                                </div>
                                                                <div class="dz-social ">
                                                                    <h5 class="form-title fs-20">Se connecter avec</h5>
                                                                    <ul class="dz-social-icon dz-border dz-social-icon-lg text-white">
                                                                        <li><a target="_blank" href="https://www.facebook.com/" class="fab fa-facebook-f btn-facebook"></a></li>
                                                                        <li><a target="_blank" href="https://www.google.com/" class="fab fa-google-plus-g btn-google-plus"></a></li>
                                                                        <li><a target="_blank" href="https://www.linkedin.com/" class="fab fa-linkedin-in btn-linkedin"></a></li>
                                                                        <li><a target="_blank" href="https://twitter.com/" class="fab fa-twitter btn-twitter"></a></li>
                                                                    </ul>
                                                                </div>
                                                            </form>
                                                            <div class="text-center bottom"> 
                                                                <button class="btn btn-primary button-md btn-block" id="nav-sign-tab" data-bs-toggle="tab" data-bs-target="#nav-sign" type="button" role="tab" aria-controls="nav-sign" aria-selected="false">Créer un compte</button> 

                                                            </div>
                                                        </div>

                                                        <div class="tab-pane fade" id="nav-forget"  role="tabpanel" aria-labelledby="nav-forget-tab">
                                                            <form class="dz-form">
                                                                <h3 class="form-title m-t0">Mot de passe oublié ?</h3>
                                                                <div class="dz-separator-outer m-b5">
                                                                    <div class="dz-separator bg-primary style-liner"></div>
                                                                </div>
                                                                <p>Saisissez votre adresse e-mail ci-dessous pour réinitialiser votre mot de passe.. </p>
                                                                <div class="form-group mb-4">
                                                                    <input name="dzName" required="" class="form-control" placeholder="Email Address" type="text">
                                                                </div>
                                                                <div class="form-group clearfix text-left"> 
                                                                    <button class=" active btn btn-primary" id="nav-personal-tab" data-bs-toggle="tab" data-bs-target="#nav-personal" type="button" role="tab" aria-controls="nav-personal" aria-selected="true">Back</button>
                                                                    <button class="btn btn-primary float-end">Envoyer</button>
                                                                </div>
                                                            </form>
                                                        </div>

                                                        <div class="tab-pane fade" id="nav-sign" role="tabpanel" aria-labelledby="nav-sign-tab">
                                                            <c:if test="${not empty error}">
                                                                <span style="color: red;">${error}</span>
                                                            </c:if>
                                                            <form action="signup" method="post"  class="dz-form py-2" enctype="multipart/form-data" >
                                                                <h3 class="form-title">S'inscrire</h3>
                                                                <div class="dz-separator-outer m-b5">
                                                                    <div class="dz-separator bg-primary style-liner"></div>
                                                                </div>
                                                                <p>Saisissez vos données personnelles ci-dessous : </p>

                                                                <div class="card card-bx profile-card author-profile m-b30">
                                                                    <div class="card-body">

                                                                        <div class="p-5">

                                                                            <div class="author-media">
                                                                                <img src="images/tab/1.jpg" id="blah" alt="">
                                                                                <div class="upload-link" title="" data-toggle="tooltip" data-placement="right" data-original-title="update">
                                                                                    <input type="file" class="update-flie" name="profilImage" onchange="readURL(this);"  accept="images/*">
                                                                                    <i class="fa fa-camera"></i>
                                                                                </div>
                                                                            </div>
                                                                            <div class="author-info">
                                                                                <h6 class="title">Photo de Profil</h6>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group mt-3">
                                                                    <select name="role" id="role" onchange="toggleTeacherInput()" class="default-select form-control wide form-control-sm ">
                                                                        <option value="Enseignant">Enseignant</option>
                                                                        <option value="Apprenant">Apprenant</option>
                                                                    </select>
                                                                </div>
                                                                <div class="form-group mt-3">
                                                                    <input name="nom" required class="form-control" placeholder="Nom" type="text">
                                                                </div>
                                                                <div class="form-group mt-3">
                                                                    <input name="prenom" required class="form-control" placeholder="Prénom" type="text">
                                                                </div>
                                                                <div class="form-group mt-3">
                                                                    <input name="email" required class="form-control" placeholder=" Adresse Email" type="email">
                                                                </div>

                                                                <div class="form-group mt-3">
                                                                    <input name="password" required class="form-control" placeholder="Mot de Passe" type="password">
                                                                </div>
                                                                <div class="form-group mt-3 mb-3">
                                                                    <input name="passwordV" required class="form-control" placeholder="Retapez votre mot de passe" type="password">
                                                                </div>
                                                                <div class="form-group mt-3" id="teacherInput" style="display: none;">
                                                                    <input name="emailEnseignant" class="form-control" placeholder="Adresse Email de votre enseignant" type="email">
                                                                </div>

                                                                <div class="mb-3">
                                                                    <span class="form-check float-start me-2 ">
                                                                        <input type="checkbox" class="form-check-input" id="check2" name="example1">
                                                                        <label class="form-check-label d-unset" for="check2">J'accepte les</label>
                                                                    </span>
                                                                    <label ><a href="#">Terms of Service </a>&amp; <a href="#">Politique de confidentialité</a></label>
                                                                </div>
                                                                <div class="form-group clearfix text-left">
                                                                    <button class="btn btn-primary outline gray" data-bs-toggle="tab" data-bs-target="#nav-personal" type="button" role="tab" aria-controls="nav-personal" aria-selected="true">Retour</button>
                                                                    <button type="submit" class="btn btn-primary float-end">S'inscrire</button>

                                                                </div>
                                                            </form>

                                                        </div>
                                                    </div>

                                                </div>
                                            </nav>
                                        </div>
                                        <div class="card-footer">
                                            <div class=" bottom-footer clearfix m-t10 m-b20 row text-center">
                                                <div class="col-lg-12 text-center">
                                                    <span> © Copyright by <span class="heart"></span>
                                                        <a href="javascript:void(0);">Mohamed at ELLIAD </a> All rights reserved.</span> 
                                                </div>
                                            </div>
                                        </div>	

                                    </div>
                                </div>
                                <div id="mCSB_1_scrollbar_vertical" class="mCSB_scrollTools mCSB_1_scrollbar mCS-light mCSB_scrollTools_vertical" style="display: block;">
                                    <div class="mCSB_draggerContainer">
                                        <div id="mCSB_1_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 0px; display: block; height: 652px; max-height: 643px; top: 0px;">
                                            <div class="mCSB_dragger_bar" style="line-height: 0px;"></div><div class="mCSB_draggerRail"></div></div></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Full Blog Page Contant -->
            </div>
            <!-- Content END-->
        </div>

        <!--**********************************
                Scripts
        ***********************************-->
        <!-- Required vendors -->
        <script src="./vendor/global/global.min.js"></script>
        <script src="./vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
        <script src="js/deznav-init.js"></script>
        <script src="./js/custom.js"></script>
        <script>
                                                                        function toggleTeacherInput() {
                                                                            var roleSelect = document.getElementById("role");
                                                                            var teacherInput = document.getElementById("teacherInput");
                                                                            var teacherEmailInput = teacherInput.querySelector('input[name="emailEnseignant"]');

                                                                            if (roleSelect.value === "Apprenant") {
                                                                                teacherInput.style.display = "block";
                                                                                teacherEmailInput.required = true;
                                                                            } else {
                                                                                teacherInput.style.display = "none";
                                                                                teacherEmailInput.required = false;
                                                                            }
                                                                        }

                                                                        function readURL(input) {
                                                                            if (input.files && input.files[0]) {
                                                                                var reader = new FileReader();

                                                                                reader.onload = function (e) {
                                                                                    $('#blah').attr('src', e.target.result).width(150).height(200);
                                                                                };

                                                                                reader.readAsDataURL(input.files[0]);
                                                                            }
                                                                        }

        </script>


    </body>
</html>