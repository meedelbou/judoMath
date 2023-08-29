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
@WebServlet(name = "grantAcces", urlPatterns = {"/grantAcces"})
public class grantAcces extends HttpServlet {

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

        String emailStudent = request.getParameter("emailStudent");
        String emailEnseignant = request.getParameter("emailEnseignant");
        String isCheckedPar = request.getParameter("isChecked");
        String grantAccessAllPar = request.getParameter("grantAccessAll");

        Boolean isChecked = Boolean.parseBoolean(isCheckedPar);
        Boolean grantAccessAll = Boolean.parseBoolean(grantAccessAllPar);

        if (grantAccessAll) {
            Document teacherQuery = new Document("email", emailEnseignant);
            Document teacherDocument = collection.find(teacherQuery).first();
            List<String> students = teacherDocument.getList("students", String.class);

            for (String EmailStudent : students) {
                Document query = new Document("email", EmailStudent);
                Document studentDocument = collection.find(query).first();
                studentDocument.append("accesToTest", true);
                collection.replaceOne(query, studentDocument);

            }

        } else {

            Document studentQuery = new Document("email", emailStudent);
            Document student = collection.find(studentQuery).first();
            student.append("accesToTest", isChecked);
            collection.replaceOne(studentQuery, student);

        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"status\": \"success\"}");

    }

}
