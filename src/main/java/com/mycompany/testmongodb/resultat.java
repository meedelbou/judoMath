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
import java.util.Collections;
import java.util.List;
import java.util.Random;
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
@WebServlet(name = "resultat", urlPatterns = {"/resultat"})
public class resultat extends HttpServlet {

   
     
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

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
            int selectedOption = new Integer(selectedOptionString);
            request.setAttribute("Ex"+exerciseIndex, selectedOption);
            answers.add(selectedOption);
            boolean isCorrect = exercise.checkResult(selectedOption);
            results.add(isCorrect);
            exerciseIndex++;
        }
        session.setAttribute("answers",answers);

        // Store the results in a session attribute for further processing
        request.getSession().setAttribute("results", results);

        // Redirect to a results page or perform any other action
        request.getRequestDispatcher("results.jsp").forward(request, response);

    }
    
    private List<Integer> generateOptions(int answer) {
        List<Integer> options = new ArrayList<>();
        options.add(answer); // Correct answer

        Random random = new Random();
        while (options.size() < 4) { // Generate three incorrect options
            int option = answer + random.nextInt(5) - 2; // Add/subtract a random value to/from the correct answer
            if (!options.contains(option)) {
                options.add(option);
            }
        }

        // Shuffle the options
        Collections.shuffle(options);

        return options;
    }


}
