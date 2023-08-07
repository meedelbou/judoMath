/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

/**
 *
 * @author medel
 */
import java.io.InputStream;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class Student extends User {

    private Date dateOfSignup;
    private List<String> competencesValides;
    private int experiencePoints;
    private Date lastLogin;
    private int numberOfVisits;
    private String enseignantEmail;
    private boolean accesToTest;
    private boolean status;
    private List<skill> skillsInProgress ;
    private long TotalTimeSpent;

    public long getTotalTimeSpent() {
        return TotalTimeSpent;
    }

    public void setTotalTimeSpent(long TotalTimeSpent) {
        this.TotalTimeSpent = TotalTimeSpent;
    }

    public List<skill> getSkillsInProgress() {
        return skillsInProgress;
    }

    public void setSkillsInProgress(List<skill> skillsInProgress) {
        this.skillsInProgress = skillsInProgress;
    }

    public Student(String email, String password, String nom, String prenom, String role, byte[] profilePicture, String enseignantEmail,
            Date dateOfSignup, List<String> competencesValides, int experiencePoints, Date lastLogin, int numberOfVisits, boolean accesToTest,boolean status) {
        super(email, password, nom, prenom, role, profilePicture);
        this.dateOfSignup = dateOfSignup;
        this.competencesValides = competencesValides;
        this.experiencePoints = experiencePoints;
        this.lastLogin = lastLogin;
        this.numberOfVisits = numberOfVisits;
        this.enseignantEmail = enseignantEmail;
        this.accesToTest = accesToTest;
        this.status =status;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public boolean isAccesToTest() {
        return accesToTest;
    }

    public void setAccesToTest(boolean accesToTest) {
        this.accesToTest = accesToTest;
    }

    public Date getDateOfSignup() {
        return dateOfSignup;
    }

    public void setDateOfSignup(Date dateOfSignup) {
        this.dateOfSignup = dateOfSignup;
    }

    public List<String> getCompetencesValides() {
        return competencesValides;
    }

    public void setCompetencesValides(List<String> competencesValides) {
        this.competencesValides = competencesValides;
    }

    public int getExperiencePoints() {
        return experiencePoints;
    }

    public void setExperiencePoints(int experiencePoints) {
        this.experiencePoints = experiencePoints;
    }

    public Date getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(Date lastLogin) {
        this.lastLogin = lastLogin;
    }

    public int getNumberOfVisits() {
        return numberOfVisits;
    }

    public void setNumberOfVisits(int numberOfVisits) {
        this.numberOfVisits = numberOfVisits;
    }

    public String getEnseignantEmail() {
        return enseignantEmail;
    }

    public void setEnseignantEmail(String enseignantEmail) {
        this.enseignantEmail = enseignantEmail;
    }

}
