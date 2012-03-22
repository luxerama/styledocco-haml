exports.start = ->
  paperboy = require('paperboy')
  http = require('http')
  path = require('path')

  webroot = path.join(__dirname, '../../docs')
  console.log webroot
  port = 3000

  http.createServer( (req, res)->
    ip = req.connection.remoteAddress
    paperboy
      .deliver(webroot, req, res)
      .addHeader('X-Powered-By', 'Atari')
      .before(() ->
        console.log 'Request received for ' + req.url
      )
      .after( (statusCode)->
        console.log(statusCode + ' - ' + req.url + ' ' + ip)
      )
      .error((statusCode, msg)->
        console.log([statusCode, msg, req.url, ip].join(' '))
        res.writeHead(statusCode, { 'Content-Type': 'text/plain' })
        res.end('Error [' + statusCode + ']')
      )
      .otherwise((err)->
        console.log([404, err, req.url, ip].join(' '))
        res.writeHead(404, { 'Content-Type': 'text/plain' })
        res.end('Error 404: File not found')
      )
  ).listen(port)
  console.log('paperboy on his round at http://localhost:' + port)