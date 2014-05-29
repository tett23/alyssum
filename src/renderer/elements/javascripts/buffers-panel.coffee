Polymer 'x-buffers-panel',
  created: ->
    @currentBuffer = null
    @addBuffer = (buffer) =>
      @.$.items.appendChild(buffer)
    @removeBuffer = (buffer) =>
      @.$.commands.innerHTML = ''
  ready: ->
    buffer = document.createElement('x-text-buffer')
    @addBuffer(buffer)
    @currentBuffer = buffer

    console.log @.currentBuffer.open
    ipc.send 'created-component',
      id: 'buffers'
      element: @
