/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.testmongodb;

import java.lang.Math;

import Models.Exercise;
import Models.Lesson;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.text.DecimalFormat;
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
import com.mycompany.testmongodb.semantic;
import org.apache.jena.query.Dataset;
import org.apache.jena.query.ReadWrite;
import org.apache.jena.rdf.model.Model;
import org.apache.jena.tdb.TDBFactory;

/**
 *
 * @author medel
 */
@WebServlet(name = "learning", urlPatterns = {"/learning"})
public class learning extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String competence = request.getParameter("c");
        HttpSession session = request.getSession();

        Lesson lesson = new Lesson();

        List<Exercise> exercises = new ArrayList<>();

        Random random = new Random();

        for (int i = 0; i < 7; i++) {
            int operand1 = random.nextInt(10); // Random integer between 0 and 9
            int operand2 = random.nextInt(10); // Random integer between 0 and 9
            int answer = operand1 + operand2;

            Exercise exercise = new Exercise();
            exercise.setContent(operand1 + " + " + operand2 + " = ?");
            exercise.setAnswer(answer);
            exercise.setOptions(generateOptions(answer));

            exercises.add(exercise);
        }

        String paragraph = "💡 Savais-tu que l'addition 🧮 est comme une grande aventure 🚀 où tu combines des choses pour les rendre encore plus géniales ? ✨<br>  <br>"
                + "Imagine que tu as 🍎🍓 3 pommes dans une main et 🍌🍇 2 bananes dans l'autre main. Si tu les mets tous ensemble, combien de fruits auras-tu en tout ? 🍎🍓🍌🍇 <br> <br>"
                + "Et là, tu vas adorer ça ! Tu auras 🥳 5 fruits au total ! C'est ce qu'on appelle la somme ! 🎉<br> <br> "
                + "Pour montrer que nous faisons une addition, nous utilisons le signe plus (+). C'est comme si on disait \"et maintenant, ajoutons-les tous ensemble\" ! ➕<br> <br>"
                + "Donc, la prochaine fois que tu te demandes combien de choses tu as en tout lorsque tu combines des groupes, tu peux utiliser l'addition. C'est super amusant pour compter et découvrir combien de choses incroyables tu as ! 🌈<br> <br>";
        lesson.setContent(paragraph);
        lesson.setExercises(exercises);
        session.setAttribute("lesson", lesson);
        session.setAttribute("exercises", exercises);

        request.setAttribute("c", competence);

        request.getRequestDispatcher("apprentissageAdaptatif.jsp").forward(request, response);

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
        session.setAttribute("answersTest", answers);
        float score = 0;
        for (boolean element : results) {
            if (element) {
                score += ((float) 20 / results.size());
            }
        }

        if (score >= 14) {
         
            String messageDeReussite = "Bravo vous avez reussi le test et validé la competence";
            

            session.setAttribute("passed", messageDeReussite);
        } else {
            String messageDechec = "Veuillez s'entrainer à nouveau";
            session.setAttribute("failed", messageDechec);

        }
        DecimalFormat df = new DecimalFormat("#.##");

        // Store the results in a session attribute for further processing
        request.getSession().setAttribute("results", results);
        request.getSession().setAttribute("score", df.format(score));

        // Redirect to a results page or perform any other action
        request.getRequestDispatcher("test.jsp").forward(request, response);

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
