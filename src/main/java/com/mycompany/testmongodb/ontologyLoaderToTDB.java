package com.mycompany.testmongodb;

import org.apache.jena.query.Dataset;
import org.apache.jena.query.ReadWrite;
import org.apache.jena.rdf.model.Model;
import org.apache.jena.tdb.TDBFactory;
import org.apache.jena.util.FileManager;

public class ontologyLoaderToTDB {

    public static void main(String[] args) {
        // Specify the paths to your ontology files
        String UserOntologyFile = "C:\\Users\\medel\\Downloads\\JudoMaths_User.owl";
        String SkillOntologyFile = "C:\\Users\\medel\\Downloads\\JudoMaths_Skill.owl";
        String DomainOntologyFile = "C:\\Users\\medel\\Downloads\\JudoMaths_Domain.owl";
        
        // Set the directory to store the TDB dataset
        String tdbDirectory = "tripleStoreDataBase";
        
        // Create a TDB dataset
        Dataset dataset = TDBFactory.createDataset(tdbDirectory);
        
        // Get the default model from the dataset
        Model model = dataset.getDefaultModel();
        
        // Begin a write transaction
        dataset.begin(ReadWrite.WRITE);
        
        try {
            // Load the first ontology into the model
            FileManager.get().readModel(model, UserOntologyFile);
            
            // Load the second ontology into the model
            
            FileManager.get().readModel(model, SkillOntologyFile);
            
            // Load the third ontology into the model
            FileManager.get().readModel(model, DomainOntologyFile);
            
            // Commit the changes to the dataset
            dataset.commit();
            
            System.out.println("Ontologies loaded successfully into TDB dataset.");
        } catch (Exception e) {
            // If any error occurs, abort the transaction
            dataset.abort();
            
            System.err.println("Error loading ontologies into TDB dataset: " + e.getMessage());
        } finally {
            // End the write transaction and release the dataset
            dataset.end();
            dataset.close();
        }
    }
}
