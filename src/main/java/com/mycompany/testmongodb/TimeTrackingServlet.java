package com.mycompany.testmongodb;

import Models.Student;
import com.mongodb.ConnectionString;
import com.mongodb.MongoClientSettings;
import com.mongodb.ServerApi;
import com.mongodb.ServerApiVersion;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.Document;

import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

import java.io.IOException;
import javax.servlet.http.HttpSession;

@WebServlet(name = "TimeTrackingServlet", urlPatterns = {"/TimeTrackingServlet"})
public class TimeTrackingServlet extends HttpServlet {

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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Student user = (Student) session.getAttribute("user");

        String nextSkill = (String) session.getAttribute("c");

        long timeSpent = Long.parseLong(request.getParameter("timeSpent"));

        saveTimeSpentInMongoDB(timeSpent, user.getEmail());

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"status\": \"success\"}");

    }

    private void saveTimeSpentInMongoDB(long timeSpent, String emailStudent) {
        try {
            // Connect to MongoDB (Assuming you have set up MongoDB in your project)
            MongoDatabase database = MongoClients.create("mongodb://localhost:27017").getDatabase(DATABASE_NAME);
            MongoCollection<Document> collection = database.getCollection(COLLECTION_NAME);

            // Create a new document to store the time spent data
            Document studentQuery = new Document("email", emailStudent);
            Document student = collection.find(studentQuery).first();

            String nextSkillName = student.get("nextSkill", Document.class).getString("name");

            Integer nextSkillTS = student.get(nextSkillName, Document.class).getInteger("timeSpent");

            if (nextSkillTS == null) {
                nextSkillTS = (int) timeSpent;
                student.get(nextSkillName, Document.class).append("timeSpent", nextSkillTS);
                collection.replaceOne(studentQuery, student);
            } else {
                nextSkillTS += (int) timeSpent;
                student.get(nextSkillName, Document.class).append("timeSpent", nextSkillTS);
                collection.replaceOne(studentQuery, student);
            }

        } catch (Exception e) {
            e.printStackTrace();
            // Handle any exceptions that might occur during the database operation
        }
    }
}
