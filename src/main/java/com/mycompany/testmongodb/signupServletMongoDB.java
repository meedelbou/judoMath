package com.mycompany.testmongodb;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.bson.Document;
import org.bson.types.ObjectId;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.gridfs.GridFSBucket;
import com.mongodb.client.gridfs.GridFSBuckets;

import Models.Student;
import Models.Teacher;
import Models.User;
import com.mongodb.ConnectionString;
import com.mongodb.MongoClientSettings;
import com.mongodb.ServerApi;
import com.mongodb.ServerApiVersion;

@WebServlet("/signup")
@MultipartConfig
public class signupServletMongoDB extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String DATABASE_NAME = "my_test_db";
    private static final String COLLECTION_NAME = "Users";
    private static final String IMAGE_COLLECTION_NAME = "Images";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        Part filePart = request.getPart("profilImage");
        InputStream imageInputStream = filePart.getInputStream();

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String role = request.getParameter("role");
        String enseignantEmail = request.getParameter("emailEnseignant");

        if (role.equals("Apprenant")) {
            Date dateOfSignup = new Date();
            List<String> competencesValides = new ArrayList<>();
            int experiencePoints = 0;
            Date lastLogin = new Date();
            int numberOfVisits = 0;
            boolean accesToTest = false;
            boolean status = false;

            Student newStudent = new Student(email, password, nom, prenom, role, imageInputStream.readAllBytes(), enseignantEmail, dateOfSignup,
                    competencesValides, experiencePoints, lastLogin, numberOfVisits,accesToTest,status);

            if (createUser(newStudent, imageInputStream)) {
                response.sendRedirect("login.jsp");
            } else {
                request.setAttribute("error",
                        "Échec de la création d'un utilisateur ou l'utilisateur existe déjà.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } else {

            Teacher newTeacher = new Teacher(email, password, nom, prenom, role,imageInputStream.readAllBytes());

            if (createUser(newTeacher, imageInputStream)) {
                response.sendRedirect("login.jsp");
            } else {
                request.setAttribute("error",
                        "Échec de la création d'un utilisateur ou l'utilisateur existe déjà.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }
    }

    private boolean createUser(User user, InputStream imageInputStream) {
        
        String connectionString = "mongodb://judomathdb:b1ooszXJgLWa6TIuVyMusgjONqpQit6IIALmoQ956oKGOwEl1gcsUQm9yNYybdfa7E27EO0305MpACDbdQPaqg==@judomathdb.mongo.cosmos.azure.com:10255/?ssl=true&retrywrites=false&replicaSet=globaldb&maxIdleTimeMS=120000&appName=@judomathdb@";
        ServerApi serverApi = ServerApi.builder()
                .version(ServerApiVersion.V1)
                .build();
        MongoClientSettings settings = MongoClientSettings.builder()
                .applyConnectionString(new ConnectionString(connectionString))
                .serverApi(serverApi)
                .build();
        
        try (MongoClient mongoClient = MongoClients.create(connectionString)) {
            MongoDatabase database = mongoClient.getDatabase(DATABASE_NAME);
            MongoCollection<Document> userCollection = database.getCollection(COLLECTION_NAME);
            GridFSBucket imageBucket = GridFSBuckets.create(database, IMAGE_COLLECTION_NAME);

            Document query = new Document("email", user.getEmail());

            Document existingUser = userCollection.find(query).first();
            if (existingUser != null) {
                return false;
            }

            Document userDocument = new Document("email", user.getEmail()).append("password", user.getPassword())
                    .append("nom", user.getNom()).append("prenom", user.getPrenom()).append("role", user.getRole());

            if (user instanceof Student) {
                Student student = (Student) user;
                userDocument.append("enseignantEmail", student.getEnseignantEmail())
                        .append("dateOfSignup", student.getDateOfSignup())
                        .append("competencesValides", student.getCompetencesValides())
                        .append("experiencePoints", student.getExperiencePoints())
                        .append("lastLogin", student.getLastLogin()).append("numberOfVisits", student.getNumberOfVisits())
                        .append("accesToTest",student.isAccesToTest())
                        .append("status", false)
                        .append("TotalTimeSpent", 0L);

                Document teacherQuery = new Document("email", student.getEnseignantEmail());
                Document teacher = userCollection.find(teacherQuery).first();
                List<String> students = teacher.getList("students", String.class);
                if (students == null) {
                    students = new ArrayList<>();
                }
                students.add(user.getEmail());
                teacher.append("students", students);
                userCollection.replaceOne(teacherQuery, teacher);
            }

            if (imageInputStream != null) {
                ObjectId imageId = imageBucket.uploadFromStream(user.getEmail() + "_image", imageInputStream);
                userDocument.append("imageId", imageId);
            }

            userCollection.insertOne(userDocument);
            
            mongoClient.close();

            return true;

        } catch (Exception e) {
            return false;
        }
    }
}
