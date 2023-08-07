/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.testmongodb;

import Models.Exercise;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author medel
 */
@WebServlet(name = "acquerirCompetence", urlPatterns = {"/acquerirCompetence"})
public class acquerirCompetence extends HttpServlet {
  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Exercise> exercises = (List<Exercise>) session.getAttribute("exercises");
        List<Boolean> results = new ArrayList<>();
        int exerciseIndex = 1;
        List<Integer> answers = new ArrayList<>();

        for (Exercise exercise : exercises) {

            String selectedOptionString = request.getParameter("Ex" + exerciseIndex);
            if (!(selectedOptionString == null)) {
                int selectedOption = new Integer(selectedOptionString);
                request.setAttribute("Ex" + exerciseIndex, selectedOption);
                answers.add(selectedOption);
                boolean isCorrect = exercise.checkResult(selectedOption);
                results.add(isCorrect);
                exerciseIndex++;
            } else {
                request.setAttribute("Ex" + exerciseIndex, -2021);
                answers.add(-2021);
                boolean isCorrect = exercise.checkResult(-2021);
                results.add(isCorrect);
                exerciseIndex++;

            }
        }
        
        session.setAttribute("answersTraining", answers);

        // Store the results in a session attribute for further processing
        request.getSession().setAttribute("resultsTraining", results);

        // Redirect to a results page or perform any other action
        request.getRequestDispatcher("apprentissageAdaptatif.jsp").forward(request, response);
        
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
