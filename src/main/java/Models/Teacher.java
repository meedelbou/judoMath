package Models;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import java.io.InputStream;
import org.bson.Document;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class Teacher extends User {

    private static final long serialVersionUID = 1L;
    private static final String DATABASE_NAME = "my_test_db";
    private static final String COLLECTION_NAME = "Users";

    private List<String> etudiants;

    public Teacher(String email, String password, String nom, String prenom, String role, byte[] profilePicture) {
        super(email, password, nom, prenom, role,profilePicture);
        this.etudiants = etudiants;
    }

    public List<String> getEtudiants() {
        return etudiants;
    }

    public void setEtudiants(List<String> etudiants) {
        this.etudiants = etudiants;
    }

    public double calculatePercentageIncrease(int days) {
        // Get the current date and time
        Date currentDate = new Date();

        // Calculate the date and time 1 hour ago
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(currentDate);
        calendar.add(Calendar.DAY_OF_MONTH, days);
        Date oneHourAgo = calendar.getTime();

        // Count the number of students who signed up in the last hour
        int newStudentsCount = 0;
        newStudentsCount = this.etudiants.stream().map(student -> {
            MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
            MongoDatabase database = mongoClient.getDatabase(DATABASE_NAME);
            MongoCollection<Document> collection = database.getCollection(COLLECTION_NAME);
            Document query = new Document();
            query.append("email", student);
            Document userDocument = collection.find(query).first();
            return userDocument;
        }).filter(userDocument -> (userDocument != null)).map(userDocument -> userDocument.getDate("dateOfSignup")).filter(signupDateTime -> (signupDateTime.after(oneHourAgo) && signupDateTime.before(currentDate))).map(_item -> 1).reduce(newStudentsCount, Integer::sum);

        // Calculate the percentage increase
        int initialStudentsCount = this.etudiants.size();
        double percentageIncrease = (double) newStudentsCount / initialStudentsCount * 100;

        return percentageIncrease;
    }

}
