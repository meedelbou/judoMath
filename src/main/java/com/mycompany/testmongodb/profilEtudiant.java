/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.testmongodb;

import Models.Student;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.jena.query.Dataset;
import org.apache.jena.query.Query;
import org.apache.jena.query.QueryExecution;
import org.apache.jena.query.QueryExecutionFactory;
import org.apache.jena.query.QueryFactory;
import org.apache.jena.query.QuerySolution;
import org.apache.jena.query.ReadWrite;
import org.apache.jena.query.ResultSet;
import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.RDFNode;
import org.apache.jena.tdb.TDBFactory;
import org.bson.Document;

/**
 *
 * @author medel
 */
@WebServlet(name = "profilEtudiant", urlPatterns = {"/profilEtudiant"})
public class profilEtudiant extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String DATABASE_NAME = "my_test_db";
    private static final String COLLECTION_NAME = "Users";

    String connectionString = "mongodb://judomathdb:b1ooszXJgLWa6TIuVyMusgjONqpQit6IIALmoQ956oKGOwEl1gcsUQm9yNYybdfa7E27EO0305MpACDbdQPaqg==@judomathdb.mongo.cosmos.azure.com:10255/?ssl=true&retrywrites=false&replicaSet=globaldb&maxIdleTimeMS=120000&appName=@judomathdb@";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        List<Student> etudiants = (List<Student>) session.getAttribute("etudiants");
        String index = request.getParameter("e");
        Integer e = Integer.parseInt(index);

        Student user;
        user = etudiants.get(e);
        session.setAttribute("etudiants", etudiants);

        MongoClient mongoClient = MongoClients.create(connectionString);
        MongoDatabase database = mongoClient.getDatabase(DATABASE_NAME);
        MongoCollection<Document> collection = database.getCollection(COLLECTION_NAME);

        List<String> skillsRecommended = new ArrayList();
        List<skill> skills = new ArrayList();
        List<skill> skillsInProgress = new ArrayList();

        Document studentQuery = new Document("email", user.getEmail());
        Document student = collection.find(studentQuery).first();

        for (String field : student.keySet()) {
            if (field.equals("_id") || field.equals("email") || field.equals("password")
                    || field.equals("nom") || field.equals("prenom") || field.equals("role")
                    || field.equals("enseignantEmail") || field.equals("dateOfSignup")
                    || field.equals("competencesValides") || field.equals("experiencePoints")
                    || field.equals("lastLogin") || field.equals("numberOfVisits")
                    || field.equals("accesToTest") || field.equals("status") || field.equals("imageId")
                    || field.equals("nextSkill")) {
                continue;
            }
            try {
                Document skillDoc = student.get(field, Document.class);
                if (skillDoc != null) {
                    skill currentSkill = new skill();
                    currentSkill.setName(field);

                    currentSkill.setProgress(skillDoc.getInteger("progress"));
                    currentSkill.setUrl(skillDoc.getString("Url"));
                    currentSkill.setTimeSpent(skillDoc.getInteger("timeSpent"));

                    Document allPalierDetailsDoc = skillDoc.get("AllpalierDetails", Document.class);
                    Map<String, skill.PalierDetails> allPalierDetails = new HashMap<>();
                    for (String key : allPalierDetailsDoc.keySet()) {
                        Document palierDetailsDoc = allPalierDetailsDoc.get(key, Document.class);
                        skill.PalierDetails palierDetails = currentSkill.new PalierDetails();
                        palierDetails.setTotalTrainingTrys(palierDetailsDoc.getInteger("totalTrainingTrys"));
                        palierDetails.setTotalTestTrys(palierDetailsDoc.getInteger("totalTestTrys"));
                        allPalierDetails.put(key, palierDetails);
                    }
                    currentSkill.setAllPalierDetails(allPalierDetails);
                    skillsInProgress.add(currentSkill);
                }

            } catch (ClassCastException E) {
                continue;

            }

        }
        user.setSkillsInProgress(skillsInProgress);

        Long studentTimeSpent = student.getLong("TotalTimeSpent");

        if (studentTimeSpent == null) {
            studentTimeSpent = 0L;
        }

        user.setTotalTimeSpent(studentTimeSpent);

        session.setAttribute("skillsRecommended", skills);
        try {
            Document nextSkillDocument = student.get("nextSkill", Document.class);
            if (nextSkillDocument != null) {
                String nextSkillName = nextSkillDocument.getString("name");
                if (nextSkillName != null) {
                    skill nextSkill = new skill(nextSkillName);
                    Document nextSkillData = student.get(nextSkillName, Document.class);
                    nextSkill.setProgress(nextSkillData.getInteger("progress"));
                    session.setAttribute("palier", nextSkillData.getInteger("palier"));

                    session.setAttribute("c", nextSkillName);
                    session.setAttribute("nextSkill", nextSkill);
                    session.setAttribute("student", user);
                    request.getRequestDispatcher("/app-profile-1.jsp").forward(request, response);

                }
            }

        } catch (ClassCastException c) {
            session.setAttribute("student", user);
            request.getRequestDispatcher("/app-profile-1.jsp").forward(request, response);

        }

    }

}
