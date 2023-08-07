/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.testmongodb;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mongodb.client.model.Filters;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;

import org.bson.Document;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.ModelFactory;

import org.apache.jena.reasoner.Reasoner;
import org.apache.jena.reasoner.ReasonerRegistry;

import org.apache.jena.query.*;
import org.apache.jena.rdf.model.*;
import org.apache.jena.ontology.*;
import org.apache.jena.vocabulary.RDF;

import org.apache.commons.io.IOUtils;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

import org.apache.jena.tdb.TDBFactory;

/**
 *
 * @author medel
 */
@WebServlet(name = "semantic", urlPatterns = {"/semantic"})
public class semantic extends HttpServlet {

    @Override
    public void init() throws ServletException {
        super.init();

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<QuerySolution> solutions = new ArrayList<QuerySolution>();

        String tdbDirectory = "tripleStoreDataBase";

        // Create a TDB dataset
        Dataset dataset = TDBFactory.createDataset(tdbDirectory);

        // Begin a write transaction
        dataset.begin(ReadWrite.READ);

        Model model = dataset.getDefaultModel();

        String Prefix = "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>\n"
                + "PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> \n"
                + "PREFIX owl: <http://www.w3.org/2002/07/owl#> \n";

        String queryString = Prefix + "SELECT ?individual  WHERE {\n"
                + "  ?individual rdf:type <http://www.semanticweb.org/caubeuf/ontologies/2023/1/maths_3eCycle_v1#multiplicationEntier>  ;\n"
                + "              rdfs:label ?name .\n"
                + "}";
        
        String queryStr = Prefix + "SELECT ?class WHERE {\n"
                    + "  ?class rdf:type owl:Class ;\n"
                    + "        rdfs:subClassOf <http://www.semanticweb.org/caubeuf/ontologies/2023/1/maths_3eCycle_v1#Calculer> .\n"
                    + "  FILTER NOT EXISTS {\n"
                    + "    ?class rdfs:subClassOf ?restriction .\n"
                    + "    FILTER (isBlank(?restriction))\n"
                    + "  }}";

        
        Query query = QueryFactory.create(queryStr);
        QueryExecution qexec = QueryExecutionFactory.create(query, model);

        ResultSet results = executeQuery(queryStr, model);
        int count = 0;

        while (results.hasNext()) {
            QuerySolution solution = results.nextSolution();
            count++;
            solutions.add(solution);

        }

        request.setAttribute("solutions", solutions);
        request.setAttribute("check", checkSubClassAndIndividual("Entiers", model));

        qexec.close();

        dataset.end();
        dataset.close();

        request.getRequestDispatcher("welcome.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    private boolean checkSubClassAndIndividual(String className, Model model) {
        String prefix = "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>\n"
                + "PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> \n";

        String queryString = prefix + "ASK { \n"
                + "  ?subclass rdfs:subClassOf <http://www.semanticweb.org/caubeuf/ontologies/2023/1/maths_3eCycle_v1#" + className + "> .\n"
                + "  ?individual rdf:type <http://www.semanticweb.org/caubeuf/ontologies/2023/1/maths_3eCycle_v1#" + className + "> .\n"
                + "}";

        Query query = QueryFactory.create(queryString);
        try (QueryExecution qexec = QueryExecutionFactory.create(query, model)) {
            boolean result = qexec.execAsk();
            return result;
        }
    }

    private void AjouterTriplet(Model model, String apprenant, String competence, String Type) {

        Resource apprenant1 = model.createResource("http://www.semanticweb.org/medel/ontologies/2023/4/untitled-ontology-42#" + apprenant);

        // Reference the existing competence2 resource from another ontology
        Resource competence2 = model.createResource(competence);

        // Define the RDF resource for class Apprenant
        Resource apprenantClass = model.createResource("http://www.semanticweb.org/medel/ontologies/2023/4/untitled-ontology-42#Apprenant");

        // Define the RDF resource for class Competences_Valid
        Resource competencesValidClass = model.createResource(Type);

        // Add the competence validation statement
        model.add(apprenant1, model.createProperty("http://www.semanticweb.org/medel/ontologies/2023/4/untitled-ontology-42#aValide"), competence2);

        // Add the class assertion for apprenant1
        model.add(apprenant1, RDF.type, apprenantClass);

        // Add the class assertion for competence2
        model.add(competence2, RDF.type, competencesValidClass);

    }

    private ResultSet competencesValidesParApprenant(Dataset dataset, String apprenant) {

        String Prefix = "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>\n"
                + "PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> \n"
                + "PREFIX : <http://www.semanticweb.org/medel/ontologies/2023/4/untitled-ontology-42#>\n";

        String queryString = Prefix + "SELECT ?name\n"
                + "WHERE {\n"
                + ":" + apprenant + ":aValide ?competence .\n"
                + " ?competence rdfs:label ?name .}";

        QueryExecution qExec = QueryExecutionFactory.create(queryString, dataset);

        // Execute the query and get the result set
        ResultSet rs = qExec.execSelect();
        qExec.close();

        return rs;

    }
    
        private ResultSet executeQuery(String Query, Model model) {

        Query query = QueryFactory.create(Query);
        QueryExecution qexec = QueryExecutionFactory.create(query, model);

        ResultSet results = qexec.execSelect();
        

        return results;

    }

}
