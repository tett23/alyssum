ipc = require 'ipc'
class Alyssum
  @instance = null

  constructor: ->
    unless Alyssum.instance?
      @instance = @
      @fileTree = null
      @commandPanel = null
      @buffers = null

  createComponent: (elementName, params) ->
    prefix = params.prefix || 'x'
    el = document.createElement(prefix+'-'+elementName)
    el.id = params.id unless params.id?
    el.onClick = params.onClick || ->

    for key, value of params.attributes
      el.setAttribute(key, value)

    el

  addBuffer: ->
  appendNewFile: (filename, fileParams) ->
    ipc.sendSync('create-file', filename: filename, params: fileParams)

  openCommandPanel: (args) ->
    if @commandPanel?
      @commandPanel.toggleDisplay()
      @commandPanel.$.search.impl.focus()

  assignDOM: ->
   @fileTree = @createComponent('file-tree', id: 'file-tree')
   @commandPanel = @createComponent('command-panel', id: 'command-panel')
   @buffers = @createComponent('buffers-panel', id: 'buffers')
   document.body.appendChild(@fileTree) if @fileTree?
   document.body.appendChild(@commandPanel) if @commandPanel?
   document.body.appendChild(@buffers) if @buffers?


module.exports = new Alyssum().instance
