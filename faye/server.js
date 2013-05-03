var http = require('http'),
    faye = require('faye');

var config, port = 9095;
config = { mount: '/', timeout: 45 };

// start bayeux server
console.log('Listening on ' + port);
new faye.NodeAdapter(config).listen(port);
