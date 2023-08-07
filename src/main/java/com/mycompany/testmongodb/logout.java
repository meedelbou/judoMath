/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.testmongodb;

import Models.Student;
import Models.User;
import com.mongodb.ConnectionString;
import com.mongodb.MongoClientSettings;
import com.mongodb.ServerApi;
import com.mongodb.ServerApiVersion;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import static com.mongodb.client.model.Filters.and;
import static com.mongodb.client.model.Filters.eq;
import static com.mongodb.client.model.Updates.set;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
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
@WebServlet(name = "logout", urlPatterns = {"/logout"})
public class logout extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String DATABASE_NAME = "my_test_db";
    private static final String Users_COLLECTION_NAME = "Users";
    private static final String TimeSpent_COLLECTION_NAME = "TimeTracking";

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
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        if (user.getRole().equals("Apprenant")) {

            long loginTime = (Long) request.getSession().getAttribute("loginTime");
            long logoutTime = System.currentTimeMillis();
            long timeSpent = logoutTime - loginTime;

            LocalDate currentDate = LocalDate.now();
            String dateString = currentDate.toString();

            MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
            MongoDatabase database = mongoClient.getDatabase(DATABASE_NAME);
            MongoCollection<Document> Users_collection = database.getCollection(Users_COLLECTION_NAME);

            // Handle the status of student : online or offline 
            Document studentQuery = new Document("email", user.getEmail());
            Document studentDocument = Users_collection.find(studentQuery).first();

            Boolean status = studentDocument.getBoolean("status");

            Long studentTimeSpent = studentDocument.getLong("TotalTimeSpent");

            if (studentTimeSpent == null) {
                studentTimeSpent = timeSpent;
            } else {
                studentTimeSpent += timeSpent;
            }

            studentDocument.append("status", false).append("TotalTimeSpent", studentTimeSpent);
            Users_collection.replaceOne(studentQuery, studentDocument);

            // Store the time spent by day 
            MongoCollection<Document> TimeSpent_collection = database.getCollection(TimeSpent_COLLECTION_NAME);
            Document timeSpentDocument = TimeSpent_collection.find(and(eq("date", dateString), eq("userEmail", user.getEmail()))).first();
            if (timeSpentDocument != null) {
                // If a document already exists, update the total time spent
                long existingTotalTimeSpent = timeSpentDocument.getLong("totalTimeSpent");
                long newTotalTimeSpent = existingTotalTimeSpent + timeSpent;

                // Update the document with the new total time spent
                TimeSpent_collection.updateOne(and(eq("date", dateString), eq("userEmail", user.getEmail())), set("totalTimeSpent", newTotalTimeSpent));

            } else {
                // If no document exists for the current date, create a new one
                Document newDocument = new Document()
                        .append("date", dateString)
                        .append("userEmail", user.getEmail())
                        .append("totalTimeSpent", timeSpent);

                // Insert the new document into the collection
                TimeSpent_collection.insertOne(newDocument);
            }

        }

        session.invalidate();
        getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
