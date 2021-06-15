var net = require("net");

var server = net.createServer();

server.on("connection", function(socket){
    var remoteAddress = socket.remoteAddress + ":" + socket.remotePort;
    console.log("new client connection is made %s", remoteAddress);

    //Handle Client data
    socket.on("data", function (d) {
        console.log("Data from %s: %s", remoteAddress, d);
        socket.write("Data received to Server: " + d)
    });
    
    socket.once("close", function () { 
        console.log("connection from %s closed", remoteAddress);
    });
    
    socket.on("error", function (err) { 
        console.log("Connection %s error: %s", remoteAddress, err.message);
    });

});


server.listen(8000,function(){

    console.log("server listening to port 8000 %j", server.address());

});