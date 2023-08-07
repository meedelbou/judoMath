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
import java.util.*;

public class lettersToNumbers {
    public static String AvecSeparateur(long nombre) {
        if (nombre < 0) {
            return "-" + AvecSeparateur(-nombre);
        }
        if (nombre / 1000L > 0) {
            return AvecSeparateur(nombre / 1000L) + ","
                    + String.format("%1$03d", nombre % 1000L);
        } else {
            return String.format("%1$d", nombre);
        }
    }

    private static String[] chiffres = { "zéro", "un", "deux",
            "trois", "quatre", "cinq", "six", "sept", "huit", "neuf", "dix",
            "onze", "douze", "treize", "quatorze", "quinze", "seize",
            "dix-sept", "dix-huit", "dix-neuf", "vingt", "trente", "quarante",
            "cinquante", "soixante", "soixante-dix", "quatre-vingt", "cent" };

    private static long[] valeurs = { 0, 1, 2, 3, 4, 5, 6, 7, 8,
            9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 30, 40, 50, 60, 70,
            80, 90, 100 };

    private static ArrayList<String> liste = new ArrayList<String>(
            Arrays.asList(chiffres));

    public static long convertirMotsEnNombres(String texte) throws Exception {
        long valeur = 0;
        String[] mots = texte.replaceAll(" et ", " ").split("\\s");
        for (String mot : mots) {
            if (!liste.contains(mot)) {
                throw new Exception("Jeton inconnu : " + mot);
            }

            long sousValeur = getValeurDe(mot);
            if (sousValeur == 100) {
                if (valeur == 0)
                    valeur = 100;
                else
                    valeur *= 100;
            } else
                valeur += sousValeur;
        }

        return valeur;
    }

    private static long getValeurDe(String mot) {
        return valeurs[liste.indexOf(mot)];
    }

    private static String[] mots = { "trillion", "billion", "million", "mille" };

    private static long[] chiffresSignificatifs = { 1000000000000L, 1000000000L, 1000000L, 1000L };

    public static long convertir(String texte) throws Exception {
        texte = texte.toLowerCase().replaceAll("[\\-,]", " ").replaceAll(" et "," ");
        long valeurTotale = 0;
        boolean traite = false;
        for (int n = 0; n < mots.length; n++) {
            int index = texte.indexOf(mots[n]);
            if (index >= 0) {
                String texte1 = texte.substring(0, index).trim();
                String texte2 = texte.substring(index + mots[n].length()).trim();

                if (texte1.equals(""))
                    texte1 = "un";

                if (texte2.equals(""))
                    texte2 = "zéro";

                valeurTotale = convertirMotsEnNombres(texte1) * chiffresSignificatifs[n] + convertir(texte2);
                traite = true;
                break;
            }
        }

        if (traite)
            return valeurTotale;
        else
            return convertirMotsEnNombres(texte);
    }

   
}
