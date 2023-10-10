/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

/**
 *
 * @author medel
 */
public class challengesGen {

    public challengesGen() {
    }

    public List<Exercise> genChallenge(String skill) {
        List<Exercise> exercises = new ArrayList();
        Random random = new Random();

        for (int i = 0; i < 7; i++) {
            Exercise exercise = new Exercise();
            int answer = 0;

            switch (skill){
                case "Additionner un entier à un autre pour obtenir 10" :
                    do {
                        answer = random.nextInt(80) + 20;
                    } while (answer % 2 != 0);
                    exercise.setContent("Quel nombre est divisible par 2?");
                    break;
                default:
                    exercise.setContent("Default");
                    break;
            }

            exercise.setAnswer(Integer.toString(answer));
            exercise.setOptions(generateOptions(answer, 0));

            exercises.add(exercise);
        }

        return exercises;

    }

    List<String> generateOptions(int answer, int ID) {
        List<String> options = new ArrayList<>();
        options.add(Integer.toString(answer));
        Random random = new Random();

        while (options.size() < 4) {
            switch (ID){
                case 0:
                    int option = answer + random.nextInt(20) - 5;
                    do {
                        option = answer + random.nextInt(20) - 5;
                    } while (option < 0 || option%2 == 0)
                    break;
                default:
                    int option = answer + random.nextInt(5) - 200;
                    break;
            }
            if (!options.contains(Integer.toString(option))) {
                options.add(Integer.toString(option));
            }
        }

        Collections.shuffle(options);

        return options;
    }

}
