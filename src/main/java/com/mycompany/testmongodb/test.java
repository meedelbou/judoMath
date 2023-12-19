/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.testmongodb;

import Models.Exercise;
import Models.Lesson;
import Models.Student;
import Models.exercisesGen;
import com.mongodb.ConnectionString;
import com.mongodb.MongoClientSettings;
import com.mongodb.ServerApi;
import com.mongodb.ServerApiVersion;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import static com.mycompany.testmongodb.ontologyLoaderFromTDB.AjouterTriplet;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.jena.query.Dataset;
import org.apache.jena.query.ReadWrite;
import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.Resource;
import org.apache.jena.tdb.TDBFactory;
import org.apache.jena.vocabulary.RDF;
import org.bson.Document;

/**
 *
 * @author medel
 */
@WebServlet(name = "test", urlPatterns = {"/test"})
public class test extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String DATABASE_NAME = "my_test_db";
    private static final String COLLECTION_NAME = "Users";
    private  final String TDBDIRECTORY = getClass().getClassLoader().getResource("tripleStoreDataBase").getPath();
    String connectionString = "mongodb://judomathdb:b1ooszXJgLWa6TIuVyMusgjONqpQit6IIALmoQ956oKGOwEl1gcsUQm9yNYybdfa7E27EO0305MpACDbdQPaqg==@judomathdb.mongo.cosmos.azure.com:10255/?ssl=true&retrywrites=false&replicaSet=globaldb&maxIdleTimeMS=120000&appName=@judomathdb@";



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        MongoClient mongoClient = MongoClients.create(connectionString);
        MongoDatabase database = mongoClient.getDatabase(DATABASE_NAME);
        MongoCollection<Document> collection = database.getCollection(COLLECTION_NAME);

        HttpSession session = request.getSession();

        Student user = (Student) session.getAttribute("user");

        Document studentQuery = new Document("email", user.getEmail());
        Document student = collection.find(studentQuery).first();

        Lesson lesson = new Lesson();

        List<Exercise> exercises = new ArrayList<>();

        exercisesGen genExos = new exercisesGen();
        String nextSkillName = student.get("nextSkill", Document.class).getString("name");

        Integer palier = student.get(nextSkillName, Document.class).getInteger("palier");
        lesson = genExos.generateExercises(nextSkillName, palier);

        exercises = lesson.getExercises();

        session.setAttribute("exercisesTest", exercises);

        request.getRequestDispatcher("test.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        MongoClient mongoClient = MongoClients.create(connectionString);
        MongoDatabase database = mongoClient.getDatabase(DATABASE_NAME);
        MongoCollection<Document> collection = database.getCollection(COLLECTION_NAME);

        HttpSession session = request.getSession();

        List<Exercise> exercises = (List<Exercise>) session.getAttribute("exercisesTest");

        List<Boolean> results = new ArrayList<>();
        List<String> answers = new ArrayList<>();

        int exerciseIndex = 1;

        for (Exercise exercise : exercises) {

            String selectedOptionString = request.getParameter("Ex" + exerciseIndex);
            if (!(selectedOptionString == null || selectedOptionString.equals(""))) {
                request.setAttribute("Ex" + exerciseIndex, selectedOptionString);
                answers.add(selectedOptionString);
                boolean isCorrect = exercise.getAnswer().equals(selectedOptionString);
                results.add(isCorrect);
                exerciseIndex++;
            } else {
                request.setAttribute("Ex" + exerciseIndex, -2021);
                answers.add("-2021");
                boolean isCorrect = exercise.checkResult("-2021");
                results.add(isCorrect);
                exerciseIndex++;

            }
        }
        session.setAttribute("answersTest", answers);
        float score = 0;
        for (boolean element : results) {
            if (element) {
                score += ((float) 20 / results.size());
            }
        }
        Student user = (Student) session.getAttribute("user");
        String competenceAValider = (String) session.getAttribute("c");

        Document studentQuery = new Document("email", user.getEmail());
        Document student = collection.find(studentQuery).first();

        Document nextSkill = student.get("nextSkill", Document.class);
        String nextSkillName = nextSkill.getString("name");
        Document skillData = student.get(nextSkillName, Document.class);

        Integer experiencePoints = student.getInteger("experiencePoints");
        Integer progress = skillData.getInteger("progress");

        Document allPalierDetails = skillData.get("AllpalierDetails", Document.class);

        if (allPalierDetails == null) {
            Document allPalierDetailsdoc = new Document();
            allPalierDetailsdoc.append("1", new Document("totalTrainingTrys", 0).append("totalTestTrys", 0));
            allPalierDetailsdoc.append("2", new Document("totalTrainingTrys", 0).append("totalTestTrys", 0));
            allPalierDetailsdoc.append("3", new Document("totalTrainingTrys", 0).append("totalTestTrys", 0));

            skillData.append("AllpalierDetails", allPalierDetailsdoc);

        } else {
            Integer palier = student.get(competenceAValider, Document.class).getInteger("palier");
            Document currentPalierDetails = allPalierDetails.get(palier.toString(), Document.class);
            Integer totalTestTrys = currentPalierDetails.getInteger("totalTestTrys");

            totalTestTrys++;

            student.get(nextSkillName, Document.class).get("AllpalierDetails", Document.class).get(palier.toString(), Document.class).append("totalTestTrys", totalTestTrys);

        }

        Integer xpPoints = 0;
        Integer prog = 0;

        if (score >= 14) {
            Integer palier = student.get(competenceAValider, Document.class).getInteger("palier");
            if (palier < 3) {

                if (palier == 1) {
                    xpPoints = 100;
                    prog = 25;
                } else {
                    xpPoints = 300;
                    prog = 60;
                }
                String messageDeReussite = "Bravo ! Tu as réussi le test et validé le palier " + palier + " de la compétence : " + competenceAValider;
                palier++;
                student.get(competenceAValider, Document.class).append("palier", palier);
                student.get(competenceAValider, Document.class).append("essais", 0);

                collection.replaceOne(studentQuery, student);
                session.setAttribute("palier", palier);
                session.setAttribute("passed_palier", messageDeReussite);
            } else {
                List<String> cv = student.getList("competencesValides", String.class);
                if (!cv.contains(competenceAValider)) {
                    cv.add(competenceAValider);
                    student.append("competencesValides", cv);
                    collection.replaceOne(studentQuery, student);
                }
                Dataset dataset = TDBFactory.createDataset(TDBDIRECTORY);
                Model model = dataset.getDefaultModel();
                String comUrl = (String) session.getAttribute("compURL");

                dataset.begin(ReadWrite.WRITE);

                AjouterTriplet(model, user.getEmail(), comUrl);
                
                

                dataset.commit();

                dataset.end();

                xpPoints = 500;
                prog = 100;

                String messageDeReussite = "Bravo ! Tu as réussi le test et validé la competence";
                session.setAttribute("passed", messageDeReussite);

            }
            experiencePoints = experiencePoints + xpPoints;

            student.append("experiencePoints", experiencePoints);
            skillData.append("progress", prog);
            user.setExperiencePoints(experiencePoints);
            session.setAttribute("user", user);

            collection.replaceOne(studentQuery, student);

        } else {
            Integer essais = student.get(competenceAValider, Document.class).getInteger("essais");
            String messageDechec = "Dommage, entraîne-toi à nouveau";
            essais = 0;
            student.get(competenceAValider, Document.class).append("essais", 0);
            collection.replaceOne(studentQuery, student);
            session.setAttribute("failed", messageDechec);

        }

        DecimalFormat df = new DecimalFormat("#.##");

        // Store the results in a session attribute for further processing
        request.getSession().setAttribute("resultsTest", results);
        request.getSession().setAttribute("scoreTest", df.format(score));

        // Redirect to a results page or perform any other action
        request.getRequestDispatcher("test.jsp").forward(request, response);

    }

    static void AjouterTriplet(Model model, String apprenant, String competence) {

        Resource apprenant1 = model.createResource("http://www.semanticweb.org/caubeuf/ontologies/2023/6/JudoMathsUser#" + apprenant);

        Resource competence2 = model.createResource(competence);

        // Define the RDF resource for class Apprenant
        Resource apprenantClass = model.createResource("http://www.semanticweb.org/caubeuf/ontologies/2023/6/JudoMathsUser#Student");

        // Define the RDF resource for class Competences_Valid
        Resource competencesValidClass = model.createResource("http://www.semanticweb.org/caubeuf/ontologies/2023/6/JudoMathsSkill#SkillItem");

        // Add the competence validation statement
        model.add(apprenant1, model.createProperty("http://www.semanticweb.org/caubeuf/ontologies/2023/6/JudoMathsUser#hasAcquired"), competence2);

        // Add the class assertion for apprenant1
        model.add(apprenant1, RDF.type, apprenantClass);

        // Add the class assertion for competence2
        model.add(competence2, RDF.type, competencesValidClass);

    }

}
