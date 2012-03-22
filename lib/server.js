(function() {

  exports.start = function(options) {
    var http, paperboy, path, port, webroot;
    paperboy = require('paperboy');
    http = require('http');
    path = require('path');
    webroot = options.out;
    console.log(webroot);
    port = options.port;
    http.createServer(function(req, res) {
      var ip;
      ip = req.connection.remoteAddress;
      return paperboy.deliver(webroot, req, res).addHeader('X-Powered-By', 'Atari').before(function() {
        return console.log('Request received for ' + req.url);
      }).after(function(statusCode) {
        return console.log(statusCode + ' - ' + req.url + ' ' + ip);
      }).error(function(statusCode, msg) {
        console.log([statusCode, msg, req.url, ip].join(' '));
        res.writeHead(statusCode, {
          'Content-Type': 'text/plain'
        });
        return res.end('Error [' + statusCode + ']');
      }).otherwise(function(err) {
        console.log([404, err, req.url, ip].join(' '));
        res.writeHead(404, {
          'Content-Type': 'text/plain'
        });
        return res.end('Error 404: File not found');
      });
    }).listen(port);
    return console.log('paperboy on his round at http://localhost:' + port);
  };

}).call(this);
