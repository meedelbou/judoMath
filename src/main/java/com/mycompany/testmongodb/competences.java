/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.testmongodb;

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
import org.apache.jena.tdb.TDBFactory;

/**
 *
 * @author medel
 */
@WebServlet(name = "competences", urlPatterns = {"/competences"})
public class competences extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        HttpSession session = request.getSession();
        String cd = request.getParameter("cd");
        session.setAttribute("cd", cd.replace("'", " ").strip());
        request.getRequestDispatcher("/competenceDomaines.jsp").forward(request, response);

    }

    private List<QuerySolution> competences(String email) {

        List<QuerySolution> solutions = new ArrayList<QuerySolution>();

        String tdbDirectory = "tripleStoreDataBase";

        Dataset dataset = TDBFactory.createDataset(tdbDirectory);

        dataset.begin(ReadWrite.READ);

        Model model = dataset.getDefaultModel();

        String Prefix = "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>\n"
                + "PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> \n"
                + "PREFIX owl: <http://www.w3.org/2002/07/owl#> \n"
                + "PREFIX :<http://www.semanticweb.org/caubeuf/ontologies/2023/5/untitled-ontology-28#>"
                + "PREFIX ont:<http://www.semanticweb.org/caubeuf/ontologies/2023/5/JudoMathsOntology#>";

        String queryString = Prefix + "";

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
