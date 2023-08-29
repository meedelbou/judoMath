/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.testmongodb;

import Models.Student;
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
@WebServlet(name = "XpIncrement", urlPatterns = {"/XpIncrement"})
public class XpIncrement extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String DATABASE_NAME = "my_test_db";
    private static final String COLLECTION_NAME = "Users";

    String connectionString = "mongodb://judomathdb:b1ooszXJgLWa6TIuVyMusgjONqpQit6IIALmoQ956oKGOwEl1gcsUQm9yNYybdfa7E27EO0305MpACDbdQPaqg==@judomathdb.mongo.cosmos.azure.com:10255/?ssl=true&retrywrites=false&replicaSet=globaldb&maxIdleTimeMS=120000&appName=@judomathdb@";
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

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        MongoClient mongoClient = MongoClients.create(connectionString);
        MongoDatabase database = mongoClient.getDatabase(DATABASE_NAME);
        MongoCollection<Document> collection = database.getCollection(COLLECTION_NAME);

        HttpSession session = request.getSession();

        Student user = (Student) session.getAttribute("user");

        String palierString = request.getParameter("palier");
        String isQuestionString = request.getParameter("isQuestion");
        String isCorrectString = request.getParameter("isCorrect");

        Integer palier = Integer.parseInt(palierString);
        Boolean isQuestion = Boolean.parseBoolean(isQuestionString);
        Boolean isCorrect = Boolean.parseBoolean(isCorrectString);

        Document studentQuery = new Document("email", user.getEmail());
        Document student = collection.find(studentQuery).first();

        Document nextSkill = student.get("nextSkill", Document.class);
        String nextSkillName = nextSkill.getString("name");
        Document skillData = student.get(nextSkillName, Document.class);

        Integer experiencePoints = student.getInteger("experiencePoints");
        Integer progress = skillData.getInteger("progress");

        if (progress == null) {
            progress = 0;
            skillData.append("progress", progress);

        }

        Integer xpPoints = 0;

        if (isQuestion) {
            if (isCorrect) {
                xpPoints = 10;
            } else {
                xpPoints = -10;
            }
        } else {
            switch (palier) {
                case 1:
                    xpPoints = 100;
                    progress += 5;
                    break;
                case 2:
                    xpPoints = 300;
                    progress += (20 / 3);
                    break;
                default:
                    xpPoints = 500;
                    progress += (20 / 3);
                    break;
            }
        }

        experiencePoints = experiencePoints + xpPoints;

        student.append("experiencePoints", experiencePoints);
        skillData.append("progress", progress);

        collection.replaceOne(studentQuery, student);
        user.setExperiencePoints(experiencePoints);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"xpPoints\": " + experiencePoints + "}");

    }

}
