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
@WebServlet(name = "choiceMade", urlPatterns = {"/choiceMade"})
public class choiceMade extends HttpServlet {

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

        Document nextSkill = student.get("nextSkill", Document.class);
        if (nextSkill == null) {
            nextSkill = new Document();
            student.append("nextSkill", nextSkill);
        }
        nextSkill.append("name", competenceAValider);
        nextSkill.append("Url", competenceAValiderURL);

        String nextSkillName = nextSkill.getString("name");
        Document skillData = student.get(nextSkillName, Document.class);
        if (skillData == null) {
            skillData = new Document();
            student.append(nextSkillName, skillData);
        }
        Integer palier = skillData.getInteger("palier");
        if (palier == null) {
            palier = 1;
            skillData.append("palier", palier);
        }
        Integer essais = skillData.getInteger("essais");
        if (essais == null) {
            essais = 0;
            skillData.append("essais", essais);
        }

        Integer progress = skillData.getInteger("progress");

        if (progress == null) {
            progress = 0;
            skillData.append("progress", progress);
        }
        String SkillUrl = skillData.getString("Url");

        if (SkillUrl == null) {
            skillData.append("Url", competenceAValiderURL);
        }

        Document allPalierDetails = skillData.get("AllpalierDetails", Document.class);

        if (allPalierDetails == null) {
            Document allPalierDetailsdoc = new Document();
            allPalierDetailsdoc.append("1", new Document("totalTrainingTrys", 0).append("totalTestTrys", 0));
            allPalierDetailsdoc.append("2", new Document("totalTrainingTrys", 0).append("totalTestTrys", 0));
            allPalierDetailsdoc.append("3", new Document("totalTrainingTrys", 0).append("totalTestTrys", 0));

            skillData.append("AllpalierDetails", allPalierDetailsdoc);

        }

        collection.replaceOne(studentQuery, student);
        request.getRequestDispatcher("ApprentissageAdaptatif").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);

    }

}
