Polymer 'x-buffers-panel',
  created: ->
    @currentBuffer = null
    @addBuffer = (buffer) =>
      @items.push(buffer)
      @.$.items.appendChild(buffer)
    @removeBuffer = (buffer) =>
      @.$.commands.innerHTML = ''
  ready: ->
    @items = []
    buffer = document.createElement('x-text-buffer')
    @addBuffer(buffer)
    @currentBuffer = buffer
