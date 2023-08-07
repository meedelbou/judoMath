/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.testmongodb;

import Models.Exercise;
import Models.Lesson;
import Models.Student;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
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
import org.bson.Document;
import Models.exercisesGen;
import com.mongodb.ConnectionString;
import com.mongodb.MongoClientSettings;
import com.mongodb.ServerApi;
import com.mongodb.ServerApiVersion;

/**
 *
 * @author medel
 */
@WebServlet(name = "ApprentissageAdaptatif", urlPatterns = {"/ApprentissageAdaptatif"})
public class ApprentissageAdaptatif extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String DATABASE_NAME = "my_test_db";
    private static final String COLLECTION_NAME = "Users";

  

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
        MongoDatabase database = mongoClient.getDatabase(DATABASE_NAME);
        MongoCollection<Document> collection = database.getCollection(COLLECTION_NAME);

        HttpSession session = request.getSession();
        session.removeAttribute("resultsTest");
        session.removeAttribute("answersTest");
        session.removeAttribute("passed_palier");
        session.removeAttribute("passed");
        session.removeAttribute("failed");
        Student user = (Student) session.getAttribute("user");

        Document studentQuery = new Document("email", user.getEmail());
        Document student = collection.find(studentQuery).first();

        String nextSkillName = student.get("nextSkill", Document.class).getString("name");

        if (nextSkillName == null) {
            nextSkillName = "Additionner un entier à un autre pour obtenir 10";
            student.get("nextSkill", Document.class).append("name", nextSkillName);
            collection.replaceOne(studentQuery, student);
        }

        String nextSkillURL = student.get("nextSkill", Document.class).getString("Url");

        Integer essais = student.get(nextSkillName, Document.class).getInteger("essais");
        Integer palier = student.get(nextSkillName, Document.class).getInteger("palier");
        if (essais == null) {
            essais = 0;
            student.get(nextSkillName, Document.class).append("essais", essais);
            collection.replaceOne(studentQuery, student);
        }

        if (palier == null) {
            palier = 1;
            student.get(nextSkillName, Document.class).append("palier", palier);
            collection.replaceOne(studentQuery, student);
        }

        Lesson lesson = new Lesson();

        exercisesGen genExos = new exercisesGen();

        lesson = genExos.generateExercises(nextSkillName, palier);

        session.setAttribute("lesson", lesson);

        session.setAttribute("c", nextSkillName);

        session.setAttribute("e", essais);

        session.setAttribute("palier", palier);
        session.setAttribute("compURL", nextSkillURL);

        response.sendRedirect("apprentissageAdaptatif.jsp");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

}
