<%@ page contentType="text/javascript" %>
<%@ page import="java.util.Date" %>
<%
    Integer e = (Integer) session.getAttribute("e");

    Integer palier = (Integer) session.getAttribute("palier");


%>
$(document).ready(function () {
const FULL_DASH_ARRAY = 126;
    const WARNING_THRESHOLD = 10;
    const ALERT_THRESHOLD = 5;

    const COLOR_CODES = {
        info: {
            color: "green"
        },
        warning: {
            color: "orange",
            threshold: WARNING_THRESHOLD
        },
        alert: {
            color: "red",
            threshold: ALERT_THRESHOLD
        }
    };

    const TIME_LIMIT = 15;
    let timePassed = 0;
    let timeLeft = TIME_LIMIT;
    let timerInterval = null;
    let remainingPathColor = COLOR_CODES.info.color;

    document.getElementById("timer").innerHTML = `
<div class="base-timer">
 <svg class="base-timer__svg" viewBox="0 0 50 50" xmlns="http://www.w3.org/2000/svg">
  <g class="base-timer__circle">
    <circle class="base-timer__path-elapsed" cx="25" cy="25" r="20"></circle>
    <path
      id="base-timer-path-remaining"
      stroke-dasharray="${FULL_DASH_ARRAY}"
      class="base-timer__path-remaining ${remainingPathColor}"
      d="
        M 25, 25
        m -20, 0
        a 20,20 0 1,0 40,0
        a 20,20 0 1,0 -40,0
      "
    ></path>
  </g>
</svg>
  <span id="base-timer-label" class="base-timer__label">${formatTime(
            timeLeft
            )}</span>
</div>
`;
    document.getElementById("timer-msg").innerHTML = "Vous pouvez le faire !";


    function onTimesUp() {
        clearInterval(timerInterval);
        document.getElementById("timer").innerHTML = `
<div class="base-timer">
  <svg class="base-timer__svg" viewBox="0 0 50 50" xmlns="http://www.w3.org/2000/svg">
  <g class="base-timer__circle">
    <circle class="base-timer__path-elapsed" cx="25" cy="25" r="20"></circle>
    <path
      id="base-timer-path-remaining"
      stroke-dasharray="${FULL_DASH_ARRAY}"
      class="base-timer__path-remaining ${remainingPathColor}"
      d="
        M 25, 25
        m -20, 0
        a 20,20 0 1,0 40,0
        a 20,20 0 1,0 -40,0
      "
    ></path>
  </g>
</svg>

  <span id="base-timer-label" class="base-timer__label">${formatTime(
                timeLeft
                )}</span>
</div>
`;

        document.getElementById("timer-msg").innerHTML = "<h4>Vous pouvez le faire !</h4>";




    }

    function startTimer() {
        timerInterval = setInterval(() => {
            timePassed = timePassed + 1;
            timeLeft = TIME_LIMIT - timePassed;
            document.getElementById("base-timer-label").innerHTML = formatTime(
                    timeLeft
                    );
            setCircleDasharray();
            setRemainingPathColor(timeLeft);

            if (timeLeft === 0) {
                onTimesUp();
                $('#smartwizard').smartWizard("next");


            }
        }, 1000);
    }

    function formatTime(time) {
        const minutes = Math.floor(time / 60);
        let seconds = time % 60;

        if (seconds < 10) {
            seconds = `0${seconds}`;
        }

        return `${minutes}:${seconds}`;
    }

    function setRemainingPathColor(timeLeft) {
        const {alert, warning, info} = COLOR_CODES;
        const pathRemaining = document.getElementById("base-timer-path-remaining");



        if (timeLeft <= alert.threshold) {
            pathRemaining.classList.remove(warning.color);
            pathRemaining.classList.add(alert.color);
            document.getElementById("timer-msg").innerHTML = "<h4>Le temps est bientôt écoulé !</h4>";
        } else if (timeLeft <= warning.threshold) {
            pathRemaining.classList.remove(info.color);
            pathRemaining.classList.add(warning.color);
            
        }
    }

    function calculateTimeFraction() {
        const rawTimeFraction = timeLeft / TIME_LIMIT;
        return rawTimeFraction - (1 / TIME_LIMIT) * (1 - rawTimeFraction);
    }

    function setCircleDasharray() {
        const circleDasharray = `${(
                calculateTimeFraction() * FULL_DASH_ARRAY
                ).toFixed(0)} ${FULL_DASH_ARRAY}`;
        document
                .getElementById("base-timer-path-remaining")
                .setAttribute("stroke-dasharray", circleDasharray);
    }



$('.sweet-text').click();
var e = <%= e%>;
var spanAttempt = document.getElementById("attempt");
var progressBar = document.querySelector(".progress-bar");
var progressBarWidth = (e / 3) * 100;

spanAttempt.textContent = "  " + e + "/3";
progressBar.style.width = progressBarWidth + "%";



if (e <= 1) {

$(".progress-bar").addClass("bg-danger");
//  spanAttempt.style.color = "red";

} else if (e === 2) {
$(".progress-bar").addClass("bg-warning");
//     spanAttempt.style.color = "orange";
} else {
$(".progress-bar").addClass("bg-green");
//    spanAttempt.style.color = "green";
}



// Toolbar extra buttons
var btnFinish = $('<button onclick="window.location.href ="https://w3docs.com""></button>').text('Valider Votre RÃ©ponses')
.addClass('btn btn-info').addClass('finishLine')
.on('click', function () {
swal("Saluuut, Bravooo!!", "Tu peux passer les tests maintenant !!", "success");
});
// Step show event
$("#smartwizard").on("showStep", function (e, anchorObject, stepNumber, stepDirection, stepPosition) {
$("#prev-btn").removeClass('disabled');
$("#next-btn").removeClass('disabled');
$(".sw-btn-next").hide();
if (stepPosition !== 'last') {
$('.finishLine').hide();
} else {
$(".sw-btn-next").hide();
<% if (e < 3) {%>
$.ajax(
{
url:
"incrementAttempts"
, // Replace with the URL of your servlet or endpoint
type:
"POST"
,
dataType:
"json"
,
data:
{
essais:
<%=e%>}, // Pass any additional data if needed
success: function (response) {
var progressBarWidth = (response.e / 3) * 100;
spanAttempt.textContent = response.e + "/3";
progressBar.style.width = progressBarWidth + "%";
if (response.e <= 1) {
xpIncrement(<%=palier%>, false, false);

$(".progress-bar").addClass("bg-danger");
$(".progress-bar").removeClass("bg-warning", "bg-green");


// spanAttempt.style.color = "red";

} else if (response.e == 2) {
xpIncrement(<%=palier%>, false, false);
$(".progress-bar").addClass("bg-warning");
$(".progress-bar").removeClass("bg-danger", "bg-green");
//                                                                                                        spanAttempt.style.color = "orange";
} else {
$(".progress-bar").addClass("bg-green");
$(".progress-bar").removeClass("bg-warning", "bg-danger");
//spanAttempt.style.color = "green";
xpIncrement(<%=palier%>, false, false);
}
// Handle the response from the server
console.log("Update successful!");
},
error: function (xhr, status, error) {
// Handle the error response
console.log("Error: " + error);
}
});
<%}%>
<% if (e == 2) { %> 
$('#passTest'
).click();
<%
            }%>
}


if (stepPosition === 'first') {
$("#prev-btn").addClass('disabled');
} else if (stepPosition === 'last') {
$("#next-btn").addClass('disabled');
} else {
$("#prev-btn").removeClass('disabled');
$("#next-btn").removeClass('disabled');
}
});
// Smart Wizard


$('#smartwizard').smartWizard({

toolbarSettings: {
toolbarPosition: 'bottom', // both bottom
showPreviousButton: false,
toolbarExtraButtons: [btnFinish]
}
});
// External Button Events
$("#reset-btn").on("click", function () {
// Reset wizard
$('#smartwizard').smartWizard("reset");
return true;
});
$("#prev-btn").on("click", function () {
// Navigate previous
$('#smartwizard').smartWizard("prev");
return true;
});
$("#next-btn").on("click", function () {
// Navigate next
$('#smartwizard').smartWizard("next");
return true;
});
}
);