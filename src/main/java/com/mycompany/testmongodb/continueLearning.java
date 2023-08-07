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
@WebServlet(name = "continueLearning", urlPatterns = {"/continueLearning"})
public class continueLearning extends HttpServlet {

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
        MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
        MongoDatabase database = mongoClient.getDatabase(DATABASE_NAME);
        MongoCollection<Document> collection = database.getCollection(COLLECTION_NAME);

        HttpSession session = request.getSession();
        Student user = (Student) session.getAttribute("user");

        String competenceAValider = request.getParameter("nextSkill");
        String competenceAValiderURL = request.getParameter("nextSkillURL");

        Document studentQuery = new Document("email", user.getEmail());
        Document student = collection.find(studentQuery).first();

        String nextSkillName = student.get("nextSkill", Document.class).getString("name");
        if (nextSkillName == null) {
            student.get("nextSkill", Document.class).append("name", competenceAValider);
            collection.replaceOne(studentQuery, student);
        } else {
            student.get("nextSkill", Document.class).append("name", competenceAValider);
            collection.replaceOne(studentQuery, student);
        }

        String nextSkillURL = student.get("nextSkill", Document.class).getString("Url");
        if (nextSkillURL == null) {
            student.get("nextSkill", Document.class).append("Url", competenceAValiderURL);
            collection.replaceOne(studentQuery, student);
        } else {
            student.get("nextSkill", Document.class).append("Url", competenceAValiderURL);
            collection.replaceOne(studentQuery, student);
        }

        Integer palier = student.get(nextSkillName, Document.class).getInteger("palier");
        if (palier == null) {
            palier = 1;
            student.get(nextSkillName, Document.class).append("palier", palier);
            collection.replaceOne(studentQuery, student);
        }
        Integer essais = student.get(nextSkillName, Document.class).getInteger("essais");
        if (essais == null) {
            essais = 1000000;
            student.get(nextSkillName, Document.class).append("essais", essais);
            collection.replaceOne(studentQuery, student);
        }

        String Url = student.get(nextSkillName, Document.class).getString("Url");
        if (Url == null) {
            Url = competenceAValiderURL;
            student.get(nextSkillName, Document.class).append("Url", Url);
            collection.replaceOne(studentQuery, student);
        } else {
            student.get("nextSkill", Document.class).append("Url", "nfknskfnks");
            collection.replaceOne(studentQuery, student);
        }

        request.getRequestDispatcher("ApprentissageAdaptatif").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
