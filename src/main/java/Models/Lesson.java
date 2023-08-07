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

import java.util.ArrayList;
import java.util.List;
import Models.Exercise;

public class Lesson {
    private String title;
    private String content;

    public String getContent() {
        return content;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setExercises(List<Exercise> exercises) {
        this.exercises = exercises;
    }

    public void setContent(String content) {
        this.content = content;
    }
    private List<Exercise> exercises;

    public Lesson(String title) {
        this.title = title;
        this.exercises = new ArrayList<>();
    }

    public Lesson() {
    }

    public String getTitle() {
        return title;
    }

    public List<Exercise> getExercises() {
        return exercises;
    }

    public void addExercise(Exercise exercise) {
        exercises.add(exercise);
    }
}

