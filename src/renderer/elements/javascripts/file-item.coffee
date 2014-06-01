alyssum = require './javascripts/alyssum'

Polymer 'x-file-item',
  ready: ->
    @super()
    @items = {}
    #@append (item) =>
    #  @items[item.filename] = item

  openFile: ->
    buffer = alyssum.buffers.currentBuffer
    buffer.open({body: @attributes.getNamedItem('body').nodeValue})
