/**
 * Simple node.js TCP server.
 */

var net = require('net');
var app = function(socket) {
    console.log('Connected');
    socket.write('[package]');
    socket.on('data', function(data) {
        console.log('Get request: ' + data);
    });
    socket.on('end', function() {
        console.log('Disconnected: ' + socket);
    });

    socket.end(new Date().getTime() + ': pong');
};

net.createServer(app).listen(9999);
console.log('Waiting for TCP connections...');
