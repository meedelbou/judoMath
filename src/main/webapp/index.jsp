<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
    </head>
    <body align="center">
        <h2>Login</h2>
        <form method="post" action="login">
            <input type="email" name="email" placeholder="Email" required><br>
            <input type="password" name="password" placeholder="Password" required><br>
            <input type="submit" value="Login">  
        </form>


        <br>
        <c:if test="${not empty error}">
            <span style="color: red;">${error}</span>
        </c:if>

        <a href="signup.jsp">Sign up</a>


    </body>
</html>
