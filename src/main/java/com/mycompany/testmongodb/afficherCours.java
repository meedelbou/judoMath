/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.testmongodb;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.List;
import org.apache.jena.query.Dataset;
import org.apache.jena.query.Query;
import org.apache.jena.query.QueryExecution;
import org.apache.jena.query.QueryExecutionFactory;
import org.apache.jena.query.QueryFactory;
import org.apache.jena.query.QuerySolution;
import org.apache.jena.query.ReadWrite;
import org.apache.jena.query.ResultSet;
import org.apache.jena.rdf.model.Model;
import org.apache.jena.tdb.TDBFactory;

/**
 *
 * @author medel
 */
@WebServlet(name = "afficherCours", urlPatterns = {"/afficherCours"})
public class afficherCours extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<QuerySolution> solutions = new ArrayList<QuerySolution>();

        String competence = request.getParameter("c");

        if (checkSubClass(competence)) {
            List<QuerySolution> results = subClass(competence);
            request.setAttribute("solutions", results);
        }
        
        else if (checkIndividual(competence)) {
         
            String title = "Competences à acquérir";
            List<QuerySolution> results = afficherCompetences(competence);
            request.setAttribute("solutions", results);
            request.setAttribute("title", title);
            
        }
        
        
        
        


//        List<QuerySolution> Competences = afficherCompetences(competence);
//        request.setAttribute("solutions", Competences);
        request.setAttribute("c", competence);

        request.getRequestDispatcher("cours2.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);
    }

    private List<QuerySolution> afficherCompetences(String Class) {
        List<QuerySolution> solutions = new ArrayList<QuerySolution>();

        String tdbDirectory = "C:\\Users\\medel\\Documents\\NetBeansProjects\\testMongoDB\\tdb";

        // Create a TDB dataset
        Dataset dataset = TDBFactory.createDataset(tdbDirectory);

        // Begin a write transaction
        dataset.begin(ReadWrite.READ);

        Model model = dataset.getDefaultModel();

        String Prefix = "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>\n"
                + "PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> \n";

        String queryString = Prefix + "SELECT ?name ?individual WHERE {\n"
                + "  ?individual rdf:type <http://www.semanticweb.org/caubeuf/ontologies/2023/1/maths_3eCycle_v1#" + Class + ">  ;\n"
                + "              rdfs:label ?name .\n"
                + "}";
        String queryS = Prefix + "SELECT Distinct ?subClass ?name\n"
                + "WHERE {\n"
                + "  ?class rdfs:subClassOf* ?superClass .\n"
                + "  ?subClass rdfs:subClassOf ?superClass .\n"
                + "  OPTIONAL {\n"
                + "    ?individual rdf:type ?subClass ;\n"
                + "  rdfs:label ?name .}\n"
                + "  FILTER (?superClass = <http://www.semanticweb.org/caubeuf/ontologies/2023/1/maths_3eCycle_v1#" + Class + ">)\n"
                + "}";

        Query query = QueryFactory.create(queryString);
        QueryExecution qexec = QueryExecutionFactory.create(query, model);

        ResultSet results = qexec.execSelect();

        while (results.hasNext()) {
            QuerySolution solution = results.nextSolution();
            solutions.add(solution);
        }
        qexec.close();

        dataset.end();
        dataset.close();

        return solutions;

    }
    
    

    private boolean checkSubClass(String className) {

        String tdbDirectory = "C:\\Users\\medel\\Documents\\NetBeansProjects\\testMongoDB\\tdb";

        // Create a TDB dataset
        Dataset dataset = TDBFactory.createDataset(tdbDirectory);

        // Begin a write transaction
        dataset.begin(ReadWrite.READ);

        Model model = dataset.getDefaultModel();

        String prefix = "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>\n"
                + "PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> \n";

        String queryString = prefix + "ASK { \n"
                + "  ?subclass rdfs:subClassOf <http://www.semanticweb.org/caubeuf/ontologies/2023/1/maths_3eCycle_v1#" + className + "> .\n"
                + "}";

        Query query = QueryFactory.create(queryString);
        try (QueryExecution qexec = QueryExecutionFactory.create(query, model)) {
            boolean result = qexec.execAsk();
            qexec.close();
            dataset.end();
            dataset.close();
            return result;

        }
    }

    private boolean checkIndividual(String className) {

        String tdbDirectory = "C:\\Users\\medel\\Documents\\NetBeansProjects\\testMongoDB\\tdb";

        // Create a TDB dataset
        Dataset dataset = TDBFactory.createDataset(tdbDirectory);

        // Begin a write transaction
        dataset.begin(ReadWrite.READ);

        Model model = dataset.getDefaultModel();

        String prefix = "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>\n"
                + "PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> \n";

        String queryString = prefix + "ASK { \n"
                + "  ?individual rdf:type <http://www.semanticweb.org/caubeuf/ontologies/2023/1/maths_3eCycle_v1#" + className + "> .\n"
                + "}";

        Query query = QueryFactory.create(queryString);
        try (QueryExecution qexec = QueryExecutionFactory.create(query, model)) {
            boolean result = qexec.execAsk();
            qexec.close();
            dataset.end();
            dataset.close();
            return result;

        }

    }

    private List<QuerySolution> subClass(String competence) {

        List<QuerySolution> solutions = new ArrayList<QuerySolution>();

        String tdbDirectory = "C:\\Users\\medel\\Documents\\NetBeansProjects\\testMongoDB\\tdb";

        // Create a TDB dataset
        Dataset dataset = TDBFactory.createDataset(tdbDirectory);

        // Begin a write transaction
        dataset.begin(ReadWrite.READ);

        Model model = dataset.getDefaultModel();

        String Prefix = "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>\n"
                + "PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> \n"
                + "PREFIX owl: <http://www.w3.org/2002/07/owl#> \n";
        String queryString = Prefix + "SELECt ?name\n"
                + "WHERE {\n"
                + "  ?name rdfs:subClassOf <http://www.semanticweb.org/caubeuf/ontologies/2023/1/maths_3eCycle_v1#"+competence+"> .\n"
                + "}";

        Query query = QueryFactory.create(queryString);
        QueryExecution qexec = QueryExecutionFactory.create(query, model);

        ResultSet results = qexec.execSelect();

        while (results.hasNext()) {
            QuerySolution solution = results.nextSolution();
            if (!solutions.contains(solution)) {
                solutions.add(solution);
            }
        }

        qexec.close();

        dataset.end();
        dataset.close();

        return solutions;

    }
    
    
}
