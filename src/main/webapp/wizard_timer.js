/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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

    const TIME_LIMIT = 120;
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
            $("#next-btn").show();
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
    $("#next-btn").show();




    // Step show event
    $("#smartwizard").on("showStep", function (e, anchorObject, stepNumber, stepDirection, stepPosition) {
        onTimesUp();
        $("#next-btn").show();


        if (stepPosition !== 'first' && stepPosition !== 'last') {
            $("#timer").show();
            $("#timer-msg").show();
            timePassed = 0;
            timeLeft = TIME_LIMIT;
            timerInterval = null;
            startTimer();



        } else {
            
            $("#timer").hide();// Reset the timer for first and last steps
            $("#timer-msg").hide();// Reset the timer for first and last steps
        }

        if (stepPosition === 'first') {
            $("#prev-btn").addClass('disabled');
        } else if (stepPosition === 'last') {
         
        } else {
            $("#next-btn").removeClass('disabled');
        }






    });
    
    
    // Smart Wizard
    $('#smartwizard').smartWizard({
        selected: 0,
        theme: 'default',
        justified: true,
    
        toolbarSettings: {
            toolbarPosition: 'bottom',
            toolbarButtonPosition: 'right',
            showPreviousButton: false
        }
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
});


