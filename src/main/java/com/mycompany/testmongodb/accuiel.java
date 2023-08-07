package com.mycompany.testmongodb;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.bson.Document;
import org.bson.types.ObjectId;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.gridfs.GridFSBucket;
import com.mongodb.client.gridfs.GridFSBuckets;
import com.mongodb.client.gridfs.GridFSDownloadStream;

import Models.Student;
import Models.Teacher;
import Models.User;
import com.mongodb.ConnectionString;
import com.mongodb.MongoClientSettings;
import com.mongodb.ServerApi;
import com.mongodb.ServerApiVersion;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;

@WebServlet(name = "accuiel", urlPatterns = {"/accuiel"})
public class accuiel extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String DATABASE_NAME = "my_test_db";
    private static final String USERS_COLLECTION_NAME = "Users";
    private static final String IMAGES_COLLECTION_NAME = "Images";

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
        User user = (User) session.getAttribute("user");

        if (user.getRole().equals("Apprenant")) {
            Student student = (Student) user;
            request.getRequestDispatcher("/accuiel.jsp").forward(request, response);
        } else {
            Teacher teacher = (Teacher) user;
            List<Student> etudiants = new ArrayList<>();

            try (MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017")) {
                MongoDatabase database = mongoClient.getDatabase(DATABASE_NAME);
                MongoCollection<Document> collection = database.getCollection(USERS_COLLECTION_NAME);
                GridFSBucket imageBucket = GridFSBuckets.create(database, IMAGES_COLLECTION_NAME);

                Document teacherQuery = new Document("email", user.getEmail());
                Document teacherDocument = collection.find(teacherQuery).first();
                byte[] imgbytes = retrieveImage(teacherDocument.getObjectId("imageId"), imageBucket).readAllBytes();

                user.setProfilePicture(imgbytes);

                for (String emailOfStudent : teacher.getEtudiants()) {
                    Document query = new Document("email", emailOfStudent);
                    Document userDocument = collection.find(query).first();

                    String role = userDocument.getString("role");
                    String nom = userDocument.getString("nom");
                    String prenom = userDocument.getString("prenom");
                    String password = userDocument.getString("password");

                    String enseignantEmail = userDocument.getString("enseignantEmail");
                    int experiencePoints = userDocument.getInteger("experiencePoints");
                    int numberOfVisits = userDocument.getInteger("numberOfVisits");
                    Date lastLogin = userDocument.getDate("lastLogin");
                    Date dateOfSignup = userDocument.getDate("dateOfSignup");
                    List<String> competencesValides = userDocument.getList("competencesValides", String.class);
                    ObjectId imageId = userDocument.getObjectId("imageId");
                    InputStream imageInputStream = retrieveImage(imageId, imageBucket);
                    byte[] imageBytes = imageInputStream.readAllBytes();
                    boolean accesToTest = userDocument.getBoolean("accesToTest");
                    boolean status = userDocument.getBoolean("status");

                    Student student = new Student(emailOfStudent, password, nom, prenom, role, imageBytes, enseignantEmail,
                            dateOfSignup, competencesValides, experiencePoints, lastLogin, numberOfVisits, accesToTest, status);

                    etudiants.add(student);
                }
            }

            session.setAttribute("etudiants", etudiants);
            session.setAttribute("user", teacher);
            request.getRequestDispatcher("/accueil_teacher.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user.getRole().equals("Apprenant")) {
            Student student = (Student) user;
            request.getRequestDispatcher("/accuiel.jsp").forward(request, response);
        } else {
            Teacher teacher = (Teacher) user;
            List<Student> etudiants = new ArrayList<>();

            try (MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017")) {
                MongoDatabase database = mongoClient.getDatabase(DATABASE_NAME);
                MongoCollection<Document> collection = database.getCollection(USERS_COLLECTION_NAME);
                GridFSBucket imageBucket = GridFSBuckets.create(database, IMAGES_COLLECTION_NAME);

                Document teacherQuery = new Document("email", user.getEmail());
                Document teacherDocument = collection.find(teacherQuery).first();
                byte[] imgbytes = retrieveImage(teacherDocument.getObjectId("imageId"), imageBucket).readAllBytes();

                user.setProfilePicture(imgbytes);

                for (String emailOfStudent : teacher.getEtudiants()) {
                    Document query = new Document("email", emailOfStudent);
                    Document userDocument = collection.find(query).first();

                    String role = userDocument.getString("role");
                    String nom = userDocument.getString("nom");
                    String prenom = userDocument.getString("prenom");
                    String password = userDocument.getString("password");

                    String enseignantEmail = userDocument.getString("enseignantEmail");
                    int experiencePoints = userDocument.getInteger("experiencePoints");
                    int numberOfVisits = userDocument.getInteger("numberOfVisits");
                    Date lastLogin = userDocument.getDate("lastLogin");
                    Date dateOfSignup = userDocument.getDate("dateOfSignup");
                    List<String> competencesValides = userDocument.getList("competencesValides", String.class);
                    ObjectId imageId = userDocument.getObjectId("imageId");
                    InputStream imageInputStream = retrieveImage(imageId, imageBucket);
                    byte[] imageBytes = imageInputStream.readAllBytes();
                    boolean accesToTest = userDocument.getBoolean("accesToTest");
                    boolean status = userDocument.getBoolean("status");

                    Student student = new Student(emailOfStudent, password, nom, prenom, role, imageBytes, enseignantEmail,
                            dateOfSignup, competencesValides, experiencePoints, lastLogin, numberOfVisits, accesToTest, status);

                    etudiants.add(student);
                }
            }

            session.setAttribute("etudiants", etudiants);
            session.setAttribute("user", teacher);
            request.getRequestDispatcher("/accueil_teacher.jsp").forward(request, response);
        }
    }

    private InputStream retrieveImage(ObjectId imageId, GridFSBucket imageBucket) throws IOException {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        GridFSDownloadStream downloadStream = imageBucket.openDownloadStream(imageId);

        int bufferSize = 1024;
        byte[] buffer = new byte[bufferSize];
        int bytesRead;

        while ((bytesRead = downloadStream.read(buffer, 0, bufferSize)) != -1) {
            outputStream.write(buffer, 0, bytesRead);
        }

        return new ByteArrayInputStream(outputStream.toByteArray());
    }

    public String encodeImageToBase64(InputStream imageInputStream) {
        try {
            byte[] imageBytes = imageInputStream.readAllBytes();
            String base64Image = Base64.getEncoder().encodeToString(imageBytes);
            return base64Image;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}
