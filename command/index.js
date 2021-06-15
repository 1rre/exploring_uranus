const { SSL_OP_EPHEMERAL_RSA } = require("constants");
const express = require("express");
const { rm } = require("fs");
const PORT1 = 8000;
const PORT2 = 8080;
// const host = '127.0.0.1';

const app = express();

//  Features to be updated

var state = [[0,0,0],[0,0,0]];
var error_code = 0;
var soc = [0,0,0];
var soh = [0,0,0];
var big_state = [0,0];
var move = 0;
var speed = 0;
//===========
var ball_posY = 0;
var ball_posX = 0;
var ball_colour = 0;
var manualInstruction = 0;
var mode = 0;
// Application


app.listen(PORT1, function(){console.log(`listening at ${PORT1}`);});
app.use(express.static('public'));
app.use(express.json({limit: "1mb"}));



// server


const net = require('net'); 
const { basename } = require("path");
const server = net.createServer();

server.on("connection", function(socket){
var remoteAddress = socket.remoteAddress + ":" + socket.remotePort;
console.log("new client connection is made %s", remoteAddress);

//===================================== MODES ========================================//
/**
 * AUTOMATIC MOVEMENT MODES
 * ------------------------
 * 128 : 10000000 : don’t move
 * 129 : 10000001 : explore the 1mx1m in front of you, going to the right
 * 130 : 10000010 : explore the 1mx1m in front of you, going to the left
 * 131 : 10000011 : move 1 m forwards
 * 132 : 10000100 : move 1m backwards
 * 133 : 10000101 : automatic strip of 1m endless to the right
 * 134 : 10000110 : automatic strip of 1m endless to the left
 * 135 : 10000111 : emergency stop
 * 
 * MANUAL MOVEMENT MODES
 * ------------------------
 * 26 : forwards (MOVE UP)
 * 10 : backwards (MOVE DOWN)
 *  3 : turn to the left (not moving) (ANTICLOCKWISE)
 * 18 : turn to the right (not moving) (CLOCKWISE)
 * 59 : stir to the left (MOVE LEFT)
 * 58 : stir to the right (MOVE RIGHT)
 * 22 : Stop (STOP)
 */
 
//===================================== CLIENT ========================================//
socket.on("data", function (msg) {
    
    /*

        Big Endian
        Packet : ...|9|8|7|6|5|4|3|2|1|
        Char   : |0|1|2|3|4|5|6|7|...
        DATA STRUCTURE - BITSTREAM - TCP PACKET

        ===== CHAR 0 ====== : 3xsmall state (2bits*3=6bit = 1 int)
        |--------0--------| : Battery 1, Bit 0
        |--------1--------| : Battery 1, Bit 1
        |--------2--------| : Battery 2, Bit 0
        |--------3--------| : Battery 2, Bit 1
        |--------4--------| : Battery 3, Bit 0
        |--------5--------| : Battery 3, Bit 1
        ******************* : error code if rover is stuck somewhere
        |--------6--------| : Error Bit (0 or 1)
        |------- 7 -------| : EMPTY BIT => BE USED ELSEWAY***********************> 

        ====== CHAR 1 ===== : SOC of Battery 1
        |----- 8-15 ------| : 
        ====== CHAR 2 ===== : SOC of Battery 2
        |----- 16-23 -----| : 
        ====== CHAR 3 ===== : SOC of Battery 3
        |----- 24-31 -----| :

        ====== CHAR 4 ===== : SOH of Battery 1
        |----- 32-39 -----| : 
        ====== CHAR 5 ===== : SOH of Battery 2
        |----- 40-47 -----| : 
        ====== CHAR 6 ===== : SOH of Battery 3
        |----- 48-55 -----| :
        
        ====== CHAR 7 ===== : big state ( i.e. charging/balancing etc)
        |----- 56-63 -----| :

        ====== CHAR 8 ===== : Automatic Movement Control
        |----- 64-71 -----| :

        ====== CHAR 9 ====| : BALL COLOUR / GRID SPECIFIER
        |----- 72-79 -----| :
        ===== CHAR 10 ====| : SPEED
        |----- 80-88 -----| :
    */


        bitStream = Uint8Array.from(msg);
        
        char0 = bitStream[0];
        char1 = bitStream[1];
        char2 = bitStream[2];
        char3 = bitStream[3];
        char4 = bitStream[4];
        char5 = bitStream[5];
        char6 = bitStream[6];
        char7 = bitStream[7];
        char8 = bitStream[8];
        char9 = bitStream[9];
        ////////////////////
        char10 = bitStream[10];

    //======================== Assignment ====================//

        var i;
        var array_char1 = [0,0,0,0,0,0,0,0];
        for (i = 0; i < 8; i++) { 
            array_char1[i] = (char0 & 1)==0 ? 0 : 1;
            char0 = char0 >> 1;
        }

        error_code = array_char1[6];

        state[0] = [array_char1[0],array_char1[2],array_char1[4]];
        state[1] = [array_char1[1],array_char1[3],array_char1[5]];

        soc = [char1,char2,char3];
        soh = [char4,char5,char6];
        move = char8;
        speed = char10;
        //==============================================
        var k;
        var array_char7 = [0,0,0,0,0,0,0,0];
        for (k = 0; k < 8; k++ ) {
            array_char7[j] = (char7 & 1)==0 ? 0 : 1;
            char7 = char7 >> 1;
        }

        big_state[0] = array_char7[0]+array_char7[1]*2+array_char7[2]*4+array_char7[3]*8;
        big_state[1] = array_char7[4]+array_char7[5]*2+array_char7[6]*4+array_char7[7]*8;
        //==============================================
        var j;
        var array_char9 = [0,0,0,0,0,0,0,0];
        for (j = 0; j < 8; j++ ) {
            array_char9[j] = (char9 & 1)==0 ? 0 : 1;
            char9 = char9 >> 1;
        }

        ball_posY = array_char9[0]+array_char9[1]*2+array_char9[2]*4;
        ball_posX = array_char9[3]+array_char9[4]*2;
        ball_colour = array_char9[5]+array_char9[6]*2+array_char9[7]*4;

        console.log("Data from %s: %s", remoteAddress, bitStream);
        // socket.write("data received: " + msg);=
    });


    app.get("/api", (request, response) => {
        response.json({
                State : state,
                Error_Code : error_code,
                SOC : soc,
                SOH : soh,
                Big_State : big_state,
                Movement : move,
                BallPosX : ball_posX, 
                BallPosY : ball_posY,
                BallColour : ball_colour,
                Speed : speed
        });
    });

    socket.once("close", function () { 
        console.log("connection from %s closed", remoteAddress);
    });

    socket.on("error", function (err) { 
        console.log("Connection %s error: %s", remoteAddress, err.message);
    });
    app.post('/manual', (req, res) => {
        console.log(req.body);
        var array = req.body;
        var i;
        var value = "";
        for (i = 0; i < 8; i++) { 
            value = value + array[i];
            console.log(array[i]);
        }
        var response = parseInt(value, 2);
        console.log(String.fromCharCode(response));
        console.log(response);
        socket.write(String.fromCharCode(response));
        // manualInstruction = response;
    });

//     function getCommand(){
//         console.log(manualInstruction);
//         socket.write("\n"+String.fromCharCode(manualInstruction)+"\n");
// }
//     getCommand();
//     setInterval(getCommand,1000);


    app.post('/mode', (req, res) => {
        console.log(req.body);
        var array = req.body;
        var i;
        var value = "";
        for (i = 0; i < 8; i++) { 
            value = value + array[i];
            console.log(array[i]);
        }
        var response = parseInt(value, 2);
        console.log(String.fromCharCode(response));
        console.log(response);
        socket.write(String.fromCharCode(response));
        // mode = response;
    });
});

server.listen(PORT2,function(){

console.log("server listening to port %d %j", PORT2, server.address());

});

