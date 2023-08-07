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
public class exercisesGen {

    public exercisesGen() {

    }

    public Lesson generateExercises(String name, int palier) {
        Lesson lesson = new Lesson();
        List<Exercise> exercises = new ArrayList();
        String cours = "Random course";

        if (name.equals("Connaitre les critères de division par 2")) {

            Random random = new Random();
            switch (palier) {
                case 1:
                    for (int i = 0; i < 7; i++) {
                        int answer;
                        do {
                            answer = random.nextInt(80) + 1;
                        } while (answer % 2 != 0);

                        Exercise exercise = new Exercise();
                        exercise.setContent("Quel nombre est divisible par 2?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptionsCD(answer, 2));

                        exercises.add(exercise);
                    }
                    break;
                case 2:
                    for (int i = 0; i < 7; i++) {
                        int answer;
                        do {
                            answer = random.nextInt(10000) + 100;
                        } while (answer % 2 != 0);

                        Exercise exercise = new Exercise();
                        exercise.setContent("Quel nombre est divisible par 2?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptionsCD(answer, 2));

                        exercises.add(exercise);
                    }
                    break;
                case 3:
                    for (int i = 0; i < 7; i++) {
                        int answer;
                        do {
                            answer = random.nextInt(100000000) + 100000;
                        } while (answer % 2 != 0);

                        Exercise exercise = new Exercise();
                        exercise.setContent("Quel nombre est divisible par 2?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptionsCD(answer, 2));
                        exercise.setTimer(true);

                        exercises.add(exercise);
                    }
                    break;
                default:
                    break;
            }

        } else if (name.equals("Connaitre les critères de division par 3")) {
            cours = "Un nombre est divisible par **3** si la **somme de ses chiffres** est un multiple de 3. <br>\n"
                    + "\n"
                    + "**Exemple : <br>** Prenons le nombre 381. La somme de ses chiffres est 3 + 8 + 1 = 12. Comme 12 est un multiple de 3 (3*4 = 12), alors le nombre 381 est divisible par 3.";
            Random random = new Random();
            switch (palier) {
                case 1:
                    for (int i = 0; i < 7; i++) {
                        int answer;
                        do {
                            answer = random.nextInt(80) + 1;
                        } while (answer % 3 != 0);

                        Exercise exercise = new Exercise();
                        exercise.setContent("Quel nombre est divisible par 3?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptionsCD(answer, 3));

                        exercises.add(exercise);
                    }
                    break;
                case 2:
                    for (int i = 0; i < 7; i++) {
                        int answer;
                        do {
                            answer = random.nextInt(10000) + 100;
                        } while (answer % 3 != 0);

                        Exercise exercise = new Exercise();
                        exercise.setContent("Quel nombre est divisible par 3?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptionsCD(answer, 3));

                        exercises.add(exercise);
                    }
                    break;
                case 3:
                    for (int i = 0; i < 7; i++) {
                        int answer;
                        do {
                            answer = random.nextInt(100000000) + 100000;
                        } while (answer % 3 != 0);

                        Exercise exercise = new Exercise();
                        exercise.setContent("Quel nombre est divisible par 3?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptionsCD(answer, 3));
                        exercise.setTimer(true);

                        exercises.add(exercise);
                    }
                    break;
                default:
                    break;
            }

        } else if (name.equals("Connaitre les critères de division par 9")) {
            Random random = new Random();
            switch (palier) {
                case 1:
                    for (int i = 0; i < 7; i++) {
                        int answer;
                        do {
                            answer = random.nextInt(80) + 1;
                        } while (answer % 9 != 0);

                        Exercise exercise = new Exercise();
                        exercise.setContent("Quel nombre est divisible par 9?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptionsCD(answer, 9));

                        exercises.add(exercise);
                    }
                    break;
                case 2:
                    for (int i = 0; i < 7; i++) {
                        int answer;
                        do {
                            answer = random.nextInt(10000) + 100;
                        } while (answer % 9 != 0);

                        Exercise exercise = new Exercise();
                        exercise.setContent("Quel nombre est divisible par 9?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptionsCD(answer, 9));

                        exercises.add(exercise);
                    }
                    break;
                case 3:
                    for (int i = 0; i < 7; i++) {
                        int answer;
                        do {
                            answer = random.nextInt(100000000) + 100000;
                        } while (answer % 9 != 0);

                        Exercise exercise = new Exercise();
                        exercise.setContent("Quel nombre est divisible par 9?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptionsCD(answer, 9));
                        exercise.setTimer(true);

                        exercises.add(exercise);
                    }
                    break;
                default:
                    break;
            }

        } else if (name.equals("Connaitre les critères de division par 5")) {
            Random random = new Random();
            switch (palier) {
                case 1:
                    for (int i = 0; i < 7; i++) {
                        int answer;
                        do {
                            answer = random.nextInt(80) + 1;
                        } while (answer % 5 != 0);

                        Exercise exercise = new Exercise();
                        exercise.setContent("Quel nombre est divisible par 5?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptionsCD(answer, 5));

                        exercises.add(exercise);
                    }
                    break;
                case 2:
                    for (int i = 0; i < 7; i++) {
                        int answer;
                        do {
                            answer = random.nextInt(10000) + 100;
                        } while (answer % 5 != 0);

                        Exercise exercise = new Exercise();
                        exercise.setContent("Quel nombre est divisible par 5?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptionsCD(answer, 5));

                        exercises.add(exercise);
                    }
                    break;
                case 3:
                    for (int i = 0; i < 7; i++) {
                        int answer;
                        do {
                            answer = random.nextInt(100000000) + 100000;
                        } while (answer % 5 != 0);

                        Exercise exercise = new Exercise();
                        exercise.setContent("Quel nombre est divisible par 5?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptionsCD(answer, 5));
                        exercise.setTimer(true);

                        exercises.add(exercise);
                    }
                    break;
                default:
                    break;
            }

        } else if (name.equals("Additionner un entier à un autre pour obtenir 10")) {
            Random random = new Random();
            switch (palier) {
                case 1:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(10) + 1;
                        int operand2 = 10 - operand1;
                        int answer = operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien faut-il ajouter à " + operand1 + " pour obtenir 10?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));

                        exercises.add(exercise);
                    }
                    break;
                case 2:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(10) + 1;
                        int operand2 = 10 - operand1;
                        int answer = operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien faut-il ajouter à " + operand1 + " pour obtenir 10?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));
                        exercise.setTimer(true);

                        exercises.add(exercise);
                    }
                    break;
                case 3:
                    List<String> problems = Arrays.asList(
                            "Clara adore les oiseaux et a déjà observé X différentes espèces dans son jardin. Elle veut en observer Y avant la fin de l'été. Combien d'espèces d'oiseaux doit-elle encore découvrir ?",
                            "David possède un classeur de cartes pokémons, où chaque page de ce classeur peut contenir Y cartes. Il possède X cartes pokémons et veut remplir la dernière page de son classeur. Combien de cartes pokémon lui manque t'il ?",
                            "Julien collectionne les timbres. Il en a déjà X mais il veut atteindre les Y. Combien de timbres doit-il encore collectionner ?",
                            "Anna fait des bijoux et elle a déjà fabriqué X colliers pour vendre à la foire. Elle veut en avoir Y au total. Combien de colliers doit-elle encore fabriquer ?",
                            "Paul fait une collection de cartes Pokémon. Il a déjà X cartes mais il veut atteindre les Y. Combien de cartes doit-il encore collectionner ?",
                            "Marie adore les fleurs et a déjà planté X roses dans son jardin. Elle veut en avoir Y. Combien de roses doit-elle encore planter ?",
                            "Louis aime cuisiner. Il a déjà fait X crêpes et il veut en faire Y pour son petit déjeuner. Combien de crêpes doit-il encore cuisiner ?",
                            "Sophie est en train de tricoter une écharpe. Elle a déjà tricoté X cm et elle veut que l'écharpe fasse Y cm. Combien de centimètres doit-elle encore tricoter ?",
                            "Maxime fait un puzzle de Y pièces. Il a déjà placé X pièces. Combien de pièces doit-il encore placer pour finir le puzzle ?",
                            "Léa est une artiste et elle a déjà dessiné X portraits. Elle veut en dessiner Y au total. Combien de portraits doit-elle encore dessiner ?",
                            "Antoine fait du jogging. Il a déjà couru X km et il veut courir Y km aujourd'hui. Combien de kilomètres doit-il encore courir ?",
                            "Emma a commencé un marathon de films. Elle a déjà regardé X films et elle veut en regarder Y au total. Combien de films doit-elle encore regarder ?",
                            "Hugo fait du coloriage. Il a déjà colorié X pages de son livre qui en compte Y. Combien de pages doit-il encore colorier ?",
                            "Camille lit un livre de Y pages. Elle a déjà lu X pages. Combien de pages doit-elle encore lire pour finir le livre ?",
                            "Alex fait de la poterie. Il a déjà fait X pots et il veut en faire Y au total. Combien de pots doit-il encore faire ?",
                            "Louise fait un tour du monde. Elle a déjà visité X pays et elle veut en visiter Y au total. Combien de pays doit-elle encore visiter ?"
                    );

                    for (int i = 0; i < 7; i++) {

                        int x = random.nextInt(10);
                        int y = 10;
                        String problem = problems.get(random.nextInt(problems.size()));
                        problem = problem.replace("X", String.valueOf(x)).replace("Y", String.valueOf(y));

                        Exercise exercise = new Exercise();
                        exercise.setContent(problem);
                        exercise.setAnswer(Integer.toString(10 - x));
                        exercise.setOptions(generateOptions(10 - x));
                        exercise.setTimer(true);
                        exercise.setPrompt(true);

                        exercises.add(exercise);
                    }
                    break;
                default:
                    break;
            }

        } else if (name.equals("Additionner un entier à un autre pour obtenir 100")) {
            Random random = new Random();
            switch (palier) {
                case 1:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(100) + 1;
                        int operand2 = 100 - operand1;
                        int answer = operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien faut-il ajouter à " + operand1 + " pour obtenir 100?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));

                        exercises.add(exercise);
                    }
                    break;
                case 2:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(100) + 1;
                        int operand2 = 10 - operand1;
                        int answer = operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien faut-il ajouter à " + operand1 + " pour obtenir 10?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));
                        exercise.setTimer(true);

                        exercises.add(exercise);
                    }
                    break;
                case 3:
                    List<String> problems = Arrays.asList(
                            "Clara adore les oiseaux et a déjà observé X différentes espèces dans son jardin. Elle veut en observer Y avant la fin de l'été. Combien d'espèces d'oiseaux doit-elle encore découvrir ?",
                            "David possède un classeur de cartes pokémons, où chaque page de ce classeur peut contenir Y cartes. Il possède X cartes pokémons et veut remplir la dernière page de son classeur. Combien de cartes pokémon lui manque t'il ?",
                            "Julien collectionne les timbres. Il en a déjà X mais il veut atteindre les Y. Combien de timbres doit-il encore collectionner ?",
                            "Anna fait des bijoux et elle a déjà fabriqué X colliers pour vendre à la foire. Elle veut en avoir Y au total. Combien de colliers doit-elle encore fabriquer ?",
                            "Paul fait une collection de cartes Pokémon. Il a déjà X cartes mais il veut atteindre les Y. Combien de cartes doit-il encore collectionner ?",
                            "Marie adore les fleurs et a déjà planté X roses dans son jardin. Elle veut en avoir Y. Combien de roses doit-elle encore planter ?",
                            "Louis aime cuisiner. Il a déjà fait X crêpes et il veut en faire Y pour son petit déjeuner. Combien de crêpes doit-il encore cuisiner ?",
                            "Sophie est en train de tricoter une écharpe. Elle a déjà tricoté X cm et elle veut que l'écharpe fasse Y cm. Combien de centimètres doit-elle encore tricoter ?",
                            "Maxime fait un puzzle de Y pièces. Il a déjà placé X pièces. Combien de pièces doit-il encore placer pour finir le puzzle ?",
                            "Léa est une artiste et elle a déjà dessiné X portraits. Elle veut en dessiner Y au total. Combien de portraits doit-elle encore dessiner ?",
                            "Antoine fait du jogging. Il a déjà couru X km et il veut courir Y km aujourd'hui. Combien de kilomètres doit-il encore courir ?",
                            "Emma a commencé un marathon de films. Elle a déjà regardé X films et elle veut en regarder Y au total. Combien de films doit-elle encore regarder ?",
                            "Hugo fait du coloriage. Il a déjà colorié X pages de son livre qui en compte Y. Combien de pages doit-il encore colorier ?",
                            "Camille lit un livre de Y pages. Elle a déjà lu X pages. Combien de pages doit-elle encore lire pour finir le livre ?",
                            "Alex fait de la poterie. Il a déjà fait X pots et il veut en faire Y au total. Combien de pots doit-il encore faire ?",
                            "Louise fait un tour du monde. Elle a déjà visité X pays et elle veut en visiter Y au total. Combien de pays doit-elle encore visiter ?"
                    );

                    for (int i = 0; i < 7; i++) {

                        int x = random.nextInt(100);
                        int y = 100;
                        String problem = problems.get(random.nextInt(problems.size()));
                        problem = problem.replace("X", String.valueOf(x)).replace("Y", String.valueOf(y));

                        Exercise exercise = new Exercise();
                        exercise.setContent(problem);
                        exercise.setAnswer(Integer.toString(100 - x));
                        exercise.setOptions(generateOptions(10 - x));
                        exercise.setTimer(true);
                        exercise.setPrompt(true);

                        exercises.add(exercise);
                    }
                    break;
                default:
                    break;
            }

        } else if (name.equals("Additionner deux entiers") && palier == 1) {

            Random random = new Random();
            switch (palier) {
                case 1:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(10);
                        int operand2 = random.nextInt(10);
                        int answer = operand1 + operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent(operand1 + " + " + operand2 + " = ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));

                        exercises.add(exercise);
                    }
                    break;
                case 2:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(100);
                        int operand2 = random.nextInt(100);
                        int answer = operand1 + operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent(operand1 + " + " + operand2 + " = ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));

                        exercises.add(exercise);
                    }
                    break;
                case 3:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(9999);
                        int operand2 = random.nextInt(9999);
                        int answer = operand1 + operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent(operand1 + " + " + operand2 + " = ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));

                        exercises.add(exercise);
                    }
                    break;
                default:
                    break;
            }

        } else if (name.equals("Soustraire un entier à un autre entier")) {

            Random random = new Random();
            switch (palier) {
                case 1:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(10);
                        int operand2 = random.nextInt(10);
                        int answer = operand1 - operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent(operand1 + " - " + operand2 + " = ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));

                        exercises.add(exercise);
                    }
                    break;
                case 2:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(99);
                        int operand2 = random.nextInt(99);
                        int answer = operand1 - operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent(operand1 + " - " + operand2 + " = ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));

                        exercises.add(exercise);
                    }
                    break;
                case 3:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(9999);
                        int operand2 = random.nextInt(9999);
                        int answer = operand1 - operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent(operand1 + " - " + operand2 + " = ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));

                        exercises.add(exercise);
                    }

                    break;
                default:
                    break;
            }

        } else if (name.equals("Connaitre la table des 2")) {
            Random random = new Random();
            switch (palier) {
                case 1:

                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(10);
                        int operand2 = 2;
                        int answer = operand1 * operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " x " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));

                        exercises.add(exercise);
                    }

