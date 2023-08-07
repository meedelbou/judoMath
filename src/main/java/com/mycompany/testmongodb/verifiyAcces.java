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
@WebServlet(name = "verifiyAcces", urlPatterns = {"/verifiyAcces"})
public class verifiyAcces extends HttpServlet {

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

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
        MongoDatabase database = mongoClient.getDatabase(DATABASE_NAME);
        MongoCollection<Document> collection = database.getCollection(COLLECTION_NAME);

        String emailStudent = request.getParameter("emailStudent");

        Document studentQuery = new Document("email", emailStudent);
        Document student = collection.find(studentQuery).first();

        Boolean accesToTest = student.getBoolean("accesToTest");

        HttpSession session = request.getSession();
        Student user = (Student) session.getAttribute("user");
        if (user.getEmail().equals(emailStudent)) {
            user.setAccesToTest(accesToTest);
        }

        session.setAttribute("user", user);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"accesToTest\": " + accesToTest + "}");

    }

}
