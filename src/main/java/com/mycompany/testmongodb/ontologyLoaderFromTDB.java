/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.testmongodb;

/**
 *
 * @author medel
 */
import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.Resource;
import org.apache.jena.tdb.TDBFactory;
import org.apache.jena.util.FileManager;
import org.apache.jena.vocabulary.RDF;
import org.apache.jena.query.*;

public class ontologyLoaderFromTDB {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here

        String tdbDirectory = "C:\\Users\\medel\\Documents\\NetBeansProjects\\testMongoDB\\tripleStoreDataBase";

        // Create a TDB dataset
        Dataset dataset = TDBFactory.createDataset(tdbDirectory);
         String email = "elbouyahyaoui.mohamed1@gmail.com";

        // Begin a write transaction
        try {
            // Get the default model from the dataset
            Model model = dataset.getDefaultModel();

//            dataset.begin(ReadWrite.WRITE);
//
//            AjouterTriplet(model, email, "http://www.semanticweb.org/caubeuf/ontologies/2023/6/JudoMathsSkill#ENTIER_addition_EntierAddEntier_simple");
//            AjouterTriplet(model, email, "http://www.semanticweb.org/caubeuf/ontologies/2023/6/JudoMathsSkill#ENTIER_numeration_comparaison");
//           
//
//            dataset.commit();
//
//            dataset.end();

            dataset.begin(ReadWrite.READ);

            String Prefix ="PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>\n"
                    + "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>\n"
                    + "PREFIX skillOnt: <http://www.semanticweb.org/caubeuf/ontologies/2023/6/JudoMathsSkill#>\n"
                    + "PREFIX userOnt: <http://www.semanticweb.org/caubeuf/ontologies/2023/6/JudoMathsUser#>\n"
                    + "\n";
           

            String queryString = Prefix + "SELECT DISTINCT ?recommendedSkill ?name\n"
                    + "WHERE {\n"
                    + "  OPTIONAL {\n"
                    + "   <http://www.semanticweb.org/caubeuf/ontologies/2023/6/JudoMathsOntologyV2#" + email + ">  <http://www.semanticweb.org/caubeuf/ontologies/2023/6/JudoMathsOntologyV2#aValidé> ?acquiredSkill .\n"
                    + "  }\n"
                    + "\n"
                    + "  {\n"
                    + "    FILTER (!bound(?acquiredSkill))\n"
                    + "    ?recommendedSkill rdf:type <http://www.semanticweb.org/caubeuf/ontologies/2023/5/untitled-ontology-28#CompetenceItem> .\n"
                    + "    ?recommendedSkill rdfs:label ?recommendedSkillLabel .\n"
                    + "    FILTER NOT EXISTS {\n"
                    + "      ?recommendedSkill <http://www.semanticweb.org/caubeuf/ontologies/2023/5/untitled-ontology-28#aPourPrerequis> ?prerequisiteSkill .\n"
                    + "    }\n"
                    + "      FILTER NOT EXISTS {\n"
                    + "        <http://www.semanticweb.org/caubeuf/ontologies/2023/6/JudoMathsOntologyV2#" + email + ">  <http://www.semanticweb.org/caubeuf/ontologies/2023/6/JudoMathsOntologyV2#aValidé> ?recommendedSkill .\n"
                    + "    }\n"
                    + "    \n"
                    + "  \n"
                    + "  }\n"
                    + "  UNION\n"
                    + "  {\n"
                    + "    FILTER (bound(?acquiredSkill))\n"
                    + "    ?acquiredSkill <http://www.semanticweb.org/caubeuf/ontologies/2023/5/untitled-ontology-28#aPourPrerequis>* ?prerequisiteSkill .\n"
                    + "    FILTER NOT EXISTS {\n"
                    + "      <http://www.semanticweb.org/caubeuf/ontologies/2023/6/JudoMathsOntologyV2#" + email + ">  <http://www.semanticweb.org/caubeuf/ontologies/2023/6/JudoMathsOntologyV2#aValidé> ?prerequisiteSkill .\n"
                    + "      FILTER (?acquiredSkill != ?prerequisiteSkill)\n"
                    + "    }\n"
                    + "    ?recommendedSkill <http://www.semanticweb.org/caubeuf/ontologies/2023/5/untitled-ontology-28#aPourPrerequis> ?prerequisiteSkill .\n"
                    + "    FILTER NOT EXISTS {\n"
                    + "      <http://www.semanticweb.org/caubeuf/ontologies/2023/6/JudoMathsOntologyV2#" + email + "> <http://www.semanticweb.org/caubeuf/ontologies/2023/6/JudoMathsOntologyV2#aValidé> ?recommendedSkill .\n"
                    + "    }\n"
                    + "    OPTIONAL {\n"
                    + "      ?recommendedSkill <http://www.semanticweb.org/caubeuf/ontologies/2023/5/untitled-ontology-28#aPourPrerequis> ?otherPrerequisiteSkill .\n"
                    + "      FILTER NOT EXISTS {\n"
                    + "        <http://www.semanticweb.org/caubeuf/ontologies/2023/6/JudoMathsOntologyV2#" + email + ">  <http://www.semanticweb.org/caubeuf/ontologies/2023/6/JudoMathsOntologyV2#aValidé> ?otherPrerequisiteSkill .\n"
                    + "        FILTER (?recommendedSkill != ?otherPrerequisiteSkill)\n"
                    + "      }\n"
                    + "    }\n"
                    + "    FILTER NOT EXISTS {\n"
                    + "      ?recommendedSkill <http://www.semanticweb.org/caubeuf/ontologies/2023/5/untitled-ontology-28#aPourPrerequis> ?missingPrerequisiteSkill .\n"
                    + "      FILTER NOT EXISTS {\n"
                    + "        <http://www.semanticweb.org/caubeuf/ontologies/2023/6/JudoMathsOntologyV2#" + email + ">  <http://www.semanticweb.org/caubeuf/ontologies/2023/6/JudoMathsOntologyV2#aValidé> ?missingPrerequisiteSkill .\n"
                    + "        FILTER (?recommendedSkill != ?missingPrerequisiteSkill)\n"
                    + "      }\n"
                    + "    }\n"
                    + "  }\n"
                    + "  \n"
                    + " ?recommendedSkill rdfs:label ?name . }";
            String tripleQuery = Prefix + "SELECT ?subject ?predicate ?object\r\n"
                    + "WHERE {\r\n"
                    + "  ?subject ?predicate ?object\r\n"
                    + " }\r\n"
                    + "";

            String AoGR = Prefix + "SELECT distinct ?label ?acquiredSkill\n"
                    + "WHERE {\n "
                    + "  <http://www.semanticweb.org/caubeuf/ontologies/2023/6/JudoMathsUser#" + email + "> userOnt:hasAcquired  ?acquiredSkill .\n"
                    + " ?acquiredSkill rdfs:label ?label}";

            String ss = Prefix +  "SELECT DISTINCT ?recommendedSkill ?name\n"
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

            QueryExecution qExec = QueryExecutionFactory.create(AoGR, dataset);

            // Execute the query and get the result set
            ResultSet rs = qExec.execSelect();

            // Output the result set
            ResultSetFormatter.out(rs);

            // Close the query execution
            qExec.close();

            // End the read transaction
            dataset.end();

        } finally {
            // Close the dataset
            dataset.close();
        }

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
