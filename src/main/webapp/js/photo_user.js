document.addEventListener('DOMContentLoaded', function() {
    var userLogs = document.getElementsByClassName('userLog');
    var basePath = "./images/userImgs/";

    for (var i = 0; i < userLogs.length; i++) {
        var userText = userLogs[i].textContent.trim();
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
                imgFileName = "pikachu.jpg";
                break;
        }

        var imgSrc = basePath + imgFileName;
        var imageElements = document.getElementsByClassName('img_user');
        for (var j = 0; j < imageElements.length; j++) {
            imageElements[j].src = imgSrc;
        }
    }
});

