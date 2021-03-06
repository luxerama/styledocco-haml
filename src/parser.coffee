# # Dependencies and configuration.

fs     = require 'fs'
highlight = require 'highlight.js'
marked = require 'marked'
_      = require './utils'

marked.setOptions sanitize: no, gfm: on


# # Public functions.

# Extract comments and code in matching blocks. Each continous block of
# comments is matched with the code that follows it, until the next comment
# block starts.
extractBlocks = exports.extractBlocks = (lang, data) ->
  lines = data.split '\n'
  sections = []

  formatCode = (line) -> "#{line.replace(/(;base64,)[^\)]*/, '$1...')}\n"
  formatDocs = (line) -> "#{lang.filter(line)}\n"

  while lines.length
    docs = code = ''

    # First check for any single line comments.
    while lines.length and lang.checkType(lines[0]) is 'single'
      docs += formatDocs lines.shift()

    # A multi line comment starts here, add lines until comment ends.
    if lines.length and lang.checkType(lines[0]) is 'multistart'
      # We want the end line, so `break` *after* line is added.
      while lines.length
        line = lines.shift()
        docs += formatDocs line
        break if lang.checkType(line) is 'multiend'

    while lines.length and \
    (lang.checkType(lines[0]) is 'code' or lang.checkType(lines[0]) is 'multiend')
      code += formatCode lines.shift()
  
    sections.push { docs, code }
  sections


makeSections = exports.makeSections = (blocks) ->
  blocks
    # Run comments through marked.lexer to get Markdown tokens, and run
    # code through highlight.js.
    .map((block) ->
      docs: marked.lexer block.docs
      code: highlight.highlight('css', block.code).value
    )
    .map(addDocExamples, [])
    .reduce(splitter, [])
    .map(parser)


# # Internal functions.

# If we encounter code blocks in documentation, add example HTML output and
# highlight the code snippet.
addDocExamples = (block) ->
  block.docs = block.docs.reduce(
    (tokens, token) ->
      if token.type is 'code'
        # console.log token.type, token.text
        html = _.splitFixtures token.text
        # console.log  '*** html ***', html
        block.haml = token.text
        tokens.push
          type: 'html'
          pre: true
          text: "<div class=\"styledocco-example\">%HAML%</div>"
        token.text = highlight.highlightAuto( _.splitFixtures( token.text ).haml ).value
        token.escaped = true
      tokens.push token
      tokens
    [])

  block


# Split into sections with headers as delimiters.
splitter = (sections, cur, i) ->
  
  if sections.length is 0
    sections.push cur
    return sections

  # If we find a heading, push a new section, otherwise append to the last one.
  for doc in cur.docs
    if doc.type is 'heading' and doc.depth <= 2
      sections.push { docs: [ doc ], code: '', haml: '' }
    else
      sections[sections.length-1].docs.push doc

  # Add code to last section.
  sections[sections.length-1].code += cur.code
  sections[sections.length-1].haml += cur.haml
  sections


# Run through marked parser to generate HTML.
parser = (block) ->
  docs: _.trimNewLines marked.parser block.docs
  code: _.trimNewLines block.code
  haml: block.haml
