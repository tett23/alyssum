Polymer 'x-buffers-panel',
  ready: ->
    @addBuffer = (buffer) =>
      @.$.items.appendChild(buffer)
    @removeBuffer = (buffer) =>
      @.$.commands.innerHTML = ''

    buffer = document.createElement('x-buffer')
    @addBuffer(buffer)
