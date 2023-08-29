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
@WebServlet(name = "incrementAttempts", urlPatterns = {"/incrementAttempts"})
public class incrementAttempts extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String DATABASE_NAME = "my_test_db";
    private static final String COLLECTION_NAME = "Users";

    String connectionString = "mongodb://judomathdb:b1ooszXJgLWa6TIuVyMusgjONqpQit6IIALmoQ956oKGOwEl1gcsUQm9yNYybdfa7E27EO0305MpACDbdQPaqg==@judomathdb.mongo.cosmos.azure.com:10255/?ssl=true&retrywrites=false&replicaSet=globaldb&maxIdleTimeMS=120000&appName=@judomathdb@";


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
        String competenceAValider = (String) session.getAttribute("c");

        Document studentQuery = new Document("email", user.getEmail());
        Document student = collection.find(studentQuery).first();

        String nextSkillName = student.get("nextSkill", Document.class).getString("name");

        Integer essais = student.get(nextSkillName, Document.class).getInteger("essais");
        Integer palier = student.get(nextSkillName, Document.class).getInteger("palier");
        if (essais < 3) {
            essais++;
            student.get(competenceAValider, Document.class).append("essais", essais);
            collection.replaceOne(studentQuery, student);

        }

        Document nextSkillDetails = student.get(nextSkillName, Document.class);
        Document allPalierDetails = nextSkillDetails.get("AllpalierDetails", Document.class);

        if (allPalierDetails == null) {

        } else {
            Document currentPalierDetails = allPalierDetails.get(palier.toString(), Document.class);
            Integer totalTrainingTrys = currentPalierDetails.getInteger("totalTrainingTrys");

            totalTrainingTrys++;

            student.get(nextSkillName, Document.class).get("AllpalierDetails", Document.class).get(palier.toString(), Document.class).append("totalTrainingTrys", totalTrainingTrys);
            collection.replaceOne(studentQuery, student);

        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"e\": " + essais + "}");

    }

}
