<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Signup</title>
    </head>
    <body align="center">
        <h2>Signup</h2>
        <form method="post" action="signup">
            <select name="role" id="role" onchange="toggleTeacherInput()">
                <option value="enseignant">Enseignant</option>
                <option value="apprenant">Apprenant</option>
            </select><br>
            <input type="email" name="email" placeholder="email" required><br>
            <input type="password" name="password" placeholder="Password" required><br>
            <input type="text" name="nom" placeholder="Nom" required><br>
            <input type="text" name="prenom" placeholder="Prénom" required><br>
            <div id="teacherInput" style="display: none;">
                <input type="text" name="emailEnseignant" placeholder="Email de votre enseignant" required><br>
            </div>
            <input type="submit" value="Signup">
        </form>
        <br>
        <c:if test="${not empty error}">
            <span style="color: red;">${error}</span>
        </c:if>


        <script>
            function toggleTeacherInput() {
                var roleSelect = document.getElementById("role");
                var teacherInput = document.getElementById("teacherInput");

                if (roleSelect.value === "apprenant") {
                    teacherInput.style.display = "block";
                } else {
                    teacherInput.style.display = "none";
                }
            }
        </script>
    </body>
</html>
