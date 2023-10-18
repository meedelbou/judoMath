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
                    nbrAlea = (int) ((random.nextInt(10)+1) * Math.pow(10, (random.nextInt(5) + 2)));        
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
                        intTransit = (int) ((op1 - op2)/2 + op1);
                    } else {
                       answer = (int) ((op1 - op2)/2 + op2);
                        intTransit = (int) ((op2 - op1)/2 + op2);
                    }                
                    exercise.setContent("Quelle valeur est comprise entre " + op1 + " et " + op2 + " ?");
                    typeExo = 4;
                break;
                case "Additionner deux entiers simples" :
                   int range = 100;
                    int op1Last = random.nextInt(range)+1;
                    int op2Last = range - op1Last;
                    int op1Mid = random.nextInt(range)+1;
                    int op2Mid = range - op1Mid - 1;
                    int op1First = random.nextInt(range)+1;
                    int op2First = range - op1First - 1;

                    String strNombre1 = String.valueOf(op1Last);
                    String strNombre2 = String.valueOf(op2Last);
                    String strNombre3 = String.valueOf(op1Mid);
                    String strNombre4 = String.valueOf(op2Mid);
                    String strNombre5 = String.valueOf(op1First);
                    String strNombre6 = String.valueOf(op2First);

                    String op1String = strNombre1 + strNombre3 + strNombre5;
                    String op2String = strNombre2 + strNombre4 + strNombre6;

                    op1 = Integer.parseInt(op1String);
                    op2 = Integer.parseInt(op2String);
                    int result =  op1 + op2;
                    answer = result - op1;
                    
                    exercise.setContent("Combien faut-il ajouter à " + op1 + " pour obtenir " + result + " ?");
                    typeExo = 0;
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
                 case 5: // addition simple   
                    int alea = random.nextInt(3);
                    int signe = random.nextInt(2);
                    switch(alea){
                        case 0: // 10
                            if (signe = 0){
                                option = answer + 10;
                            } else {
                                option = answer - 10;
                            }                           
                            break;
                        case 1: // 100
                             if (signe = 0){
                                option = answer + 100;
                            } else {
                                option = answer - 100;
                            }      
                            break;
                        case 2: // 110
                             if (signe = 0){
                                option = answer + 110;
                            } else {
                                option = answer - 110;
                            }      
                            break;                            
                    }
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
