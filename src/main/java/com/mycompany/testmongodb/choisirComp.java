/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.testmongodb;

import Models.Student;
import Models.skill;
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
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.jena.query.Dataset;
import org.apache.jena.query.Query;
import org.apache.jena.query.QueryExecution;
import org.apache.jena.query.QueryExecutionFactory;
import org.apache.jena.query.QueryFactory;
import org.apache.jena.query.QuerySolution;
import org.apache.jena.query.ReadWrite;
import org.apache.jena.query.ResultSet;
import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.RDFNode;
import org.apache.jena.tdb.TDBFactory;
import org.bson.Document;

/**
 *
 * @author medel
 */
@WebServlet(name = "choisirComp", urlPatterns = {"/choisirComp"})
public class choisirComp extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String DATABASE_NAME = "my_test_db";
    private static final String COLLECTION_NAME = "Users";

    String connectionString = "mongodb://judomathdb:b1ooszXJgLWa6TIuVyMusgjONqpQit6IIALmoQ956oKGOwEl1gcsUQm9yNYybdfa7E27EO0305MpACDbdQPaqg==@judomathdb.mongo.cosmos.azure.com:10255/?ssl=true&retrywrites=false&replicaSet=globaldb&maxIdleTimeMS=120000&appName=@judomathdb@";
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

        doPost(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MongoClient mongoClient = MongoClients.create(connectionString);
        MongoDatabase database = mongoClient.getDatabase(DATABASE_NAME);
        MongoCollection<Document> collection = database.getCollection(COLLECTION_NAME);

        HttpSession session = request.getSession();
        Student user = (Student) session.getAttribute("user");

        List<QuerySolution> solutions = aPourPrerequis(user.getEmail());

        List<String> skillsRecommended = new ArrayList();
        List<skill> skills = new ArrayList();
        List<skill> skillsInProgress = new ArrayList();

        for (QuerySolution solution : solutions) {
            RDFNode name = solution.get("?name");
            skillsRecommended.add(name.toString());
        }

        Document studentQuery = new Document("email", user.getEmail());
        Document student = collection.find(studentQuery).first();

        for (QuerySolution solution : solutions) {
            RDFNode name = solution.get("?name");
            RDFNode recommendedSkill = solution.get("?recommendedSkill");

            String skil = name.toString();
            String UrlSkil = recommendedSkill.toString();

            skill Skill = new skill(skil);

            Document skillData = student.get(skil, Document.class);
            if (skillData == null) {
                skillData = new Document();
                student.append(skil, skillData);
            }

            String Url = skillData.getString("Url");

            if (Url == null) {
                skillData.append("Url", UrlSkil);

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
            Integer timeSpent = skillData.getInteger("timeSpent");

            if (timeSpent == null) {
                timeSpent = 0;
                skillData.append("timeSpent", timeSpent);
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

            Skill.setName(skil);
            Skill.setProgress(progress);
            Skill.setUrl(UrlSkil);
            Skill.setTimeSpent(timeSpent);

            if (Skill.getProgress() == 0) {
                skills.add(Skill);
            }

        }

        for (String field : student.keySet()) {
            if (field.equals("_id") || field.equals("email") || field.equals("password")
                    || field.equals("nom") || field.equals("prenom") || field.equals("role")
                    || field.equals("enseignantEmail") || field.equals("dateOfSignup")
                    || field.equals("competencesValides") || field.equals("experiencePoints")
                    || field.equals("lastLogin") || field.equals("numberOfVisits")
                    || field.equals("accesToTest") || field.equals("status") || field.equals("imageId")
                    || field.equals("nextSkill") || field.equals("TotalTimeSpent")) {
                continue;
            }

            Document skillDoc = student.get(field, Document.class);
            if (skillDoc != null) {
                skill Skilloooo = new skill();
                Skilloooo.setName(field);

                Skilloooo.setProgress(skillDoc.getInteger("progress"));
                Skilloooo.setUrl(skillDoc.getString("Url"));
                Skilloooo.setTimeSpent(skillDoc.getInteger("timeSpent"));
                skillsInProgress.add(Skilloooo);
            }
        }
        user.setSkillsInProgress(skillsInProgress);

        session.setAttribute("user", user);
        session.setAttribute("solutions", solutions);
        session.setAttribute("skillsRecommended", skills);

        Document nextSkillDocument = student.get("nextSkill", Document.class);
        if (nextSkillDocument != null) {
            String nextSkillName = nextSkillDocument.getString("name");
            if (nextSkillName != null) {
                skill nextSkill = new skill(nextSkillName);
                Document nextSkillData = student.get(nextSkillName, Document.class);
                nextSkill.setProgress(nextSkillData.getInteger("progress"));
                session.setAttribute("palier", nextSkillData.getInteger("palier"));

                session.setAttribute("c", nextSkillName);
                session.setAttribute("nextSkill", nextSkill);
                
                request.getRequestDispatcher("preApprentissageAdaptatif.jsp").forward(request, response);
            }
           mongoClient.close(); 
            
        } else {
            mongoClient.close();
            request.getRequestDispatcher("preApprentissageAdaptatif.jsp").forward(request, response);
        }

    }

    private List<QuerySolution> aPourPrerequis(String email) {

        List<QuerySolution> solutions = new ArrayList<QuerySolution>();

        String tdbDirectory = getClass().getClassLoader().getResource("tripleStoreDataBase").getPath();

        // Create a TDB dataset
        Dataset dataset = TDBFactory.createDataset(tdbDirectory);

        // Begin a write transaction
        dataset.begin(ReadWrite.READ);

        Model model = dataset.getDefaultModel();

        String Prefix = "PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>\n"
                + "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>\n"
                + "PREFIX skillOnt: <http://www.semanticweb.org/caubeuf/ontologies/2023/6/JudoMathsSkill#>\n"
                + "PREFIX userOnt: <http://www.semanticweb.org/caubeuf/ontologies/2023/6/JudoMathsUser#>\n"
                + "\n";

        String queryString = Prefix + "SELECT DISTINCT ?recommendedSkill ?name\n"
                + "WHERE {\n"
                + "  OPTIONAL {\n"
                + "    <http://www.semanticweb.org/caubeuf/ontologies/2023/6/JudoMathsUser#" + email + ">  userOnt:hasAcquired ?acquiredSkill .\n"
                + "  }\n"
                + "\n"
                + "  {\n"
                + "    FILTER (!bound(?acquiredSkill))\n"
                + "    ?recommendedSkill rdf:type skillOnt:SkillItem .\n"
                + "    ?recommendedSkill rdfs:label ?recommendedSkillLabel .\n"
                + "    FILTER NOT EXISTS {\n"
                + "      ?recommendedSkill skillOnt:hasForPrerequisite ?prerequisiteSkill .\n"
                + "    }\n"
                + "    FILTER NOT EXISTS {\n"
                + "      <http://www.semanticweb.org/caubeuf/ontologies/2023/6/JudoMathsUser#" + email + ">  userOnt:hasAcquired  ?recommendedSkill .\n"
                + "    }    \n"
                + "  }\n"
                + "\n"
                + "  UNION\n"
                + "\n"
                + "  {\n"
                + "    FILTER (bound(?acquiredSkill))\n"
                + "    ?acquiredSkill skillOnt:hasForPrerequisite* ?prerequisiteSkill .\n"
                + "    FILTER NOT EXISTS {\n"
                + "    <http://www.semanticweb.org/caubeuf/ontologies/2023/6/JudoMathsUser#" + email + ">  userOnt:hasAcquired ?prerequisiteSkill .\n"
                + "      FILTER (?acquiredSkill != ?prerequisiteSkill)\n"
                + "    }      \n"
                + "    ?recommendedSkill skillOnt:hasForPrerequisite ?prerequisiteSkill .\n"
                + "    FILTER NOT EXISTS {\n"
                + "      <http://www.semanticweb.org/caubeuf/ontologies/2023/6/JudoMathsUser#" + email + "> userOnt:hasAcquired ?recommendedSkill .\n"
                + "    }\n"
                + "    OPTIONAL {\n"
                + "      ?recommendedSkill skillOnt:hasForPrerequisite ?otherPrerequisiteSkill .\n"
                + "      FILTER NOT EXISTS {\n"
                + "        <http://www.semanticweb.org/caubeuf/ontologies/2023/6/JudoMathsUser#" + email + ">  userOnt:hasAcquired ?otherPrerequisiteSkill .\n"
                + "        FILTER (?recommendedSkill != ?otherPrerequisiteSkill)\n"
                + "      }\n"
                + "    }\n"
                + "    FILTER NOT EXISTS {\n"
                + "      ?recommendedSkill skillOnt:hasForPrerequisite ?missingPrerequisiteSkill .\n"
                + "      FILTER NOT EXISTS {\n"
                + "        <http://www.semanticweb.org/caubeuf/ontologies/2023/6/JudoMathsUser#" + email + ">  userOnt:hasAcquired ?missingPrerequisiteSkill .\n"
                + "        FILTER (?recommendedSkill != ?missingPrerequisiteSkill)\n"
                + "      }\n"
                + "    }\n"
                + "  }\n"
                + "\n"
                + "  ?recommendedSkill rdfs:label ?name .\n"
                + "}";

        ResultSet results = executeQuery(queryString, model);

        while (results.hasNext()) {
            QuerySolution solution = results.nextSolution();

            solutions.add(solution);

        }

        dataset.end();
        dataset.close();

        return solutions;

    }

    private ResultSet executeQuery(String Query, Model model) {

        Query query = QueryFactory.create(Query);
        QueryExecution qexec = QueryExecutionFactory.create(query, model);

        ResultSet results = qexec.execSelect();

        return results;

    }
}
