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
        String cours = "Affichage par défaut";

        if (name.equals("Connaitre les critères de division par 2")) {
            cours = "Un nombre est divisible par **2** si son **dernier chiffre** est **pair** (0, 2, 4, 6 ou 8)."
                    + "\n**Exemple :** Les nombres 42, 68, 120 sont divisibles par 2 car ils se terminent respectivement par 2, 8 et 0.";
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
            cours = "Un nombre est divisible par **3** si la **somme de ses chiffres** est un **multiple de 3**."
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
            cours = "Un nombre est divisible par **9** si la **somme de ses chiffres** est un **multiple de 9**."
                    + "\n**Exemple :** Prenons le nombre 729. La somme de ses chiffres est 7 + 2 + 9 = 18. Comme 18 est un multiple de 9 (9*2 = 18), alors le nombre 729 est divisible par 9.";
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
            cours = "\n\nUn nombre est divisible par **5** si son **dernier chiffre** est **0 ou 5**."
                    + "\n**Exemple :** Les nombres 45, 70, 125 sont divisibles par 5 car ils se terminent respectivement par 5, 0 et 5.";
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
            cours = "Le **complément à 10** d'un nombre entier est la différence entre 10 et ce nombre."
                    + "\n**Exemple :** Pour le nombre 7, le complément à 10 est 10 - 7 = **3**.";

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
            cours = "Le **complément à 100** d'un nombre entier est la différence entre 100 et ce nombre."
                    + "\n**Exemple :** Pour le nombre 75, le complément à 100 est 100 - 75 = **25**.";
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
                        int operand2 = 100 - operand1;
                        int answer = operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien faut-il ajouter à " + operand1 + " pour obtenir 100?");
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
            cours = "L'**addition** est une opération qui permet de calculer la somme de deux nombres ou plus. Pour additionner deux entiers, on commence généralement par additionner les chiffres de droite (les unités) puis on continue vers la gauche, en reportant si nécessaire."
                    + "\n**Exemple :** Pour additionner 47 et 29, on commence par additionner 7 (unités de 47) et 9 (unités de 29) pour obtenir 16. On écrit 6 et on reporte 1. Ensuite, on additionne 4 (dizaines de 47), 2 (dizaines de 29) et le 1 reporté pour obtenir 7. Le résultat est donc **76**.";
            Random random = new Random();
            switch (palier) {
                case 1:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(100000000) + 1;
                        int operand2 = random.nextInt(100000000) + 2;
                        int answer = operand1 + operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " + " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));

                        exercises.add(exercise);
                    }
                    break;
                case 2:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(100000000) + 1;
                        int operand2 = random.nextInt(100000000) + 2;
                        int answer = operand1 + operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " + " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));
                        exercise.setPrompt(true);
                        exercise.setTimer(true);

                        exercises.add(exercise);
                    }
                    break;
                case 3:
                    int operand1 = random.nextInt(100000) + 1;
                    int operand2 = random.nextInt(100000) + 1;
                    exercises = addition(operand1, operand2);
                    break;
                default:
                    break;
            }

        } else if (name.equals("Soustraire un entier à un autre entier")) {
            cours = "La **soustraction** est une opération qui permet de déterminer la différence entre deux nombres. Pour soustraire deux entiers, on commence généralement par soustraire les chiffres de droite (les unités) puis on continue vers la gauche. Si le chiffre du haut est plus petit que celui du bas, on emprunte 1 à la colonne de gauche."
                    + "\n**Exemple :** Pour soustraire 29 de 47, on commence par soustraire 9 (unités de 29) de 7 (unités de 47). Comme 7 est plus petit que 9, on emprunte 1 à la colonne des dizaines. 17 (7 + 10) moins 9 égale 8. Ensuite, on soustrait 2 (dizaines de 29) de 3 (dizaines de 47, après avoir emprunté) pour obtenir 1. Le résultat est donc 18.";
            Random random = new Random();
            switch (palier) {
                case 1:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(20) + 1;
                        int operand2 = random.nextInt(10) + 1;
                        int answer = operand1 - operand2;

                        do {
                            operand1 = random.nextInt(20) + 1;
                            operand2 = random.nextInt(10) + 1;
                            answer = operand1 - operand2;
                        } while (answer < 0);

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " - " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));

                        exercises.add(exercise);
                    }
                    break;
                case 2:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(50) + 1;
                        int operand2 = random.nextInt(20) + 2;
                        int answer = operand1 - operand2;

                        do {
                            operand1 = random.nextInt(50) + 1;
                            operand2 = random.nextInt(20) + 1;
                            answer = operand1 - operand2;
                        } while (answer < 0);

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " - " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));
                        exercise.setPrompt(true);
                        exercise.setTimer(true);

                        exercises.add(exercise);
                    }
                    break;
                case 3:
                    int operand1 = random.nextInt(80) + 1;
                    int operand2 = random.nextInt(20) + 1;
                    int answer = operand1 - operand2;

                    do {
                        operand1 = random.nextInt(80) + 1;
                        operand2 = random.nextInt(20) + 1;
                        answer = operand1 - operand2;
                    } while (answer < 0);

                    exercises = soustraire(operand1, operand2);
                    break;
                default:
                    break;
            }

        } else if (name.equals("Connaitre la table des 2")) {
            cours = "La table de multiplication par 2 est l'une des premières tables que nous apprenons. Elle consiste à doubler un nombre."
                    + "\n**Exemple :** 3 x 2 = 6";
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
            cours = "La table de multiplication par 3 consiste à tripler un nombre."
                    + "\n**Exemple :** 3 x 3 = 9";
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
            cours = "La table de multiplication par 4 consiste à quadrupler un nombre."
                    + "\n**Exemple :** 3 x 4 = 12";
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
            cours = "La table de multiplication par 5 est facile à mémoriser car elle se termine toujours par 0 ou 5."
                    + "\n**Exemple :** 3 x 5 = 15, 6 x 5 = 30";
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
            cours = "La table de multiplication par 6."
                    + "**Exemple :** 3 x 6 = 18";
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
            cours = "La table de multiplication par 7."
                    + "\n**Exemple :** 3 x 7 = 21";
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
            cours = "La table de multiplication par 8."
                    + "\n**Exemple :** 3 x 8 = 24";
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
            cours = "La table de multiplication par 9 a une astuce intéressante : les chiffres des produits s'additionnent toujours à 9."
                    + "\n**Exemple :** 3 x 9 = 27 (Vérification : 2 + 7 = 9)";
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
            cours = "Multiplier un nombre par **10** est simple. Il suffit d'ajouter un zéro à la fin du nombre."
                    + "\n**Exemple :** Si on multiplie 5 par 10, on obtient 50.";
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
            cours = "Multiplier un nombre par **20** revient à le multiplier d'abord par 10, puis à doubler le résultat."
                    + "\n**Exemple :** Si on multiplie 5 par 20, on obtient d'abord 50 (5 multiplié par 10) puis 100 (50 doublé).";

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
            cours = "Multiplier un nombre par **100** ou **1000** est similaire à la multiplication par 10, mais on ajoute deux zéros à la fin pour 100 et trois zéros pour 1000."
                    + "\n**Exemple :** 5 multiplié par 100 donne 500 et 5 multiplié par 1000 donne 5000.";
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
            cours = "Comparer deux nombres signifie déterminer lequel est le plus grand, le plus petit ou s'ils sont égaux."
                    + "\n**Exemple :** Entre 5 et 7, 7 est le plus grand et 5 est le plus petit. Si on compare 8 et 8, ils sont égaux.";

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
            cours = "Décomposer de très grands nombres fonctionne de la même manière que pour les petits nombres, mais avec plus de catégories."
                    + "\n**Exemple :** Prenons le nombre 1,234,567,890. Il se décompose en :"
                    + "\n- 0 unités"
                    + "\n- 9 dizaines (soit 90)"
                    + "\n- 8 centaines (soit 800)"
                    + "\n- 7 milliers (soit 7,000)"
                    + "\n- 6 dizaines de milliers (soit 60,000)"
                    + "\n- 5 centaines de milliers (soit 500,000)"
                    + "\n- 4 millions (soit 4,000,000)"
                    + "\n- 3 dizaines de millions (soit 30,000,000)"
                    + "\n- 2 centaines de millions (soit 200,000,000)"
                    + "\n- 1 milliard (soit 1,000,000,000)"
                    + "\nAinsi, 1,234,567,890 = 1,000,000,000 + 200,000,000 + 30,000,000 + 4,000,000 + 500,000 + 60,000 + 7,000 + 800 + 90.";
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
            cours = "La **soustraction** est une opération qui permet de déterminer la différence entre deux nombres. Pour soustraire deux entiers, on commence généralement par soustraire les chiffres de droite (les unités) puis on continue vers la gauche. Si le chiffre du haut est plus petit que celui du bas, on emprunte 1 à la colonne de gauche."
                    + "\n**Exemple :** Pour soustraire 29 de 47, on commence par soustraire 9 (unités de 29) de 7 (unités de 47). Comme 7 est plus petit que 9, on emprunte 1 à la colonne des dizaines. 17 (7 + 10) moins 9 égale 8. Ensuite, on soustrait 2 (dizaines de 29) de 3 (dizaines de 47, après avoir emprunté) pour obtenir 1. Le résultat est donc 18.";
            Random random = new Random();
            switch (palier) {
                case 1:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(100) + 1;
                        int operand2 = random.nextInt(100) + 1;
                        int answer = operand1 - operand2;

                        do {
                            operand1 = random.nextInt(100) + 1;
                            operand2 = random.nextInt(100) + 1;
                            answer = operand1 - operand2;
                        } while (answer < 0 || operand2 % 2 == 0 || operand2 % 5 == 0);

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " - " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));

                        exercises.add(exercise);
                    }
                    break;
                case 2:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(1000) + 1;
                        int operand2 = random.nextInt(1000) + 2;
                        int answer = operand1 - operand2;

                        do {
                            operand1 = random.nextInt(1000) + 1;
                            operand2 = random.nextInt(1000) + 1;
                            answer = operand1 - operand2;
                        } while (answer < 0 || operand2 % 2 == 0 || operand2 % 5 == 0);

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " - " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));
                        exercise.setPrompt(true);
                        exercise.setTimer(true);

                        exercises.add(exercise);
                    }
                    break;
                case 3:
                    int operand1 = random.nextInt(100000) + 1;
                    int operand2 = random.nextInt(100000) + 1;
                    int answer = operand1 - operand2;
                    do {
                        operand1 = random.nextInt(100000) + 1;
                        operand2 = random.nextInt(100000) + 1;
                        answer = operand1 - operand2;
                    } while (answer < 0 || operand2 % 2 == 0 || operand2 % 5 == 0);

                    exercises = soustraire(operand1, operand2);
                    break;
                default:
                    break;
            }

        } else if (name.equals("Soustraire deux entiers")) {
            cours = "La **soustraction** est une opération qui permet de déterminer la différence entre deux nombres. Pour soustraire deux entiers, on commence généralement par soustraire les chiffres de droite (les unités) puis on continue vers la gauche. Si le chiffre du haut est plus petit que celui du bas, on emprunte 1 à la colonne de gauche."
                    + "\n**Exemple :** Pour soustraire 29 de 47, on commence par soustraire 9 (unités de 29) de 7 (unités de 47). Comme 7 est plus petit que 9, on emprunte 1 à la colonne des dizaines. 17 (7 + 10) moins 9 égale 8. Ensuite, on soustrait 2 (dizaines de 29) de 3 (dizaines de 47, après avoir emprunté) pour obtenir 1. Le résultat est donc 18.";
            Random random = new Random();
            switch (palier) {
                case 1:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(1000) + 1;
                        int operand2 = random.nextInt(1000) + 1;
                        int answer = operand1 - operand2;

                        do {
                            operand1 = random.nextInt(1000) + 1;
                            operand2 = random.nextInt(1000) + 1;
                            answer = operand1 - operand2;
                        } while (answer < 0);

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " - " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));

                        exercises.add(exercise);
                    }
                    break;
                case 2:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(10000) + 1;
                        int operand2 = random.nextInt(10000) + 2;
                        int answer = operand1 - operand2;

                        do {
                            operand1 = random.nextInt(10000) + 1;
                            operand2 = random.nextInt(10000) + 1;
                            answer = operand1 - operand2;
                        } while (answer < 0);

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " - " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));
                        exercise.setPrompt(true);
                        exercise.setTimer(true);

                        exercises.add(exercise);
                    }
                    break;
                case 3:
                    int operand1 = random.nextInt(100000) + 1;
                    int operand2 = random.nextInt(100000) + 1;
                    int answer = operand1 - operand2;
                    do {
                        operand1 = random.nextInt(100000) + 1;
                        operand2 = random.nextInt(100000) + 1;
                        answer = operand1 - operand2;
                    } while (answer < 0);

                    exercises = soustraire(operand1, operand2);
                    break;
                default:
                    break;
            }

        } else if (name.equals("Multiplier deux entiers")) {
            cours = "La **multiplication** est une opération qui permet d'ajouter un nombre à lui-même plusieurs fois. Pour multiplier deux entiers, on multiplie les chiffres de droite (les unités) puis on continue vers la gauche, en reportant si nécessaire."
                    + "\n**Exemple :** Pour multiplier 4 par 3, on fait comme si on ajoutait le nombre 4 trois fois : 4 + 4 + 4 = 12. Donc, 4 multiplié par 3 donne 12.";

            Random random = new Random();
            switch (palier) {
                case 1:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(10) + 1;
                        int operand2 = random.nextInt(10) + 2;
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
                        int operand1 = random.nextInt(10) + 1;
                        int operand2 = random.nextInt(10) + 2;
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
                    int operand2 = random.nextInt(10) + 2;
                    exercises = table(operand2);
                    break;
                default:
                    break;
            }

        } else if (name.equals("Diviser deux entiers")) {
            cours = "La **division** est une opération qui permet de partager un nombre en plusieurs parties égales. La division est l'inverse de la multiplication."
                    + "\n**Exemple :** Si on a 12 pommes et qu'on veut les partager équitablement entre 4 amis, chaque ami recevra 3 pommes (car 3 x 4 = 12). Donc, 12 divisé par 4 donne 3.";
            Random random = new Random();
            switch (palier) {
                case 1:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(20) + 1;
                        int operand2 = random.nextInt(9) + 2;
                        int answer = operand1 / operand2;

                        do {
                            operand1 = random.nextInt(20) + 1;
                            operand2 = random.nextInt(9) + 2;
                            answer = operand1 / operand2;
                        } while (operand1 % operand2 != 0);

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " ÷ " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));

                        exercises.add(exercise);
                    }
                    break;
                case 2:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(50) + 50;
                        int operand2 = random.nextInt(9) + 2;
                        int answer = operand1 / operand2;

                        do {
                            operand1 = random.nextInt(50) + 50;
                            operand2 = random.nextInt(9) + 2;
                            answer = operand1 / operand2;
                        } while (operand1 % operand2 != 0);

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " ÷ " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));
                        exercise.setPrompt(true);
                        exercise.setTimer(true);

                        exercises.add(exercise);
                    }
                    break;
                case 3:
                    int operand1 = random.nextInt(50) + 50;
                    int operand2 = random.nextInt(9) + 2;
                    int answer = operand1 / operand2;
                    do {
                        operand1 = random.nextInt(50) + 1;
                        operand2 = random.nextInt(9) + 2;
                        answer = operand1 / operand2;
                    } while (operand1 % operand2 != 0);

                    exercises = division(operand1, operand2);
                    break;
                default:
                    break;
            }

        } else if (name.equals("Diviser un entier par 2")) {
            cours = "Diviser un nombre par **2** signifie le partager en deux parties égales. C'est comme si on coupait quelque chose en deux morceaux identiques."
                    + "\n**Exemple :** Si on a 8 gâteaux et qu'on les partage en deux, chaque part aura 4 gâteaux. Donc, 8 divisé par 2 donne 4.";
            Random random = new Random();
            switch (palier) {
                case 1:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(20) + 1;
                        int operand2 = 2;
                        int answer = operand1 / operand2;

                        do {
                            operand1 = random.nextInt(20) + 1;
                            operand2 = 2;
                            answer = operand1 / operand2;
                        } while (operand1 % operand2 != 0);

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " ÷ " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));

                        exercises.add(exercise);
                    }
                    break;
                case 2:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(50) + 10;
                        int operand2 = 2;
                        int answer = operand1 / operand2;

                        do {
                            operand1 = random.nextInt(50) + 10;
                            operand2 = 2;
                            answer = operand1 / operand2;
                        } while (operand1 % operand2 != 0);

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " ÷ " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));
                        exercise.setPrompt(true);
                        exercise.setTimer(true);

                        exercises.add(exercise);
                    }
                    break;
                case 3:
                    int operand1 = random.nextInt(50) + 10;
                    int operand2 = 2;
                    int answer = operand1 / operand2;
                    do {
                        operand1 = random.nextInt(50) + 10;
                        operand2 = 2;
                        answer = operand1 / operand2;
                    } while (operand1 % operand2 != 0);

                    exercises = division(operand1, operand2);
                    break;
                default:
                    break;
            }

        } else if (name.equals("Diviser un entier par 10")) {
            cours = "Diviser un nombre par **10** est simple. Il suffit de déplacer la virgule d'un cran vers la gauche. Si le nombre est un entier, cela revient à retirer le dernier chiffre."
                    + "\n**Exemple :** 250 divisé par 10 donne 25.";
            Random random = new Random();
            switch (palier) {
                case 1:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(100) + 1;
                        int operand2 = 10;
                        int answer = operand1 / operand2;

                        do {
                            operand1 = random.nextInt(100) + 1;
                            operand2 = 10;
                            answer = operand1 / operand2;
                        } while (operand1 % operand2 != 0);

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " ÷ " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));

                        exercises.add(exercise);
                    }
                    break;
                case 2:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(1000) + 100;
                        int operand2 = 10;
                        int answer = operand1 / operand2;

                        do {
                            operand1 = random.nextInt(1000) + 100;
                            operand2 = 10;
                            answer = operand1 / operand2;
                        } while (operand1 % operand2 != 0);

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " ÷ " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));
                        exercise.setPrompt(true);
                        exercise.setTimer(true);

                        exercises.add(exercise);
                    }
                    break;
                case 3:
                    int operand1 = random.nextInt(1000) + 100;
                    int operand2 = 10;
                    int answer = operand1 / operand2;
                    do {
                        operand1 = random.nextInt(1000) + 100;
                        operand2 = 10;
                        answer = operand1 / operand2;
                    } while (operand1 % operand2 != 0);

                    exercises = division(operand1, operand2);
                    break;
                default:
                    break;
            }

        } else if (name.equals("Diviser un entier par 100 et par 1000")) {
            cours = "Diviser un nombre par **100** ou **1000** est similaire à la division par 10, mais on déplace la virgule de 2 crans vers la gauche pour 100 et de 3 crans pour 1000. Si le nombre est un entier, cela revient à retirer les deux ou trois derniers chiffres respectivement."
                    + "\n**Exemple :** 5400 divisé par 100 donne 54 et 5400 divisé par 1000 donne 5.4.";
            Random random = new Random();
            switch (palier) {
                case 1:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(10000) + 1000;
                        int operand2 = 10;

                        int rand10 = random.nextInt(1);
                        if (rand10 == 0) {operand2 = 100;} else {operand2 = 1000;}

                        int answer = operand1 / operand2;

                        do {
                            operand1 = random.nextInt(10000) + 1000;
                            answer = operand1 / operand2;
                        } while (operand1 % operand2 != 0);

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " ÷ " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));

                        exercises.add(exercise);
                    }
                    break;
                case 2:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(100000) + 1000;
                        int operand2 = 10;
                        int rand10 = random.nextInt(1);
                        if (rand10 == 0) {operand2 = 100;} else {operand2 = 1000;}
                        int answer = operand1 / operand2;

                        do {
                            operand1 = random.nextInt(100000) + 1000;
                            answer = operand1 / operand2;
                        } while (operand1 % operand2 != 0);

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " ÷ " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));
                        exercise.setPrompt(true);
                        exercise.setTimer(true);

                        exercises.add(exercise);
                    }
                    break;
                case 3:
                    int operand1 = random.nextInt(100000) + 1000;
                    int operand2 = 10;
                    int rand10 = random.nextInt(1);
                    if (rand10 == 0) {operand2 = 100;} else {operand2 = 1000;}
                    int answer = operand1 / operand2;
                    
                    do {
                        operand1 = random.nextInt(100000) + 1000;
                        answer = operand1 / operand2;
                    } while (operand1 % operand2 != 0);

                    exercises = division(operand1, operand2);
                    break;
                default:
                    break;
            }

        } else if (name.equals("Maitriser les priorités opératoires")) {
            cours = "Lorsque nous effectuons des calculs avec plusieurs opérations, il est important de connaître l'ordre dans lequel elles doivent être effectuées. Cet ordre est appelé les priorités opératoires."
                    + "\nVoici l'ordre des opérations, de la plus haute priorité à la plus basse :"
                    + "\n1. **Parenthèses ()** : Tout ce qui est à l'intérieur des parenthèses doit être calculé en premier."
                    + "\n2. **Multiplication (*) et Division (/)** : Ces opérations ont la même priorité et sont effectuées avant l'addition et la soustraction. Si elles apparaissent ensemble, elles sont effectuées de gauche à droite."
                    + "\n3. **Addition (+) et Soustraction (-)** : Ces opérations ont la même priorité et sont effectuées après la multiplication et la division. Si elles apparaissent ensemble, elles sont effectuées de gauche à droite."
                    + "\n**Exemple :** Pour le calcul 3 + 5 x 2, nous effectuons d'abord la multiplication pour obtenir 10, puis nous ajoutons 3 pour obtenir 13."
                    + "\nPour le calcul (3 + 5) x 2, nous effectuons d'abord l'addition à l'intérieur des parenthèses pour obtenir 8, puis nous multiplions par 2 pour obtenir 16.";

            Random random = new Random();
            switch (palier) {
                case 1:
                    for (int i = 0; i < 7; i++) {
                        int op1 = random.nextInt(40) + 20;
                        int op2 = random.nextInt(10) + 1;
                        int op3 = random.nextInt(10) + 1;
                        int op4 = random.nextInt(9) + 2;
                        int answer = 0;

                        String consigne = "";

                        switch (random.nextInt(4)){
                            case 0:
                                // op1 + op2 x op4
                                answer = op1 + op2 * op4;
                                consigne = "Combien fait " + op1 + " + " + op2 + " x " + op4 + " ?";
                                break;
                            case 1:
                                // op1 x op4 - op3
                                answer = op1 * op4 - op3;
                                consigne = "Combien fait " + op1 + " x " + op4 + " - " + op3 + " ?";
                                break;
                            case 2:
                                // op3 - op2 x op4
                                answer = op3 - op3 * op4;
                                consigne = "Combien fait " + op3 + " - " + op2 + " x " + op4 + " ?";
                                break;
                            case 3:
                                // op2 x op4 + op1
                                answer = op2 * op4 + op1;
                                consigne = "Combien fait " + op2 + " x " + op4 + " + " + op1 + " ?";
                                break;
                        }

                        Exercise exercise = new Exercise();
                        exercise.setContent(consigne);
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));

                        exercises.add(exercise);
                    }
                    break;
                case 2:
                    for (int i = 0; i < 7; i++) {
                        int op1 = random.nextInt(10) + 1;
                        int op2 = random.nextInt(10) + 1;
                        int op3 = random.nextInt(10) + 1;
                        int op4 = random.nextInt(9) + 2;
                        int answer = 0;

                        String consigne = "";

                        switch (random.nextInt(6)){
                            case 0:
                                // 1 - 2 + 3 * 4
                                answer = op1 - op2 + op3 * op4;
                                consigne = "Combien fait " + op1 + " - " + op2 + " + " + op3 + " x " + op4 + " ?";
                                break;
                            case 1:
                                // (1 - 2) + 3 * 4
                                answer = (op1 - op2) + op3 * op4;
                                consigne = "Combien fait (" + op1 + " - " + op2 + ") + " + op3 + " x " + op4 + " ?";
                                break;
                            case 2:
                                // 3 + (1 - 2) * 4
                                answer = op1 + (op2 - op3) * op4;
                                consigne = "Combien fait " + op1 + " + (" + op2 + " - " + op3 + ") x " + op4 + " ?";
                                break;
                            case 3:
                                // (3 + 1 - 2) * 4
                                answer = (op1 + op2 - op3) * op4;
                                consigne = "Combien fait (" + op1 + " + " + op2 + " - " + op3 + ") x " + op4 + " ?";
                                break;
                            case 4:
                                // 3 + (4 * 1 - 2)
                                answer = op1 + (op2 * op3 - op4);
                                consigne = "Combien fait " + op1 + " + (" + op2 + " x " + op3 + " - " + op4 + ") ?";
                                break;
                            case 5:
                                // 4 * 3 - (1 + 2)
                                answer = op1 * op2 - (op3 + op4);
                                consigne = "Combien fait " + op1 + " x " + op2 + " - (" + op3 + " + " + op4 + ") ?";
                                break;
                        }

                        Exercise exercise = new Exercise();
                        exercise.setContent(consigne);
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));
                        exercise.setPrompt(true);
                        exercise.setTimer(true);

                        exercises.add(exercise);
                    }
                    break;
                case 3:
                    int operand1 = random.nextInt(10) + 1;
                    int operand2 = random.nextInt(10) + 1;
                    int operand3 = random.nextInt(10) + 1;
                    int answerTemp = 0;
                    int niveau = 0;

                    switch (random.nextInt(3)){
                        case 0:
                            niveau = 0;
                            // ((X - Y + Z) / 2)
                            do {
                                operand2 = random.nextInt(10) + 1;
                                operand3 = random.nextInt(10) + 1;
                                answerTemp = operand1 - operand2 + operand3;
                            } while (answerTemp < 0 || answerTemp%2 != 0);
                            break;
                        case 1:
                            niveau = 1;
                            // ((X / 2 + Y) - Z)
                            do {
                                operand1 = random.nextInt(10) + 1;
                                operand2 = random.nextInt(10) + 1;
                                operand3 = random.nextInt(10) + 1;
                                answerTemp = operand1 / 2;
                            } while (answerTemp + operand2 - operand3 < 0 || answerTemp%2 != 0);
                            break;
                        case 2:
                            niveau = 2;
                            // ((2 * X - Y) + Z)
                            do {
                                operand1 = random.nextInt(10) + 1;
                                operand2 = random.nextInt(10) + 1;
                                answerTemp = 2 * operand1 - operand2;
                            } while (answerTemp < 0);
                            break;
                    }
                    exercises = priorite(niveau, operand1, operand2, operand3);
                    break;
                default:
                    break;
            }

        } else if (name.equals("Encadrer un entier entre deux entiers")) {
            cours = "Encadrer un nombre signifie trouver deux autres nombres, l'un juste en dessous et l'autre juste au-dessus, généralement des nombres ronds ou faciles à manipuler."
                    + "\n**Exemple :** Prenons le nombre 5,432. Pour l'encadrer entre deux grands entiers, nous pourrions choisir 5,000 comme le nombre juste en dessous et 6,000 comme le nombre juste au-dessus."
                    + "\nAinsi, nous pouvons dire que 5,000 < 5,432 < 6,000."
                    + "\nCela nous aide à avoir une idée rapide de la position du nombre par rapport à des valeurs plus familières ou plus faciles à manipuler.";

            Random random = new Random();
            switch (palier) {
                case 1:

                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(50) + 1;
                        int operand2 = random.nextInt(50) + 50;
                        int operandAnswer = random.nextInt(100) + 1;
                        String answer;
                        String otherChoice;

                        // QCM, 2 choix, une réponse possible
                        if (operand1 < operandAnswer && operandAnswer < operand2) {
                            answer = operandAnswer + " est compris entre " + operand1 + " et " + operand2;
                            otherChoice = operandAnswer + " n'est pas compris entre " + operand1 + " et " + operand2;

                        } else {
                            answer = operandAnswer + " n'est pas compris entre " + operand1 + " et " + operand2;
                            otherChoice = operandAnswer + " est compris entre " + operand1 + " et " + operand2;
                        }

                        List<String> options = new ArrayList();
                        options.add(answer);
                        options.add(otherChoice);
                        Collections.shuffle(options);

                        Exercise exercise = new Exercise();
                        exercise.setContent(operandAnswer + " est-il compris entre " + operand1 + " et " + operand2 + " ?");
                        exercise.setAnswer(answer);
                        exercise.setOptions(options);
                        // AJOUTER LE TEXTE DES REPONSES POSSIBLES
                        // AJOUTER LES FONCTIONS LIEES AU QCM VRAI/FAUX
                        exercises.add(exercise);
                    }
                    break;
                case 2:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(10000 - 100) + 100;
                        int limB = (int) (operand1 - 0.1 * operand1);
                        int limH = (int) (operand1 + 0.1 * operand1);
                        int operand2 = random.nextInt(limH - limB);
                        int operand3 = (int) (operand1 + 0.12 * operand1);
                        String answer;
                        String otherChoice;

                        // QCM, 2 choix, une réponse possible
                        if (operand1 < operand2 && operand2 < operand3) {
                            answer = operand2 + " est compris entre " + operand1 + " et " + operand3;
                            otherChoice = operand2 + " n'est pas compris entre " + operand1 + " et " + operand3;

                        } else {
                            answer = operand2 + " n'est pas compris entre " + operand1 + " et " + operand3;
                            otherChoice = operand2 + " est compris entre " + operand1 + " et " + operand3;
                        }

                        List<String> options = new ArrayList();
                        options.add(answer);
                        options.add(otherChoice);
                        Collections.shuffle(options);

                        // Réponses du QCM
                        // Choix 1 (answer 0 -> op1 < op2) : "Plus petit"
                        // Choix 2 (answer 1 -> op1 > op2) : "Plus grande"
                        Exercise exercise = new Exercise();
                        exercise.setContent(operand2 + " est-il compris entre " + operand1 + " et " + operand3 + " ?");
                        exercise.setAnswer(answer);
                        exercise.setOptions(options);
                        // AJOUTER LE TEXTE DES REPONSES POSSIBLES
                        // AJOUTER LES FONCTIONS LIEES AU QCM VRAI/FAUX
                        exercises.add(exercise);
                    }
                    break;
                case 3:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(100000 - 10000) + 10000;
                        int limB = (int) (operand1 - 0.001 * operand1);
                        int limH = (int) (operand1 + 0.001 * operand1);
                        int operand2 = random.nextInt(limH - limB);
                        int operand3 = (int) (operand1 + 0.002 * operand1);
                        String answer;
                        String otherChoice;

                        // QCM, 2 choix, une réponse possible
                        if (operand1 < operand2 && operand2 < operand3) {
                            answer = operand1 + " < " + operand2 + " et " + operand2 + " < " + operand3;
                            otherChoice = operand1 + " > " + operand2 + " ou " + operand2 + " > " + operand3;

                        } else {
                            answer = operand1 + " > " + operand2 + " ou " + operand2 + " > " + operand3;
                            otherChoice = operand1 + " < " + operand2 + " et " + operand2 + " < " + operand3;
                        }

                        List<String> options = new ArrayList();
                        options.add(answer);
                        options.add(otherChoice);
                        Collections.shuffle(options);

                        Exercise exercise = new Exercise();
                        exercise.setContent(operand2 + " est-il compris entre " + operand1 + " et " + operand3 + " ?");
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

        } else if (name.equals("Encadrer un grand entier entre deux entiers")) {
            cours = "Encadrer un nombre signifie trouver deux autres nombres, l'un juste en dessous et l'autre juste au-dessus, généralement des nombres ronds ou faciles à manipuler."
                    + "\n**Exemple :** Prenons le nombre 5,432,109. Pour l'encadrer entre deux grands entiers, nous pourrions choisir 5,000,000 comme le nombre juste en dessous et 6,000,000 comme le nombre juste au-dessus."
                    + "\nAinsi, nous pouvons dire que 5,000,000 < 5,432,109 < 6,000,000."
                    + "\nCela nous aide à avoir une idée rapide de la position du nombre par rapport à des valeurs plus familières ou plus faciles à manipuler.";

            Random random = new Random();
            switch (palier) {
                case 1:

                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(10000000 - 10000) + 10000;
                        int operand2 = random.nextInt(10000000 - 10000) + 10000;
                        int operandAnswer = random.nextInt(100) + 1;
                        String answer;
                        String otherChoice;

                        // QCM, 2 choix, une réponse possible
                        if (operand1 < operandAnswer && operandAnswer < operand2) {
                            answer = operandAnswer + " est compris entre " + operand1 + " et " + operand2;
                            otherChoice = operandAnswer + " n'est pas compris entre " + operand1 + " et " + operand2;

                        } else {
                            answer = operandAnswer + " n'est pas compris entre " + operand1 + " et " + operand2;
                            otherChoice = operandAnswer + " est compris entre " + operand1 + " et " + operand2;
                        }

                        List<String> options = new ArrayList();
                        options.add(answer);
                        options.add(otherChoice);
                        Collections.shuffle(options);

                        Exercise exercise = new Exercise();
                        exercise.setContent(operandAnswer + " est-il compris entre " + operand1 + " et " + operand2 + " ?");
                        exercise.setAnswer(answer);
                        exercise.setOptions(options);
                        // AJOUTER LE TEXTE DES REPONSES POSSIBLES
                        // AJOUTER LES FONCTIONS LIEES AU QCM VRAI/FAUX
                        exercises.add(exercise);
                    }
                    break;
                case 2:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(100000000 - 100000) + 100000;
                        int limB = (int) (operand1 - 0.1 * operand1);
                        int limH = (int) (operand1 + 0.1 * operand1);
                        int operand2 = random.nextInt(limH - limB);
                        int operand3 = (int) (operand1 + 0.12 * operand1);
                        String answer;
                        String otherChoice;

                        // QCM, 2 choix, une réponse possible
                        if (operand1 < operand2 && operand2 < operand3) {
                            answer = operand2 + " est compris entre " + operand1 + " et " + operand3;
                            otherChoice = operand2 + " n'est pas compris entre " + operand1 + " et " + operand3;

                        } else {
                            answer = operand2 + " n'est pas compris entre " + operand1 + " et " + operand3;
                            otherChoice = operand2 + " est compris entre " + operand1 + " et " + operand3;
                        }

                        List<String> options = new ArrayList();
                        options.add(answer);
                        options.add(otherChoice);
                        Collections.shuffle(options);

                        // Réponses du QCM
                        // Choix 1 (answer 0 -> op1 < op2) : "Plus petit"
                        // Choix 2 (answer 1 -> op1 > op2) : "Plus grande"
                        Exercise exercise = new Exercise();
                        exercise.setContent(operand2 + " est-il compris entre " + operand1 + " et " + operand3 + " ?");
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
                        int operand2 = random.nextInt(limH - limB);
                        int operand3 = (int) (operand1 + 0.002 * operand1);
                        String answer;
                        String otherChoice;

                        // QCM, 2 choix, une réponse possible
                        if (operand1 < operand2 && operand2 < operand3) {
                            answer = operand1 + " < " + operand2 + " et " + operand2 + " < " + operand3;
                            otherChoice = operand1 + " > " + operand2 + " ou " + operand2 + " > " + operand3;

                        } else {
                            answer = operand1 + " > " + operand2 + " ou " + operand2 + " > " + operand3;
                            otherChoice = operand1 + " < " + operand2 + " et " + operand2 + " < " + operand3;
                        }

                        List<String> options = new ArrayList();
                        options.add(answer);
                        options.add(otherChoice);
                        Collections.shuffle(options);

                        Exercise exercise = new Exercise();
                        exercise.setContent(operand2 + " est-il compris entre " + operand1 + " et " + operand3 + " ?");
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

        } else if (name.equals("Additionner deux entiers simples")) {
            cours = "L'**addition** est une opération qui permet de calculer la somme de deux nombres ou plus. Pour additionner deux entiers, on commence généralement par additionner les chiffres de droite (les unités) puis on continue vers la gauche, en reportant si nécessaire."
                    + "\n**Exemple :** Pour additionner 14 et 27, on commence par additionner 4 (unités de 14) et 7 (unités de 27) pour obtenir 11. On écrit 1 et on reporte 1. Ensuite, on additionne 1 (dizaine de 14), 2 (dizaines de 27) et le 1 reporté pour obtenir 3. Le résultat est donc 31.";
            Random random = new Random();
            switch (palier) {
                case 1:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(10) + 1;
                        int operand2 = random.nextInt(10) + 1;
                        int answer = operand1 + operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " + " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));

                        exercises.add(exercise);
                    }
                    break;
                case 2:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(50) + 1;
                        int operand2 = random.nextInt(10) + 2;
                        int answer = operand1 + operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " + " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));
                        exercise.setPrompt(true);
                        exercise.setTimer(true);

                        exercises.add(exercise);
                    }
                    break;
                case 3:
                    int operand1 = random.nextInt(80) + 1;
                    int operand2 = random.nextInt(20) + 1;
                    exercises = addition(operand1, operand2);
                    break;
                default:
                    break;
            }

        } else if (name.equals("Additionner un entier à un entier particulier")) {
            cours = "L'**addition** est une opération qui permet de calculer la somme de deux nombres ou plus. Pour additionner deux entiers, on commence généralement par additionner les chiffres de droite (les unités) puis on continue vers la gauche, en reportant si nécessaire."
                    + "\n**Exemple :** Pour additionner 14 et 27, on commence par additionner 4 (unités de 14) et 7 (unités de 27) pour obtenir 11. On écrit 1 et on reporte 1. Ensuite, on additionne 1 (dizaine de 14), 2 (dizaines de 27) et le 1 reporté pour obtenir 3. Le résultat est donc 31.";

            Random random = new Random();
            switch (palier) {
                case 1:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(10000) + 1;
                        int operand2 = random.nextInt(100) + 1;
                        do {
                            operand2 = random.nextInt(1000) + 1;
                        } while (operand2 % 5 == 0 || operand2 % 2 == 0);

                        int answer = operand1 + operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " + " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));

                        exercises.add(exercise);
                    }
                    break;
                case 2:
                    for (int i = 0; i < 7; i++) {
                        int operand1 = random.nextInt(10000) + 1;
                        int operand2 = random.nextInt(1000) + 1;
                        do {
                            operand2 = random.nextInt(1000) + 1;
                        } while (operand2 % 5 == 0 || operand2 % 2 == 0);
                        int answer = operand1 + operand2;

                        Exercise exercise = new Exercise();
                        exercise.setContent("Combien fait " + operand1 + " + " + operand2 + " ?");
                        exercise.setAnswer(Integer.toString(answer));
                        exercise.setOptions(generateOptions(answer));
                        exercise.setPrompt(true);
                        exercise.setTimer(true);

                        exercises.add(exercise);
                    }
                    break;
                case 3:
                    int operand1 = random.nextInt(10000) + 1;
                    int operand2 = random.nextInt(10000) + 1;
                    do {
                        operand2 = random.nextInt(10000) + 1;
                    } while (operand2 % 5 == 0 || operand2 % 2 == 0);

                    exercises = addition(operand1, operand2);
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

            int x = random.nextInt(10)+1;

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

    List<Exercise> addition(int x, int y) {
        Random random = new Random();
        List<Exercise> exercises = new ArrayList();

        List<String> problems = Arrays.asList(
                "Farle le boulanger s'occupe de fournir son village en pain. Il en a déjà fait X, et en refait cuire Y. Combien de pains Farle a t'il fabriqué en tout ?",
                "Dans la forêt magique de Sleepwood, une licorne adore manger des fraises enchantées et des papillons féériques. Elle en a déjà mangé X, et elle en a mangé Y aujourd'hui. Combien de ressources la licorne a t'elle mangé aujourd'hui ?",
                "Valens adore jouer avec ses boites de légos. Il en a déjà X, et il en a récupéré Y lors de la fête de l'école. Combien de boites Valens a t'il dans sa collection ?",
                "Lila la fée adore collectionner les papillons magiques. Elle en a déjà X, et elle en a récupéré Y avec son filet enchanté. Combien de papillons Lila a t'elle dans sa collection ?",
                "Harold le dragon adore amasser des pièces d'or. Il en a déjà X dans son antre, et il en a trouvé Y dans un trésor. Combien de pièces Harold a t'il dans sa collection ?",
                "Chaque jour, le petit prince du royaume aquatique adore donner des perles. Il en donne X à la princesse des mers, et Y à la reine des mers. Combien de perles le prince donne-t'il en tout chaque jour ?",
                "Perla la pieuvre adore collectionner les coquillages colorés. Elle en a trouvé X dans le sable, et elle en a trouvé Y dans les algues. Combien de coquillages Perla a t'elle dans sa collection ?",
                "Pour célébrer l'arrivée du printemps, Bella la nymphe adore planter des fleurs. Elle a planté X tulipes, et elle a ajouté Y roses des vents. Combien de fleurs Bella a t'elle planté au total ?",
                "La maman du petit elfe Orion adore offrir des étoiles filantes. Elle lui en a offert X pour son anniversaire, et son papa lui en a offert Y. Combien d'étoiles filantes Orion a t'il reçues pour son anniversaire ?",
                "Dans le ciel nocturne, Castor le petit astronome adore compter les étoiles. Il en a compté X dans la Grande Ourse, et Y dans la Petite Ourse. Combien d'étoiles Castor a t'il compté en tout ?",
                "La sorcière Morgana adore préparer des potions. Elle a préparé X potions d'invisibilité, et Y potions de vol. Combien de potions Morgana a t'elle préparé au total ?",
                "La famille de lutins adore manger des pommes dorées. Ils en ont mangé X pour le déjeuner, et Y pour le dîner. Combien de pommes dorées ont-ils mangé au total ce jour-là ?",
                "Arion le centaure adore s'entraîner à l'arc. Il a tiré X flèches lors de la première manche, et Y lors de la seconde manche. Combien de flèches Arion a t'il tirées en tout ?");

        for (int i = 0; i < 7; i++) {

            String problem = problems.get(random.nextInt(problems.size()));
            problem = problem.replace("X", String.valueOf(x)).replace("Y", String.valueOf(y));

            Exercise exercise = new Exercise();
            exercise.setContent(problem);
            exercise.setAnswer(Integer.toString(x + y));
            exercise.setOptions(generateOptions(x + y));
            exercise.setTimer(true);
            exercise.setPrompt(true);

            exercises.add(exercise);
        }
        return exercises;
    }

    List<Exercise> soustraire(int x, int y) {
        Random random = new Random();
        List<Exercise> exercises = new ArrayList();

        List<String> problems = Arrays.asList(
                "Evariste le magicien a X étoiles magiques, mais il en donne Y à son apprenti. Combien d'étoiles magiques lui reste-t-il ?",
                "Le forgeron nain Burin possède X lingots d'or, mais il en utilise Y pour fabriquer une couronne royale. Combien de lingots d'or lui restent-ils ?",
                "Mélusine la sirène a cueilli X coquillages mais en perd Y sur le chemin de retour. Combien de coquillages lui restent-ils ?",
                "Papyrus le hibou sage a commencé l'année avec X livres dans sa bibliothèque, mais en a prêté Y à ses amis. Combien de livres lui restent-ils ?",
                "Clémentine la fée a X fioles de poussière d'étoile. Elle en utilise Y pour enchanter des rêves. Combien de fioles lui restent-ils ?",
                "Le petit troll Gaston a X bonbons, mais en mange Y en regardant son dessin animé préféré. Combien de bonbons lui restent-ils ?",
                "Le pirate Barbe-Grise compte X pièces dans son coffre au trésor, mais doit en donner Y à son équipage. Combien de pièces lui restent-ils ?",
                "Mirette la géante a X fleurs dans son jardin, mais un vent fort en emporte Y. Combien de fleurs lui restent-ils ?",
                "L'archer elfe Lorian a commencé la journée avec X flèches, mais en a utilisé Y pour la chasse. Combien de flèches lui restent-ils ?",
                "Azur la licorne a X cristaux magiques, mais en offre Y à sa meilleure amie, l'elfe Luna. Combien de cristaux lui restent-ils ?",
                "Le dragon Drako a X pierres précieuses dans sa caverne, mais en perd Y en volant trop vite. Combien de pierres précieuses lui restent-ils ?",
                "Grizelda la sorcière a X ingrédients pour ses potions, mais en utilise Y pour une potion de sommeil. Combien d'ingrédients lui restent-ils ?",
                "L'épouvantail Émile a commencé l'automne avec X feuilles sur sa tête, mais le vent en a emporté Y. Combien de feuilles lui restent-ils ?",
                "Le chevalier Roland a X pommes à partager avec ses amis, mais en donne Y à son cheval. Combien de pommes lui restent-ils ?",
                "Le nain Minus a X pépites de diamant, mais doit en donner Y au roi pour payer ses taxes. Combien de pépites de diamant lui restent-ils ?");

        for (int i = 0; i < 7; i++) {

            String problem = problems.get(random.nextInt(problems.size()));
            problem = problem.replace("X", String.valueOf(x)).replace("Y", String.valueOf(y));

            Exercise exercise = new Exercise();
            exercise.setContent(problem);
            exercise.setAnswer(Integer.toString(x - y));
            exercise.setOptions(generateOptions(x - y));
            exercise.setTimer(true);
            exercise.setPrompt(true);

            exercises.add(exercise);
        }
        return exercises;
    }


    List<Exercise> division(int x, int y) {
        Random random = new Random();
        List<Exercise> exercises = new ArrayList();

        List<String> problems = Arrays.asList(
                "Alphonse le magicien a X cartes de tarot et veut faire des piles de Y cartes chacune pour ses tours. Combien de piles peut-il faire ?",
                "Lilly l'abeille a X grains de pollen et veut les répartir équitablement entre ses Y amies. Combien de grains de pollen chaque amie recevra-t-elle ?",
                "Le gnome Fredo a X pommes et veut les partager entre Y paniers pour les vendre au marché. Combien de pommes mettra-t-il dans chaque panier ?",
                "Le dragon Torrid a X trésors et veut les répartir équitablement entre ses Y cavernes. Combien de trésors chaque caverne recevra-t-elle ?",
                "La fée Lumina a X lucioles et veut les répartir entre Y lanternes pour éclairer sa maison. Combien de lucioles chaque lanterne recevra-t-elle ?",
                "Le géant Bigor a X rochers à disposer en Y lignes pour délimiter son territoire. Combien de rochers doit-il mettre sur chaque ligne ?",
                "Le nain Dardo a X gemmes et veut les répartir équitablement entre ses Y coffres. Combien de gemmes chaque coffre recevra-t-il ?",
                "La sirène Perle a X perles et veut les répartir en Y colliers pour les offrir à ses amies. Combien de perles chaque collier aura-t-il ?",
                "Le boulanger Gastro a X baguettes à répartir entre Y sacs pour la livraison. Combien de baguettes chaque sac contiendra-t-il ?",
                "Le chevalier Lancelot a X pièces d'or à partager entre ses Y écuyers. Combien de pièces chaque écuyer recevra-t-il ?",
                "Le sorcier Merlin a X potions à diviser entre ses Y étagères. Combien de potions chaque étagère recevra-t-elle ?",
                "La licorne Iris a X arcs-en-ciel à répartir entre Y nuages. Combien d'arcs-en-ciel chaque nuage recevra-t-il ?",
                "Le pirate Barbe Noire a X bouteilles de rhum à partager entre ses Y matelots. Combien de bouteilles chaque matelot recevra-t-il ?",
                "La fée Chloris a X fleurs à disposer en Y bouquets pour la fête des fleurs. Combien de fleurs chaque bouquet aura-t-il ?",
                "L'elfe Sylver a X flèches à diviser entre ses Y carquois. Combien de flèches chaque carquois recevra-t-il ?");


        for (int i = 0; i < 7; i++) {

            String problem = problems.get(random.nextInt(problems.size()));
            problem = problem.replace("X", String.valueOf(x)).replace("Y", String.valueOf(y));

            Exercise exercise = new Exercise();
            exercise.setContent(problem);
            exercise.setAnswer(Integer.toString(x / y));
            exercise.setOptions(generateOptions(x / y));
            exercise.setTimer(true);
            exercise.setPrompt(true);

            exercises.add(exercise);
        }
        return exercises;
    }

    List<Exercise> priorite(int niveau, int x, int y, int z) {
        Random random = new Random();
        List<Exercise> exercises = new ArrayList();

        int answer = 0;

        List<String> problems = Arrays.asList();

        switch (niveau){
            case 0:
                // ((X - Y + Z) / 2)
                problems = Arrays.asList(
                        "Arthur l'apprenti sorcier a X étoiles filantes, il en donne Y à son maître et en trouve Z de plus. Il utilise ensuite la moitié pour une potion. Combien lui reste-t-il d'étoiles filantes ?",
                        "Fred le fermier a X poules. Il en vend Y à son voisin, en achète Z de plus au marché. Combien a-t-il de poules après avoir donné la moitié à son frère ?",
                        "Robin le voleur a X pièces d'or. Il en perd Y dans une partie de dés, mais en vole Z de plus au shérif. Combien de pièces d'or lui reste-t-il après avoir partagé la moitié avec ses compagnons ?",
                        "Lina la jardinière a X graines. Elle en perd Y à cause des oiseaux, mais en trouve Z de plus dans son grenier. Combien de graines lui restent-elles après avoir semé la moitié dans son jardin ?",
                        "Max le musicien a X partitions. Il en perd Y dans un déménagement, mais en récupère Z de plus dans une brocante. Combien de partitions lui restent-ils après en avoir donné la moitié à son élève ?",
                        "Olga l'ornithologue a observé X oiseaux. Elle en a manqué Y parce qu'elle dormait, mais en a repéré Z de plus le lendemain. Combien d'oiseaux a-t-elle observés après avoir compté la moitié deux fois par erreur ?",
                        "Sam le libraire a X livres. Il en perd Y dans un incendie, mais en récupère Z de plus lors d'une vente aux enchères. Combien de livres lui restent-ils après en avoir vendu la moitié lors d'une promotion ?",
                        "Léo le lion a mangé X antilopes. Il en perd Y à cause des hyènes, mais en chasse Z de plus le lendemain. Combien d'antilopes lui restent-ils après en avoir partagé la moitié avec sa famille ?",
                        "Marie la mathématicienne a écrit X équations. Elle en perd Y lors d'une panne d'ordinateur, mais en crée Z de plus pendant la nuit. Combien d'équations lui restent-elles après en avoir rayé la moitié comme incorrectes ?",
                        "Pablo le peintre a créé X œuvres d'art. Il en perd Y lors d'un vol, mais en peint Z de plus au cours de l'année. Combien d'œuvres lui restent-ils après en avoir vendu la moitié à un musée ?",
                        "Tina la couturière a X boutons. Elle en perd Y en cousant, mais en trouve Z de plus dans un tiroir. Combien de boutons lui restent-ils après en avoir utilisé la moitié pour une nouvelle robe ?"
                );
                answer = (int) ((x - y + z) / 2);
                break;
            case 1:
                // ((X / 2 + Y) - Z)
                problems = Arrays.asList(
                        "Morgana la sorcière a X ingrédients pour ses potions. Elle utilise la moitié pour une potion de sommeil, trouve Y de plus et en donne Z à sa sœur. Combien lui reste-t-il d'ingrédients ?",
                        "Farle le boulanger fait X pains tous les jours. Il en vend la moitié, donne Y à sa famille et en fait Z de plus. Combien de pains lui restent-il ?",
                        "Zéphyr le dragon a X trésors. Il en cache la moitié, perd Y en volant et trouve Z de plus dans une caverne. Combien de trésors a-t-il désormais ?",
                        "Pétunia la fée a X fleurs. Elle en utilise la moitié pour un sortilège, en donne Y à sa meilleure amie et en cueille Z de plus. Combien de fleurs lui restent-il ?",
                        "Hector le troll a X pierres. Il en utilise la moitié pour construire un pont, perd Y dans la rivière et trouve Z de plus en creusant. Combien de pierres lui restent-il ?",
                        "Luna la licorne a X cristaux magiques. Elle en utilise la moitié pour un enchantement, en donne Y à sa mère et en trouve Z de plus dans la forêt. Combien de cristaux lui restent-il ?",
                        "Goliath le géant a X troncs d'arbres. Il en utilise la moitié pour faire un feu, perd Y dans le vent et en coupe Z de plus dans la forêt. Combien de troncs lui restent-il ?",
                        "Éole le nain a X gemmes. Il en utilise la moitié pour forger une couronne, en donne Y au roi et en trouve Z de plus dans la mine. Combien de gemmes lui restent-il ?",
                        "Ombrelle la sirène a X perles. Elle en utilise la moitié pour un collier, en donne Y à sa sœur et en trouve Z de plus dans une huître. Combien de perles lui restent-il ?"
                );
                answer = (int) ((x /2 + y) - z);
                break;
            case 2:
                // ((2 * X - Y) + Z)
                problems = Arrays.asList(
                        "Fiona la fée a X paillettes magiques. Elle en utilise le double pour un sortilège, en donne Y à son amie la licorne et en trouve Z de plus dans la forêt. Combien de paillettes lui restent-il ?",
                        "Baloo l'ours a X pots de miel. Il en mange le double pour son petit déjeuner, en donne Y à ses amis les abeilles et en trouve Z de plus dans la forêt. Combien de pots de miel lui restent-il ?",
                        "Merlin l'apprenti magicien a X parchemins. Il en utilise le double pour ses sortilèges, en donne Y à son maître et en trouve Z de plus dans la bibliothèque. Combien de parchemins lui restent-il ?",
                        "Le dragon Zephyr a X pierres précieuses. Il en cache le double dans sa caverne, en perd Y lors d'une bataille et en trouve Z de plus lors d'un raid. Combien de pierres précieuses lui restent-il ?",
                        "Clochette la fée a X gouttes de rosée. Elle en utilise le double pour ses potions, en donne Y à sa sœur et en trouve Z de plus sur les fleurs au petit matin. Combien de gouttes lui restent-il ?",
                        "Bagheera la panthère a X poissons. Elle en mange le double pour son dîner, en donne Y à ses petits et en pêche Z de plus dans la rivière. Combien de poissons lui restent-il ?",
                        "Hagrid le demi-géant a X citrouilles. Il en utilise le double pour ses potions, en donne Y à ses élèves et en trouve Z de plus dans son potager. Combien de citrouilles lui restent-il ?",
                        "Le nain Grumpy a X diamants. Il en cache le double dans sa mine, en donne Y à Blanche-Neige et en trouve Z de plus lors d'une nouvelle fouille. Combien de diamants lui restent-il ?",
                        "Le sorcier Gandalf a X plumes d'aigle. Il en utilise le double pour écrire ses sortilèges, en donne Y à Frodo et en trouve Z de plus lors de son voyage. Combien de plumes lui restent-il ?"
                );
                answer = (int) ((2 * x - y) + z);
                break;
            default:
                break;
        }

        for (int i = 0; i < 7; i++) {

            String problem = problems.get(random.nextInt(problems.size()));
            problem = problem.replace("X", String.valueOf(x)).replace("Y", String.valueOf(y)).replace("Z", String.valueOf(z));

            Exercise exercise = new Exercise();
            exercise.setContent(problem);
            exercise.setAnswer(Integer.toString(answer));
            exercise.setOptions(generateOptions(answer));
            exercise.setTimer(true);
            exercise.setPrompt(true);

            exercises.add(exercise);
        }
        return exercises;
    }

}
