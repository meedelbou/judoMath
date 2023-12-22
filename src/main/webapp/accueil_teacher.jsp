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
        <title>Judomath - Gestion</title>
        <!-- FAVICONS ICON -->
        <link rel="shortcut icon" type="image/png" href="images/JM_icon.png">
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

                                                    <img src="images/tab/1.jpg>" alt="" class="userImg">
                                                </div>
                                                
                                               <div class="header-info">
                                                    <h6>${user.prenom} ${user.nom}</h6>
                                                    <p class="userLog">${user.email}</p>
                                                </div>                                          

                                            </div>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-end" style="">
                                            <div class="card border-0 mb-0">
                                                <div class="card-header py-2" style="display:none;">
                                                    <div class="products">
                                                        
                                                    <div>
                                                    
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
                <!-- row -->	
                <div class="page-titles">
                    <ol class="breadcrumb">
                        <li><h5 class="bc-title">Tableau de bord</h5></li>
                        <li class="breadcrumb-item">
                            <a href="javascript:void(0)">
                                <svg width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M2.125 6.375L8.5 1.41667L14.875 6.375V14.1667C14.875 14.5424 14.7257 14.9027 14.4601 15.1684C14.1944 15.4341 13.8341 15.5833 13.4583 15.5833H3.54167C3.16594 15.5833 2.80561 15.4341 2.53993 15.1684C2.27426 14.9027 2.125 14.5424 2.125 14.1667V6.375Z" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M6.375 15.5833V8.5H10.625V15.5833" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round"/>
                                </svg>
                                <span> Judomath </span>
                                </a>
                        </li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">Tableau de bord</a></li>
                    </ol>
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
                                                            <input type="checkbox" class="form-check-input myCheckbox" data-email="<%=etudiant.getEmail()%>" <%= etudiant.isAccesToTest() ? "checked" : ""%>>
                                                            <label class="form-check-label" for="customCheckBox2"></label>
                                                        </div>
                                                    </td>

                                                    <td>
                                                        <div class="products">
                                                            <% if (!base64Image.equals("")) {%>
                                                            <img src="data:image/jpeg;base64,<%=base64Image%>" class="avatar avatar-md img_user" alt="">
                                                            <% } else {%>
                                                            <img src="images/contacts/pic1.jpg" class="avatar avatar-md userImg" alt="">


                                                            <% }%>
                                                            <div>
                                                                <h6><a href="profilEtudiant?e=<%=etudiants.indexOf(etudiant)%>"><strong><%=etudiant.getNom()%> <%=etudiant.getPrenom()%></strong></a></h6>
                                                                <span><%=etudiant.getRole()%></span>	
                                                            </div>	
                                                        </div>
                                                    </td>
                                                    <td ><span class="userLog"><%=etudiant.getEmail()%> </span></td>
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

        <script src="./js/photo_user.js"></script>

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
