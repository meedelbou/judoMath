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

    int intTransit = 0;

    public List<Exercise> genChallenge(String skill) {
        List<Exercise> exercises = new ArrayList();
        Random random = new Random();

        for (int i = 0; i < 7; i++) {
            Exercise exercise = new Exercise();
            int answer = 0;
            int typeExo = 0;
            int op1 = 0;
            int op2 = 0;
            int nbrAlea = 0;
            int nbrTemp = 0;
            int limB = 0;
            int limH = 0;
            
            switch (skill){
                case "Additionner un entier à un autre pour obtenir 10" :
                    op1 = random.nextInt(9)+1;                   
                    op2 = 10;
                    answer = op2 - op1;
                    nbrAlea = random.nextInt(89)+10;
                    nbrTemp = (nbrAlea + 1) * 10;
                    exercise.setContent("Combien faut-il ajouter à " + nbrAlea + op1 + " pour obtenir " + nbrTemp + " ?");
                    typeExo = 1;
                break;
                case "Additionner un entier à un autre pour obtenir 100" :
                    op1 = random.nextInt(99)+1;                   
                    op2 = 100;
                    answer = op2 - op1;                            
                    nbrAlea = (random.nextInt(10)+1) * Math.pow(10, (random.nextInt(5) + 2));        
                    nbrTemp = nbrAlea - answer;                 
                    exercise.setContent("Combien faut-il ajouter à " + nbrTemp + " pour obtenir " + nbrAlea + " ?");
                    typeExo = 2;
                break;
                 case "Comparer deux entiers" :  
                    op1 = random.nextInt(100000000 - 100000) + 100000;
                    limB = (int) (op1 - 0.00001 * op1);
                    limH = (int) (op1 + 0.00001 * op1);
                    switch (random.nextInt(2)) {
                        case 0:
                            op2 = random.nextInt(limH - limB) + limB;
                            break;
                        case 1:
                            op2 = random.nextInt(limH - limB) + limH;
                            break;
                    }                   
                    if (op1 < op2){
                        exercise.setContent("Quel est la valeur de ??? dans la comparaison : " + op1 + " < ???");
                        intTransit = op1;
                        answer = op2;
                    } else {
                        exercise.setContent("Quel est la valeur de ??? dans la comparaison : " + "??? < " + op1);    
                        answer = op2;
                        intTransit = op1;
                    }
                    typeExo = 3;
                break;
                case "Encadrer un entier entre deux entiers" :  
                    op1 = random.nextInt(100000 - 10000) + 10000;
                    limB = (int) (op1 - 0.00001 * op1);
                    limH = (int) (op1 + 0.00001 * op1);
                    switch (random.nextInt(2)) {
                        case 0:
                            op2 = random.nextInt(limH - limB) + limB;
                            break;
                        case 1:
                            op2 = random.nextInt(limH - limB) + limH;
                            break;
                    }                   
                    if (op1 < op2){
                        answer = (int) ((op2 - op1)/2 + op1);
                        intTemp = (int) ((op1 - op2)/2 + op1);
                    } else {
                       answer = (int) ((op1 - op2)/2 + op2);
                        intTemp = (int) ((op2 - op1)/2 + op2);
                    }                
                    exercise.setContent("Quelle valeur est comprise entre " + op1 + " et " + op2 + " ?");
                    typeExo = 4;
                break;
                case "Connaitre les critères de division par 2" :
                    do {
                        answer = random.nextInt(80) + 20;
                    } while (answer % 2 != 0);
                    exercise.setContent("Quel nombre est divisible par 2?");
                    typeExo = 0;
                break;
                default:
                    exercise.setContent("Default");
                break;
            }

            exercise.setAnswer(Integer.toString(answer));
            exercise.setOptions(generateOptions(answer, typeExo));

            exercises.add(exercise);
        }

        return exercises;

    }

    List<String> generateOptions(int answer, int ID) {
        List<String> options = new ArrayList<>();
        options.add(Integer.toString(answer));
        Random random = new Random();
        int option = 0;

        while (options.size() < 4) {
            switch (ID){
                case 0: // 1 seul nbr divisible par 2
                    option = answer + random.nextInt(20) - 5;
                    do {
                        option = answer + random.nextInt(20) - 5;
                    } while (option < 0 || option%2 == 0);
                break;
                case 1: // cplmnt à 10
                     option = answer + random.nextInt(5) - 2;
                break;
                    case 2: // cplmnt à 100   
                    do {
                     option = answer + (random.nextInt(5) - 2)*10;
                    } while (option == answer);
                break;
                    case 3: // comparaison entier   
                    if (intTransit < answer){
                        int transInt = (int) ((random.nextInt(10)+1)*Math.pow((random.nextInt(10)+1), (random.nextInt(3) + 1)));
                        option = intTransit - transInt;
                    } else {
                        int transInt = (int) ((random.nextInt(10)+1)*Math.pow((random.nextInt(10)+1), (random.nextInt(3) + 1)));
                        option = intTransit + transInt;
                    }
                break;
                case 4: // comparaison entier   
                    int transInt = (int) ((random.nextInt(10)+1)*Math.pow((random.nextInt(10)+1), (random.nextInt(3) + 1)));
                    option = intTransit - transInt;
                break;
                default:
                    option = answer + random.nextInt(1) + 666;
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
