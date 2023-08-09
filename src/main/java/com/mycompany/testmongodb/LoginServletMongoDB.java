package com.mycompany.testmongodb;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.bson.Document;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.gridfs.GridFSBucket;
import com.mongodb.client.gridfs.GridFSDownloadStream;
import org.bson.types.ObjectId;

import com.mongodb.client.gridfs.GridFSBucket;
import com.mongodb.client.gridfs.GridFSBuckets;

import Models.User;
import Models.Student;
import Models.Teacher;
import com.mongodb.ConnectionString;
import com.mongodb.MongoClientSettings;
import com.mongodb.ServerApi;
import com.mongodb.ServerApiVersion;
import java.util.ArrayList;
import java.util.Base64;

@WebServlet("/login")
public class LoginServletMongoDB extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String DATABASE_NAME = "my_test_db";
    private static final String COLLECTION_NAME = "Users";
    private static final String IMAGE_COLLECTION_NAME = "Images";
    String connectionString = "mongodb://judomathdb:b1ooszXJgLWa6TIuVyMusgjONqpQit6IIALmoQ956oKGOwEl1gcsUQm9yNYybdfa7E27EO0305MpACDbdQPaqg==@judomathdb.mongo.cosmos.azure.com:10255/?ssl=true&retrywrites=false&replicaSet=globaldb&maxIdleTimeMS=120000&appName=@judomathdb@";
    ServerApi serverApi = ServerApi.builder()
            .version(ServerApiVersion.V1)
            .build();
    MongoClientSettings settings = MongoClientSettings.builder()
            .applyConnectionString(new ConnectionString(connectionString))
            .serverApi(serverApi)
            .build();

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String email = request.getParameter("email");
        String Password = request.getParameter("password");

        User user = authenticateUser(email, Password);

        if (user != null) {

            if (user.getRole().equals("Apprenant")) {
                Student student = (Student) user;
                MongoClient mongoClient = MongoClients.create(connectionString);
                MongoDatabase database = mongoClient.getDatabase(DATABASE_NAME);
                MongoCollection<Document> collection = database.getCollection(COLLECTION_NAME);

                Document studentQuery = new Document("email", user.getEmail());
                Document studentDocument = collection.find(studentQuery).first();
                Boolean status = studentDocument.getBoolean("status");
                if (status == null) {
                    studentDocument.append("status", true);
                    collection.replaceOne(studentQuery, studentDocument);
                } else {
                    studentDocument.append("status", true);
                    collection.replaceOne(studentQuery, studentDocument);

                }
                long loginTime = System.currentTimeMillis();
                session.setAttribute("loginTime", loginTime);
                session.setAttribute("user", student);
                request.getRequestDispatcher("/choisirComp").forward(request, response);
            } else {
                Teacher teacher = (Teacher) user;
                List<Student> etudiants = new ArrayList<>();

                try (MongoClient mongoClient = MongoClients.create(connectionString)) {
                    MongoDatabase database = mongoClient.getDatabase(DATABASE_NAME);
                    MongoCollection<Document> collection = database.getCollection(COLLECTION_NAME);
                    GridFSBucket imageBucket = GridFSBuckets.create(database, IMAGE_COLLECTION_NAME);

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
        } else {
            session.setAttribute("error", "Adresse Email ou mot de passe est invalide.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        if (user != null) {

            if (user.getRole().equals("Apprenant")) {
                Student student = (Student) user;
                session.setAttribute("user", student);
                request.getRequestDispatcher("/ApprentissageAdaptatif").forward(request, response);
            } else {
                Teacher teacher = (Teacher) user;
                List<Student> etudiants = new ArrayList<>();

                try (MongoClient mongoClient = MongoClients.create(connectionString)) {
                    MongoDatabase database = mongoClient.getDatabase(DATABASE_NAME);
                    MongoCollection<Document> collection = database.getCollection(COLLECTION_NAME);
                    GridFSBucket imageBucket = GridFSBuckets.create(database, IMAGE_COLLECTION_NAME);

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
        } else {
            session.setAttribute("error", "Adresse Email ou mot de passe est invalide.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    private User authenticateUser(String email, String password) {
        try (MongoClient mongoClient = MongoClients.create(connectionString)) {
            MongoDatabase database = mongoClient.getDatabase(DATABASE_NAME);
            MongoCollection<Document> collection = database.getCollection(COLLECTION_NAME);
            GridFSBucket imageBucket = GridFSBuckets.create(database, IMAGE_COLLECTION_NAME);

            Document query = new Document();
            query.append("email", email);
            query.append("password", password);

            Document userDocument = collection.find(query).first();
            if (userDocument != null) {
                String role = userDocument.getString("role");
                String nom = userDocument.getString("nom");
                String prenom = userDocument.getString("prenom");

                if (userDocument.containsKey("imageId")) {
                    ObjectId imageId = userDocument.getObjectId("imageId");
                    InputStream imageInputStream = retrieveImage(imageId, imageBucket);

                    if (role.equals("Apprenant")) {
                        String enseignantEmail = userDocument.getString("enseignantEmail");
                        int experiencePoints = userDocument.getInteger("experiencePoints");
                        int numberOfVisits = userDocument.getInteger("numberOfVisits");
                        numberOfVisits++;
                        Date lastLogin = new Date();
                        Date dateOfSignup = userDocument.getDate("dateOfSignup");
                        List<String> competencesValides = userDocument.getList("competencesValides", String.class);

                        userDocument.append("lastLogin", lastLogin);
                        userDocument.append("numberOfVisits", numberOfVisits);
                        collection.replaceOne(query, userDocument);
                        byte[] imageBytes = imageInputStream.readAllBytes();
                        boolean accesToTest = userDocument.getBoolean("accesToTest");
                        boolean status = userDocument.getBoolean("status");

                        Student student = new Student(email, password, nom, prenom, role, imageBytes, enseignantEmail,
                                dateOfSignup, competencesValides, experiencePoints, lastLogin, numberOfVisits, accesToTest, status);

                        return student;
                    }

                    List<String> students = userDocument.getList("students", String.class);
                    if (students == null) {
                        students = new ArrayList();
                    }
                    byte[] imageBytes = imageInputStream.readAllBytes();
                    Teacher teacher = new Teacher(email, password, nom, prenom, role, imageBytes);
                    teacher.setEtudiants(students);

                    return teacher;
                } else {
                    // Handle the case when the imageId is not present in the user document
                    if (role.equals("Apprenant")) {

                        String enseignantEmail = userDocument.getString("enseignantEmail");
                        int experiencePoints = userDocument.getInteger("experiencePoints");
                        int numberOfVisits = userDocument.getInteger("numberOfVisits");
                        numberOfVisits++;
                        Date lastLogin = new Date();
                        Date dateOfSignup = userDocument.getDate("dateOfSignup");
                        List<String> competencesValides = userDocument.getList("competencesValides", String.class);

                        userDocument.append("lastLogin", lastLogin);
                        userDocument.append("numberOfVisits", numberOfVisits);
                        boolean accesToTest = userDocument.getBoolean("accesToTest");
                        boolean status = userDocument.getBoolean("status");

                        collection.replaceOne(query, userDocument);

                        return new Student(email, password, nom, prenom, role, null, enseignantEmail,
                                dateOfSignup, competencesValides, experiencePoints, lastLogin, numberOfVisits, accesToTest, status);
                    }

                    List<String> students = userDocument.getList("students", String.class);
                    Teacher teacher = new Teacher(email, password, nom, prenom, role, null);
                    teacher.setEtudiants(students);

                    return teacher;
                }
            } else {
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
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
