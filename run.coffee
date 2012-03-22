###

StyleDocco (with haml and fixtures) and Paperboy

###
path = require 'path'
fs = require 'fs'
dir = path.dirname fs.realpathSync(__filename)
lib = path.join dir , './lib'


#
# Dependencies 
# 
optimist = require('optimist');
server = require( lib+'/server.js');
docs = require( lib+'/main.js');


# 
# Configuration
#

options = optimist
  .usage('Usage: $0 [options] [INPUT]')
  .describe('name', 'Name of the project').alias('n', 'name').demand('name')
  .describe('out', 'Output directory').alias('o', 'out').default('out', 'docs')
  .describe('nocss', 'Hide CSS code pane').boolean('nocss').default('nocss', false)
  .describe('tmpl', 'Template directory').default('tmpl', "#{__dirname}/resources/")
  .describe('overwrite', 'Overwrite existing files in target dir').boolean('overwrite')
  .describe('pass', 'Pass argument through to CSS preprocessor')
  .describe('server', 'Run node server to display docs').alias('s', 'server').boolean('server').default('server', false)
  .describe('port', 'Port to run paperboy').default('port', 3000)
  .argv

options.in = options._[0] or './'


#
# Create docs
# 
docs.run options

#
# run paperboy
# 
console.log options
if options.server then server.start options