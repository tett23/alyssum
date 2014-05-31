require 'ipc'
require './javascripts/alyssum'

Polymer 'x-file-item',
  ready: ->
    @super()
  openFile: ->
    file = ipc.sendSync('get-file', @filename)
    buffer = alyssum.buffers.currentBuffer
    buffer.open(file)
