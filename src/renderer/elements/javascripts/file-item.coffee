Polymer 'x-file-item',
  ready: ->
    @super()
  openFile: ->
    file = ipc.sendSync('get-file', @filename)
    ipc.sendSync('get-current-buffer').open(file)
