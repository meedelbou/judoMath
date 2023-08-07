<%@page import="Models.Lesson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import ="Models.Exercise" %>
<%@ page import ="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Exercise Results</title>
    </head>
    <body>
        ${answers}
        <h1>Exercise Results</h1>
        <table>
            <tr>
                <th>Exercise</th>
                <th>Content</th>
                <th>Your Answer</th>
                <th>Correct Answer</th>
                <th>Result</th>
            </tr>
            <%
                Lesson lesson =(Lesson)session.getAttribute("lesson");
                List<Exercise> exercises = (List<Exercise>) session.getAttribute("exercises");
                List<Integer> answers = (List<Integer>) session.getAttribute("answers");
                List<Boolean> results = (List<Boolean>) session.getAttribute("results");
                

                int countE = 1;
                for (Exercise exercise :lesson.getExercises() ) {
            %>
            <tr>
                <td><%= countE%></td>
                <td><%= exercise.getContent()%></td>
                <td><%= answers.get(countE-1)%></td>
                <td><%= exercise.getAnswer()%></td>
                <td><%= results.get(countE-1) ? "Correct" : "Incorrect"%></td>
            </tr>
            <%
                    countE++;
                }
            %>
        </table>
    </body>
</html>
