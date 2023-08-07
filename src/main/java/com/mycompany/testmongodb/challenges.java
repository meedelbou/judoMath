/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.testmongodb;

import Models.Exercise;
import Models.Student;
import Models.challengesGen;
import Models.skill;
import com.mongodb.ConnectionString;
import com.mongodb.MongoClientSettings;
import com.mongodb.ServerApi;
import com.mongodb.ServerApiVersion;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
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
import org.bson.Document;

/**
 *
 * @author medel
 */
@WebServlet(name = "challenges", urlPatterns = {"/challenges"})
public class challenges extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String DATABASE_NAME = "my_test_db";
    private static final String COLLECTION_NAME = "Users";

    String connectionString = "mongodb+srv://judomath:O1Tgj61O0EiDP0Wb@cluster0.elpqgfo.mongodb.net/?retryWrites=true&w=majority";
    ServerApi serverApi = ServerApi.builder()
            .version(ServerApiVersion.V1)
            .build();
    MongoClientSettings settings = MongoClientSettings.builder()
            .applyConnectionString(new ConnectionString(connectionString))
            .serverApi(serverApi)
            .build();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
        MongoDatabase database = mongoClient.getDatabase(DATABASE_NAME);
        MongoCollection<Document> collection = database.getCollection(COLLECTION_NAME);

        HttpSession session = request.getSession();
        Student user = (Student) session.getAttribute("user");

        Document studentQuery = new Document("email", user.getEmail());
        Document student = collection.find(studentQuery).first();

        List<skill> skillsInProgress = new ArrayList();

        String skill = request.getParameter("skill");

        if (skill == null) {
            for (String field : student.keySet()) {
                if (field.equals("_id") || field.equals("email") || field.equals("password")
                        || field.equals("nom") || field.equals("prenom") || field.equals("role")
                        || field.equals("enseignantEmail") || field.equals("dateOfSignup")
                        || field.equals("competencesValides") || field.equals("experiencePoints")
                        || field.equals("lastLogin") || field.equals("numberOfVisits")
                        || field.equals("accesToTest") || field.equals("status") || field.equals("imageId")
                        || field.equals("nextSkill") || field.equals("TotalTimeSpent")) {
                    continue;
                }

                Document skillDoc = student.get(field, Document.class);
                if (skillDoc != null) {
                    skill Skilloooo = new skill();
                    Skilloooo.setName(field);

                    Skilloooo.setProgress(skillDoc.getInteger("progress"));
                    Skilloooo.setUrl(skillDoc.getString("Url"));
                    skillsInProgress.add(Skilloooo);
                }
            }
            user.setSkillsInProgress(skillsInProgress);
            session.setAttribute("user", user);
            request.getRequestDispatcher("challenges.jsp").forward(request, response);

        } else {
            List<Exercise> exercises = new ArrayList();
            session.setAttribute("skill", skill);
            challengesGen cg = new challengesGen();
            exercises = cg.genChallenge(skill);
            session.setAttribute("exercisesChallenges", exercises);

            request.getRequestDispatcher("challengepage.jsp").forward(request, response);
        }

    }

}
