alyssum = require './javascripts/alyssum'

Polymer 'x-file-item',
  ready: ->
    @super()
    @items = {}
    @append (item) =>
      @items[item.filename] = item

  openFile: ->
    file = ipc.sendSync('get-file', @filename)
    buffer = alyssum.buffers.currentBuffer
    console.log buffer
    buffer.open(file)
