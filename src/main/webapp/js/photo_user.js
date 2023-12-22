document.addEventListener('DOMContentLoaded', function() {
    var userLog = document.getElementById('userLog');
    var userText = userLog.textContent.trim();

    var basePath = "./images/userImgs/";  // Préfixe pour le chemin des images
    var imgFileName;

    switch (userText) {
        case "clemeleve":
            imgFileName = "xana.jpg";
            break;
        case "Texte 2":
            imgFileName = "photo2.jpg";
            break;
        case "Texte 3":
            imgFileName = "photo3.jpg";
            break;
        case "Texte 4":
            imgFileName = "photo4.jpg";
            break;
        case "Texte 5":
            imgFileName = "photo5.jpg";
            break;
        default:
            imgFileName = "pikachu.jpg"; // Nom de fichier par défaut
            break;
    }

    var imgSrc = basePath + imgFileName; // Construire le chemin complet de l'image

    var imageElements = document.getElementsByClassName('img_user');
    
    for (var i = 0; i < imageElements.length; i++) {
        imageElements[i].src = imgSrc;
    }
});
