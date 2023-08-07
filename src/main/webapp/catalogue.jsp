<%-- 
    Document   : catalogue
    Created on : 31 mai 2023, 09:51:31
    Author     : medel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>

            .course {
             
            }
            .content {
              margin-left: 100px;
            }
            
        </style>
    </head>
    <body>
        <h1 align='center'>Catalogue des cours de mathématiques 3e cycle</h1>
        <h2>Calculer</h3> 
        <div class='content'>
            <div class = "course" >

                <h3>Entiers</h3>
                <ul>
                    <li> <a href="afficherCours?c=additionEntier"> Addition </a></li>
                    <li><a href="afficherCours?c=comparaisonEntier">Comparaison </a></li>
                    <li>Division 
                        <ul>
                            <li> <a href="afficherCours?c=criteresDiv">Criteres division</a></li>
                            <li><a href="afficherCours?c=entierDivEntier">Entier / Entier</a></li>
                            <li><a href="afficherCours?c=entierDivPar10">Entier / 10</a> </li>
                        </ul>
                    </li>
                    <li><a href="afficherCours?c=encadrementEntier">Encadrement </a></li>
                    <li>Multiplication <ul><li><a href="afficherCours?c=tablesDeMultiplication">Tables de multiplication</a></li></ul></li>
                    <li><a href="afficherCours?c=ordreCalculEntier">Ordre de calcul </a></li>
                    <li><a href="afficherCours?c=soustractionEntier">Soustraction</a></li>
                </ul>
            </div>
            <div class="course">
                <h3>Décimaux</h3>
                <ul>
                    <li><a href="afficherCours?c=additionDecimal">Addition</a></li>
                    <li><a href="afficherCours?c=soustractionDecimal">Soustraction</a></li>
                    <li><a href="afficherCours?c=comparaisonDecimal">Comparaison</a></li>
                    <li><a href="afficherCours?c=multiplicationDecimal">Multiplication</a></li>
                    <li><a href="afficherCours?c=divisionDecimal">Division</a></li>
                    <li><a href="afficherCours?c=divisionDecimal">ordre de calcul</a></li>
                    <li><a href="afficherCours?c=encadrementDecimal">Encadrement</a></li>
                </ul>
            </div>
            <div class="course">
                <h3>Fraction</h3>
                <ul>
                    <li><a href="afficherCours?c=additionFraction">Addition</a></li>
                    <li><a href="afficherCours?c=comparaisonFraction">Comparaison</a></li>
                    <li>Multiplication
                        <ul>
                            <li> <a href="afficherCours?c=entierMultFractionRemarquable">Multiplication des fractions remarquables</a></li>

                        </ul>
                    </li>
                    <li><a href="afficherCours?c=EncadrementFraction">Encadrement</a></li>
                </ul>
            </div>

            <div class="course">
                <h3><a href="afficherCours?c=Proportionnalite">Proportionnalité</a></h3>
            </div>

            <div class="course">
                <h3><a href="afficherCours?c=Conversion">Conversion</a></h3>
            </div>

        </div> 
</body>
</html>
