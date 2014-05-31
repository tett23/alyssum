document.createElement('x-text-buffer')

Polymer 'x-buffers-panel',
  created: ->
  ready: ->
    @currentBuffer = null
    @addBuffer = (buffer) =>
      @items.push(buffer)
      @.$.items.appendChild(buffer)
    @removeBuffer = (buffer) =>
      @.$.items.innerHTML = ''
    @items = []
    buffer = alyssum.createComponent('text-buffer', attributes: {})
    @addBuffer(buffer)
    @currentBuffer = buffer
