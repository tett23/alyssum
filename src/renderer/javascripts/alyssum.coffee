ipc = require 'ipc'
class Alyssum
  @instance = null

  constructor: ->
    unless Alyssum.instance?
      @instance = @
      @fileTree = null
      @commandPanel = null
      @buffers = null

  assignDOM: ->
    @fileTree = @createComponent(element: 'file-tree', id: 'file-tree')
    @commandPanel = @createComponent(element: 'command-panel', id: 'command-panel')
    @buffers = @createComponent(element: 'buffers-panel', id: 'buffers')
    console.log @fileTree, @commandPanel, @buffers
    document.body.appendChild(@fileTree) if @fileTree?
    document.body.appendChild(@commandPanel) if @commandPanel?
    document.body.appendChild(@buffers) if @buffers?

  createComponent: (params) ->
    prefix = params.prefix || 'x'
    el = document.createElement(prefix+'-'+params.element)
    el.id = params.id

    el

  addBuffer: ->

  openCommandPanel: (args) ->
    if @commandPanel?
      @commandPanel.toggleDisplay()
      @commandPanel.$.search.impl.focus()

module.exports = new Alyssum().instance
