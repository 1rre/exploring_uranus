    /**
     * MODES FUNCTIONALITY
     */

    var selectedMode = document.getElementById("modesList");
    selectedMode.addEventListener('change', function(e){
        let value = document.getElementById("modesList").value;
        console.log(value);
        let msg = Uint8Array.from(value);
        fetch('/mode', {
        method:'POST',
        headers: {
            'Content-Type' : 'application/json'
        },
        body: JSON.stringify(msg)
        });
    });

    /**
     * BUTTON FUNCTIONALITY
     */
    // 
    async function buttonListener(value) {
        let msg = Uint8Array.from(value);
        fetch('/manual', {
        method:'POST',
        headers: {
            'Content-Type' : 'application/json'
        },
        body: JSON.stringify(msg)
        });
    }
    const buttonLeft = document.getElementById('left-button');
    const buttonRight = document.getElementById('right-button');
    const buttonLeftBack = document.getElementById('left-back-button');
    const buttonRightBack = document.getElementById('right-back-button');
    const buttonUp = document.getElementById('up-button');
    const buttonDown = document.getElementById('down-button');
    const buttonClock = document.getElementById('clock-button');
    const buttonAnticlock = document.getElementById('anticlock-button');
    const buttonStop = document.getElementById('stop-button');


    buttonLeft.addEventListener('click', function(e) {
        let value = document.getElementById('left-button').value;
        if(document.getElementById('speedList').value=="1"){
            value = "00111101";
        }else if(document.getElementById('speedList').value=="2"){
            value = "00111011";
        }else if(document.getElementById('speedList').value=="3"){
            value = "00111001";
        }
        console.log(value);
        let msg = Uint8Array.from(value);
        buttonListener(msg);
    });
    buttonRight.addEventListener('click', function(e) {
        let value = document.getElementById('right-button').value;
        if(document.getElementById('speedList').value=="1"){
            value = "00111100";
        }else if(document.getElementById('speedList').value=="2"){
            value = "00111010";
        }else if(document.getElementById('speedList').value=="3"){
            value = "00111000";
        }
        console.log(value);
        let msg = Uint8Array.from(value);
        buttonListener(msg);
    });
    buttonLeftBack.addEventListener('click', function(e) {
        let value = document.getElementById('left-back-button').value;
        if(document.getElementById('speedList').value=="1"){
            value = "00101100";
        }else if(document.getElementById('speedList').value=="2"){
            value = "00101010";
        }else if(document.getElementById('speedList').value=="3"){
            value = "00101000";
        }
        console.log(value);
        let msg = Uint8Array.from(value);
        buttonListener(msg);
    });
    buttonRightBack.addEventListener('click', function(e) {
        let value = document.getElementById('right-back-button').value;
        if(document.getElementById('speedList').value=="1"){
            value = "00101101";
        }else if(document.getElementById('speedList').value=="2"){
            value = "00101011";
        }else if(document.getElementById('speedList').value=="3"){
            value = "00101001";
        }
        console.log(value);
        let msg = Uint8Array.from(value);
        buttonListener(msg);
    });
    buttonUp.addEventListener('click', function(e) {
        let value = document.getElementById('up-button').value;
        if(document.getElementById('speedList').value=="1"){
            value = "00011100";
        }else if(document.getElementById('speedList').value=="2"){
            value = "00011010";
        }else if(document.getElementById('speedList').value=="3"){
            value = "00011000";
        }
        console.log(value);
        let msg = Uint8Array.from(value);
        buttonListener(msg);
    });
    buttonDown.addEventListener('click', function(e) {
        let value = document.getElementById('down-button').value;
        if(document.getElementById('speedList').value=="1"){
            value = "00001100";
        }else if(document.getElementById('speedList').value=="2"){
            value = "00001010";
        }else if(document.getElementById('speedList').value=="3"){
            value = "00001000";
        }
        console.log(value);
        let msg = Uint8Array.from(value);
        buttonListener(msg);
    });
    buttonClock.addEventListener('click', function(e) {
        let value = document.getElementById('clock-button').value;
        if(document.getElementById('speedList').value=="1"){
            value = "00010100";
        }else if(document.getElementById('speedList').value=="2"){
            value = "00010010";
        }else if(document.getElementById('speedList').value=="3"){
            value = "00010000";
        }
        console.log(value);
        let msg = Uint8Array.from(value);
        buttonListener(msg);
    });
    buttonAnticlock.addEventListener('click', function(e) {
        let value = document.getElementById('anticlock-button').value;
        if(document.getElementById('speedList').value=="1"){
            value = "00000101";
        }else if(document.getElementById('speedList').value=="2"){
            value = "00000011";
        }else if(document.getElementById('speedList').value=="3"){
            value = "00000001";
        }
        console.log(value);
        let msg = Uint8Array.from(value);
        buttonListener(msg);
    });
    buttonStop.addEventListener('click', function(e) {
        let value = document.getElementById('stop-button').value;
        console.log(value);
        let msg = Uint8Array.from(value);
        buttonListener(msg);
    });

    //====================================================================

    var movement = 22;
    var ballsColour = [];
    var ballsCoord = [[]];
    var ballsClourCoor = [[]];
    var colours = ["#ffffff","#ff9900","#33cc33","#0066ff","#ff6699","#000000"]; //white,orange,green,blue,pink,black
    var canvas = document.getElementById("myCanvas");
    var image = document.querySelector("img");
    var ctx = canvas.getContext("2d");
    var u = 333;        //    true movement as seen by observer in true x-axis.
    var v = 333;        //    true movement as seen by observer in true y-axis.
    var prev_mode = 22; // previous case is 22.
    var theta = 0;    //    clockwise angle difference between rover axis and true axis.


    async function getValues(){
        const getvel = fetchdata().then(data => {
        return [data.State, data.Error_Code, data.SOC, data.SOH, data.Big_State,
                data.Movement, data.BallColour, data.BallPosX, data.BallPosY,
                data.Speed];
        });

        const get = async() => {
            let rover = await getvel;
            document.getElementById('State1-error').textContent = (rover[0][0][0]==0) ?  "No" : "Yes";
            document.getElementById('State2-error').textContent = (rover[0][0][1]==0) ?  "No" : "Yes";
            document.getElementById('State3-error').textContent = (rover[0][0][2]==0) ?  "No" : "Yes";
            document.getElementById('State1-discharge').textContent = (rover[0][1][0]==0) ?  "No" : "Yes";
            document.getElementById('State2-discharge').textContent = (rover[0][1][1]==0) ?  "No" : "Yes";
            document.getElementById('State3-discharge').textContent = (rover[0][1][2]==0) ?  "No" : "Yes";

            document.getElementById('ErrorCode').textContent = rover[1];
            
            document.getElementById('SOC0').textContent = rover[2][0];
            document.getElementById('SOC1').textContent = rover[2][1];
            document.getElementById('SOC2').textContent = rover[2][2];
            
            document.getElementById('SOH0').textContent = rover[3][0];
            document.getElementById('SOH1').textContent = rover[3][1];
            document.getElementById('SOH2').textContent = rover[3][2];
            
            if(rover[4][0]==0){document.getElementById('MPPT-State').textContent = "Reset/Initial"};
            if(rover[4][0]==1){document.getElementById('MPPT-State').textContent = "Left Look Up"};
            if(rover[4][0]==2){document.getElementById('MPPT-State').textContent = "Right Look Up"};
            if(rover[4][0]==3){document.getElementById('MPPT-State').textContent = "DCM Avoidance"};
            if(rover[4][0]==4){document.getElementById('MPPT-State').textContent = "Rest"};
            if(rover[4][0]==5){document.getElementById('MPPT-State').textContent = "Restriction Adjustment"};
            
            if(rover[4][1]==0){document.getElementById('SM-State').textContent = "Start"};
            if(rover[4][1]==1){document.getElementById('SM-State').textContent = "Balanced Charging"};
            if(rover[4][1]==2){document.getElementById('SM-State').textContent = "Charge Rest"};
            if(rover[4][1]==3){document.getElementById('SM-State').textContent = "Discharge"};
            if(rover[4][1]==4){document.getElementById('SM-State').textContent = "Discharge Rest"};
            if(rover[4][1]==5){document.getElementById('SM-State').textContent = "Overall Error"};
            if(rover[4][1]==6){document.getElementById('SM-State').textContent = "MPPT/Restriction"};

            document.getElementById('Move').textContent = rover[5];
            document.getElementById('Speed').textContent = rover[9];
            
            movement = rover[5];
            if(rover[6]!=0){
                if(!ballsColour.includes(rover[6])){
            ballsColour.push(rover[6]);
            ballsCoord.push([rover[7]-1,rover[8]]); /// offset for x-axis to be from -3,-2,-1,0,1,2,3 and y-axis 0,1,2,3
            var i = ballsCoord.length;
            ballsCoord[i-1][0] = u + (ballsCoord[i-1][1] * Math.sin(theta) + ballsCoord[i-1][0] * Math.cos(theta));
            ballsCoord[i-1][1] = v + (ballsCoord[i-1][1] * Math.cos(theta) - ballsCoord[i-1][0] * Math.sin(theta));
        }
    }
        }
    get();
    }
    async function fetchdata() {
        const option = {
            method: "GET",
            headers: {
                "Content-Type": "application/json"
            }
        };
    const response = await fetch("/api", option);
    return response.json();
    }


    /**
     * CANVAS FOR BALL POSITION
     */
     
    //================================= ACTION TAKEN BY ROVER ==================================
    function actionToMake(data,true_u,true_v,relative_theta,previous_mode) {
        var values = {
        updated_theta : 0,
        updated_u : 0,
        updated_v : 0,
        updated_mode : 0
        };
        switch (data) {
            case 24:
            case 28:
            case 26:            // FORWARDS (increase by 2 each time for now)
                values.updated_theta = relative_theta;
                values.updated_v = true_v + (2 * Math.cos(relative_theta) - 0 * Math.sin(relative_theta));
                values.updated_u = true_u + (2 * Math.sin(relative_theta) + 0 * Math.cos(relative_theta));
                values.updated_mode = 26;
                return values;
            case 12:
            case 8:
            case 10:            // BACKWARDS (decrease by 2 each time for now)
                values.updated_theta = relative_theta;
                values.updated_v = true_v + (-2 * Math.cos(relative_theta) - 0 * Math.sin(relative_theta));
                values.updated_u = true_u + (-2 * Math.sin(relative_theta) + 0 * Math.cos(relative_theta));
                values.updated_mode = 10;
                return values;
            case 20:
            case 16:
            case 18:            // ROTATE CLOCKWISE (increase theta by 6 deg for now)
                //values.updated_theta = relative_theta + (Math.PI/10);
                values.updated_theta = (previous_mode == 18) ?  (relative_theta) : relative_theta + Math.PI/2;
                values.updated_v = true_v;
                values.updated_u = true_u;
                values.updated_mode = 18;
                return values;
            case 5:
            case 1:
            case 3:             // ROTATE ANTICLOCKWISE (decrease theta by 6 deg for now)
                //values.updated_theta = relative_theta - (Math.PI/10);
                values.updated_theta = (previous_mode == 3) ? (relative_theta) : relative_theta - Math.PI/2;
                values.updated_v = true_v;
                values.updated_u = true_u;
                values.updated_mode = 3;
                return values;
            case 61:
            case 57:
            case 59:            // STEER TO THE LEFT (increase y by 2 decrease x by 2 for now)
                values.updated_theta = relative_theta;
                values.updated_v = true_v + (2 * Math.cos(relative_theta) - (-2) * Math.sin(relative_theta));
                values.updated_u = true_u + (2 * Math.sin(relative_theta) + (-2) * Math.cos(relative_theta));
                values.updated_mode = 59;
                return values;
            case 60:
            case 56:
            case 58:            // STEER TO THE RIGHT (increase y,x by 2 for now)
                values.updated_theta = relative_theta;
                values.updated_v = true_v + (2 * Math.cos(relative_theta) - 2 * Math.sin(relative_theta));
                values.updated_u = true_u + (2 * Math.sin(relative_theta) + 2 * Math.cos(relative_theta));
                values.updated_mode = 58;
                return values;
            case 44:
            case 40:
            case 42:            // STEER TO THE LEFT BACK (increase y by 2 decrease x by 2 for now)
                values.updated_theta = relative_theta;
                values.updated_v = true_v - (2 * Math.cos(relative_theta) - (-2) * Math.sin(relative_theta));
                values.updated_u = true_u - (2 * Math.sin(relative_theta) + (-2) * Math.cos(relative_theta));
                values.updated_mode = 42;
                return values;
            case 45:
            case 41:
            case 43:            // STEER TO THE RIGHT BACK(increase y,x by 2 for now)
                values.updated_theta = relative_theta;
                values.updated_v = true_v - (2 * Math.cos(relative_theta) - 2 * Math.sin(relative_theta));
                values.updated_u = true_u - (2 * Math.sin(relative_theta) + 2 * Math.cos(relative_theta));
                values.updated_mode = 43;
                return values;
            case 22:            // STOP (no motion same x,y position)
                values.updated_v = true_v;
                values.updated_u = true_u;
                values.updated_theta = relative_theta;
                values.updated_mode = 22;
                return values;
          }
    }

    //================================= FUNCTION DRAWING BALLS DETECTED ========================
    function drawBall() {
        var i;
        for(i=0; i< ballsColour.length;i++){
          ctx.beginPath();
          ctx.arc(ballsCoord[i][0],1000-ballsCoord[i][1], 10, 0, Math.PI*2);
          ctx.fillStyle = colours[ballsColour[i]];
          ctx.fill();
          ctx.closePath();
      }
    }

    //================================= FUNCTION DRAWING ROVER =================================
    function drawRover(value_x,value_y) {
        ctx.beginPath();
        ctx.drawImage(image,value_x,value_y,100,75);
        ctx.fillStyle = "#CC6600";
        ctx.fill();
        ctx.closePath();
    }



    function draw() {
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        var values1 = actionToMake(movement,u,v,theta,prev_mode);
        u = values1.updated_u;
        v = values1.updated_v;
        theta = values1.updated_theta;
        prev_mode = values1.updated_mode;
        drawRover(u,1000 - v);
        drawBall();
    }
    setInterval(getValues,100)
    setInterval(fetchdata,100);
    setInterval(draw, 100);