                    break;
                case 2:

                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(10);
                        int operand2 = 2;
                        int answer = operand1 * operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " x " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));
                        exercise.setPrompt(true);
                        exercise.setTimer(true);

                        exercises.add(exercise);
                    }
                    break;
                case 3:
                    exercises = table(2);
                    break;
                default:
                    break;
            }
        } else if (name.equals("Connaitre la table des 3")) {
            Random random = new Random();
            switch (palier) {
                case 1:

                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(10);
                        int operand2 = 3;
                        int answer = operand1 * operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " x " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));

                        exercises.add(exercise);
                    }

                    break;
                case 2:

                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(10);
                        int operand2 = 3;
                        int answer = operand1 * operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " x " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));
                        exercise.setPrompt(true);
                        exercise.setTimer(true);

                        exercises.add(exercise);
                    }
                    break;
                case 3:
                    exercises = table(3);
                    break;
                default:
                    break;
            }
        } else if (name.equals("Connaitre la table des 4")) {
            Random random = new Random();
            switch (palier) {
                case 1:

                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(10);
                        int operand2 = 4;
                        int answer = operand1 * operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " x " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));

                        exercises.add(exercise);
                    }

                    break;
                case 2:

                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(10);
                        int operand2 = 4;
                        int answer = operand1 * operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " x " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));
                        exercise.setPrompt(true);
                        exercise.setTimer(true);

                        exercises.add(exercise);
                    }
                    break;
                case 3:
                    exercises = table(4);
                    break;
                default:
                    break;
            }
        } else if (name.equals("Connaitre la table des 5")) {
            Random random = new Random();
            switch (palier) {
                case 1:

                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(10);
                        int operand2 = 5;
                        int answer = operand1 * operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " x " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));

                        exercises.add(exercise);
                    }

                    break;
                case 2:

                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(10);
                        int operand2 = 5;
                        int answer = operand1 * operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " x " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));
                        exercise.setPrompt(true);
                        exercise.setTimer(true);

                        exercises.add(exercise);
                    }
                    break;
                case 3:
                    exercises = table(5);
                    break;
                default:
                    break;
            }
        } else if (name.equals("Connaitre la table des 6")) {
            Random random = new Random();
            switch (palier) {
                case 1:

                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(10);
                        int operand2 = 6;
                        int answer = operand1 * operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " x " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));

                        exercises.add(exercise);
                    }

                    break;
                case 2:

                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(10);
                        int operand2 = 6;
                        int answer = operand1 * operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " x " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));
                        exercise.setPrompt(true);
                        exercise.setTimer(true);

                        exercises.add(exercise);
                    }
                    break;
                case 3:
                    exercises = table(6);
                    break;
                default:
                    break;
            }
        } else if (name.equals("Connaitre la table des 7")) {
            Random random = new Random();
            switch (palier) {
                case 1:

                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(10);
                        int operand2 = 7;
                        int answer = operand1 * operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " x " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));

                        exercises.add(exercise);
                    }

                    break;
                case 2:

                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(10);
                        int operand2 = 7;
                        int answer = operand1 * operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " x " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));
                        exercise.setPrompt(true);
                        exercise.setTimer(true);

                        exercises.add(exercise);
                    }
                    break;
                case 3:
                    exercises = table(7);
                    break;
                default:
                    break;
            }
        } else if (name.equals("Connaitre la table des 8")) {
            Random random = new Random();
            switch (palier) {
                case 1:

                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(10);
                        int operand2 = 8;
                        int answer = operand1 * operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " x " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));

                        exercises.add(exercise);
                    }

                    break;
                case 2:

                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(10);
                        int operand2 = 8;
                        int answer = operand1 * operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " x " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));
                        exercise.setPrompt(true);
                        exercise.setTimer(true);

                        exercises.add(exercise);
                    }
                    break;
                case 3:
                    exercises = table(8);
                    break;
                default:
                    break;
            }
        } else if (name.equals("Connaitre la table des 9")) {
            Random random = new Random();
            switch (palier) {
                case 1:

                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(10);
                        int operand2 = 9;
                        int answer = operand1 * operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " x " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));

                        exercises.add(exercise);
                    }

                    break;
                case 2:

                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(10);
                        int operand2 = 9;
                        int answer = operand1 * operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " x " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));
                        exercise.setPrompt(true);
                        exercise.setTimer(true);

                        exercises.add(exercise);
                    }
                    break;
                case 3:
                    exercises = table(9);
                    break;
                default:
                    break;
            }
        } else if (name.equals("Multiplier un entier par 10")) {
            Random random = new Random();
            switch (palier) {
                case 1:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(200) + 1;
                        int operand2 = 10;
                        int answer = operand1 * operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " x " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));

                        exercises.add(exercise);
                    }
                    break;
                case 2:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(20000) + 1000;
                        int operand2 = 10;
                        int answer = operand1 * operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " x " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));
                        exercise.setPrompt(true);
                        exercise.setTimer(true);

                        exercises.add(exercise);
                    }
                    break;
                case 3:
                    exercises = multi(100000, 100000000, 10);
                    break;
                default:
                    break;
            }

        } else if (name.equals("Multiplier un entier par 20")) {
            Random random = new Random();
            switch (palier) {
                case 1:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(50) + 1;
                        int operand2 = 20;
                        int answer = operand1 * operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " x " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));

                        exercises.add(exercise);
                    }
                    break;
                case 2:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(100) + 10;
                        int operand2 = 20;
                        int answer = operand1 * operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " x " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));
                        exercise.setPrompt(true);
                        exercise.setTimer(true);

                        exercises.add(exercise);
                    }
                    break;
                case 3:
                    int x = random.nextInt(10000) + 100;
                    exercises = multi(100, 10000, 20);
                    break;
                default:
                    break;
            }

        } else if (name.equals("Multiplier un entier par 100 et par 1000")) {
            Random random = new Random();
            List<Integer> centOuMille = Arrays.asList(100, 1000);
            switch (palier) {
                case 1:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(200) + 1;
                        int operand2 = centOuMille.get(random.nextInt(2));
                        int answer = operand1 * operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " x " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));

                        exercises.add(exercise);
                    }
                    break;
                case 2:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(20000) + 1000;
                        int operand2 = centOuMille.get(random.nextInt(2));
                        int answer = operand1 * operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " x " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));
                        exercise.setPrompt(true);
                        exercise.setTimer(true);

                        exercises.add(exercise);
                    }
                    break;
                case 3:

                    exercises = multi(100000, 100000000, centOuMille.get(random.nextInt(2)));
                    break;
                default:
                    break;
            }

        } else if (name.equals("Comparer deux entiers")) {
            Random random = new Random();
            switch (palier) {
                case 1:

                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(200) + 1;
                        int operand2 = random.nextInt(200) + 1;
                        String answer;
                        String otherChoice;

                        // QCM, 2 choix, une réponse possible
                        if (operand1 < operand2) {
                            answer = operand1 + " est plus petit que (<) " + operand2;
                            otherChoice = operand1 + " est plus grand que (>) " + operand2;

                        } else {
                            answer = operand1 + " est plus grand que (>) " + operand2;
                            otherChoice = operand1 + " est plus petit que (<) " + operand2;
                        }

                        List<String> options = new ArrayList();
                        options.add(answer);
                        options.add(otherChoice);
                        Collections.shuffle(options);

                        Exercise exercise = new Exercise();
                        exercise.setContent(operand1 + " est-il plus petit ou plus grand que " + operand2 + " ?");
                        exercise.setAnswer(answer);
                        exercise.setOptions(options);
                        // AJOUTER LE TEXTE DES REPONSES POSSIBLES
                        // AJOUTER LES FONCTIONS LIEES AU QCM VRAI/FAUX
                        exercises.add(exercise);
                    }
                    break;
                case 2:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(10000 - 1000) + 1000;
                        int limB = (int) (operand1 - 0.1 * operand1);
                        int limH = (int) (operand1 + 0.1 * operand1);
                        int operand2 = random.nextInt(limH - limB) + limB;
                        String answer;
                        String otherChoice;

                        // QCM, 2 choix, une réponse possible
                        if (operand1 < operand2) {
                            answer = operand1 + " < " + operand2;
                            otherChoice = operand1 + " > " + operand2;

                        } else {
                            answer = operand1 + " > " + operand2;
                            otherChoice = operand1 + " < " + operand2;
                        }

                        List<String> options = new ArrayList();
                        options.add(answer);
                        options.add(otherChoice);
                        Collections.shuffle(options);

                        // Réponses du QCM
                        // Choix 1 (answer 0 -> op1 < op2) : "Plus petit"
                        // Choix 2 (answer 1 -> op1 > op2) : "Plus grande"
                        Exercise exercise = new Exercise();
                        exercise.setContent(operand1 + " est-il plus petit ou plus grand que " + operand2 + " ?");
                        exercise.setAnswer(answer);
                        exercise.setOptions(options);
                        // AJOUTER LE TEXTE DES REPONSES POSSIBLES
                        // AJOUTER LES FONCTIONS LIEES AU QCM VRAI/FAUX
                        exercises.add(exercise);
                    }
                    break;
                case 3:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(100000000 - 100000) + 100000;
                        int limB = (int) (operand1 - 0.001 * operand1);
                        int limH = (int) (operand1 + 0.001 * operand1);
                        int operand2 = random.nextInt(limH - limB) + limB;
                        String answer;
                        String otherChoice;

                        // QCM, 2 choix, une réponse possible
                        if (operand1 < operand2) {
                            answer = operand1 + " < " + operand2;
                            otherChoice = operand1 + " > " + operand2;

                        } else {
                            answer = operand1 + " > " + operand2;
                            otherChoice = operand1 + " < " + operand2;
                        }

                        List<String> options = new ArrayList();
                        options.add(answer);
                        options.add(otherChoice);
                        Collections.shuffle(options);

                        // Réponses du QCM
                        // Choix 1 (answer 0 -> op1 < op2) : "Plus petit"
                        // Choix 2 (answer 1 -> op1 > op2) : "Plus grande"
                        Exercise exercise = new Exercise();
                        exercise.setContent("La comparaison "+operand1 + " < " + operand2 + " est-elle correcte ?");
                        
                        if (operand1 < operand2) {
                            answer = "Vrai";
                            otherChoice = "Faux";

                        } else  {
                            answer = "Faux";
                            otherChoice = "Vrai";
                        }
                        
                        exercise.setAnswer(answer);
                        exercise.setOptions(options);
                        // AJOUTER LE TEXTE DES REPONSES POSSIBLES
                        // AJOUTER LES FONCTIONS LIEES AU QCM VRAI/FAUX
                        exercises.add(exercise);
                    }

                    break;
                default:
                    break;
            }

        } else if (name.equals("Décomposer un entier")) {
            Random random = new Random();
            switch (palier) {
                case 1:
                    for (int i = 0; i < 7; i++) {
                        Exercise exercise = new Exercise();

                        int x = random.nextInt(1000) + 10;
                        List<String> questions = Arrays.asList("Ecrire en lettres le nombre X .", "Ecrire en chiffre le nombre X .");
                        int questIndex = random.nextInt(questions.size());

                        String question = questions.get(questIndex);

                        if (question.equals("Ecrire en lettres le nombre X .")) {
                            exercise.setContent(question.replace("X", String.valueOf(x)));
                            exercise.setAnswer(numbersToLetters.convert(x));
                            exercise.setOptions(generateOptionsDE(x));

                        } else {
                            exercise.setContent(question.replace("X", numbersToLetters.convert(x)));
                            exercise.setAnswer(Integer.toString(x));
                            exercise.setOptions(generateOptions(x));
                        }
                        exercise.setPrompt(true);
                        exercises.add(exercise);

                    }

                    break;
                case 2:
                    for (int i = 0; i < 7; i++) {
                        Exercise exercise = new Exercise();

                        int lowerBound = 100;
                        long upperBound = 100000000000L;

                        long x = random.nextInt((int) (upperBound - lowerBound + 1)) + lowerBound;
                        List<String> questions = Arrays.asList("Ecrire en lettres le nombre X .", "Ecrire en chiffre le nombre X .");
                        int questIndex = random.nextInt(questions.size());

                        String question = questions.get(questIndex);

                        if (question.equals("Ecrire en lettres le nombre X .")) {
                            exercise.setContent(question.replace("X", String.valueOf(x)));
                            exercise.setAnswer(numbersToLetters.convert(x));
                            exercise.setOptions(generateOptionsDE((int) x));

                        } else {
                            exercise.setContent(question.replace("X", numbersToLetters.convert(x)));
                            exercise.setAnswer(Long.toString(x));
                            exercise.setOptions(generateOptions((int) x));
                        }
                        exercise.setPrompt(true);
                        exercises.add(exercise);

                    }
                    break;
                case 3:
                    for (int i = 0; i < 7; i++) {
                        Exercise exercise = new Exercise();

                        int lowerBound = 1000000;
                        long upperBound = 100000000000L;

                        int x = random.nextInt((int) (upperBound - lowerBound + 1)) + lowerBound;

                        Map<String, Integer> questions = new HashMap<>();

                        questions.put("dizaine", x / 10);
                        questions.put("centaine", x / 100);
                        questions.put("milliers", x / 1000);
                        questions.put("dizaine de milliers", x / 10000);
                        questions.put("centaine de millions", x / 100000000);
                        questions.put("milliards", x / 1000000000);

                        List<Map.Entry<String, Integer>> entryList = new ArrayList<>(questions.entrySet());

                        int questIndex = random.nextInt(entryList.size());

                        String question = "Combien de A le nombre X contient t'il ?";

                        exercise.setContent(question.replace("X", String.valueOf(x)).replace("A", entryList.get(questIndex).getKey()));
                        exercise.setAnswer(entryList.get(questIndex).getValue().toString());
                        exercise.setOptions(generateOptions((int) entryList.get(questIndex).getValue()));

                        exercise.setPrompt(true);
                        exercises.add(exercise);

                    }

                    break;
                default:
                    break;
            }

        } else if (name.equals("Soustraire un entier à un entier particulier")) {
            Random random = new Random();
            switch (palier) {
                case 1:
                    break;
                case 2:
                    break;
                case 3:
                    break;
                default:
                    break;
            }

        } else if (name.equals("Soustraire deux entiers")) {
            Random random = new Random();
            switch (palier) {
                case 1:
                    break;
                case 2:
                    break;
                case 3:
                    break;
                default:
                    break;
            }

        } else if (name.equals("Multiplier deux entiers")) {
            Random random = new Random();
            switch (palier) {
                case 1:
                    break;
                case 2:
                    break;
                case 3:
                    break;
                default:
                    break;
            }

        } else if (name.equals("Diviser deux entiers")) {
            Random random = new Random();
            switch (palier) {
                case 1:
                    break;
                case 2:
                    break;
                case 3:
                    break;
                default:
                    break;
            }

        } else if (name.equals("Diviser un entier par 2")) {
            Random random = new Random();
            switch (palier) {
                case 1:
                    break;
                case 2:
                    break;
                case 3:
                    break;
                default:
                    break;
            }

        } else if (name.equals("Diviser un entier par 10")) {
            Random random = new Random();
            switch (palier) {
                case 1:
                    break;
                case 2:
                    break;
                case 3:
                    break;
                default:
                    break;
            }

        } else if (name.equals("Diviser un entier par 100 et par 1000")) {
            Random random = new Random();
            switch (palier) {
                case 1:
                    break;
                case 2:
                    break;
                case 3:
                    break;
                default:
                    break;
            }

        } else if (name.equals("Maitriser les priorités opératoires")) {
            Random random = new Random();
            switch (palier) {
                case 1:
                    break;
                case 2:
                    break;
                case 3:
                    break;
                default:
                    break;
            }

        } else if (name.equals("Encadrer un entier entre deux entiers")) {
            Random random = new Random();
            switch (palier) {
                case 1:
                    break;
                case 2:
                    break;
                case 3:
                    break;
                default:
                    break;
            }

        } else if (name.equals("Encadrer un grand entier entre deux entiers")) {
            Random random = new Random();
            switch (palier) {
                case 1:
                    break;
                case 2:
                    break;
                case 3:
                    break;
                default:
                    break;
            }

        } else if (name.equals("Additionner deux entiers simples")) {
            Random random = new Random();
            switch (palier) {
                case 1:
                    break;
                case 2:
                    break;
                case 3:
                    break;
                default:
                    break;
            }

        } else if (name.equals("Additionner un entier à un entier particulier")) {
            Random random = new Random();
            switch (palier) {
                case 1:
                    break;
                case 2:
                    break;
                case 3:
                    break;
                default:
                    break;
            }

        }

        lesson.setExercises(exercises);
        lesson.setContent(cours);
        lesson.setTitle(name);

        return lesson;
    }

    List<String> generateOptions(int answer) {
        List<String> options = new ArrayList<>();
        options.add(Integer.toString(answer));

        Random random = new Random();
        while (options.size() < 4) {
            int option = answer + random.nextInt(5) - 2;
            if (!options.contains(Integer.toString(option))) {
                options.add(Integer.toString(option));
            }
        }

        Collections.shuffle(options);

        return options;
    }

    List<String> generateOptionsDE(int answer) {
        List<String> options = new ArrayList<>();
        options.add(numbersToLetters.convert(answer));

        Random random = new Random();
        while (options.size() < 4) {
            int option = answer + random.nextInt(5) - 2;
            if (!options.contains(numbersToLetters.convert(option))) {
                options.add(numbersToLetters.convert(option));
            }
        }

        Collections.shuffle(options);

        return options;
    }

    List<String> generateOptionsCD(int answer, int div) {
        List<String> options = new ArrayList<>();
        options.add(Integer.toString(answer));

        Random random = new Random();
        while (options.size() < 4) {
            int helper = random.nextInt(10) + 1;
            int option = answer + random.nextInt(5) - helper;
            if (!options.contains(Integer.toString(option)) && option % div != 0 && option >= 0) {
                options.add(Integer.toString(option));
            }
        }

        Collections.shuffle(options);

        return options;
    }

    List<Exercise> table(int y) {
        Random random = new Random();
        List<Exercise> exercises = new ArrayList();

        List<String> problems = Arrays.asList(
                "Les extraterrestres viennent Y par Y sur Terre pour un tournoi intergalactique de cache-cache. Si X paires d'extraterrestres sont arrivées, combien d'extraterrestres jouent au cache-cache ?",
                "Les licornes aiment courir. Chaque jour, une licorne court Y fois plus loin que la veille. Si lundi, elle court X km, combien court-elle mardi ?",
                "Des pirates ont trouvé un trésor et chaque pirate reçoit Y pièces d'or. S'ils sont X pirates, combien de pièces d'or y a-t-il dans le trésor ?",
                "X dragons vivent dans chaque grotte de la montagne magique. Si la montagne a Y grottes, combien de dragons vivent sur la montagne ?",
                "Dans la forêt enchantée, chaque arbre produit Y pommes magiques par jour. Si on a X arbres, combien de pommes magiques aura-t-on en une journée ?",
                "Le robot de Jules peut construire Y châteaux de sable par heure. Combien de châteaux aura-t-il construit après X heures ?",
                "Dans l'espace, chaque étoile a Y planètes qui l'entourent. Si on découvre X nouvelles étoiles, combien de nouvelles planètes avons-nous découvertes ?",
                "Chaque sorcière a Y balais volants. Si une école de magie compte X sorcières, combien de balais volants y a-t-il à l'école ?",
                "Léa a Y fois plus de bonbons que son petit frère qui en a X. Combien de bonbons a Léa ?",
                "Les pingouins organisent une parade et chaque pingouin porte Y chapeaux pour l'occasion. S'il y a X pingouins, combien de chapeaux y a-t-il dans la parade ?",
                "Chaque martien a Y antennes sur la tête. Si un groupe de X martiens atterrit sur Terre, combien d'antennes comptons-nous en tout ?",
                "Les lutins du Père Noël fabriquent Y jouets par heure. Combien de jouets fabriquent-ils en X heures ?",
                "Dans le Royaume des Chats, chaque chat a Y couronnes. S'il y a X chats, combien de couronnes y a-t-il dans le royaume ?",
                "Chaque super-héros possède Y super-pouvoirs. Si on compte X super-héros, combien de super-pouvoirs avons-nous en tout ?",
                "Un train transporte X passagers. Chaque voiture peut contenir Y passagers. Combien de voitures le train doit-il avoir au minimum pour transporter tous les passagers ?",
                "Un fermier a X pommes qu'il veut vendre au marché. Chaque cagette peut contenir Y pommes. Combien de cagettes le fermier doit-il préparer pour transporter toutes les pommes ?",
                "Un professeur a X copies à corriger. Il peut corriger Y copies par heure. Combien d'heures le professeur doit-il travailler pour corriger toutes les copies ?",
                "Un restaurateur doit préparer X assiettes de pâtes. Chaque casserole permet de préparer Y assiettes. Combien de casseroles le restaurateur doit-il utiliser pour préparer toutes les assiettes ?",
                "Une usine produit X pièces par jour. Chaque palette peut contenir Y pièces. Combien de palettes l'usine doit-elle utiliser pour emballer toutes les pièces produites en une journée ?",
                "Un marathonien doit parcourir X kilomètres. Chaque bouteille d'eau qu'il porte contient assez d'eau pour Y kilomètres. Combien de bouteilles d'eau le marathonien doit-il porter pour parcourir la distance totale ?",
                "Une cantine scolaire doit préparer X repas. Chaque four peut cuire Y repas à la fois. De combien de fours la cantine a-t-elle besoin pour préparer tous les repas ?",
                "Une bibliothèque reçoit X nouveaux livres. Chaque étagère peut contenir Y livres. Combien d'étagères la bibliothèque doit-elle libérer pour accueillir tous les nouveaux livres ?",
                "Une entreprise souhaite expédier X produits. Chaque carton peut contenir Y produits. Quel est le nombre minimum de cartons que l'entreprise doit utiliser pour expédier tous les produits ?",
                "Un théâtre veut installer X sièges. Chaque rangée peut contenir Y sièges. Quel est le nombre minimum de rangées que le théâtre doit prévoir pour installer tous les sièges ?",
                "Un chauffeur de bus doit transporter X étudiants. Chaque bus a une capacité de Y étudiants. Combien de bus le chauffeur doit-il conduire pour transporter tous les étudiants ?",
                "Une usine d'emballage doit emballer X bonbons. Chaque sachet peut contenir Y bonbons. Combien de sachets l'usine doit-elle utiliser pour emballer tous les bonbons ?",
                "Une équipe de construction doit placer X briques. Chaque ouvrier peut placer Y briques par jour. Quel est le nombre minimum de jours dont l'équipe a besoin pour placer toutes les briques ?",
                "Un jardinier veut planter X graines. Chaque pot peut contenir Y graines. Combien de pots le jardinier doit-il utiliser pour planter toutes les graines ?",
                "Une salle de gym peut accueillir X personnes. Chaque séance de cours collectif peut accueillir Y personnes. Quel est le nombre minimum de séances que la salle de gym doit organiser pour accueillir toutes les personnes ?",
                "Un cinéma doit accueillir X spectateurs pour une avant-première. Chaque salle peut accueillir Y spectateurs. Combien de salles le cinéma doit-il ouvrir pour accueillir tous les spectateurs pour cette avant-première ?"
        );

        for (int i = 0; i < 7; i++) {

            int x = random.nextInt(10);

            String problem = problems.get(random.nextInt(problems.size()));
            problem = problem.replace("X", String.valueOf(x)).replace("Y", String.valueOf(y));

            Exercise exercise = new Exercise();
            exercise.setContent(problem);
            exercise.setAnswer(Integer.toString(x * y));
            exercise.setOptions(generateOptions(x * y));
            exercise.setTimer(true);
            exercise.setPrompt(true);

            exercises.add(exercise);
        }
        return exercises;
    }

    List<Exercise> multi(int start, int end, int y) {
        Random random = new Random();
        List<Exercise> exercises = new ArrayList();

        List<String> problems = Arrays.asList(
                "Pierre a un nouveau truc de magie : chaque fois qu'il claque des doigts, il fait apparaître Y lapins. Combien de lapins aura-t-il s'il claque des doigts X fois ?",
                "Dans le monde des bonbons, chaque sac contient Y bonbons. Combien de bonbons y aura-t-il si Léa achète X sacs ?",
                "Au pays des dinosaures, chaque dinosaure a Y dents. Si un paléontologue trouve X dinosaures, combien de dents comptera-t-il au total ?",
                "Dans le royaume des fées, chaque fée possède Y paillettes magiques. Combien de paillettes y a-t-il si on compte X fées ?",
                "Sur la planète Mars, chaque martien possède Y soucoupes volantes. Si on découvre X martiens, combien de soucoupes volantes y a-t-il ?",
                "Chaque pirate dans le navire de capitaine Jack a Y pièces d'or. Si le navire compte X pirates, combien de pièces d'or sont à bord du navire ?",
                "Un robot extraterrestre peut sauter Y fois plus haut qu'un humain. Si un humain saute X mètres de haut, quelle hauteur peut sauter le robot ?",
                "Dans la forêt magique, chaque arbre donne Y pommes d'or par an. Si on compte X arbres, combien de pommes d'or aurons-nous en un an ?",
                "Chaque sorcière dans l'école de magie a Y potions magiques. Si l'école compte X sorcières, combien de potions y a-t-il en tout ?",
                "La bande de super-héros de l'école a besoin d'un coup de pouce pour rassembler ses forces. Ils ont X super-amis et chacun d'entre eux doit multiplier son pouvoir par Y pour renforcer leur équipe. Combien de super-puissances auront-ils en tout après cette multiplication?",
                "Imagine que tu es un savant fou en train de créer des potions magiques. Tu dois préparer une potion spéciale en multipliant chaque ingrédient par Y. Si la formule originale nécessite X gouttes de venin de serpent, combien en faudra-t-il après la multiplication par Y ?",
                "Dans la ferme de Monsieur Dupont, il y a X poules qui pondent des œufs. Chaque poule pond en moyenne Y œufs par mois. Combien d'œufs la ferme récolte-t-elle en tout chaque mois ?",
                "L'équipe de football de l'école a réussi à marquer X buts lors du dernier match. Maintenant, l'entraîneur veut savoir combien de buts ils auraient marqué s'ils avaient multiplié leur score par Y. Peux-tu l'aider en effectuant le calcul?",
                "Le supermarché local organise une promotion spéciale sur les bonbons. Ils vendent des sachets contenant Y bonbons chacun. Si tu veux acheter X sachets, combien de bonbons auras-tu en tout?",
                "Le laboratoire de sciences a reçu une nouvelle cargaison de bactéries pour une expérience passionnante. Ils ont reçu X boîtes de culture, et chaque boîte contient Y bactéries. Combien de bactéries auront-ils au total après avoir multiplié le nombre de boîtes par Y ?",
                "Aujourd'hui, l'artiste de cirque a réalisé un exploit incroyable en équilibrant X assiettes sur des bâtons. Pour impressionner encore plus le public, il décide de multiplier son exploit par Y. Combien d'assiettes aura-t-il à équilibrer après cette multiplication?",
                "Le professeur de musique organise un concert avec X musiciens talentueux. Chaque musicien joue d'un instrument différent. Si chaque musicien joue une mélodie composée de Y notes, combien de notes seront jouées au total pendant le concert?",
                "Le cirque du village a décidé d'ajouter une touche magique à son spectacle de jonglerie. Le jongleur jongle avec Y balles à la fois. S'il décide de multiplier son talent par X, combien de balles jonglera-t-il en tout?",
                "Les extraterrestres ont atterri dans la cour de récréation de l'école et ils veulent apprendre à compter. Ils ont donné aux élèves Y cristaux magiques. Chaque cristal représente un nombre. Si les élèves multiplient chaque cristal par X, combien de chiffres auront-ils pour représenter les nombres?");

        for (int i = 0; i < 7; i++) {
            int x = random.nextInt(end) + start;

            String problem = problems.get(random.nextInt(problems.size()));
            problem = problem.replace("X", String.valueOf(x)).replace("Y", String.valueOf(y));

            Exercise exercise = new Exercise();
            exercise.setContent(problem);
            exercise.setAnswer(Integer.toString(x * y));
            exercise.setOptions(generateOptions(x * y));
            exercise.setTimer(true);
            exercise.setPrompt(true);

            exercises.add(exercise);
        }
        return exercises;
    }

}
